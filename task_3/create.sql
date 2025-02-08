CREATE TABLE parking (
 parking_id SERIAL PRIMARY KEY,
 lot_id INTEGER,
 name VARCHAR(100) NOT NULL,
 address VARCHAR(200) NOT NULL
);

CREATE TABLE review (
 review_id SERIAL PRIMARY KEY,
 parking_id INTEGER REFERENCES parking (parking_id),
 review_text TEXT NOT NULL
);

CREATE TABLE users (
 user_id SERIAL PRIMARY KEY,
 review_id INTEGER REFERENCES review(review_id),
 name VARCHAR(50) NOT NULL,
 email VARCHAR(100) NOT NULL,
 password VARCHAR(50) NOT NULL,
 role VARCHAR(20) NOT NULL
);

CREATE TABLE cars (
 car_id SERIAL PRIMARY KEY,
 car_brand VARCHAR(50) NOT NULL,
 license_plate VARCHAR(20) NOT NULL
);

CREATE TABLE parking_spaces (
 lot_id SERIAL PRIMARY KEY,
 parking_id INTEGER REFERENCES parking(parking_id),
 number INTEGER NOT NULL,
 availability VARCHAR(10) NOT NULL,
 cost INTEGER NOT NULL
);

CREATE TABLE reservation (
 booking_id SERIAL PRIMARY KEY,
 car_id INTEGER REFERENCES cars (car_id),
 lot_id INTEGER REFERENCES parking_spaces (lot_id),
 start_date_time_booking TIMESTAMP NOT NULL,
 end_date_time_booking TIMESTAMP NOT NULL
);

CREATE TABLE payments (
 payment_id SERIAL PRIMARY KEY,
 booking_id INTEGER REFERENCES reservation (booking_id),
 status VARCHAR(20) NOT NULL,
 payment_check VARCHAR(100) NOT NULL
);

CREATE TABLE user_car (
 user_id INTEGER REFERENCES users (user_id),
 car_id INTEGER REFERENCES cars (car_id)
);

CREATE TABLE user_reservation (
 user_id INTEGER REFERENCES users (user_id),
 booking_id INTEGER REFERENCES reservation (booking_id)
);