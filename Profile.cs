using MySql.Data.MySqlClient;
using System;

namespace server;

static class Profile
{
    public record Get_Data(string Email, string Firstname, string Lastname, string Phonenumber, string Address);
    public record Update_Data(string? Email, string? Firstname, string? Lastname, string? Phonenumber, string? Address);
    public static async Task<Get_Data?>
    Get_UserData(Config config, HttpContext ctx)
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
                result = new(r.GetString(0), r.GetString(1), r.GetString(2), r.IsDBNull(3)? "" : r.GetString(3), r.GetString(4));
            }
        }
        return result;
    }
    public static async Task<bool> Patch_UserData(Config config, HttpContext ctx, Update_Data data)
    {
        if (!ctx.Session.IsAvailable)
            return false;
        if (ctx.Session.GetInt32("user_id") is not int user_id)
            return false;

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
        if (parameters.Count == 1)
            return false;
        query += string.Join(',', userValues) + " WHERE userid = @id";
        int updatedRows = await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, query, parameters.ToArray());
        return updatedRows > 0;
    }
}
