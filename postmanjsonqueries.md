
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


