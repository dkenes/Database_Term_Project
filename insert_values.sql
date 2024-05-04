USE transportation_db;

INSERT INTO VEHICLE_TYPE (type_name, brand) VALUES 
('Airplane', 'Airbus A380'),
('Bus', 'Mercedes-Benz Sprinter'),
('Ferry', 'Metal Shark'),
('Train', 'Siemens Velaro'),
('Airplane', 'Boeing 777'),
('Bus', 'Volvo 9700'),
('Ferry', 'Cruise Ferry 2000'),
('Train', 'Alstom Euroduplex'),
('Airplane', 'Embraer E190'),
('Bus', 'Neoplan Tourliner');

INSERT INTO LOCATION (name, location, location_type) VALUES 
('Istanbul Ataturk Airport', 'Istanbul', 'airport'),
('Taksim Square', 'Istanbul', 'charging_station'),
('Kusadasi Port', 'Kusadasi', 'port'),
('Esenler Bus Station', 'Istanbul', 'bus_station'),
('Alsancak Izban Station', 'Izmir', 'izban_station'),
('Antalya Airport', 'Antalya', 'airport'),
('Cappadocia Charging Station', 'Nevsehir', 'charging_station'),
('Bodrum Port', 'Bodrum', 'port'),
('Ankara Bus Station', 'Ankara', 'bus_station'),
('Gaziemir Izban Station', 'Izmir', 'izban_station'),
('Sabiha Gokcen Airport', 'Istanbul', 'airport'),
('Izmir Konak Square Charging Station', 'Izmir', 'charging_station'),
('Marmaris Port', 'Marmaris', 'port'),
('Busan Bus Station', 'Busan', 'bus_station'),
('Karsiyaka Izban Station', 'Izmir', 'izban_station'),
('Dalaman Airport', 'Dalaman', 'airport'),
('Konya Charging Station', 'Konya', 'charging_station'),
('Canakkale Port', 'Canakkale', 'port'),
('Trabzon Bus Station', 'Trabzon', 'bus_station'),
('Bornova Izban Station', 'Izmir', 'izban_station'),
('Izmit Charging Station', 'Izmit', 'charging_station'),
('Cesme Port', 'Cesme', 'port'),
('Gaziantep Bus Station', 'Gaziantep', 'bus_station'),
('Alsancak Renting Location 1', 'Izmir', 'renting_location'),
('Istanbul Renting Location 1', 'Istanbul', 'renting_location'),
('Ephesus Charging Station', 'Selcuk', 'charging_station'),
('Fethiye Port', 'Fethiye', 'port'),
('Samsun Bus Station', 'Samsun', 'bus_station'),
('Kars Renting Location 2', 'Kars', 'renting_location'),
('Adana Renting Location 2', 'Adana', 'renting_location'),
('Antakya Charging Station', 'Antakya', 'charging_station'),
('Bursa Bus Station', 'Bursa', 'bus_station'),
('Izmir Konak Renting Location 3', 'Izmir', 'renting_location'),
('Istanbul Renting Location 2', 'Istanbul', 'renting_location'),
('Mugla Port', 'Mugla', 'port'),
('Erzurum Bus Station', 'Erzurum', 'bus_station'),
('Konya Renting Location 1', 'Konya', 'renting_location'),
('Trabzon Port', 'Trabzon', 'port'),
('Denizli Bus Station', 'Denizli', 'bus_station'),
('Eskisehir Renting Location 4', 'Eskisehir', 'renting_location'),
('Eskisehir Train Location', 'Eskisehir', 'train_station'),
('Erzurum Train Location', 'Erzurum', 'train_station');

INSERT INTO VEHICLE (company, transportation_type) VALUES 
('TCDD', 'Ticketed_vehicle'),
('THY', 'Ticketed_vehicle'),
('IDO', 'Ticketed_vehicle'),
('Martı', 'Rental_vehicle'),
('OBilet', 'Ticketed_vehicle'),
('Yolcu360', 'Rental_vehicle'),
('IZBAN', 'IZBAN'),
('TCDD', 'Ticketed_vehicle'),
('THY', 'Ticketed_vehicle'),
('IDO', 'Ticketed_vehicle'),
('Martı', 'Rental_vehicle'),
('OBilet', 'Rental_vehicle'),
('Yolcu360', 'Rental_vehicle'),
('IZBAN', 'IZBAN'),
('TCDD', 'Ticketed_vehicle'),
('THY', 'Ticketed_vehicle'),
('IDO', 'Ticketed_vehicle'),
('Martı', 'Rental_vehicle'),
('OBilet', 'Ticketed_vehicle'),
('TCDD', 'Ticketed_vehicle');

INSERT INTO PASSENGER (fname, lname, gender, age, type, card_id, total_amount) VALUES
('Ali', 'Yılmaz', 'M', 23, 'Student', 'CARD12345', 500),
('Ayşe', 'Demir', 'F', 35, 'Regular', 'CARD23456', 700),
('Mustafa', 'Arslan', 'M', 40, 'Regular', 'CARD314567', 600),
('Fatma', 'Kaya', 'F', 28, 'Student', 'CARD456718', 550),
('Hüseyin', 'Öztürk', 'M', 19, 'Student', 'CARD156789', 480),
('Zeynep', 'Çelik', 'F', 75, 'Elderly', 'CARD678190', 800),
('Mehmet', 'Koç', 'M', 33, 'Regular', 'CARD781901', 720),
('Aslı', 'Yıldız', 'F', 80, 'Elderly', 'CARD82', 900),
('Can', 'Şahin', 'M', 21, 'Student', 'CARD190123', 520),
('Seda', 'Aydın', 'F', 70, 'Elderly', 'CARD012134', 850),
('Emre', 'Ergin', 'M', 29, 'Healthcare_worker', 'CARD1231456', 750),
('Nur', 'Avcı', 'F', 25, 'Student', 'CARD21345678', 480),
('Ercan', 'Uzun', 'M', 32, 'Regular', 'CARD34567189', 690),
('Gizem', 'Yavuz', 'F', 22, 'Student', 'CARD1456789', 510),
('Tolga', 'Güler', 'M', 68, 'Elderly', 'CARD5678190', 670),
('Elif', 'Aydın', 'F', 65, 'Healthcare_worker', 'CARD67189012', 880),
('Burak', 'Kurt', 'M', 26, 'Healthcare_worker', 'CARD178901', 780),
('Esra', 'Erdem', 'F', 70, 'Elderly', 'CARD890112', 710),
('Cem', 'Kara', 'M', 24, 'Student', 'CARD910123', 530),
('Duygu', 'Güneş', 'F', 42, 'Regular', 'CARD012345617', 720);

INSERT INTO GUIDE (gender, fname, lname, age) VALUES
('M', 'İsmail', 'Yıldırım', 36),
('F', 'Aylin', 'Can', 42),
('M', 'Burhan', 'Arslan', 38),
('F', 'Ceren', 'Aksoy', 29),
('M', 'Kadir', 'Öztürk', 27),
('F', 'Nihan', 'Taş', 48),
('M', 'Mert', 'Koç', 35),
('F', 'Gamze', 'Kaya', 41),
('M', 'Engin', 'Şahin', 31),
('F', 'Gülçin', 'Aydın', 43),
('M', 'Emir', 'Erdem', 33),
('F', 'Selma', 'Avcı', 30),
('M', 'Tarkan', 'Uzun', 37),
('F', 'Ece', 'Yavuz', 28),
('M', 'Okan', 'Güler', 42),
('F', 'Şule', 'Aydın', 50),
('M', 'Umut', 'Kurt', 29),
('F', 'Elif', 'Erdem', 26),
('M', 'Kaan', 'Kara', 34),
('F', 'Cansu', 'Güneş', 39);

INSERT INTO TICKET_VEHICLE (ticket_vehicle_id, total_no_of_seats, ticket_vehicle_type, airplane_registration_number, plate_no, ferry_name, number_of_vagons, type_id) VALUES 
(1, 150, 'Train', NULL, NULL, NULL, 5, 4), 
(2, 200, 'Airplane', 'ABC123', NULL, NULL, NULL, 1), 
(3, 100, 'Ferry', NULL, NULL, 'FerryA', NULL, 3), 
(5, 50, 'Bus', NULL, 'XY123', NULL, NULL, 2), 
(8, 150, 'Train', NULL, NULL, NULL, 4, 4),
(9, 200, 'Airplane', 'XYZ789', NULL, NULL, NULL , 1),
(10, 100, 'Ferry', NULL, NULL, 'FerryB', NULL, 3),
(15, 150, 'Train', NULL, NULL, NULL, 3, 4),
(16, 200, 'Airplane', 'DEF456', NULL, NULL, NULL, 1),
(17, 100, 'Ferry', NULL, NULL, 'FerryC', NULL, 3),
(19, 50, 'Bus', NULL, 'WX789', NULL, NULL, 2); 

INSERT INTO RENTAL_VEHICLE (rental_vehicle_id, price_per_minute, rental_vehicle_type, moped_model, scooter_model, engine_serial_number, car_model) VALUES 
(4, 0.2, 'Moped', 'MopedModelA', NULL, NULL, NULL),
(6, 0.5, 'Car', NULL, NULL, 'EngineSerialA', 'CarModelA'),
(11, 0.3, 'Scooter', NULL, 'ScooterModelB', NULL, NULL), 
(12, 0.6, 'Car', NULL, NULL, 'EngineSerialB', 'CarModelB'),
(13, 0.7, 'Car', NULL, NULL, 'EngineSerialC', 'CarModelC'), 
(18, 0.25, 'Moped', 'MopedModelB', NULL, NULL, NULL); 


INSERT INTO RENTAL_SEARCH_HISTORY (passenger_id, vehicle_id, searched_time) VALUES 
(1, 4, '2023-03-15 10:30:00'),
(2, 6, '2023-04-20 15:45:00'),
(3, 11, '2023-05-12 08:20:00'),
(4, 12, '2023-06-08 12:10:00'),
(5, 13, '2023-07-05 17:00:00'),
(6, 18, '2023-08-18 09:55:00'),
(7, 4, '2023-09-23 14:30:00'),
(8, 6, '2023-10-14 11:15:00'),
(9, 11, '2023-11-27 19:40:00'),
(10, 12, '2023-12-09 22:05:00'),
(11, 13, '2024-01-30 16:50:00'),
(12, 18, '2024-02-14 07:25:00'),
(13, 4, '2024-03-08 18:15:00'),
(14, 6, '2024-04-04 13:05:00'),
(15, 11, '2024-05-19 20:45:00'),
(16, 12, '2024-06-22 10:00:00'),
(17, 13, '2024-07-17 23:30:00'),
(18, 18, '2024-08-03 05:40:00'),
(19, 4, '2024-09-11 08:55:00'),
(20, 6, '2024-10-27 14:20:00');


INSERT INTO RIDE (departure_date_time, arrival_date_time, passenger_id, departure_location_id, arrival_location_id, vehicle_id) VALUES
('2024-01-01 08:00:00', '2024-01-01 12:00:00', 1, 25, 30, 6),
('2024-01-02 10:30:00', '2024-01-02 14:45:00', 2, 9, 10, 4),
('2024-01-03 14:00:00', '2024-01-03 17:30:00', 3, 5, 6, 11),
('2024-01-04 08:45:00', '2024-01-04 12:15:00', 4, 33, 34, 6),
('2024-01-05 09:30:00', '2024-01-05 12:45:00', 5, 9, 10, 4),
('2024-01-06 11:15:00', '2024-01-06 15:30:00', 6, 34, 37, 13),
('2024-01-07 14:30:00', '2024-01-07 17:45:00', 1, 15, 16, 11),
('2024-01-08 07:45:00', '2024-01-08 11:15:00', 2, 37, 38, 11),
('2024-01-09 12:00:00', '2024-01-09 15:30:00', 3, 5, 6, 11),
('2024-01-10 10:15:00', '2024-01-10 14:30:00', 4, 37, 33, 6);

INSERT INTO IZBAN (izban_id, number_of_vagons) VALUES
(7, 6),
(14, 9);

INSERT INTO EXPEDITION (expedition_type, departure_location_id, arrival_location_id) VALUES
('flight', 1, 6),
('ferry', 3, 8),
('izban', 5, 10),
('train', 41, 42),
('bus', 4, 19),
('flight', 6, 1),
('ferry', 8, 3),
('izban', 10, 5),
('train', 42, 41),
('bus', 19, 4);

INSERT INTO PREFERENCE (passenger_id, class_type, seat_position, day_time, meal_menu) VALUES
(1, 'First Class', 'window', 'day', 'Chicken'),
(2, 'Economy', 'corridor', 'night', 'Fish'),
(3, 'Business', 'window', 'day', 'Vegetarian'),
(4, 'Economy', 'corridor', 'night', 'Pasta'),
(5, 'First Class', 'window', 'day', 'Beef'),
(6, 'Business', 'corridor', 'night', 'Steak'),
(7, 'Economy', 'corridor', 'day', 'Fish'),
(8, 'First Class', 'window', 'night', 'Pasta'),
(9, 'Business', 'corridor', 'day', 'Chicken'),
(10, 'Economy', 'corridor', 'night', 'Vegetarian'),
(11, 'First Class', 'window', 'day', 'Beef'),
(12, 'Business', 'window', 'night', 'Steak'),
(13, 'Economy', 'corridor', 'day', 'Pasta'),
(14, 'First Class', 'window', 'night', 'Chicken'),
(15, 'Business', 'corridor', 'day', 'Fish'),
(16, 'Economy', 'corridor', 'night', 'Steak'),
(17, 'First Class', 'window', 'day', 'Beef'),
(18, 'Business', 'window', 'night', 'Pasta'),
(19, 'Economy', 'corridor', 'day', 'Vegetarian'),
(20, 'First Class', 'window', 'night', 'Chicken');

INSERT INTO LEG_INSTANCE (leg_id, price, departure_datetime, arrival_datetime, expedition_id, guide_id, izban_id, ticket_vehicle_id) VALUES
(1, 75.5, '2024-01-01 08:00:00', '2024-01-01 10:30:00', 1, 3, NULL, 2),
(2, 45.0, '2024-01-03 14:30:00', '2024-01-03 18:00:00', 2, 8, NULL, 3),
(3, 30.0, '2024-01-04 09:45:00', '2024-01-04 11:30:00', 3, 12, 7, NULL),
(4, 55.75, '2024-01-25 17:30:00', '2024-01-25 20:15:00', 4, 6, NULL, 1),
(6, 65.0, '2024-02-08 07:30:00', '2024-02-08 09:45:00', 6, 18, NULL, 9),
(8, 27.75, '2024-02-22 10:00:00', '2024-02-22 11:45:00', 8, 10, 14, NULL),
(10, 35.0, '2024-03-07 12:30:00', '2024-03-07 16:15:00', 10, 7, NULL, 19);

INSERT INTO RIDE_HISTORY (passenger_id, ride_id) 
VALUES
(3, 1),
(5, 2),
(8, 3),
(10, 4),
(15, 5),
(2, 6),
(7, 7),
(12, 8),
(18, 9),
(20, 10);

INSERT INTO EXPEDITION_SEARCH_HISTORY (passenger_id, expedition_id, searched_time) VALUES
(1, 1, '2024-01-06 10:00:00'),
(3, 2, '2024-01-06 11:30:00'),
(6, 3, '2024-01-06 12:45:00'),
(9, 4, '2024-01-06 14:15:00'),
(12, 5, '2024-01-06 15:30:00'),
(15, 6, '2024-01-06 16:45:00'),
(18, 7, '2024-01-06 18:00:00'),
(2, 8, '2024-01-06 19:15:00'),
(5, 9, '2024-01-06 20:30:00'),
(20, 10, '2024-01-06 21:45:00');

INSERT INTO EXPEDITION_HISTORY(passenger_id, expedition_id, leg_id) VALUES
(1,1,1),
(2,1,1),
(3,2,2),
(4,2,2),
(5,4,4),
(6,4,4),
(7,6,6),
(8,6,6),
(9,10,10),
(10,10,10);

INSERT INTO SEAT (seat_no, leg_id, expedition_id) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 2),
(4, 2, 2),
(5, 4, 4),
(6, 4, 4),
(7, 6, 6),
(8, 6, 6),
(9, 10, 10),
(10, 10, 10);

INSERT INTO TICKET (seat_no, leg_id, expedition_id, passenger_id, class_type) VALUES
(1, 1, 1, 1, 'economy'),
(2, 1, 1, 2,'first class'),
(3, 2, 2,3,'business'),
(4, 2, 2,4, 'economy'),
(5, 4, 4,5, 'first class'),
(6, 4, 4,6,'business'),
(7, 6, 6,7, 'economy'),
(8, 6, 6,8,'first class'),
(9, 10, 10,9,'business'),
(10, 10, 10,10, 'economy');
