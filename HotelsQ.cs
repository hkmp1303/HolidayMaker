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
    
public record PricedHotel(int Id, string Name, decimal Price);

public static async Task<List<PricedHotel>> SortHotelPrice(Config config)
{
    var hotels = new List<PricedHotel>();

    var sql = @"
            SELECT h.hotelid, h.name, MIN(p.price) AS price
            FROM hotel h
            JOIN room r ON h.hotelid = r.fk_hotel_id
            JOIN price p ON r.fk_price_id = p.priceid
            WHERE p.priceType = 'Room'
            GROUP BY h.hotelid, h.name
        ORDER BY price ASC";

    using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql);
    while (await reader.ReadAsync())
    {
        hotels.Add(new PricedHotel(
            reader.GetInt32("hotelid"),
            reader.GetString("name"),
            reader.GetDecimal("price")
        ));
    }
    return hotels;
}
}