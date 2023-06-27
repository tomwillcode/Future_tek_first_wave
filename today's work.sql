CREATE TABLE customer_reviews (
  review_id SERIAL PRIMARY KEY,
  customer_id INT,
  review_text TEXT
);

INSERT INTO customer_reviews (customer_id, review_text)
VALUES (1, 'This film was fantastic! I highly recommend it.');


SELECT concat(first_name,' ' ,last_name) as full_name 
FROM actor
WHERE first_name = 'Tom';

select*from actor;


SELECT*FROM payment
WHERE staff_id <> 1
ORDER BY amount ASC;

SELECT COUNT(distinct staff_id)
FROM payment;

SELECT DISTINCT staff_id
FROM payment;


SELECT staff_id, MED(amount) 
FROM payment
GROUP BY staff_id;

SELECT staff_id, percentile_cont(.5)
FROM payment
WITHIN GROUP staff_id
(ORDER BY amount ASC);
GROUP BY staff_id;

SELECT COUNT(staff_id) 
FROM payment
GROUP BY staff_id;


SELECT*FROM payment
WHERE (amount>5) AND (payment_date > '2007-03-17')
AND (payment_date < '2007-03-18'); 


SELECT*FROM actor
WHERE first_name IN('Tom', 'Jack','Nick','Jill');

SELECT*FROM language
WHERE NOT NAME = 'English';

SELECT*FROM language
WHERE NAME NOT LIKE 'E%';

SELECT*FROM language
WHERE name NOT IN('English');

SELECT*FROM film
WHERE title LIKE 'Ad%';

SELECT*FROM film
where description LIKE '%Moose%Cat%';

SELECT*FROM film
where description LIKE '%Cat%' AND description LIKE '%Moose%';


SELECT * FROM actor
WHERE actor_id BETWEEN 4 AND 10;


SELECT * FROM actor
WHERE LENGTH(last_name) > 
ALL(select LENGTH(first_name) from actor);

select LENGTH(first_name) from actor;


--the following uses the ALL clause to find all customers who have no outstanding DVD's
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id <> ALL (
    SELECT customer_id
    FROM rental
    WHERE return_date IS NULL
);


SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM rental
    WHERE return_date IS NULL
);


SELECT*FROM film
where (description LIKE '%Cat%') OR (description LIKE '%Dog%');


SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id <> Any (
    SELECT customer_id
    FROM rental
    WHERE return_date IS NULL
);

SELECT customer_id, first_name, last_name
FROM customer c
WHERE EXISTS (
    SELECT 1
    FROM rental r
    WHERE r.customer_id = c.customer_id
    AND r.return_date IS NULL
)
LIMIT 20;


SELECT DISTINCT return_date 
FROM rental;



SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_count DESC;




