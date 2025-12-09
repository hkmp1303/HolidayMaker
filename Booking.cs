using System.Reflection.Metadata;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Cms;

namespace server;

static class BookingRequest
{
    public record Bookingactivity(int fk_bookingid, int fk_bookingactivityid, DateTime start, DateTime end);
    public record Bookinghotel(int fk_bookingid, int fk_roomid, DateTime start, DateTime end);
    public record Bookingroom(int fk_hotelid, int fk_priceid, Enum roomtype, Enum status);

    public record Booking (int transportationid, List<Bookingactivity> activityList, List<Bookinghotel> hotellist, List<Bookingroom> roomlist);

    public static async Task CreateBooking(Booking credentials, Config config, HttpContext ctx)
    {
        if(ctx.Session.IsAvailable)
        {
            if(ctx.Session.GetInt32("user_id") is int user_id)
            {
                string bookingquery = """
                INSERT INTO booking(fk_user_id, fk_transportation_id, bookingdate)
                VALUES(@userid, @transportationid, NOW());
                SELECT LAST_INSERT_ID();
                """;

                int booking_id;

                var cmd = new MySqlCommand();

                booking_id = Convert.ToInt32(cmd.LastInsertedId);

                // var parameters = new MySqlParameter[]
                // {
                //   new("@userid", user_id),
                //   new("@transportationid", credentials.transportationid)
                  
                // };
                // await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, bookingquery, parameters);
            }
        }
        
    }
}

/*
    DELIMITER //
    CREATE PROCEDURE sp_newbooking(
    IN p_userid INT,
    IN p_transportationid INT,
    )
    BEGIN
    INSERT INTO booking (fk_user_id, fk_transportation_id, bookingdate)
    VALUES (p_userid, p_transportationid, NOW());
    END//
    DELIMITER;

    DELIMITER //
    CREATE PROCEDURE sp_newbookingdetails
    IN p_bookingid
    IN p_roomid
    IN p_datestart
    IN p_dateend
    BEGIN
    INSERT INTO bookinghotel(fk_booking_id, fk_room_id, date_start, date_end)
    VALUES (p_bookingid, p_roomid, p_datestart, p_dateend);
    END//
    DELIMITER;

    DELIMITER //
    CREATE PROCEDURE sp_newbookingactivity
    IN p_bookingid
    IN p_activityid
    IN p_datestart
    IN p_dateend
    BEGIN
    INSERT INTO bookingactivity (fk_booking_id, fk_activity_id, DateStart, DateEnd);
    END//
    DELIMITER;



*/