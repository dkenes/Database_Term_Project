USE transportation_db;

-- Using minimum 2 tables
SELECT fname, lname, gender, age, type, class_type, seat_position, day_time, meal_menu
FROM PASSENGER, PREFERENCE
WHERE PREFERENCE.passenger_id = PASSENGER.passenger_id;

SELECT COUNT(*) AS vehicle_count, ticket_vehicle_type
FROM TICKET_VEHICLE, LEG_INSTANCE
WHERE TICKET_VEHICLE.type_id = LEG_INSTANCE.ticket_vehicle_id
GROUP BY ticket_vehicle_type;

-- Using minimum 3 tables
SELECT fname, lname, searched_time, expedition_type, departure_location_id, arrival_location_id
FROM PASSENGER AS P, EXPEDITION_SEARCH_HISTORY AS ESH, EXPEDITION AS EXP
WHERE P.passenger_id = ESH.passenger_id AND ESH.expedition_id = EXP.expedition_id;

SELECT fname, lname, RH.ride_id, departure_date_time, arrival_date_time, departure_location_id, arrival_location_id, vehicle_id
FROM PASSENGER AS P, RIDE_HISTORY AS RH, RIDE AS R
WHERE P.passenger_id = RH.passenger_id AND RH.ride_id = R.ride_id;

SELECT P.Fname, P.Lname, RV.Car_model
FROM PASSENGER AS P, RENTAL_VEHICLE AS RV, RIDE_HISTORY AS RH, RIDE AS R
WHERE P.Passenger_id = RH.Passenger_id
AND RH.Ride_id = R.Ride_id
AND R.Vehicle_id = RV.rental_vehicle_id
AND Car_model IS NOT NULL;

-- Critical SELECT statements

-- Flights from Antalya to Istanbul
SELECT LGI.leg_id, LGI.expedition_id, DL.name, AL.name
FROM LEG_INSTANCE AS LGI, EXPEDITION AS E, LOCATION AS DL, LOCATION AS AL
WHERE LGI.Expedition_id = E.Expedition_id
AND E.Expedition_type = 'flight'
AND E.Departure_location_id = DL.location_id
AND E.Arrival_location_id = AL.location_id
AND DL.Location = 'Antalya'
AND AL.Location = 'İstanbul';

-- All upcoming expeditions
SELECT EXP.expedition_type, DL.name AS departure_location, AL.name AS arrival_location, LGI.departure_datetime, LGI.arrival_datetime
FROM LEG_INSTANCE AS LGI, EXPEDITION AS EXP, LOCATION AS DL, LOCATION AS AL
WHERE LGI.expedition_id = EXP.expedition_id
AND EXP.departure_location_id = DL.location_id
AND EXP.arrival_location_id = AL.location_id
AND LGI.departure_datetime > NOW();

-- Most preferred car model
SELECT COUNT(*) AS number_of_ride, RV.car_model
FROM RIDE_HISTORY AS RH, RIDE AS R, RENTAL_VEHICLE AS RV
WHERE RH.ride_id = R.ride_id
AND R.vehicle_id = RV.rental_vehicle_id
AND RV.car_model IS NOT NULL
GROUP BY RV.car_model
ORDER BY number_of_ride DESC
LIMIT 1;

-- Total price for upcoming leg instances for each passenger
SELECT P.fname, P.lname, SUM(price) AS total_price
FROM PASSENGER AS P, (SELECT passenger_id, price
FROM TICKET AS T, SEAT AS S, LEG_INSTANCE AS LGI
WHERE T.seat_no = S.seat_no
AND S.leg_id = LGI.leg_id
AND LGI.departure_datetime > NOW()) AS LGI_DATA
WHERE P.passenger_id = LGI_DATA.passenger_id
GROUP BY P.fname, P.lname
ORDER BY total_price;
