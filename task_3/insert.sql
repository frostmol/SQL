INSERT INTO parking (parking_id, lot_id, name, address) VALUES (1, 1, 'Parking Lot 1', '123 Main Street');
INSERT INTO parking (parking_id, lot_id, name, address) VALUES (2, 2, 'Parking Lot 2', '456 Elm Street');

INSERT INTO review (review_id, parking_id, review_text) VALUES (1,1, 'Great parking lot, very convenient');
INSERT INTO review (review_id, parking_id, review_text) VALUES (2, 2, 'Not a good experience, lot was full');

INSERT INTO users (user_id, review_id, name, email, password, role) VALUES (1, 1, 'John Doe', 'john@example.com', 'password1', 'user');
INSERT INTO users (user_id, review_id, name, email, password, role) VALUES (2, 2, 'Jane Smith', 'jane@example.com', 'password2', 'admin');

INSERT INTO cars (car_id, car_brand, license_plate) VALUES (1, 'Toyota', 'ABC123');
INSERT INTO cars (car_id, car_brand, license_plate) VALUES (2, 'Honda', 'XYZ789');

INSERT INTO parking_spaces (lot_id, parking_id, number, availability, cost) VALUES (1,1, 101, 'available', 10);
INSERT INTO parking_spaces (lot_id, parking_id, number, availability, cost) VALUES (2,1, 102, 'occupied', 15);
INSERT INTO parking_spaces (lot_id, parking_id, number, availability, cost) VALUES (3,2, 201, 'available', 12);

INSERT INTO reservation (booking_id, car_id, lot_id, start_date_time_booking, end_date_time_booking) VALUES (1, 1, 1, '2023-01-01 08:00:00', '2023-01-01 18:00:00');
INSERT INTO reservation (booking_id, car_id, lot_id, start_date_time_booking, end_date_time_booking) VALUES (2, 2, 2, '2023-01-02 09:00:00', '2023-01-02 17:00:00');

INSERT INTO payments (booking_id, status, payment_check) VALUES (1, 'paid', 'transaction123');
INSERT INTO payments (booking_id, status, payment_check) VALUES (2, 'pending', 'transaction456');

INSERT INTO user_car (user_id, car_id) VALUES (1, 1);
INSERT INTO user_car (user_id, car_id) VALUES (2, 2);

INSERT INTO user_reservation (user_id, booking_id) VALUES (1, 1);
INSERT INTO user_reservation (user_id, booking_id) VALUES (2, 2);