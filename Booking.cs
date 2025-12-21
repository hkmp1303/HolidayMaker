using MySql.Data.MySqlClient;

namespace server;

static class BookingRequest
{
    //public record Bookingactivity(int fk_bookingid, int fk_bookingactivityid, DateTime start, DateTime end);
    public record Bookinghotel(int fk_room_id, DateTime date_start, DateTime date_end);
    //public record Bookingroom(int fk_hotelid, int fk_priceid, Enum roomtype, Enum status);

    public record Booking (int fk_transportation_id, List<Bookinghotel> hotellist);

    public static async Task CreateBooking(Booking credentials, Config config, HttpContext ctx)
    {
        if (ctx.Session.IsAvailable)
        {
            if(ctx.Session.GetInt32("user_id") is int user_id)
            {
                using var con = new MySqlConnection(config.ConnectionString);

                await con.OpenAsync();

                using var transaction = con.BeginTransaction();

                
                string bookingquery = """
                     INSERT INTO booking(fk_user_id, fk_transportation_id, bookingdate)
                     VALUES(@userid, @transportationid, NOW());
                     SELECT LAST_INSERT_ID();
                     """;

                int booking_id;

                using (var cmd = new MySqlCommand(bookingquery, con, transaction))
                {
                    cmd.Parameters.AddWithValue("@userid", user_id);
                    cmd.Parameters.AddWithValue("@transportationid", credentials.fk_transportation_id);

                    var result_id = await cmd.ExecuteScalarAsync();
                    booking_id = Convert.ToInt32(result_id);
                }

                
                
                foreach(var hotel in credentials.hotellist)
                {
                    string bookinghotelquary = """
                    INSERT INTO bookinghotel(fk_booking_id, fk_room_id, date_start, date_end)
                    VALUES(@fkbookingid, @fkroomid, @date_start, @date_end)
                    """;

                    using var cmd = new MySqlCommand(bookinghotelquary, con, transaction);
                
                    cmd.Parameters.AddWithValue("@fkbookingid", booking_id);
                    cmd.Parameters.AddWithValue("@fkroomid", hotel.fk_room_id);
                    cmd.Parameters.AddWithValue("@date_start", hotel.date_start);
                    cmd.Parameters.AddWithValue("@date_end", hotel.date_end);

                    await cmd.ExecuteNonQueryAsync();
                }

                await transaction.CommitAsync();
                
            }
        }
    }
}
