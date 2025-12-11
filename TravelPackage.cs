using System.Reflection.Metadata;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Cms;
using Org.BouncyCastle.Crypto.Engines;
namespace server;




static class PackageBooking
{

    public record TravelPackage(int transportationid);

    public static async Task CreatePackageBooking(TravelPackage credentials, Config config, HttpContext ctx)
    {
        if (ctx.Session.IsAvailable)
        {
            if(ctx.Session.GetInt32("user_id") is int user_id)
            {
                using var con = new MySqlConnection(config.ConnectionString);

                await con.OpenAsync();

                using var transaction = con.BeginTransaction();

                
                string checkpackagequery = """                       
                            SELECT t.title, h.name, h.description, a.name, a.description
                            FROM holidaymaker.travelpackage AS t
                            JOIN holidaymaker.packagedetails AS p ON t.travelpackageid = p.fk_travelpackage_id
                            JOIN holidaymaker.hotel AS h ON p.fk_hotel_id = h.hotelid 
                            JOIN holidaymaker.activity AS a ON p.fk_activity_id = a.activityid
                            WHERE t.travelpackageid = @searchpackage;
                            """;
                using(var cmd = new MySqlCommand(checkpackagequery, con, transaction))
                {
                    cmd.Parameters.AddWithValue("@searchpackage", credentials.transportationid);

                    var result = await cmd.ExecuteReaderAsync();
                }

                // int booking_id;

                // using (var cmd = new MySqlCommand(bookingquery, con, transaction))
                // {
                //     cmd.Parameters.AddWithValue("@userid", user_id);
                //     cmd.Parameters.AddWithValue();

                //     var result_id = await cmd.ExecuteScalarAsync();
                //     booking_id = Convert.ToInt32(result_id);
                // }

                
                
                // foreach(var hotel in credentials.hotellist)
                // {
                //     string bookinghotelquary = """
                //     INSERT INTO bookinghotel(fk_booking_id, fk_room_id, date_start, date_end)
                //     VALUES(@fkbookingid, @fkroomid, @date_start, @date_end)
                //     """;

                //     using var cmd = new MySqlCommand(bookinghotelquary, con, transaction);
                
                //     cmd.Parameters.AddWithValue("@fkbookingid", booking_id);
                //     cmd.Parameters.AddWithValue("@fkroomid", hotel.fk_room_id);
                //     cmd.Parameters.AddWithValue("@date_start", hotel.date_start);
                //     cmd.Parameters.AddWithValue("@date_end", hotel.date_end);

                //     await cmd.ExecuteNonQueryAsync();
                // }

                await transaction.CommitAsync();
                
            }
        }
    }
}

/*

select t.title, h.name, h.description, a.name, a.description 
from holidaymaker.travelpackage as t
join holidaymaker.packagedetails as p on t.travelpackageid = p.fk_travelpackage_id
join holidaymaker.hotel as h on p.fk_hotel_id = h.hotelid 
join holidaymaker.activity as a on p.fk_activity_id = a.activityid; 

*/