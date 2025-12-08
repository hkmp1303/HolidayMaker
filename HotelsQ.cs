using MySql.Data.MySqlClient;
namespace server;

// Vi skapar en enkel modell för Hotel här (eller i en egen fil)
public record Hotel(int Id, string Name);

public class HotelsQ
{
    public static async Task<List<Hotel>> GetHotels(Config config)
    {
        var hotels = new List<Hotel>();
        
        var sql = "SELECT hotelid, name FROM hotel"; 

        using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql);

        while (await reader.ReadAsync())
        {
            hotels.Add(new Hotel(
                reader.GetInt32("hotelid"), // Ändrat från "hotel_id" till "hotelid"
                reader.GetString("name")    // Ändrat från "getString" till "GetString"
            ));
        }
        return hotels;
    }
}