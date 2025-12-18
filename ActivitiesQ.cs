using MySql.Data.MySqlClient;
namespace server;

public class ActivitiesQ
{

  public record ActivityFull(
      int Id, string Name, string Phonenumber, string Address, string City, decimal Price, string Description
  );

  public record ActivityRatingSummary(
      int ActivityId, string ActivityName, double AverageRating, int TotalRatings
  );

  // Read activities by country
  public static async Task<List<ActivityFull>> GetActivitiesByCountry(string country, Config config)
  {
    var result = new List<ActivityFull>();

    string sql = @"
            SELECT
                a.activityid,
                a.name,
                a.phonenumber,
                a.address,
                a.city,
                COALESCE(p.price, 0) AS price,
                COALESCE(a.description, '') AS description
            FROM activity a
            JOIN bycountrysearch bcs ON a.activityid = bcs.fk_activity_id
            JOIN country c ON c.countryid = bcs.fk_country_id
            LEFT JOIN price p ON p.priceid = a.fk_price_id
            WHERE LOWER(c.country) = LOWER(@country)
            ORDER BY a.name;
        ";

    var parameters = new MySqlParameter[]
    {
            new("@country", country)
    };

    using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql, parameters);

    while (await reader.ReadAsync())
    {
      result.Add(new ActivityFull(
          reader.GetInt32("activityid"),
          reader.GetString("name"),
          reader.GetString("phonenumber"),
          reader.GetString("address"),
          reader.GetString("city"),
          reader.GetDecimal("price"),
          reader.GetString("description")
      ));
    }

    return result;
  }

  //Read activity by id
  public static async Task<ActivityFull?> GetActivityById(int id, Config config)
  {
    string sql = @"
            SELECT
                a.activityid,
                a.name,
                a.phonenumber,
                a.address,
                a.city,
                COALESCE(p.price, 0) AS price,
                COALESCE(a.description, '') AS description
            FROM activity a
            LEFT JOIN price p ON p.priceid = a.fk_price_id
            WHERE a.activityid = @id
            LIMIT 1;
        ";

    var parameters = new MySqlParameter[]
    {
            new("@id", id)
    };

    using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql, parameters);

    if (await reader.ReadAsync())
    {
      return new ActivityFull(
          reader.GetInt32("activityid"),
          reader.GetString("name"),
          reader.GetString("phonenumber"),
          reader.GetString("address"),
          reader.GetString("city"),
          reader.GetDecimal("price"),
          reader.GetString("description")
      );
    }

    return null;
  }

  // Read activity rating by id
  public static async Task<ActivityRatingSummary?> GetActivityRating(int id, Config config)
  {
    string sql = @"
            SELECT
                a.activityid,
                a.name,
                COALESCE(AVG(r.star_rating), 0) AS avg_rating,
                COUNT(r.ratingid) AS rating_count
            FROM activity a
            LEFT JOIN bookingactivity ba ON ba.fk_activity_id = a.activityid
            LEFT JOIN booking b ON b.bookingid = ba.fk_booking_id
            LEFT JOIN rating r ON r.fk_booking_id = b.bookingid
            AND r.rating_type = 'Activity'
            WHERE a.activityid = @id
            GROUP BY a.activityid, a.name
            LIMIT 1;
        ";

    var parameters = new MySqlParameter[]
    {
            new("@id", id)
    };

    using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql, parameters);

    if (await reader.ReadAsync())
    {
      double avg = Convert.ToDouble(reader["avg_rating"]);
      int count = Convert.ToInt32(reader["rating_count"]);

      return new ActivityRatingSummary(
          reader.GetInt32("activityid"),
          reader.GetString("name"),
          avg,
          count
      );
    }

    return null;
  }
}
