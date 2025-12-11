using System.Net.Mime;
using MySql.Data.MySqlClient;
namespace server;

public class ActivitiesQ
{
  // Enkel modell för aktivitet
  public record ActivitySimple(int Id, string Name);

  //Detaljerad modell för aktivitet
  public record ActivityFull(
    int Id, string Name, string Phonenumber, string Address, string City, decimal Price, string? Description, double Latitude, double Longitude
  );

  // Hämtar alla aktiviteter kopplade till ett visst land (resmål)
  // countryName = t.ex. "Sweden", "Spain", "Italy"
  public static async Task<List<ActivityFull>> GetActivitiesByCountry(string countryName, Config config)
  {
    // Lista som vi fyller med aktiviteter från databasen
    var activities = new List<ActivityFull>();

    // SQL fråga:
    // hämtar information från activity
    // kopplar ihop via bycountrysearch
    // filtrerar på landet i tabellen country
    string sql = @"
            SELECT 
                a.activityid,
                a.name,
                a.phonenumber,
                a.address,
                a.city,
                a.price,
                a.description,
                ST_X(a.coordinates) AS x,
                ST_Y(a.coordinates) AS y
            FROM activity a
            JOIN bycountrysearch bcs ON a.activityid = bcs.fk_activity_id
            JOIN country c ON bcs.fk_country_id = c.countryid
            WHERE c.country = @countryName
        ";

    // Parameter för att undvika SQL injection och skicka in landets namn
    var parameters = new MySqlParameter[]
    {
            new("@countryName", countryName)
    };

    // Kör SQL frågan mot databasen och får tillbaka en datareader
    using var reader = await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, sql, parameters);

    // Läser rad för rad från resultatet
    while (await reader.ReadAsync())
    {
      // Skapar ett ActivityFull-objekt från varje rad och lägger till i listan
      activities.Add(new ActivityFull(
          reader.GetInt32("activityid"),
          reader.GetString("name"),
          reader.GetString("phonenumber"),
          reader.GetString("address"),
          reader.GetString("city"),
          reader.GetDecimal("price"),
          reader.IsDBNull(reader.GetOrdinal("description"))
              ? null
              : reader.GetString("description"),
          reader.GetDouble("y"), // Latitude (ST_Y)
          reader.GetDouble("x")  // Longitude (ST_X)
      ));
    }

    // Returnerar aktiviteter för landet
    return activities;
  }

  // Hämtar bara id och namn för aktiviteter
  public static async Task<List<ActivitySimple>> GetSimpleActivitiesByCountry(string countryName, Config config)
  {
    var activities = new List<ActivitySimple>();

    string sql = @"
            SELECT DISTINCT
                a.activityid,
                a.name
            FROM activity a
            JOIN bycountrysearch bcs ON a.activityid = bcs.fk_activity_id
            JOIN country c ON bcs.fk_country_id = c.countryid
            WHERE c.country = @countryName
        ";

    var parameters = new MySqlParameter[]
    {
            new("@countryName", countryName)
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
}
