DROP DATABASE transportation_db;
CREATE DATABASE transportation_db;
USE transportation_db;

CREATE TABLE PASSENGER (
  passenger_id INT AUTO_INCREMENT,
  fname VARCHAR(20) NOT NULL,
  lname VARCHAR(20) NOT NULL,
  gender CHAR(1) NOT NULL,
  age INT NOT NULL DEFAULT 18,
  type VARCHAR(30) NOT NULL,
  card_id VARCHAR(20) NOT NULL UNIQUE,
  total_amount FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (passenger_id),
  CONSTRAINT check_age CHECK (age >= 0),
  CONSTRAINT check_amount CHECK (total_amount >= 0)
);

CREATE TABLE PREFERENCE (
  preference_id INT AUTO_INCREMENT,
  passenger_id INT NOT NULL,
  class_type VARCHAR(45),
  seat_position VARCHAR(10) DEFAULT 'corridor',
  day_time VARCHAR(5) NOT NULL DEFAULT 'day',
  meal_menu VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (preference_id),
  FOREIGN KEY (passenger_id) REFERENCES PASSENGER(passenger_id) ON DELETE CASCADE
);

CREATE TABLE LOCATION (
  location_id INT AUTO_INCREMENT,
  name VARCHAR(50) NULL DEFAULT NULL,
  location VARCHAR(50) NOT NULL,
  location_type VARCHAR(50) NOT NULL,
  PRIMARY KEY (location_id)
);

CREATE TABLE EXPEDITION (
  expedition_id INT AUTO_INCREMENT,
  expedition_type VARCHAR(45) NOT NULL,
  departure_location_id INT NOT NULL,
  arrival_location_id INT NOT NULL,
  PRIMARY KEY (expedition_id),
  FOREIGN KEY (departure_location_id) REFERENCES LOCATION(location_id) ON DELETE CASCADE,
  FOREIGN KEY (arrival_location_id) REFERENCES LOCATION(location_id) ON DELETE CASCADE
);

CREATE TABLE GUIDE (
  guide_id INT AUTO_INCREMENT,
  gender CHAR(1) NOT NULL,
  fname VARCHAR(45) NOT NULL,
  lname VARCHAR(45) NOT NULL,
  age INT NOT NULL DEFAULT 18,
  PRIMARY KEY (guide_id)
);

CREATE TABLE VEHICLE (
  vehicle_id INT AUTO_INCREMENT,
  company VARCHAR(30) NOT NULL,
  transportation_type VARCHAR(50) NOT NULL,
  PRIMARY KEY (vehicle_id)
);

CREATE TABLE IZBAN (
  izban_id INT AUTO_INCREMENT,
  number_of_vagons INT NOT NULL DEFAULT 6,
  PRIMARY KEY (izban_id),
  FOREIGN KEY (izban_id) REFERENCES VEHICLE(vehicle_id) ON DELETE CASCADE,
  CONSTRAINT check_number_of_vagons CHECK (number_of_vagons >= 1)
);

CREATE TABLE VEHICLE_TYPE (
  type_id INT AUTO_INCREMENT,
  type_name VARCHAR(45) NOT NULL,
  brand VARCHAR(45) NOT NULL,
  PRIMARY KEY (type_id)
);

CREATE TABLE TICKET_VEHICLE (
  ticket_vehicle_id INT AUTO_INCREMENT,
  total_no_of_seats INT NOT NULL DEFAULT 100,
  ticket_vehicle_type VARCHAR(45) NOT NULL,
  airplane_registration_number VARCHAR(45) UNIQUE DEFAULT NULL,
  plate_no VARCHAR(45) UNIQUE DEFAULT NULL,
  ferry_name VARCHAR(45) UNIQUE DEFAULT NULL,
  number_of_vagons INT DEFAULT NULL,
  type_id INT,
  PRIMARY KEY (ticket_vehicle_id),
  FOREIGN KEY (ticket_vehicle_id) REFERENCES VEHICLE (vehicle_id) ON UPDATE CASCADE ON DELETE CASCADE, 
  FOREIGN KEY (type_id) REFERENCES VEHICLE_TYPE (type_id) ON DELETE SET NULL
);

CREATE TABLE LEG_INSTANCE (
  leg_id INT AUTO_INCREMENT,
  price FLOAT NOT NULL DEFAULT 0,
  departure_datetime DATETIME NOT NULL DEFAULT '1999-01-01',
  arrival_datetime DATETIME NOT NULL DEFAULT '1999-01-01',
  expedition_id INT NOT NULL,
  guide_id INT,
  izban_id INT,
  ticket_vehicle_id INT,
  number_of_available_seats INT,
  PRIMARY KEY (leg_id, expedition_id),
  FOREIGN KEY (expedition_id) REFERENCES EXPEDITION (expedition_id) ON DELETE CASCADE,
  FOREIGN KEY (guide_id) REFERENCES GUIDE (guide_id),
  FOREIGN KEY (izban_id) REFERENCES IZBAN (izban_id),
  FOREIGN KEY (ticket_vehicle_id) REFERENCES TICKET_VEHICLE (ticket_vehicle_id),
  CONSTRAINT check_price CHECK (price >= 0),
  CONSTRAINT check_seats CHECK (number_of_available_seats >= 0)
);

CREATE TABLE SEAT (
  seat_no INT AUTO_INCREMENT,
  leg_id INT NOT NULL,
  expedition_id INT NOT NULL,
  PRIMARY KEY (seat_no, leg_id, expedition_id),
  FOREIGN KEY (leg_id , expedition_id) REFERENCES LEG_INSTANCE (leg_id , expedition_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE TICKET (
  ticket_id INT AUTO_INCREMENT,
  class_type VARCHAR(45) NOT NULL,
  ticket_price FLOAT NOT NULL DEFAULT 0,
  passenger_id INT NOT NULL,
  seat_no INT NOT NULL,
  leg_id INT NOT NULL,
  expedition_id INT NOT NULL,
  PRIMARY KEY (ticket_id),
  FOREIGN KEY (passenger_id) REFERENCES PASSENGER (passenger_id) ON DELETE CASCADE,
  FOREIGN KEY (seat_no , leg_id , expedition_id) REFERENCES SEAT (seat_no , leg_id , expedition_id)
);

CREATE TABLE RENTAL_VEHICLE (
  rental_vehicle_id INT AUTO_INCREMENT,
  price_per_minute FLOAT NOT NULL,
  rental_vehicle_type VARCHAR(45) NOT NULL,
  moped_model VARCHAR(45),
  scooter_model VARCHAR(45),
  engine_serial_number VARCHAR(45) UNIQUE,
  car_model VARCHAR(45),
  PRIMARY KEY (rental_vehicle_id),
  FOREIGN KEY (rental_vehicle_id) REFERENCES VEHICLE (vehicle_id) ON DELETE CASCADE
);

CREATE TABLE RIDE (
  ride_id INT AUTO_INCREMENT,
  departure_date_time DATETIME NOT NULL DEFAULT '1999-01-01',
  arrival_date_time DATETIME NOT NULL DEFAULT '1999-01-01',
  passenger_id INT NOT NULL,
  departure_location_id INT NOT NULL,
  arrival_location_id INT NOT NULL,
  vehicle_id INT NOT NULL,
  PRIMARY KEY (ride_id),
  FOREIGN KEY (passenger_id) REFERENCES PASSENGER (passenger_id) ON DELETE CASCADE,
  FOREIGN KEY (departure_location_id) REFERENCES LOCATION (location_id) ON DELETE CASCADE,
  FOREIGN KEY (arrival_location_id) REFERENCES LOCATION (location_id) ON DELETE CASCADE,
  FOREIGN KEY (vehicle_id) REFERENCES RENTAL_VEHICLE (rental_vehicle_id)
);

CREATE TABLE RIDE_HISTORY (
  passenger_id INT NOT NULL,
  ride_id INT NOT NULL,
  PRIMARY KEY (passenger_id, ride_id),
  FOREIGN KEY (passenger_id) REFERENCES PASSENGER (passenger_id) ON DELETE CASCADE,
  FOREIGN KEY (ride_id) REFERENCES RIDE (ride_id) ON DELETE CASCADE
);

CREATE TABLE RENTAL_SEARCH_HISTORY (
  passenger_id INT NOT NULL,
  vehicle_id INT NOT NULL,
  searched_time DATETIME NOT NULL DEFAULT '1999-01-01',
  PRIMARY KEY (passenger_id, vehicle_id),
  FOREIGN KEY (passenger_id) REFERENCES PASSENGER (passenger_id) ON DELETE CASCADE,
  FOREIGN KEY (vehicle_id) REFERENCES RENTAL_VEHICLE (rental_vehicle_id)
);

CREATE TABLE EXPEDITION_SEARCH_HISTORY (
  passenger_id INT NOT NULL,
  expedition_id INT NOT NULL,
  searched_time DATETIME NOT NULL DEFAULT '1999-01-01',
  PRIMARY KEY (passenger_id, expedition_id),
  FOREIGN KEY (passenger_id) REFERENCES PASSENGER (passenger_id) ON DELETE CASCADE,
  FOREIGN KEY (expedition_id) REFERENCES EXPEDITION (expedition_id)
);

CREATE TABLE EXPEDITION_HISTORY (
  passenger_id INT NOT NULL,
  leg_id INT NOT NULL,
  expedition_id INT NOT NULL,
  PRIMARY KEY (passenger_id, leg_id, expedition_id),
  FOREIGN KEY (passenger_id) REFERENCES PASSENGER (passenger_id) ON DELETE CASCADE,
  FOREIGN KEY (leg_id , expedition_id) REFERENCES LEG_INSTANCE (leg_id , expedition_id)
);
