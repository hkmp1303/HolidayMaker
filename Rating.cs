using System.Security;
using MySql.Data.MySqlClient;

namespace server;

static class Rating
{
    public record Put_RatingData(int starRating, string description, string ratingType, int bookingID);
    public static async Task<bool> Put_NewRating(Config config, HttpContext ctx, Put_RatingData rating)
    {
        if (!ctx.Session.IsAvailable || ctx.Session.GetInt32("user_id") is not int user_id)
        {
            ctx.Response.StatusCode = 401;
            return false;
        }
        // duplicate check, user check
        var result = MySqlHelper.ExecuteReader(config.ConnectionString, """
        SELECT ratingid FROM rating as r
        JOIN booking as b on r.fk_booking_id = b.bookingid
        WHERE fk_booking_id = @bookingID AND rating_type = @ratingType AND b.fk_user_id = @user
        """,
        new MySqlParameter[] { new("@bookingID", rating.bookingID), new("@ratingType", rating.ratingType), new("@user", user_id) });
        if (result.Read())
        {
            ctx.Response.StatusCode = 409;
            return false;
        }
        int created = MySqlHelper.ExecuteNonQuery(config.ConnectionString, """
            INSERT INTO rating SET
                star_rating = @starRating, description = @description, date_created = NOW(),
                rating_type = @rating_type, fk_booking_id = @fk_booking_id
            """,
            new MySqlParameter[]{
                new("@starRating", rating.starRating),
                new("@description", rating.description),
                new("@rating_type", rating.ratingType),
                new("@fk_booking_id", rating.bookingID)
            }
        );
        if (created > 0)
        {
            ctx.Response.StatusCode = 201;
            return true;
        }
        return false;
    }
    // Sort by rating
    public record RatingData(int Id, string Description, decimal Stars);
    public static async Task<IEnumerable<RatingData>?> Get_Ratings(string type, int id, Config config, HttpContext ctx)
    {
        type = type.ToLower();
        if (!(new string[]{"transportation", "activity", "hotel"/*, "package"*/}).Contains(type))
        {
            ctx.Response.StatusCode = 404;
            return null;
        }
        string sql = $"""
            SELECT ratingid, description, star_rating
            FROM rating AS r
                LEFT JOIN booking AS t ON rating_type = 'transportation'
                    AND t.bookingid = r.fk_booking_id
                LEFT JOIN bookingactivity AS a ON rating_type = 'activity'
                    AND a.fk_booking_id = r.fk_booking_id
                LEFT JOIN bookinghotel AS hl ON rating_type = 'hotel'
                    AND hl.fk_booking_id = r.fk_booking_id
                LEFT JOIN room AS h ON hl.fk_room_id = h.roomid
            WHERE {type[0]}.fk_{type}_id = @id AND rating_type = @type
                AND DATE_ADD(date_created, INTERVAL 2 YEAR) > NOW()
            ORDER BY date_created DESC
            LIMIT 100
        """;
        var r = MySqlHelper.ExecuteReader(config.ConnectionString, sql,
            new MySqlParameter[] { new("@id", id), new("@type", type)});
        List<RatingData> ratings = new();
        while (r.Read())
        {
            ratings.Add(new(
                r.GetInt32("ratingid"),
                r.GetString("description"),
                r.GetDecimal("star_rating")
            ));
        }
        return ratings;
    }

}

