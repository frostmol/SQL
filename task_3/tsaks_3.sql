-- 1. Получить все резервации (id, дата, имя парковочного места, марка машины) для определенного пользователя (например, с именем "John Doe").

SELECT reservation.booking_id, reservation.start_date_time_booking, parking.name AS parking_lot, cars.car_brand
FROM user_reservation
JOIN reservation ON user_reservation.booking_id = reservation.booking_id
JOIN cars ON reservation.car_id = cars.car_id
JOIN parking_spaces ON reservation.lot_id = parking_spaces.lot_id
JOIN parking ON parking_spaces.parking_id = parking.parking_id
JOIN users ON user_reservation.user_id = users.user_id
WHERE users.name = 'John Doe';


-- 2. Получить среднюю стоимость парковочных мест на каждой парковке.

SELECT parking.name AS parking_lot, AVG(parking_spaces.cost) AS average_cost
FROM parking
JOIN parking_spaces ON parking.parking_id = parking_spaces.parking_id
GROUP BY parking.name;


-- 3. Подсчитать количество выполненных и ожидающих оплат резерваций.

SELECT payments.status, COUNT(*) AS count
FROM reservation
JOIN payments ON reservation.booking_id = payments.booking_id
GROUP BY payments.status;


-- 4. Получить обзоры с названием парковки и текстом обзора, связанные с опреденным статусом оплаты

SELECT parking.name AS parking, review.review_text
FROM payments
JOIN reservation ON payments.booking_id = reservation.booking_id
JOIN parking_spaces ON reservation.lot_id = parking_spaces.lot_id
JOIN parking ON parking_spaces.parking_id = parking.parking_id
JOIN review ON parking.parking_id = review.parking_id
WHERE payments.status = 'pending';


-- 5. Получить информацию о пользователях, занимающих определенное парковочное место.

SELECT users.name, cars.car_brand, cars.license_plate
FROM user_reservation
JOIN users ON user_reservation.user_id = users.user_id
JOIN reservation ON user_reservation.booking_id = reservation.booking_id
JOIN cars ON reservation.car_id = cars.car_id
WHERE reservation.lot_id = 1; 


-- 6. Узнать наличие свободных парковочных мест в конкретной парковке.

SELECT parking.name AS parking_lot, COUNT(*) AS available_spaces
FROM parking
JOIN parking_spaces ON parking.parking_id = parking_spaces.parking_id
WHERE parking_spaces.availability = 'available'
GROUP BY parking.name;


-- 7. Получить информацию о пользователях, имеющих незавершенные оплаты.

SELECT users.name, cars.car_brand, reservation.start_date_time_booking
FROM users
JOIN user_car ON users.user_id = user_car.user_id
JOIN cars ON user_car.car_id = cars.car_id
JOIN reservation ON cars.car_id = reservation.car_id
JOIN payments ON reservation.booking_id = payments.booking_id
WHERE payments.status = 'pending';


-- 8. Найти парковочные места, занятые определенной машиной.

SELECT cars.license_plate, parking.name AS parking_lot
FROM cars
JOIN reservation ON cars.car_id = reservation.car_id
JOIN parking_spaces ON reservation.lot_id = parking_spaces.lot_id
JOIN parking ON parking_spaces.parking_id = parking.parking_id
WHERE cars.license_plate = 'ABC123';


-- 9. Получить обзоры, связанные с парковками, для которых есть неоплаченные резервации.

SELECT parking.name AS parking_lot, review.review_text
FROM parking
JOIN review ON parking.parking_id = review.parking_id
JOIN reservation ON parking.parking_id = reservation.parking_id
JOIN payments ON reservation.booking_id = payments.booking_id
WHERE payments.status = 'pending';


-- 9. Получить информацию о пользователях, делавших обзоры парковок

SELECT DISTINCT users.name, users.email
FROM users
JOIN review ON users.review_id = review.review_id


-- 10. Получить суммарные расходы по каждой из машин.

SELECT cars.license_plate, SUM(parking_spaces.cost) AS total_cost
FROM cars
JOIN reservation ON cars.car_id = reservation.car_id
JOIN parking_spaces ON reservation.lot_id = parking_spaces.lot_id
GROUP BY cars.license_plate;

-- 11. Узнать количество резерваций для каждой из машин.

SELECT cars.license_plate, COUNT(*) AS reservation_count
FROM cars
JOIN reservation ON cars.car_id = reservation.car_id
GROUP BY cars.license_plate;

-- 12. Вывести все резервации, которые еще не начались.

SELECT reservation.booking_id, cars.license_plate, parking.name AS parking_lot, reservation.start_date_time_booking
FROM reservation
JOIN cars ON reservation.car_id = cars.car_id
JOIN parking_spaces ON reservation.lot_id = parking_spaces.lot_id
JOIN parking ON parking_spaces.parking_id = parking.parking_id
WHERE reservation.start_date_time_booking > NOW();

-- 13. Вывести количество резерваций, сделанных каждым пользователем.

SELECT users.name, COUNT(user_reservation.booking_id) AS total_reservations
FROM users
JOIN user_reservation ON users.user_id = user_reservation.user_id
GROUP BY users.name;

-- 14. Получить информацию о пользователях, зарегистрированных в системе как администраторы, и их резервациях.

SELECT users.name, user_reservation.booking_id, reservation.start_date_time_booking
FROM users
JOIN user_reservation ON users.user_id = user_reservation.user_id
JOIN reservation ON user_reservation.booking_id = reservation.booking_id
WHERE users.role = 'admin';

-- 15. Суммирование стоимости бронирования парковочного места по каждому пользователю


SELECT 
    u.user_id,
    u.name AS user_name,
    r.booking_id,
    ps.cost AS parking_space_cost,
    SUM(ps.cost) OVER (PARTITION BY u.user_id) AS total_cost_for_user
FROM 
    users u
JOIN 
    user_reservation ur ON u.user_id = ur.user_id
JOIN 
    reservation r ON ur.booking_id = r.booking_id
JOIN 
    parking_spaces ps ON r.lot_id = ps.lot_id


-- 16. Нахождение общего количества обзоров для каждой парковки

SELECT 
    p.parking_id,
    p.name AS parking_name,
    COALESCE(COUNT(r.review_id), 0) AS total_reviews
FROM 
    parking p
LEFT JOIN 
    review r ON p.parking_id = r.parking_id
GROUP BY 
    p.parking_id, p.name
