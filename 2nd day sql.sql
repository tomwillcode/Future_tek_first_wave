SELECT*FROM city
;

SELECT COUNT (DISTINCT last_update)
FROM city;


SELECT*FROM city
WHERE country_id = 10;

SELECT*FROM rental
WHERE rental_date > '2005-05-25';

SELECT count(return_date - rental_date) as rental_period
FROM rental
WHERE (return_date - rental_date) > '5 days';





