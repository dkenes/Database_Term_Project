USE transportation_db;

-- DROP TRIGGER check_location_for_expedition_type;
-- DROP TRIGGER check_vehicle_type_for_ride;
-- DROP TRIGGER check_vehicle_is_ticket_vehicle_before_ticket_insert;
-- DROP TRIGGER check_vehicle_type_before_seat_insert;
-- DROP TRIGGER expedition_departure_arrival_location_check;
-- DROP TRIGGER leg_instance_departure_arrival_datetime_check;
-- DROP TRIGGER ride_departure_arrival_datetime_check;
-- DROP TRIGGER leg_instance_add_no_of_seats;
-- DROP TRIGGER ticket_insert_update_and_check_seats;

DELIMITER //
CREATE TRIGGER check_location_for_expedition_type
BEFORE INSERT ON EXPEDITION
FOR EACH ROW
BEGIN
    DECLARE departure_location_type VARCHAR(30);
    DECLARE arrival_location_type VARCHAR(30);

    -- Fetch location types for departure and arrival locations
    SELECT location_type INTO departure_location_type
    FROM LOCATION
    WHERE location_id = NEW.departure_location_id;

    SELECT location_type INTO arrival_location_type
    FROM LOCATION
    WHERE location_id = NEW.arrival_location_id;
    
    -- Check expedition type
    IF NEW.expedition_type NOT IN ('bus', 'train', 'izban', 'ferry', 'flight') THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Invalid expedition type!';
	END IF;

    -- Check for flight type
    IF NEW.expedition_type = 'flight' THEN
        IF departure_location_type != 'airport' OR arrival_location_type != 'airport' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'For flights, both departure and arrival locations must be airports!';
        END IF;
    END IF;

    -- Check for ferry type
    IF NEW.expedition_type = 'ferry' THEN
        IF departure_location_type != 'port' OR arrival_location_type != 'port' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'For ferries, both departure and arrival locations must be ports!';
        END IF;
    END IF;

    -- Check for bus type
    IF NEW.expedition_type = 'bus' THEN
        IF departure_location_type != 'bus_station' OR arrival_location_type != 'bus_station' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'For buses, both departure and arrival locations must be bus stations!';
        END IF;
    END IF;

    -- Check for train type
    IF NEW.expedition_type = 'train' THEN
        IF departure_location_type != 'train_station' OR arrival_location_type != 'train_station' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'For trains, both departure and arrival locations must be train stations!';
        END IF;
    END IF;
    
    -- Check for IZBAN type
    IF NEW.expedition_type = 'izban' THEN
        IF departure_location_type != 'izban_station' OR arrival_location_type != 'izban_station' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'For izban, both departure and arrival locations must be izban stations!';
        END IF;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER check_vehicle_type_for_ride
BEFORE INSERT ON RIDE
FOR EACH ROW
BEGIN
    DECLARE vehicle_type VARCHAR(45);
    DECLARE departure_location_type VARCHAR(30);

    -- Fetch the vehicle type
    SELECT rental_vehicle_type INTO vehicle_type
    FROM RENTAL_VEHICLE
    WHERE rental_vehicle_id = NEW.vehicle_id;

    -- Fetch the departure location type
    SELECT location_type INTO departure_location_type
    FROM LOCATION
    WHERE location_id = NEW.departure_location_id;

    -- Check for Car type and departure location
    IF vehicle_type = 'Car' THEN
        IF departure_location_type != 'renting_location' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'For Car rentals, the departure location must be a car rental station';
        END IF;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER check_vehicle_is_ticket_vehicle_before_ticket_insert
BEFORE INSERT ON TICKET
FOR EACH ROW
BEGIN
    DECLARE fetched_ticket_vehicle_id INT;
    DECLARE is_ticket_vehicle BOOLEAN;

    -- Fetch the ticket_vehicle_id from LEG_INSTANCE
    SELECT ticket_vehicle_id INTO fetched_ticket_vehicle_id
    FROM LEG_INSTANCE
    WHERE leg_id = NEW.leg_id AND expedition_id = NEW.expedition_id;

    -- Check if the vehicle is a TICKET_VEHICLE
    SELECT EXISTS (
        SELECT 1
        FROM TICKET_VEHICLE
        WHERE ticket_vehicle_id = fetched_ticket_vehicle_id
    ) INTO is_ticket_vehicle;

    -- If the vehicle is not a TICKET_VEHICLE, prevent the insertion
    IF NOT is_ticket_vehicle THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tickets can only be added for vehicles that are TICKET_VEHICLES';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER check_vehicle_type_before_seat_insert
BEFORE INSERT ON SEAT
FOR EACH ROW
BEGIN
    DECLARE leg_instance_ticket_vehicle_id INT;
    DECLARE is_ticket_vehicle BOOLEAN;
    DECLARE is_izban BOOLEAN;

    -- Fetch the ticket_vehicle_id from LEG_INSTANCE
    SELECT ticket_vehicle_id INTO leg_instance_ticket_vehicle_id
    FROM LEG_INSTANCE
    WHERE leg_id = NEW.leg_id AND expedition_id = NEW.expedition_id;

    -- Check if the vehicle is a TICKET_VEHICLE
    SELECT EXISTS (
        SELECT 1
        FROM TICKET_VEHICLE
        WHERE ticket_vehicle_id = leg_instance_ticket_vehicle_id
    ) INTO is_ticket_vehicle;

    -- Check if the vehicle is an IZBAN
    SELECT EXISTS (
        SELECT 1
        FROM IZBAN
        WHERE izban_id = leg_instance_ticket_vehicle_id
    ) INTO is_izban;

    -- If the vehicle is not a TICKET_VEHICLE or if it's an IZBAN, prevent the insertion
    IF NOT is_ticket_vehicle OR is_izban THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Seats can only be added for vehicles that are TICKET_VEHICLES and not IZBAN';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER expedition_departure_arrival_location_check
BEFORE INSERT ON EXPEDITION
FOR EACH ROW
BEGIN
    IF NEW.departure_location_id = NEW.arrival_location_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Departure and arrival locations cannot be same!';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER leg_instance_departure_arrival_datetime_check
BEFORE INSERT ON LEG_INSTANCE
FOR EACH ROW
BEGIN
    IF NEW.departure_datetime >= NEW.arrival_datetime THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid departure and arrival datetimes!';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER ride_departure_arrival_datetime_check
BEFORE INSERT ON RIDE
FOR EACH ROW
BEGIN
    IF NEW.departure_date_time >= NEW.arrival_date_time THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid departure and arrival datetimes!';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER leg_instance_add_no_of_seats
BEFORE INSERT ON LEG_INSTANCE
FOR EACH ROW
BEGIN
    DECLARE number_of_seats INT DEFAULT NULL;

    SELECT TIV.total_no_of_seats INTO number_of_seats
    FROM TICKET_VEHICLE AS TIV
    WHERE TIV.ticket_vehicle_id = NEW.ticket_vehicle_id;

    SET NEW.number_of_available_seats = number_of_seats;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER ticket_insert_update_and_check_seats
BEFORE INSERT ON TICKET
FOR EACH ROW
BEGIN
    DECLARE available_seats INT;

    SELECT number_of_available_seats INTO available_seats
    FROM LEG_INSTANCE
    WHERE leg_id = NEW.leg_id AND expedition_id = NEW.expedition_id;

    IF available_seats <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add ticket because no available seats!';
    ELSE
        UPDATE LEG_INSTANCE
        SET number_of_available_seats = number_of_available_seats - 1
        WHERE leg_id = NEW.leg_id AND expedition_id = NEW.expedition_id;
    END IF;
END;
//
DELIMITER ;
