SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS holidaymakerab (
    holidaymakerabid INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    phonenumber VARCHAR(20) NOT NULL,
    email VARCHAR(254) NOT NULL,
    `address` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS user (
    userid INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    phonenumber VARCHAR(20) NULL,
    `address` VARCHAR(255) NOT NULL,
    consent DATETIME NULL,
    requestDelete DATETIME NULL,
    requestPass VARCHAR(36) NULL,
    `role` ENUM ('customer', 'admin') NOT NULL,
    fk_holidaymakerab_id INT,
    FOREIGN KEY(fk_holidaymakerab_id) REFERENCES holidaymakerab(holidaymakerabid)
);

CREATE TABLE IF NOT EXISTS hotel (
    hotelid INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `address` VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    phonenumber VARCHAR(20),
    email VARCHAR(254),
    total_capacity INT NOT NULL,
    coordinates POINT NOT NULL SRID 4326,
    SPATIAL INDEX(coordinates)
);

CREATE TABLE IF NOT EXISTS amenity (
    amenityid INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS hotelamenity (
    fk_hotel_id INT NOT NULL,
    fk_amenity_id INT NOT NULL,
    PRIMARY KEY (`fk_hotel_id`, `fk_amenity_id`),
    FOREIGN KEY (fk_amenity_id) REFERENCES amenity(amenityid),
    FOREIGN KEY(fk_hotel_id) REFERENCES hotel(hotelid)
);

CREATE TABLE IF NOT EXISTS price (
    priceid int PRIMARY key AUTO_INCREMENT,
    price decimal(10, 2) NOT NULL,
    priceType enum('Room', 'Activity', 'Transportation') NOT NULL
);

CREATE TABLE IF NOT EXISTS transportation (
    transportationid INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    phonenumber VARCHAR(20) NOT NULL,
    departure DATETIME,
    arrival DATETIME,
    coordinates POINT NOT NULL SRID 4326,
    fk_price_id int NOT NULL,
    SPATIAL INDEX(coordinates),
    FOREIGN KEY (fk_price_id) REFERENCES price(priceid)
);

CREATE TABLE IF NOT EXISTS activity (
    activityid INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    phonenumber VARCHAR(20) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    fk_price_id int NOT NULL,
    `description` TEXT,
    coordinates POINT NOT NULL SRID 4326,
    SPATIAL INDEX(coordinates),
    FOREIGN KEY (fk_price_id) REFERENCES price(priceid)
);

CREATE TABLE IF NOT EXISTS rating (
    ratingid INT PRIMARY KEY AUTO_INCREMENT,
    star_rating INT NOT NULL CHECK (star_rating BETWEEN 1 AND 5),
    `description` TEXT,
    date_created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    rating_type enum('Hotel', 'Activity', 'Transportation', 'Package') NOT NULL,
    fk_booking_id INT NOT NULL,
    CONSTRAINT UC_type_booking UNIQUE (rating_type, fk_booking_id),
    FOREIGN KEY (fk_booking_id) REFERENCES booking(bookingid)
);

CREATE TABLE IF NOT EXISTS booking (
    bookingid INT PRIMARY KEY AUTO_INCREMENT,
    bookingdate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fk_user_id INT NOT NULL,
    fk_transportation_id INT,
    `status` enum('Active', 'Booked', 'Canceled') DEFAULT 'Active',
    FOREIGN KEY (fk_user_id) REFERENCES user(userid),
    FOREIGN KEY (fk_transportation_id) REFERENCES transportation(transportationid)
);

CREATE TABLE IF NOT EXISTS room (
    roomid int PRIMARY KEY AUTO_INCREMENT,
    fk_hotel_id int NOT NULL,
    fk_price_id int NOT NULL,
    roomtype enum('Double twin', 'Double bed', 'Family', 'Suite') NOT NULL,
    `status` enum('Vacant', 'Reserved', 'Occupied', 'Unavailable') NOT NULL,
    FOREIGN KEY (fk_hotel_id) REFERENCES hotel(hotelid),
    FOREIGN KEY (fk_price_id) REFERENCES price(priceid)
);

CREATE TABLE IF NOT EXISTS bookingactivity (
    bookingactivityid INT PRIMARY KEY AUTO_INCREMENT,
    fk_booking_id INT NOT NULL,
    fk_activity_id INT NOT NULL,
    DateStart DATE NOT NULL,
    DateEnd DATE NOT NULL,
    FOREIGN KEY (fk_booking_id) REFERENCES booking(bookingid),
    FOREIGN KEY (fk_activity_id) REFERENCES activity(activityid)
);

CREATE TABLE IF NOT EXISTS bookinghotel (
    bookinghotelid INT PRIMARY KEY AUTO_INCREMENT,
    fk_booking_id INT NOT NULL,
    fk_room_id INT NOT NULL,
    date_start DATE NOT NULL,
    date_end DATE NOT NULL,
    FOREIGN KEY (fk_booking_id) REFERENCES booking(bookingid),
    FOREIGN KEY (fk_room_id) REFERENCES room(roomid)
);

CREATE TABLE IF NOT EXISTS country (
    countryid INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS bycountrysearch (
    bycountrysearchid INT PRIMARY KEY AUTO_INCREMENT,
    fk_hotel_id INT,
    fk_activity_id INT,
    fk_transportation_id INT,
    fk_country_id INT,
    FOREIGN KEY (fk_hotel_id) REFERENCES hotel(hotelid),
    FOREIGN KEY (fk_activity_id) REFERENCES activity(activityid),
    FOREIGN KEY (fk_transportation_id) REFERENCES transportation(transportationid),
    FOREIGN KEY (fk_country_id) REFERENCES country(countryid)
);

CREATE TABLE IF NOT EXISTS travelpackage(
    travelpackageid INT PRIMARY KEY AUTO_INCREMENT,
    fk_user_id INT,
    fk_holidaymakerab_id INT,
    title VARCHAR(100) NOT NULL UNIQUE,
    FOREIGN KEY (fk_user_id) REFERENCES user(userid),
    FOREIGN KEY (fk_holidaymakerab_id) REFERENCES holidaymakerab(holidaymakerabid)
);

CREATE TABLE IF NOT EXISTS packagedetails(
    packagedetailsid INT PRIMARY KEY AUTO_INCREMENT,
    fk_travelpackage_id INT,
    fk_hotel_id INT,
    fk_activity_id INT,
    FOREIGN KEY (fk_travelpackage_id) REFERENCES travelpackage(travelpackageid),
    FOREIGN KEY (fk_activity_id) REFERENCES activity(activityid),
    FOREIGN KEY (fk_hotel_id) REFERENCES hotel(hotelid)
);
SET FOREIGN_KEY_CHECKS = 1;
