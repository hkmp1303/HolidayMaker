using MySql.Data.MySqlClient;
namespace server;

public class ActivitiesQ
{
  public record ActivitySimple(int Id, string Name, decimal? Stars = null);

  public record ActivityFull(
      int Id, string Name, string Phonenumber, string Address, string City, decimal Price, string? Description, double Latitude, double Longitude
  );

    public static async Task<IEnumerable<ActivitySimple>> Get_Activities(Config config, HttpContext ctx)
    {
        var qs = ctx.Request.Query;
        bool sortbystars = bool.TryParse(qs["sortbystars"], out sortbystars);
        var activities = new List<ActivitySimple>();
        string sort = (sortbystars ? "stars DESC, " : "") + "a.name ASC";
        var sql = $"""
                SELECT a.activityid, a.name, ROUND(AVG(s.star_rating), 1) AS stars
                FROM activity AS a
                    LEFT JOIN bookingactivity AS b ON a.activityid = b.fk_activity_id
                    LEFT JOIN rating AS s USING(fk_booking_id)
                GROUP BY a.activityid
                ORDER BY {sort}
                """;
        using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql);
        while (await reader.ReadAsync())
        {
            activities.Add(new ActivitySimple(
                reader.GetInt32("activityid"),
                reader.GetString("name"),
                reader.IsDBNull(2) ? null : reader.GetDecimal("stars")
            ));
        }
        return activities;
    }
  public static async Task<List<ActivityFull>> GetActivitiesByCountry(string country, Config config)
  {
    var activities = new List<ActivityFull>();

    string sql = @"
            SELECT
              a.activityid,
              a.name,
              a.phonenumber,
              a.address,
              a.city,
              COALESCE(p.price, 0) AS price,
              a.description,
              ST_X(a.coordinates) AS x,
              ST_Y(a.coordinates) AS y
            FROM activity a
            LEFT JOIN price p ON p.priceid = a.fk_price_id
            WHERE EXISTS (
              SELECT 1
              FROM bycountrysearch b
              JOIN country c ON c.countryid = b.fk_country_id
              WHERE LOWER(c.country) = LOWER(@country)
                AND b.fk_activity_id = a.activityid
            );
            ";

    var parameters = new MySqlParameter[]
    {
            new("@country", country)
    };

    using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql, parameters);

    while (await reader.ReadAsync())
    {
      int id = reader.GetInt32("activityid");
      string name = reader.GetString("name");
      string phone = reader.GetString("phonenumber");
      string address = reader.GetString("address");
      string city = reader.GetString("city");

      decimal price = reader.IsDBNull(reader.GetOrdinal("price"))
          ? 0m
          : reader.GetDecimal("price");

      string? description = reader.IsDBNull(reader.GetOrdinal("description"))
          ? null
          : reader.GetString("description");

      double longitude = reader.IsDBNull(reader.GetOrdinal("x")) ? 0.0 : reader.GetDouble("x");
      double latitude = reader.IsDBNull(reader.GetOrdinal("y")) ? 0.0 : reader.GetDouble("y");

      activities.Add(new ActivityFull(
          id,
          name,
          phone,
          address,
          city,
          price,
          description,
          latitude,
          longitude
      ));
    }

    return activities;
  }

  // Read Bara id och name för ett land
  public static async Task<List<ActivitySimple>> GetSimpleActivitiesByCountry(string country, Config config)
  {
    var activities = new List<ActivitySimple>();

    // För att undvika dubletter via bycountrysearch
    string sql = @"
            SELECT DISTINCT
              a.activityid,
              a.name
            FROM bycountrysearch b
            JOIN country c ON c.countryid = b.fk_country_id
            JOIN activity a ON a.activityid = b.fk_activity_id
            WHERE LOWER(c.country) = LOWER(@country);
            ";

    var parameters = new MySqlParameter[]
    {
            new("@country", country)
    };

    using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql, parameters);

    while (await reader.ReadAsync())
    {
      activities.Add(new ActivitySimple(
          reader.GetInt32("activityid"),
          reader.GetString("name")
      ));
    }

    return activities;
  }

  // Read en aktivitet by id
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
              a.description,
              ST_X(a.coordinates) AS x,
              ST_Y(a.coordinates) AS y
            FROM activity a
            LEFT JOIN price p ON a.fk_price_id = p.priceid
            WHERE a.activityid = @id
            LIMIT 1;
            ";

    var param = new MySqlParameter("@id", id);

    using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql, param);

    if (await reader.ReadAsync())
    {
      string? description = reader.IsDBNull(reader.GetOrdinal("description"))
          ? null
          : reader.GetString("description");

      double longitude = reader.IsDBNull(reader.GetOrdinal("x")) ? 0.0 : reader.GetDouble("x");
      double latitude = reader.IsDBNull(reader.GetOrdinal("y")) ? 0.0 : reader.GetDouble("y");

      return new ActivityFull(
          reader.GetInt32("activityid"),
          reader.GetString("name"),
          reader.GetString("phonenumber"),
          reader.GetString("address"),
          reader.GetString("city"),
          reader.IsDBNull(reader.GetOrdinal("price")) ? 0m : reader.GetDecimal("price"),
          description,
          latitude,
          longitude
      );
    }

    return null;
  }
}
