using System.Reflection.Metadata;
using MySql.Data.MySqlClient;

namespace server;

static class Booking
{
    public record bookingactivity(int bookingid, int fkbookingactivityid, DateTime start, DateTime end);
    public record Post_Args(int transportationid, int roomid, DateTime start, DateTime end);
    public static async Task 
    CreateBooking(Post_Args credentials, Config config, HttpContext ctx)
    {
        if(ctx.Session.IsAvailable)
        {
            if(ctx.Session.GetInt32("user_id") is int user_id)
            {
                string bookingquery = """
                INSERT INTO booking(fk_user_id, fk_transportation_id, bookingdate)
                VALUES(@userid, @transportationid, NOW())
                """;

                var parameters = new MySqlParameter[]
                {
                  new("@userid", user_id),
                  new("@transportationid", credentials.transportationid)
                  
                };
                await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, bookingquery, parameters);
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