задание 1
CREATE VIEW StoreInfo AS
SELECT 
    s.store_id,
    a.address,
    a.address2,
    c.country
FROM 
    store s
INNER JOIN 
    address a ON s.address_id = a.address_id
INNER JOIN 
    city ci ON a.city_id = ci.city_id
INNER JOIN 
    country c ON ci.country_id = c.country_id;try` `c` ON ((`ci`.`country_id` = `c`.`country_id`)))
		
		

		
задание 2
CREATE PROCEDURE GetMoviesInYear(IN year INT)
BEGIN
    SELECT DISTINCT f.film_id, f.title, f.description
    FROM film f
    INNER JOIN inventory i ON f.film_id = i.film_id
    INNER JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE YEAR(r.rental_date) = year;
END

задание 3
CREATE TRIGGER increase_rental_duration
AFTER INSERT ON rental
FOR EACH ROW
BEGIN
    UPDATE film
    SET rental_duration = rental_duration + 1
    WHERE film_id = (SELECT film_id FROM inventory WHERE inventory_id = NEW.inventory_id);
END