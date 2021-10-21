-- 1
SELECT 
	c.customer_id, 
	c.first_name || ' ' || c.last_name as full_name, 
	c.email,
	c3.country
FROM customer c 
JOIN address a USING (address_id)
JOIN city c2 USING (city_id)
JOIN country c3 USING (country_id)
WHERE c3.country = 'Canada';

-- 2
SELECT 
	c.customer_id,
	c.first_name || ' ' || c.last_name as full_name,
	count(r.rental_id) AS times_renting 
FROM customer c
JOIN rental r USING (customer_id)
JOIN inventory i USING (inventory_id)
JOIN film f USING (film_id) 
	WHERE f.rating = 'NC-17'
GROUP BY (c.customer_id, full_name)
	ORDER BY times_renting DESC
		LIMIT 1;

-- 3
SELECT
	f.film_id,
	f.title,
	count(r.rental_id) AS times_rented
FROM rental r
JOIN inventory i USING (inventory_id)
JOIN film f USING (film_id)
GROUP BY (f.film_id, f.title)
	ORDER BY times_rented DESC;
	
-- 4
SELECT 
	s.store_id,
	c2.country,
	c.city,
	a.address,
	sum(p.amount) AS revenue
FROM payment p
JOIN rental r USING (rental_id)
JOIN inventory i USING (inventory_id)
JOIN store s USING (store_id)
JOIN address a USING (address_id)
JOIN city c USING (city_id)
JOIN country c2 USING (country_id)
GROUP BY (s.store_id, a.address_id,c.city,c2.country);



