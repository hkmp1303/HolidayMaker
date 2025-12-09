using System.Net.Mime;
using MySql.Data.MySqlClient;
namespace server;

// Vi skapar en enkel modell för Hotel


public class HotelsQ
{
    public record Hotelsimple(int Id, string Name );
    public static async Task<List<Hotelsimple>> GetHotels(Config config)
    {
        
        var hotels = new List<Hotelsimple>();
        
        var sql = "SELECT hotelid, name FROM hotel"; 

        using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql);

        while (await reader.ReadAsync())
        {
            hotels.Add(new Hotelsimple(
                reader.GetInt32("hotelid"),
                reader.GetString("name")    
            ));
        }
        return hotels;
    }
    public record Hotelfull(int Id, string Name,  string Description, string Address,
        string City, string Phonenumber, string Email, int Totalcapacity);
    public static async Task<List<Hotelfull>> GetHotelsfull(Config config)
    {
        var hotels = new List<Hotelfull>();
        
        var sql = "SELECT hotelid, name, description, address, city, phonenumber, email, total_capacity FROM hotel"; 

        using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql);

        while (await reader.ReadAsync())
        {
            hotels.Add(new Hotelfull(
                reader.GetInt32("hotelid"),
                reader.GetString("name"),
                reader.GetString("description"),
                reader.GetString("address"),
                reader.GetString("city"),
                reader.GetString("phonenumber"),
                reader.GetString("email"),
               reader.GetInt32("total_capacity")
            ));
        }
        return hotels;
    }
}