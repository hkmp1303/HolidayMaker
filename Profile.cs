using MySql.Data.MySqlClient;
using System;

namespace server;

static class Profile
{
    public record Get_Data(string Email, string Firstname, string Lastname, string Phonenumber, string Address);
    public record Update_Data(string? Email, string? Firstname, string? Lastname, string? Phonenumber, string? Address, string? CurrentPass, string? NewPass);
    public static async Task<Get_Data?> Get_UserData(Config config, HttpContext ctx)
    {
        Get_Data? result = null;
        if (!ctx.Session.IsAvailable)
            return null;
        if (ctx.Session.GetInt32("user_id") is not int user_id)
            return null;
        string query = @"SELECT email, firstname, lastname, phonenumber, address
                        FROM user WHERE userid = @id LIMIT 1";
        var parameters = new MySqlParameter[] { new("@id", user_id) };
        using (var r = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, query, parameters))
        {
            if (r.Read())
            {
                result = new(r.GetString(0), r.GetString(1), r.GetString(2), r.IsDBNull(3) ? "" : r.GetString(3), r.GetString(4));
            }
        }
        return result;
    }
    public record updateUserDataResult(string status, string[]? errors = null);
    public static async Task<updateUserDataResult> Patch_UserData(Config config, HttpContext ctx, Update_Data data)
    {
        string status = "success";
        List<string> errors = new();
        if (!ctx.Session.IsAvailable)
        {
            ctx.Response.StatusCode = 401;
            return new updateUserDataResult("error", new string[] { "Not logged in" });
        }
        if (ctx.Session.GetInt32("user_id") is not int user_id)
        {
            ctx.Response.StatusCode = 401;
            return new updateUserDataResult("error", new string[] { "Invalid user session" });
        }

        var parameters = new List<MySqlParameter>
        {
            new("@id", user_id),
        };
        string query = @"UPDATE user SET ";
        List<string> userValues = new();
        if (data.Email != null)
        {
            userValues.Add("email = @email");
            parameters.Add(new MySqlParameter("@email", data.Email));
        }
        if (data.Firstname != null)
        {
            userValues.Add("firstname = @firstname");
            parameters.Add(new MySqlParameter("@firstname", data.Firstname));
        }
        if (data.Lastname != null)
        {
            userValues.Add("lastname = @lastname");
            parameters.Add(new MySqlParameter("@lastname", data.Lastname));
        }
        if (data.Phonenumber != null)
        {
            if (data.Phonenumber == "")
                userValues.Add("phonenumber = NULL");
            else
            {
                userValues.Add("phonenumber = @phonenumber");
                parameters.Add(new MySqlParameter("@phonenumber", data.Phonenumber));
            }
        }
        if (data.Address != null)
        {
            userValues.Add("address = @address");
            parameters.Add(new MySqlParameter("@address", data.Address));
        }

        if (data.NewPass != null && data.CurrentPass != null)
        {
            string newPass = data.NewPass.Trim(), currentPass = data.CurrentPass.Trim();
            if (newPass == "" || currentPass == "") {
                errors.Add("Current or new password user input error");
            }
            if (newPass == currentPass)
                errors.Add("New and current password are the same.");
            using (var user = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString,
                "Select userID from user WHERE userid = @id and `password` = @currentPass",
                new MySqlParameter[] { new("@id", user_id), new("@currentPass", currentPass) }))
            {
                if (user.Read())
                {      // if user and current pass combo does't exist
                    userValues.Add("`password` = @newPass");
                    parameters.Add(new("@newPass", newPass));
                }
                else
                {
                    errors.Add("Invalid current password");
                }
            }
        }
        if (parameters.Count > 1)
        {
            query += string.Join(',', userValues) + " WHERE userid = @id";
            int updatedRows = await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, query, parameters.ToArray());
            if (updatedRows == 0) { status = "error"; errors.Add("Sql failed to update profile"); }
        }
        else
            errors.Add("");
        return new updateUserDataResult(status, errors.Count()>0? errors.ToArray():null ); // errors array to string
    }
}
