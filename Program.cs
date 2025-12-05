using MySql.Data.MySqlClient;
using server;

var builder = WebApplication.CreateBuilder(args);

string db = "server=127.0.0.1;uid=holidaymaker;pwd=holidaymaker;database=holidaymaker";
Config config = new(db);
builder.Services.AddSingleton<Config>(config);

var app = builder.Build();

//Reset and creaste
app.MapDelete("/dbcustomertable", DbResetCostumerTable);

app.Run();

async Task DbResetCostumerTable(Config config) //create customer table, also hard reset
{
    await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, "DROP TABLE IF EXISTS customer"); 

    string customerTable = """
        CREATE TABLE customer
        (
            id INT PRIMARY KEY AUTO_INCREMENT,
            email VARCHAR(254),
            password VARCHAR(255),
            firstname VARCHAR(100),
            lastname VARCHAR(100),
            phonenumber VARCHAR(20),
            address VARCHAR(255)
        )
    """;
    await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, customerTable);
}