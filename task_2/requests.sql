-- задание 3
-- Шаг 1: Выборка машин
SELECT DISTINCT Car.carID
FROM Car
JOIN Travel ON Car.carID = Travel.carID
JOIN gruzTrevel ON Travel.date = gruzTrevel.date AND Travel.travelID = gruzTrevel.travelID
JOIN gruz ON gruzTrevel.gruzID = gruz.gruzID
WHERE gruz.mass > 500;

-- Шаг 2: Обновление типа машины
UPDATE Car
SET typeOFcar = 'Truck'
WHERE carID IN (
    SELECT DISTINCT Car.carID
    FROM Car
    JOIN Travel ON Car.carID = Travel.carID
    JOIN gruzTrevel ON Travel.date = gruzTrevel.date AND Travel.travelID = gruzTrevel.travelID
    JOIN gruz ON gruzTrevel.gruzID = gruz.gruzID
    WHERE gruz.mass > 500
);

-- Задание 4
SELECT d.driverId
FROM driver d
JOIN Travel t ON d.driverId = t.driverId
WHERE t.date <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Удаление записей из таблицы Travel
DELETE FROM Travel
WHERE driverId IN (
    SELECT d.driverId
    FROM driver d
    JOIN Travel t ON d.driverId = t.driverId
    WHERE t.date <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

-- Удаление записей из таблицы Car, если они больше не используются
DELETE FROM Car
WHERE carID NOT IN (
    SELECT DISTINCT carID FROM Travel
);

-- Удаление записей из таблицы driver
DELETE FROM driver
WHERE driverId IN (
    SELECT d.driverId
    FROM driver d
    JOIN Travel t ON d.driverId = t.driverId
    WHERE t.date <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

-- Задание 5
SELECT departurepoint, COUNT(*) as count
FROM Travel
JOIN driver ON Travel.driverId = driver.driverId
JOIN firmName ON driver.firmID = firmName.firmID
WHERE firmName.name = 'Название фирмы'
GROUP BY departurepoint
ORDER BY count DESC
LIMIT 1;

-- Задание 6
SELECT carID, SUM(cost) AS total_cost
FROM Travel
JOIN Car ON Travel.carID = Car.carID
GROUP BY carID;


SELECT carID, total_cost
FROM (
    SELECT carID, SUM(cost) AS total_cost
    FROM Travel
    JOIN Car ON Travel.carID = Car.carID
    GROUP BY carID
) AS car_costs
WHERE total_cost = (
    SELECT MIN(total_cost) FROM (
        SELECT SUM(cost) AS total_cost
        FROM Travel
        JOIN Car ON Travel.carID = Car.carID
        GROUP BY carID
    ) AS min_cost
);
