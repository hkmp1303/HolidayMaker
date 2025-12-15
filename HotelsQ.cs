
using MySql.Data.MySqlClient;
using Microsoft.AspNetCore.Mvc;  // VIKTIGT: För [FromBody] och [FromServices]

namespace server;

public record DateSearchRequest(DateTime StartDate, DateTime EndDate, int MinRooms);
    
public record HotelResult(int Id, string Name, string City, string Description, int AvailableRooms);


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

    public static async Task<List<PricedHotel>> GetHotelPrice(Config config)

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


    public record HotelAmenity(int HotelId, string HotelName, string Description, string Address, string City, string Amenity);

    public static async Task<List<HotelAmenity>> GetHotelAmenities(Config config)
{
    var hotels = new List<HotelAmenity>();

    var sql = @"
            SELECT h.hotelid,
            h.name AS hotel_name,
            h.description,
            h.address,
            h.city,
            GROUP_CONCAT(a.name ORDER BY a.name SEPARATOR ', ') AS amenities
        FROM hotel h
        JOIN hotelamenity ha ON h.hotelid = ha.fk_hotel_id
        JOIN amenity a ON ha.fk_amenity_id = a.amenityid
        GROUP BY h.hotelid, h.name, h.description, h.address, h.city
        ORDER BY h.name";

    using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql);
    while (await reader.ReadAsync())
    {
        hotels.Add(new HotelAmenity(
            reader.GetInt32("hotelid"),
            reader.GetString("hotel_name"),
            reader.GetString("description"),
            reader.GetString("address"),
            reader.GetString("city"),
            reader.GetString("amenities")
        ));
    }
    return hotels;
    }

    public static async Task<List<HotelResult>> GetAvailableHotels(
        [FromBody] DateSearchRequest request,
        [FromServices] Config config)
    {
        var availableHotels = new List<HotelResult>();


        var sql = @"
        SELECT 
            h.hotelid, 
            h.name, 
            h.city, 
            h.description, 
            COUNT(r.roomid) as available_count
        FROM hotel h
        JOIN room r ON h.hotelid = r.fk_hotel_id
        WHERE r.roomid NOT IN (
            SELECT bh.fk_room_id 
            FROM bookinghotel bh
            WHERE 
                (bh.date_start < @endDate AND bh.date_end > @startDate)
        )
        GROUP BY h.hotelid, h.name, h.city, h.description
        HAVING available_count >= @minRooms";

        var parameters = new List<MySqlParameter>
        {
            new MySqlParameter("@startDate", request.StartDate),
            new MySqlParameter("@endDate", request.EndDate),
            new MySqlParameter("@minRooms", request.MinRooms)
        };

        using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql, parameters.ToArray());

        while (await reader.ReadAsync())
        {
            availableHotels.Add(new HotelResult(
                reader.GetInt32("hotelid"),
                reader.GetString("name"),
                reader.GetString("city"),
                reader.GetString("description"),
                reader.GetInt32("available_count")
            ));
        }

        return availableHotels;

    
    }
}
