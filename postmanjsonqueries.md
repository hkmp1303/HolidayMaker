
*app.MapPost("/package", PackageBooking.CreatePackageBooking);*

postman quary: boka ett travel package

{
  "travelpackageid": 1,
  "start": "2025-07-01",
  "end": "2025-07-10",
  "hotellist": [
    {
      "fk_room_id": 1,
      "date_start": "2025-07-01",
      "date_end": "2025-07-05"
    }
  ]
}

*app.MapPost("/booking", BookingRequest.CreateBooking);*

postman query: boka ett hotel

{
  "fk_transportation_id": 2,
  "hotellist": [
    {
      "fk_room_id": 2,
      "date_start": "2025-12-20",
      "date_end": "2025-12-22"
    }
  ]
}

*app.MapPost(""hotels/Name", HotelsQ.GetnameHotels")*
postman query: söka hotel efter namn
{
  "Name": "ice"
}

*app.MapPost("/rooms/availability", HotelsQ.GetAvailableHotels);*

postman query: see att et rum är bokad den här tiden

{
"startDate": "2026-06-11",
"endDate": "2026-06-11",
"minRooms": 1
}

postman query: vissa alla rum är inte bokade den här tiden

{
"startDate": "2027-02-12",
"endDate": "2027-02-14",
"minRooms": 1
}
