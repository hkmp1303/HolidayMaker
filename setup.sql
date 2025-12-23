CREATE SCHEMA IF NOT EXISTS holidaymaker;
CREATE USER IF NOT EXISTS "holidaymaker" IDENTIFIED BY "holidaymaker";
GRANT ALL PRIVILEGES ON `holidaymaker`.* TO 'holidaymaker'@'localhost';

FLUSH PRIVILEGES;
USE holidaymaker;