using MySql.Data.MySqlClient;
using System;

namespace server;

static class Profile
{
    public record Get_Data(string Email, string Firstname, string Lastname, string Phonenumber, string Address);
    public record Update_Data(string Email, string Firstname, string Lastname, string Phonenumber, string Address);
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
                result = new(r.GetString(0), r.GetString(1), r.GetString(2), r.GetString(3), r.GetString(4));
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
        string query = @"UPDATE user
                        SET email = @email,
                            firstname = @firstname,
                            lastname = @lastname,
                            phonenumber = @phonenumber,
                            address = @address
                        WHERE userid = @id";
        var parameters = new MySqlParameter[]
        {
            new("@id", user_id),
            new("@email", data.Email),
            new("@firstname", data.Firstname),
            new("@lastname", data.Lastname),
            new("@phonenumber", data.Phonenumber),
            new("@address", data.Address),
        };

        int updatedRows = await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, query, parameters);
        return updatedRows > 0;
    }
}
