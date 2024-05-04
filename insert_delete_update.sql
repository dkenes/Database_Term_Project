USE transportation_db;

INSERT INTO TICKET (seat_no, leg_id, expedition_id, passenger_id, class_type) VALUES (5, 4, 4, 1, 'business');
DELETE FROM PASSENGER WHERE fname LIKE '%a%';
UPDATE VEHICLE SET company = 'Turkish Airlines' WHERE company = 'THY';
UPDATE TICKET_VEHICLE SET ticket_vehicle_id = 20 WHERE ticket_vehicle_id = 15;
