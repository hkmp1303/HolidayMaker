using MySql.Data.MySqlClient;

namespace server;

static class PackageBooking
{

    public record TravelPackage(int travelpackageid, List<Bookinghotel> hotellist, DateTime start, DateTime end);

    public record Bookinghotel(int fk_room_id, DateTime date_start, DateTime date_end);

    public record PackageResult(string packagetitle, string hotelname, string hoteldesc, int idhotel, string activityname, string activitydesc, int idactivity);

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
                            SELECT t.title AS packagetitle,
                            h.name AS hotelname,
                            h.description AS hoteldesc,
                            h.hotelid AS idhotel,
                            a.name AS activityname, 
                            a.description AS activitydesc,
                            a.activityid AS idactivity
                            FROM holidaymaker.travelpackage AS t
                            JOIN holidaymaker.packagedetails AS p ON t.travelpackageid = p.fk_travelpackage_id
                            JOIN holidaymaker.hotel AS h ON p.fk_hotel_id = h.hotelid 
                            JOIN holidaymaker.activity AS a ON p.fk_activity_id = a.activityid
                            WHERE t.travelpackageid = @searchpackage;
                            """;

                var result = new List<PackageResult>();

                using(var cmd = new MySqlCommand(checkpackagequery, con, transaction))
                {
                    cmd.Parameters.AddWithValue("@searchpackage", credentials.travelpackageid);

                    using var reader = cmd.ExecuteReader();

                    while (await reader.ReadAsync())
                    {
                        result.Add(new PackageResult(
                            reader.GetString("packagetitle"),
                            reader.GetString("hotelname"),
                            reader.GetString("hoteldesc"),
                            reader.GetInt32("idhotel"),
                            reader.GetString("activityname"),
                            reader.GetString("activitydesc"),
                            reader.GetInt32("idactivity"))
                        );
                    }
                    
                }
                await ctx.Response.WriteAsJsonAsync(result);   //funkade innan jag skrev resten av koden ........

                // display package?????

                //select room in hotel????
                //select date_start????
                //select date_end?????

                // add yes, no logic if you want to continue with the booking????????

                //logic to select transportation????

                int booking_id;

                string bookingquery = """
                     INSERT INTO booking(fk_user_id, bookingdate)
                     VALUES(@userid, NOW());
                     SELECT LAST_INSERT_ID();
                     """;

                using (var cmd = new MySqlCommand(bookingquery, con, transaction))
                {
                    cmd.Parameters.AddWithValue("@userid", user_id);

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


                var activity_id = result.Select(r => r.idactivity);

                foreach(var a_id in activity_id)
                {

                string Bookingactivityquery = """
                INSERT INTO Bookingactivity(fk_booking_id, fk_activity_id, datestart, dateend)
                VALUES(@fkbookingid, @fkactivityid, @datestart, @dateend)
                """;

                using var cmd = new MySqlCommand(Bookingactivityquery, con, transaction);

                cmd.Parameters.AddWithValue("@bookingid", booking_id);
                cmd.Parameters.AddWithValue("@fkactivityid", a_id);
                cmd.Parameters.AddWithValue("@datestart", credentials.start);
                cmd.Parameters.AddWithValue("@dateend", credentials.end);
                }
                await transaction.CommitAsync();                
            }
            
        }
        
    }

    public record CancelTP(int BookingId, DateTime BookingDate, int UserId, int? TransportationId, string Status);
    public static async Task<bool> CancelTPBooking(HttpContext ctx, Config config, int bookingId)  
    {
    if (ctx.Session.IsAvailable && ctx.Session.GetInt32("user_id") is int user_id)
    {
        var sql = @"
            UPDATE booking
            SET status = 'Canceled'
            WHERE bookingid = @bookingId AND fk_user_id = @userId";

        var parameters = new MySqlParameter[]
        {
            new MySqlParameter("@bookingId", bookingId),
            new MySqlParameter("@userId", user_id)
        };
        var rowsAffected = await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, sql, parameters);
        return rowsAffected > 0;
    }
        return false;
    }

        public record TravelPackageList(int bookingid, string hotelname, string activityname);
        public static async Task<List<TravelPackageList>> Tplist(Config config, HttpContext ctx)
        {

            var tplist = new List<TravelPackageList>();

            if (ctx.Session.IsAvailable)
            {

            
                string listpackagequery = """                      
                            SELECT b.bookingid,
                            h.name AS hotelname,
                            a.name AS activityname
                            FROM booking AS b
                            JOIN bookinghotel AS bh ON b.bookingid = bh.fk_booking_id
                            JOIN bookingactivity AS ba ON b.bookingid = ba.fk_booking_id
                            JOIN room AS r ON bh.fk_room_id = r.roomid
                            JOIN hotel AS h ON r.fk_hotel_id = h.hotelid
                            JOIN activity AS a ON ba.fk_activity_id = a.activityid
                            ORDER BY b.bookingid DESC;
                            """;

                

                using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, listpackagequery);


                while(await reader.ReadAsync())
                {
                tplist.Add(new TravelPackageList(

                        reader.GetInt32("bookingid"),
                        reader.GetString("hotelname"),
                        reader.GetString("activityname")
                ));
                }
            }
        return tplist;
    }

    public record MyOldPackages(int bookingid, string hotelname, int hotelid, string room, int roomid, double roomprice, string activityname, int activityid, double activityprice);
    public static async Task<List<MyOldPackages>> Mytplist(Config config, HttpContext ctx)
    {

        var result = new List<MyOldPackages>();

        if (ctx.Session.IsAvailable)
        {
            if(ctx.Session.GetInt32("user_id") is int user_id)
            {
                using var con = new MySqlConnection(config.ConnectionString);

                await con.OpenAsync();


                string mytpquary = """
                        SELECT b.bookingid as yourbooking,
                        h.name AS hotelname,
                        h.hotelid AS hotelshowid,
                        r.roomtype as room,
                        r.roomid AS roomshowid,
                        rp.price as roomprice,
                        a.name AS activityname,
                        a.activityid AS activityshowid,
                        ap.price as activityprice
                        FROM booking AS b
                        join user as u on b.fk_user_id = u.userid
                        JOIN bookinghotel AS bh ON b.bookingid = bh.fk_booking_id
                        JOIN bookingactivity AS ba ON b.bookingid = ba.fk_booking_id
                        JOIN room AS r ON bh.fk_room_id = r.roomid
                        JOIN hotel AS h ON r.fk_hotel_id = h.hotelid
                        JOIN activity AS a ON ba.fk_activity_id = a.activityid
                        join price as rp on r.fk_price_id = rp.priceid
                        join price as ap on a.fk_price_id = ap.priceid
                        WHERE u.userid = @userid
                        ORDER BY b.bookingid DESC;          
                """;

                using var cmd = new MySqlCommand(mytpquary, con );
                
                    cmd.Parameters.AddWithValue("@userid", user_id);

                    using var reader = cmd.ExecuteReader();

                    while(await reader.ReadAsync())
                    {
                        result.Add(new MyOldPackages(
                            reader.GetInt32("yourbooking"),
                            reader.GetString("hotelname"),
                            reader.GetInt32("hotelshowid"),
                            reader.GetString("room"),
                            reader.GetInt32("roomshowid"),
                            reader.GetDouble("roomprice"),
                            reader.GetString("activityname"),
                            reader.GetInt32("activityshowid"),
                            reader.GetDouble("activityprice"))
                        );
                    }
            }
            
        }
        return result;
    }
        public record RebookTP(int BookingId, DateTime BookingDate, int UserId, int? TransportationId, string Status);
        public static async Task<bool> RebookTPBooking(HttpContext ctx, Config config, int bookingId)
        {
        if (ctx.Session.IsAvailable && ctx.Session.GetInt32("user_id") is int user_id)
        {
            var sql = @"
                INSERT INTO booking (fk_user_id, bookingdate, fk_transportation_id, status)
                SELECT fk_user_id, NOW(), fk_transportation_id, 'Rebooked'
                FROM booking
                WHERE bookingid = @bookingId AND fk_user_id = @userId";

            var parameters = new MySqlParameter[]
            {
                new MySqlParameter("@bookingId", bookingId),
                new MySqlParameter("@userId", user_id)
            };
            var rowsAffected = await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, sql, parameters);
            return rowsAffected > 0;
        }
        return false;
    }
}


