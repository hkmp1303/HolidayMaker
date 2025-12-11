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
    public record HotelAdmin(int Id, string Name,  string Description, string Address,
        string City, string Phonenumber, string Email, int Totalcapacity, double Latitude,  double Longitude);
    public static async Task<List<HotelAdmin>> GetHotelsAdmin(Config config)
    {
        var hotels = new List<HotelAdmin>();
        
        var sql = "SELECT hotelid, name, description, address, city, phonenumber, email, total_capacity, ST_X(coordinates) AS x, ST_Y(coordinates) AS y FROM hotel"; 

        using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql);

        while (await reader.ReadAsync())
        {
            hotels.Add(new HotelAdmin(
                reader.GetInt32("hotelid"),
                reader.GetString("name"),
                reader.GetString("description"),
                reader.GetString("address"),
                reader.GetString("city"),
                reader.GetString("phonenumber"),
                reader.GetString("email"),
               reader.GetInt32("total_capacity"),
                reader.GetDouble("y"),
                reader.GetDouble("x")
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
    public record Hotelfull(int Id, string Name,  string Description, string Address,
        string City, string Phonenumber, string Email, int Totalcapacity, string CountryName);
    public static async Task<List<Hotelfull>> GetHotelsfull(Config config)
    {
        var hotels = new List<Hotelfull>();
            
        var sql = @"SELECT 
                  hotel.hotelid,
                  hotel.name,
                  hotel.description,
                  hotel.address,
                  hotel.city,
                  hotel.phonenumber,
                  hotel.email,
                  hotel.total_capacity,
                  country.country FROM hotel
                  JOIN  bycountrysearch ON hotel.hotelid = bycountrysearch.fk_hotel_id
                  JOIN country ON bycountrysearch.fk_country_id = country.countryid"; 

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
                reader.GetInt32("total_capacity"),
                reader.GetString("country")
                
            ));
        }
        return hotels;
    }
}