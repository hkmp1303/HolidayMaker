namespace server;

using MySql.Data.MySqlClient;

static class Login
{
    public record Post_args(string Email, string Password);
    public static async Task<bool> Post(Post_args credentials, Config config, HttpContext ctx)
    {
        if (credentials.Email.Trim() == "" || credentials.Password == "") return false;
        bool result = false;
        string query = "SELECT userid FROM user WHERE email = @email and password = @password";
        var parameters = new MySqlParameter[]
        {
            new("@email", credentials.Email),
            new("@password", credentials.Password),
        };

        object query_result = await MySqlHelper.ExecuteScalarAsync(config.ConnectionString, query, parameters);
        if (query_result is int id)
        {
            if (ctx.Session.IsAvailable)
            {
                ctx.Session.SetInt32("user_id", id);
                result = true;
            }
        }

        return result;
    }
    public record Post_requestArgs(string Email);
    public static async Task<string> Post_RequestPassword(Post_requestArgs reset, Config config)
    {
        MySqlParameter email = new("@email", reset.Email);
        var reader = MySqlHelper.ExecuteReader(config.ConnectionString,
        "SELECT userid FROM user WHERE email = @email", email);
        if (!reader.Read())
        {
            return "Invalid email";
        }
        string guid = Guid.NewGuid().ToString();
        var updatedRows = MySqlHelper.ExecuteNonQuery(config.ConnectionString,
        "UPDATE user SET requestPass = @guid WHERE email = @email",
        new MySqlParameter[] { new("@guid", guid), email });
        if (updatedRows > 0)
        {
            // TODO send email with GUID link here
            return "Set link has been sent to your email.";
        }
        return "Crazzzyyyyy that you got here";
    }
    public record Post_resetArgs(string NewPass, string Guid);
    public static async Task<string> Post_ResetPassword(Post_resetArgs reset, Config config)
    {
        MySqlParameter guid = new("@guid", reset.Guid);
        var reader =  MySqlHelper.ExecuteReader(config.ConnectionString,
        "SELECT userid FROM user WHERE requestPass = @Guid", guid);
        if (!reader.Read()) return "Invalid link";
        var updatedRows = MySqlHelper.ExecuteNonQuery(config.ConnectionString, """
            UPDATE user SET password = @newPass, requestPass=NULL WHERE requestPass = @guid
            """, new MySqlParameter[] { new("@newPass", reset.NewPass), guid });
        if (updatedRows > 0) return "Password has been updated";
        return "Could not update password";
    }
}