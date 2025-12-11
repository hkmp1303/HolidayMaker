SET FOREIGN_KEY_CHECKS = 0;
-- =========================================================
-- 1. HOLIDAYMAKERAB
-- =========================================================
INSERT IGNORE INTO holidaymakerab (holidaymakerabid, name, phonenumber, email, address) VALUES
(1, 'HolidayMaker AB Göteborg',  '+46-31-100100', 'info.gbg@holidaymaker.se',   'Kungsportsavenyn 1, 411 36 Göteborg'),
(2, 'HolidayMaker AB Stockholm', '+46-8-200200',  'info.sto@holidaymaker.se',   'Drottninggatan 10, 111 51 Stockholm'),
(3, 'HolidayMaker AB Malmö',     '+46-40-300300', 'info.malmo@holidaymaker.se', 'Södra Förstadsgatan 15, 211 43 Malmö');

-- =========================================================
-- 2. USER  (OBS: tabellnamn "user")
-- =========================================================
INSERT IGNORE INTO user (userid, email, password, firstname, lastname, phonenumber, address, role, fk_holidaymakerab_id) VALUES
(1, 'anna.kund@example.com',   'hashed_pw_1', 'Anna',   'Svensson',  '+46-70-1111111', 'Storgatan 1, 411 00 Göteborg',  'customer', 1),
(2, 'erik.kund@example.com',   'hashed_pw_2', 'Erik',   'Johansson', '+46-70-2222222', 'Sveavägen 12, 111 57 Stockholm','customer', 2),
(3, 'maria.kund@example.com',  'hashed_pw_3', 'Maria',  'Nilsson',   '+46-70-3333333', 'Föreningsgatan 20, 214 26 Malmö','customer',3),
(4, 'david.kund@example.com',  'hashed_pw_4', 'David',  'Karlsson',  '+46-70-4444444', 'Linnégatan 7, 413 04 Göteborg', 'customer', 1),
(5, 'lisa.admin@example.com',  'hashed_pw_5', 'Lisa',   'Andersson', '+46-70-5555555', 'Kungsgatan 5, 411 19 Göteborg', 'admin',    1),
(6, 'peter.admin@example.com', 'hashed_pw_6', 'Peter',  'Berg',      '+46-70-6666666', 'Vasagatan 15, 111 20 Stockholm','admin',    2);

-- =========================================================
-- 3. HOTEL  (POINT(lat lon), SRID 4326)
-- =========================================================
INSERT IGNORE INTO hotel (hotelid, name, description, address, city, phonenumber, email, total_capacity, coordinates) VALUES
-- USA
(1, 'The Plaza New York', 'Ikoniskt lyxhotell vid Central Park.', '768 5th Ave', 'New York', '+1-212-759-3000', 'plaza@fairmont.com', 282, ST_GeomFromText('POINT(40.7645 -73.9744)', 4326)),
(2, 'Beverly Hills Hotel', 'Kändistätt hotell i Los Angeles.', '9641 Sunset Blvd', 'Los Angeles', '+1-310-276-2251', 'beverlyHills@hotel.com', 210, ST_GeomFromText('POINT(34.0816 -118.4137)', 4326)),
(3, 'Miami Beach Resort', 'Hotell precis vid stranden och Ocean Drive.', '4833 Collins Ave', 'Miami', '+1-305-532-3600', 'miamibeachresort@resort.com', 400, ST_GeomFromText('POINT(25.8240 -80.1216)', 4326)),
(4, 'Caesars Palace', 'Gigantiskt casino-hotell i Las Vegas.', '3570 Las Vegas Blvd', 'Las Vegas', '+1-866-227-5938', 'ceasar@palace.com', 3960, ST_GeomFromText('POINT(36.1162 -115.1745)', 4326)),
(5, 'Fairmont San Francisco', 'Historiskt hotell med utsikt över bukten.', '950 Mason St', 'San Francisco', '+1-415-772-5000', 'fairmontSanFran@hotel.com', 600, ST_GeomFromText('POINT(37.7924 -122.4106)', 4326)),

-- EUROPA
(6, 'The Ritz Paris', 'Elegans i hjärtat av Paris.', '15 Place Vendôme', 'Paris', '+33-1-43-16-30-30', 'ritz@paris.com', 142, ST_GeomFromText('POINT(48.8680 2.3290)', 4326)),
(7, 'The Savoy London', 'Klassiskt brittiskt hotell vid Themsen.', 'Strand', 'London', '+44-20-7836-4343', 'thesavoy@londonhotel.com', 260, ST_GeomFromText('POINT(51.5103 -0.1206)', 4326)),
(8, 'Hotel Arts Barcelona', 'Skyskrapa med utsikt över Medelhavet.', 'Carrer de la Marina 19', 'Barcelona', '+34-932-211-000', 'hotelarts@barcelona.com', 480, ST_GeomFromText('POINT(41.3871 2.1963)', 4326)),
(9, 'Hotel Danieli Venice', 'Legendariskt hotell nära Markusplatsen.', 'Riva degli Schiavoni 4196', 'Venedig', '+39-041-522-6480', 'hoteldanieli@venicehotel.com', 200, ST_GeomFromText('POINT(45.4338 12.3421)', 4326)),
(10, 'Adlon Kempinski', 'Berömt hotell vid Brandenburger Tor.', 'Unter den Linden 77', 'Berlin', '+49-30-22610', 'adlon@keminskihotel.com', 380, ST_GeomFromText('POINT(52.5160 13.3808)', 4326)),
(11, 'Rome Cavalieri', 'Resort med panoramautsikt över Rom.', 'Via Alberto Cadlolo 101', 'Rom', '+39-06-35091', 'rome.cavalieri@hotel.com', 370, ST_GeomFromText('POINT(41.9213 12.4431)', 4326)),

-- ASIEN
(12, 'Marina Bay Sands', 'Världskänd pool på taket som ser ut som en båt.', '10 Bayfront Ave', 'Singapore', '+65-6688-8888', 'marianbay@sands.com', 2560, ST_GeomFromText('POINT(1.2834 103.8607)', 4326)),
(13, 'Park Hyatt Tokyo', 'Känt från filmen Lost in Translation.', '3-7-1-2 Nishi-Shinjuku', 'Tokyo', '+81-3-5322-1234', 'parkhyatt@tokyohotel.com', 170, ST_GeomFromText('POINT(35.6856 139.6911)', 4326)),
(14, 'Mandarin Oriental Bangkok', 'Lyxhotell vid floden Chao Phraya.', '48 Oriental Ave', 'Bangkok', '+66-2-659-9000', 'mandarin@bangkok.com', 330, ST_GeomFromText('POINT(13.7233 100.5144)', 4326)),
(15, 'Taj Mahal Palace', 'Historiskt landmärke vid havet.', 'Apollo Bunder', 'Mumbai', '+91-22-6665-3366', 'tajmahalpalace@resort.com', 560, ST_GeomFromText('POINT(18.9217 72.8332)', 4326)),
(16, 'Burj Al Arab', 'Sjöstjärneformat 7-stjärnigt hotell.', 'Jumeirah St', 'Dubai', '+971-4-301-7777', 'burjialarab@resort.com', 200, ST_GeomFromText('POINT(25.1412 55.1853)', 4326)),
(17, 'Atlantis The Palm', 'Resort på den konstgjorda ön Palm Jumeirah.', 'Crescent Rd', 'Dubai', '+971-4-426-2000', 'atlantisthepalm@hotel.com', 1500, ST_GeomFromText('POINT(25.1304 55.1171)', 4326)),

-- AUSTRALIEN & OCEANIEN
(18, 'Park Hyatt Sydney', 'Utsikt direkt mot operahuset.', '7 Hickson Rd', 'Sydney', '+61-2-9256-1234', 'parkhyatt@sydneyhotel.com', 155, ST_GeomFromText('POINT(-33.8550 151.2093)', 4326)),
(19, 'Four Seasons Bora Bora', 'Bungalows ute på vattnet.', 'Motu Tehotu', 'Bora Bora', '+689-40-60-31-30', 'fourseasons@borahotel.com', 100, ST_GeomFromText('POINT(-16.4746 -151.7248)', 4326)),
(20, 'Sofitel Auckland', 'Lyx vid hamnen Viaduct Harbour.', '21 Viaduct Harbour Ave', 'Auckland', '+64-9-909-9000', 'sofitel@auckland.com', 170, ST_GeomFromText('POINT(-36.8437 174.7594)', 4326)),

-- SYDAMERIKA
(21, 'Copacabana Palace', 'Art Deco-hotell vid stranden.', 'Av. Atlântica 1702', 'Rio de Janeiro', '+55-21-2548-7070', 'copacabana@palace.com', 230, ST_GeomFromText('POINT(-22.9673 -43.1790)', 4326)),
(22, 'Alvear Palace', 'Klassisk fransk stil i Sydamerika.', 'Av. Alvear 1891', 'Buenos Aires', '+54-11-4808-2100', 'alvear@palace.com', 190, ST_GeomFromText('POINT(-34.5880 -58.3900)', 4326)),

-- AFRIKA
(23, 'La Mamounia', 'Palatshotell med stora trädgårdar.', 'Avenue Bab Jdid', 'Marrakech', '+212-524-388-600', 'lamamounia@plalatshotel', 200, ST_GeomFromText('POINT(31.6218 -7.9972)', 4326)),
(24, 'The Table Bay', 'Vid Waterfront med utsikt över Taffelberget.', 'Quay 6', 'Kapstaden', '+27-21-406-5000', 'thetable@bayhotel.com', 320, ST_GeomFromText('POINT(-33.9056 18.4230)', 4326)),

-- NORDEN
(25, 'Gothia Sky Towers', 'Fantastisk utsikt över Göteborg.', 'Mässans Gata 24', 'Göteborg', '+46-31-123456', 'gothia.faulty@towers.se', 1200, ST_GeomFromText('POINT(57.6969 11.9865)', 4326)),
(26, 'Grand Hôtel', 'Vid Stockholms ström.', 'S. Blasieholmshamnen 8', 'Stockholm', '+46-8-123456', 'grandhotel@stockhom.se', 300, ST_GeomFromText('POINT(59.3295 18.0754)', 4326)),
(27, 'Icehotel', 'Byggt av snö och is.', 'Marknadsvägen 63', 'Jukkasjärvi', '+46-980-12345', 'icehotel@ishotell.se', 100, ST_GeomFromText('POINT(67.8512 20.6154)', 4326)),
(28, 'Villa Copenhagen', 'Nytt lyxhotell i gamla posthuset.', 'Tietgensgade 35', 'Köpenhamn', '+45-78-73-00-00', 'villacopenhagen@lyxhotell.dk', 390, ST_GeomFromText('POINT(55.6725 12.5695)', 4326)),
(29, 'Hotel Kämp', 'Finlands mest kända hotell.', 'Pohjoisesplanadi 29', 'Helsingfors', '+358-9-576-111', 'hotelkamp@finland.fi', 179, ST_GeomFromText('POINT(60.1678 24.9482)', 4326)),
(30, 'The Thief', 'Designhotell på Tjuvholmen.', 'Landgangen 1', 'Oslo', '+47-24-00-40-00', 'thethief@stold.no', 119, ST_GeomFromText('POINT(59.9075 10.7225)', 4326));

-- =========================================================
-- 4. AMENITY
-- =========================================================
INSERT IGNORE INTO amenity (amenityid, name) VALUES
(1, 'Free WiFi'),
(2, 'Breakfast included'),
(3, 'Swimming pool'),
(4, 'Gym'),
(5, 'Spa'),
(6, 'Airport shuttle'),
(7, 'Parking'),
(8, 'Bar & Lounge');

-- =========================================================
-- 5. HOTELAMENITY
-- =========================================================
-- Gothia Towers (hotelid = 1)
INSERT IGNORE INTO hotelamenity (fk_hotel_id, fk_amenity_id) VALUES
(1,1),(1,2),(1,3),(1,4),(1,7);

-- Grand Hôtel (hotelid = 2)
INSERT IGNORE INTO hotelamenity (fk_hotel_id, fk_amenity_id) VALUES
(2,1),(2,2),(2,3),(2,4),(2,5),(2,8);

-- Radisson Blu Malmö (hotelid = 3)
INSERT IGNORE INTO hotelamenity (fk_hotel_id, fk_amenity_id) VALUES
(3,1),(3,2),(3,4),(3,7);

-- Clarion Sign (hotelid = 4)
INSERT IGNORE INTO hotelamenity (fk_hotel_id, fk_amenity_id) VALUES
(4,1),(4,2),(4,4),(4,7),(4,8);

-- Barcelona Beach (hotelid = 5)
INSERT IGNORE INTO hotelamenity (fk_hotel_id, fk_amenity_id) VALUES
(5,1),(5,2),(5,3),(5,6),(5,8);

-- Roma Centro (hotelid = 6)
INSERT IGNORE INTO hotelamenity (fk_hotel_id, fk_amenity_id) VALUES
(6,1),(6,2),(6,5),(6,7);

-- Oslo Fjord Hotel (7)
INSERT IGNORE INTO hotelamenity (fk_hotel_id, fk_amenity_id) VALUES
(7,1),(7,2),(7,4),(7,7),(7,8);

-- Copenhagen City Hotel (8)
INSERT IGNORE INTO hotelamenity (fk_hotel_id, fk_amenity_id) VALUES
(8,1),(8,2),(8,4),(8,7);

-- =========================================================
-- 6. TRANSPORTATION  (POINT(lat lon))
-- =========================================================
INSERT IGNORE INTO transportation (transportationid, name, phonenumber, departure, arrival, coordinates, fk_price_id) VALUES
(1, 'Flyg Göteborg–Barcelona', '+46-770-123456', '2026-06-10 08:00:00', '2026-06-10 11:00:00',
 ST_GeomFromText('POINT(57.6660 12.2948)', 4326), 7),  -- Landvetter
(2, 'Tåg Stockholm–Malmö',     '+46-771-757575', '2026-07-01 09:30:00', '2026-07-01 13:45:00',
 ST_GeomFromText('POINT(59.3300 18.0580)', 4326), 8),   -- Stockholm C
(3, 'Flyg Köpenhamn–Rom',      '+45-32-123456',  '2026-09-05 07:15:00', '2026-09-05 10:00:00',
 ST_GeomFromText('POINT(55.6180 12.6560)', 4326), 7),  -- CPH
(4, 'Färja Göteborg–Kiel',     '+46-31-123450',  '2026-08-15 18:00:00', '2026-08-16 09:00:00',
 ST_GeomFromText('POINT(57.7060 11.9660)', 4326), 7),  -- Göteborgs hamn
(5, 'Inrikesflyg Stockholm–Luleå', '+46-770-654321', '2026-12-20 07:00:00', '2026-12-20 08:30:00',
 ST_GeomFromText('POINT(59.6519 17.9186)', 4326), 8);  -- Arlanda

-- =========================================================
-- 7. ACTIVITY  (POINT(lat lon))
-- =========================================================
INSERT IGNORE INTO activity (activityid, name, phonenumber, address, city, fk_price_id, description, coordinates) VALUES
(1, 'Lisebergsbesök', '+46-31-400100', 'Örgrytevägen 5', 'Göteborg', 9,
 'Heldagsentré till Liseberg nöjespark.', ST_GeomFromText('POINT(57.6959 11.9936)', 4326)),
(2, 'Skärgårdskryssning', '+46-31-987654', 'Packhuskajen 10', 'Göteborg', 5,
 '3 timmars båttur i Göteborgs södra skärgård.', ST_GeomFromText('POINT(57.7060 11.9570)', 4326)),
(3, 'Gamla Stan Walking Tour', '+46-8-7654321', 'Stortorget', 'Stockholm', 10,
 'Guided tur genom Gamla Stans gränder.', ST_GeomFromText('POINT(59.3250 18.0700)', 4326)),
(4, 'Gaudí Walking Tour', '+34-93-9876500', 'Plaça de Catalunya', 'Barcelona', 6,
 'Guided tur med fokus på Gaudís arkitektur.', ST_GeomFromText('POINT(41.3870 2.1700)', 4326)),
(5, 'Colosseum Night Tour', '+39-06-1234567', 'Piazza del Colosseo 1', 'Roma', 11,
 'Kvällstur i Colosseum med guide.', ST_GeomFromText('POINT(41.8902 12.4922)', 4326)),
(6, 'Fjord Cruise Oslo', '+47-22-765432', 'Rådhusbrygge 3', 'Oslo', 12,
 '2 timmars fjordkryssning i Oslofjorden.', ST_GeomFromText('POINT(59.9080 10.7270)', 4326));

-- =========================================================
-- 8. RATING
-- =========================================================
INSERT IGNORE INTO rating (ratingid, star_rating, description, fk_user_id, fk_hotel_id, fk_activity_id) VALUES
(1, 5, 'Fantastisk utsikt och bra service.',      1, 1, 1),
(2, 4, 'Mycket trevligt hotell, bra frukost.',    2, 2, 3),
(3, 3, 'Bra läge men lite små rum.',              3, 3, 2),
(4, 5, 'Magisk kvällstur i Colosseum.',           1, 6, 5),
(5, 4, 'Väldigt rolig Gaudí-tur.',                4, 5, 4),
(6, 5, 'Fjordkryssningen var otrolig.',           2, 7, 6);

-- =========================================================
-- 9. BOOKING
-- =========================================================
INSERT IGNORE INTO booking (bookingid, bookingdate, fk_user_id, fk_transportation_id) VALUES
(1, '2026-06-01 10:15:00', 1, 1),  -- Anna, flyg Gbg–Barcelona
(2, '2026-07-10 14:30:00', 2, 2),  -- Erik, tåg Sthlm–Malmö
(3, '2026-08-01 09:00:00', 3, 4),  -- Maria, färja Gbg–Kiel
(4, '2026-09-01 09:00:00', 1, 3),  -- Anna, flyg CPH–Rom
(5, '2026-12-10 12:00:00', 4, 5),  -- David, flyg Sthlm–Luleå
(6, '2026-05-20 08:30:00', 2, NULL); -- Erik, bokning utan transport (lokalt hotell)

-- =========================================================
-- 10. PRICE
-- =========================================================
INSERT IGNORE INTO price (priceid, price, priceType) VALUES
(1, 895.00,  'Room'),
(2, 1295.00, 'Room'),
(3, 1595.00, 'Room'),
(4, 1995.00, 'Room'),
(5, 450.00,  'Activity'),
(6, 390.00,  'Activity'),
(7, 750.00,  'Transportation'),
(8, 1200.00, 'Transportation'),
(9, 595.00, 'Activity'),
(10, 350.00, 'Activity'),
(11, 420.00, 'Activity'),
(12, 520.00, 'Activity');

-- =========================================================
-- 11. ROOM
-- =========================================================
INSERT IGNORE INTO room (roomid, fk_hotel_id, fk_price_id, roomtype, status) VALUES
(1, 1, 1, 'Double twin',     'Vacant'),
(2, 1, 2, 'Suite',   'Reserved'),
(3, 2, 2, 'Double bed',     'Vacant'),
(4, 2, 3, 'Family',   'Occupied'),
(5, 3, 1, 'Double bed',     'Vacant'),
(6, 4, 3, 'Suite','Unavailable'),
(7, 5, 4, 'Double bed',     'Vacant'),
(8, 6, 4, 'Family',   'Reserved');

-- =========================================================
-- 12. BOOKINGACTIVITY
-- =========================================================
INSERT IGNORE INTO bookingactivity (bookingactivityid, fk_booking_id, fk_activity_id, DateStart, DateEnd) VALUES
(1, 1, 4, '2026-06-11', '2026-06-11'), -- Gaudí tour
(2, 2, 1, '2026-07-16', '2026-07-16'), -- Liseberg
(3, 3, 2, '2026-08-02', '2026-08-02'), -- Skärgårdskryssning
(4, 4, 5, '2026-09-06', '2026-09-06'), -- Colosseum
(5, 5, 3, '2026-12-11', '2026-12-11'), -- Gamla Stan
(6, 6, 1, '2026-05-21', '2026-05-21'); -- Liseberg (lokal bokning)

-- =========================================================
-- 13. BOOKINGHOTEL
-- =========================================================
INSERT IGNORE INTO bookinghotel (bookinghotelid, fk_booking_id, fk_room_id, date_start, date_end) VALUES
(1, 1, 7, '2026-06-10', '2026-06-15'), -- Barcelona Beach
(2, 2, 3, '2026-07-15', '2026-07-18'), -- Grand Hôtel
(3, 3, 5, '2026-08-15', '2026-08-18'), -- Radisson Malmö
(4, 4, 8, '2026-09-05', '2026-09-09'), -- Roma Centro
(5, 5, 4, '2026-12-20', '2026-12-23'), -- Grand Hôtel Family-rum
(6, 6, 1, '2026-05-20', '2026-05-22'); -- Gothia Towers

-- =========================================================
-- 14. COUNTRY
-- =========================================================
INSERT IGNORE INTO country (countryid, country) VALUES
(1, 'Sweden'),
(2, 'Norway'),
(3, 'Denmark'),
(4, 'Spain'),
(5, 'Italy'),
(6, 'Germany'),
(7, 'United States'),
(8, 'France'),
(9, 'United Kingdom'),
(10, 'Singapore'),
(11, 'Japan'),
(12, 'Thailand'),
(13, 'India'),
(14, 'Australia'),
(15, 'United Arab Emirates'),
(16, 'Brazil'),
(17, 'Argentina'),
(18, 'Morocco'),
(19, 'South Africa'),
(20, 'Finland');

-- =========================================================
-- 15. BYCOUNTRYSEARCH
-- =========================================================
INSERT IGNORE INTO bycountrysearch (bycountrysearchid, fk_hotel_id, fk_activity_id, fk_transportation_id, fk_country_id) VALUES
(1, 1, 1, 4, 1),  -- Gothia + Liseberg + färja Gbg–Kiel (Sweden)
(2, 2, 3, 2, 1),  -- Grand + Gamla Stan + tåg Sthlm–Malmö (Sweden)
(3, 3, 2, NULL, 1), -- Radisson Malmö + skärgård (svensk produkt)
(4, 4, NULL, 2, 1), -- Clarion Sign + tåg (Sweden)
(5, 5, 4, 1, 4),    -- Barcelona Beach + Gaudí + flyg Gbg–Barcelona (Spain)
(6, 6, 5, 3, 5),    -- Roma Centro + Colosseum + flyg CPH–Rom (Italy)
(7, 7, 6, NULL, 2), -- Oslo Fjord Hotel + fjord cruise (Norway)
(8, 8, NULL, 3, 3); -- Copenhagen City Hotel + flyg CPH–Rom (Denmark)
SET FOREIGN_KEY_CHECKS = 1;