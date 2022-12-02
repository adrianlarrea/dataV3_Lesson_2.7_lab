USE sakila;


-- 1.How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.

select *
from film;
select *
from film_category;

SELECT  fc.category_id , count(f.film_id) as count
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
GROUP BY category_id;

-- 2.Display the total amount rung up (how much money did each put in the register) by each staff member in August of 2005.

select *
from payment;


SELECT  s.staff_id , SUM(p.amount) as SUM_of_amount
FROM staff s
JOIN payment p
ON s.staff_id = p.staff_id
WHERE p.payment_date LIKE '%2005-08%'
GROUP BY s.staff_id;


-- 3. Which actor has appeared in the most films?
select *
from film_actor;
select *
from actor;

SELECT  f.actor_id , count(f.film_id) as count
FROM film_actor f
JOIN actor a
ON f.actor_id = a.actor_id
GROUP BY f.actor_id
ORDER BY count(f.film_id) DESC
LIMIT 1;


-- 4.Most active customer (the customer that has rented the most number of films)

select *
from rental;
select *
from customer;

SELECT  c.customer_id, count(r.rental_id) as count
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY count(r.rental_id) DESC
LIMIT 1;


-- 5. Display the first and last names, as well as the address, of each staff member.

select *
from staff;
select *
from address;

SELECT  s.first_name , s.last_name, a.address
FROM staff s
JOIN address a
ON s.address_id = a.address_id
;



-- 6. List each film and the number of actors who are listed for that film.

select *
from film_actor;
select *
from film;

SELECT f.film_id, count(actor_id) as number_of_actors
FROM film_actor fa
JOIN film f
ON f.film_id = fa.film_id
GROUP BY f.film_id;


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

select *
from payment;
select *
from customer;


SELECT  c.last_name, sum(p.amount) as TOTAL_PAID
FROM payment p
JOIN customer c
ON c.customer_id = c.customer_id
GROUP BY c.last_name
ORDER BY c.last_name;

-- this is the total amount in each of the alphabetically ordered last names, not the amount per person


-- 8. List number of films per category. 8 is the same as 1, just copy 


select *
from film;
select *
from film_category;

SELECT  fc.category_id , count(f.film_id) as count
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
GROUP BY category_id;

