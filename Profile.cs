using MySql.Data.MySqlClient;

namespace server;

static class Profile
{
    public record Get_Data(string Email, string Firstname, string Lastname, string Phonenumber, string Address, bool ShareInfoConsent, bool RequestInfoDelete);
    public record Update_Data(string? Email, string? Firstname, string? Lastname, string? Phonenumber, string? Address, bool? ShareInfoConsent, bool? RequestInfoDelete, string? CurrentPass, string? NewPass);
    public static async Task<Get_Data?> Get_UserData(Config config, HttpContext ctx)
    {
        Get_Data? result = null;
        if (!ctx.Session.IsAvailable || ctx.Session.GetInt32("user_id") is not int user_id)
        {
            ctx.Response.StatusCode = 401;
            return null;
        }
        string query = """
                        SELECT email, firstname, lastname, phonenumber, address, consent, requestDelete
                        FROM user WHERE userid = @id LIMIT 1
                        """;
        var parameters = new MySqlParameter[] { new("@id", user_id) };
        using (var r = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, query, parameters)) {
            if (r.Read()) {
                result = new(r.GetString(0), r.GetString(1), r.GetString(2), r.IsDBNull(3) ? "" : r.GetString(3), r.GetString(4), !r.IsDBNull(5), !r.IsDBNull(6));
            }
        }
        return result;
    }
    public record updateUserDataResult(string status, string[]? errors = null);
    public static async Task<updateUserDataResult> Patch_UserData(Config config, HttpContext ctx, Update_Data data)
    {
        string status = "ok";
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
        var parameters = new List<MySqlParameter>{
            new("@id", user_id),
        };
        string role = "";
        using (var user = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString,
                "Select role from user WHERE userid = @id", parameters.ToArray()
                ))
        {
            if (user.Read())
                role = user.GetString(0);
        }
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
        if(role != "admin") {
            if (data.ShareInfoConsent != null)
            {
                userValues.Add("consent = "+((bool)data.ShareInfoConsent ? "NOW()" : "null"));  // set literal MySqlValue
            }
            if (data.RequestInfoDelete != null)
            {
                userValues.Add("requestDelete = " + ((bool)data.RequestInfoDelete ? "NOW()" : "null"));
            }
        }
        if (data.NewPass != null && data.CurrentPass != null)
        {
            string newPass = data.NewPass.Trim(), currentPass = data.CurrentPass.Trim();
            if (newPass == "" || currentPass == "")
            {
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
        if (userValues.Count > 0)
        {
            string query = "UPDATE IGNORE user SET " + string.Join(',', userValues) + " WHERE userid = @id";
            int updatedRows = await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, query, parameters.ToArray());
            if (updatedRows == 0) { status = "error"; errors.Add("Sql failed to update profile"); }
        }
        else
            errors.Add("");
        return new updateUserDataResult(status, errors.Count() > 0 ? errors.ToArray() : null); // errors array to string
    }

    public static async Task<string> DeleteUserData(Config config, HttpContext ctx)
    {
        if (ctx.Session.IsAvailable && ctx.Session.GetInt32("user_id") is int user_id)
        {
            var result = MySqlHelper.ExecuteReader(config.ConnectionString, "SELECT userid FROM user WHERE userid = @id AND role = 'admin'",
            new MySqlParameter("@id", user_id));
            if (result.Read())
            {
                int deletedRows = MySqlHelper.ExecuteNonQuery(config.ConnectionString, """
                UPDATE user SET email = NULL, password ='', firstname ='', lastname ='', phonenumber = NULL,
                                address ='', consent =NULL
                WHERE DATE_ADD(requestDelete, INTERVAL 30 DAY) < NOW()
                """);
                return $"Deleted {deletedRows} users";
            }
            else
            {
                ctx.Response.StatusCode = 401;
                return "Unauhorized";
            }
        }
        ctx.Response.StatusCode = 401;
        return "Failed to execute requested delete";
    }

}
