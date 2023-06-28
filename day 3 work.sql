SELECT category_id, COUNT(*) AS category_count
FROM film_category
GROUP BY category_id
ORDER by COUNT(*) ASC;



SELECT c.category_id, c.name AS category_name, COUNT(*) AS film_count
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY film_count DESC;



SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;



SELECT c.category_id, c.name AS category_name, COUNT(f.film_id) AS film_count, SUM(p.amount) AS total_amount
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.category_id, c.name
ORDER BY total_amount DESC;






SELECT f.rating, SUM(p.amount) AS total_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.rating
ORDER BY total_revenue DESC;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(*) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(*) > 10
ORDER BY c.last_name ASC;


SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
ORDER BY last_name ASC;

SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
ORDER BY last_name ASC;


SELECT f.rating, SUM(p.amount) AS total_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.rating
HAVING SUM(p.amount) > 13000
ORDER BY total_revenue DESC;


SELECT film_id, title
FROM film
EXCEPT
SELECT f.film_id, f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
ORDER BY title DESC;





