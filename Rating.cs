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
        if(created > 0)
        {
            ctx.Response.StatusCode = 201;
            return true;
        }
        return false;
    }
}

