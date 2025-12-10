namespace server;

using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;

static class Login
{
    public record Post_args(string Email, string Password);
    public static async Task<bool>
    Post(Post_args credentials, Config config, HttpContext ctx)
    {
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
}