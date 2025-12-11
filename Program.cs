using MySql.Data.MySqlClient;
using server;


string db = "server=127.0.0.1;uid=holidaymaker;pwd=holidaymaker;database=holidaymaker"; //login and connection to database
Config config = new(db);

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton(config);
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
    {
        options.Cookie.IsEssential = true;
        options.Cookie.HttpOnly = true;
    });

var app = builder.Build();
app.UseSession();
app.MapGet("/", () => "Server is running");
// Get user data
app.MapGet("/profile", Profile.Get_UserData);
// Update user data by user
app.MapPatch("/profile", Profile.Patch_UserData);
// Login
app.MapPost("/login", Login.Post);
//create user
app.MapPost("/createuser", CreateUser.Post);
//booking
app.MapPost("/booking", BookingRequest.CreateBooking);

//Reset and create the database
app.MapDelete("/db", DbReset);
app.MapGet("/Hotel", HotelsQ.GetHotels); 
app.MapGet("/fhotel", HotelsQ.GetHotelsAdmin);
app.MapGet("/HotelPrice", HotelsQ.GetHotelPrice);
app.MapGet("/HotelAmenity", HotelsQ.GetHotelAmenities);
app.MapGet("/activities/{country}", ActivitiesQ.GetActivitiesByCountry);

app.Run();

async Task DbReset(Config config) //create tables, also hard reset
{
    string dropSql ="""
    SET FOREIGN_KEY_CHECKS = 0;
    DROP TABLE IF EXISTS
        rating,
        bookingactivity,
        bookinghotel,
        booking,
        hotel,
        hotelamenity,
        amenity,
        transportation,
        user,
        room,
        price,
        holidaymakerab,
        activity,
        country,
        bycountrysearch;
    SET FOREIGN_KEY_CHECKS =1;
    """; //string that hold the databse and fk

    await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, dropSql); //connection

    string holidaymakerdb = File.ReadAllText("data.ddl"); //create tables with fk connections

    await MySqlHelper.ExecuteNonQueryAsync(config.ConnectionString, holidaymakerdb); //creating the database
}