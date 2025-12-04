using MySql.Data.MySqlClient;
using server;

var builder = WebApplication.CreateBuilder(args);

string db = "server=127.0.0.1;uid=holidaymaker;pwd=holidaymaker;database=holidaymaker";
Config config = new(db);
builder.Services.AddSingleton<Config>(config);

var app = builder.Build();

app.Run();
