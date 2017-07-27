-- Description:
--	This is basically a refresher on PostgreSQL and PGAdmin (mostly queries). Queries progressively get more
--  difficult.

-- NOTE: All database(s) and table(s) information / schema is stored in the dvdrental.tar file.

-- 1. Given a table "customer" with fields "first_name," "last_name," and "email," find the first and last names 
--    of every customer and their email address.

			SELECT CONCAT(first_name, ' ', last_name), email 
			FROM customer;
			
			
-- 2. Given the database from dvdrental.tar, print out the distinct types of ratings (PG, PG13, R, NC-17, etc.) 
--	  the movies have.

			SELECT DISTINCT rating 
			FROM film 
			ORDER BY rating ASC;
			
			
-- 3. How many customers' first name is "Jared?"

			SELECT COUNT(first_name) 
			FROM customer
			WHERE first_name = 'Jared';
			
			
-- 4. What is the email address of the customer named "Nancy Thomas?"

			SELECT email
			FROM customer
			WHERE first_name = 'Nancy' AND last_name = 'Thomas';

			
-- 5. Someone wants to know what the movie "Outlaw Hanky" is about. Help them out.

			SELECT description
			FROM film
			WHERE title = 'Outlaw Hanky';
			
			
-- 6. A customer is overdue on their film return. Their address is "259 Ipoh Drive." We need to 
--    find their phone number to let them know.

			SELECT phone
			FROM address
			WHERE address = '259 Ipoh Drive';
			
			
-- 7. Print out all customers and list them by first name ascending order and last name descending order.
--    Make sure to only print the customers with an even id.

			SELECT customer_id, 
				   CONCAT(first_name, ' ', last_name)
			FROM customer
			WHERE customer_id % 2 = 0
			ORDER BY first_name ASC, last_name DESC
			
			
-- 8. Find the top ten highest payment amounts. Print the customer ids.

			SELECT customer_id, amount 
			FROM payment 
			ORDER BY amount DESC 
			LIMIT 10;
			
			
-- 9. Get all movie titles with IDs 1-5.

			SELECT film_id, title
			FROM film
			ORDER BY film_id ASC
			LIMIT 5;
			
			
-- 10. Find all payment instances that are between 7 and 9 dollars.

			SELECT amount
			FROM payment
			WHERE amount BETWEEN 8 AND 9
			ORDER BY amount ASC;
			
			
-- 11. Find all payment plans that are not between 5 and 8 dollars.

			SELECT DISTINCT amount
			FROM payment
			WHERE amount NOT BETWEEN 5 AND 8
			ORDER BY amount ASC;
			
			
-- 12. Using the IN statement, find the customer ID and full name of everyone named Jared, Patricia, and Mary. Order them by ID.

			SELECT customer_id, CONCAT(first_name, ' ', last_name)
			FROM customer
			WHERE first_name IN ('Jared', 'Patricia', 'Mary')
			ORDER BY customer_id ASC;
			
			
-- 13. Using the IN statement, find the customer ID and full name of everyone not named Jared, Patricia, and Mary. Order them by ID and limit by 5.

			SELECT customer_id, CONCAT(first_name, ' ', last_name)
			FROM customer
			WHERE first_name NOT IN ('Jared', 'Patricia', 'Mary')
			ORDER BY customer_id ASC
			LIMIT 5;
			
			
-- 14. Find everyone whose first name has "el" in it.

			SELECT CONCAT(first_name, ' ', last_name)
			FROM customer
			WHERE first_name LIKE '%el%';
			
			
-- 15. Find everyone whose first name starts with "A."

			SELECT CONCAT(first_name, ' ', last_name)
			FROM customer
			WHERE first_name LIKE 'A%';
			
			
-- 16. Find everyone whose last name ends with "ez."

			SELECT CONCAT(first_name, ' ', last_name)
			FROM customer
			WHERE last_name LIKE '%ez';
			
			
-- 17. Find everyone whose last name ends with "ez" and also has 3 or more characters before it.

			SELECT CONCAT(first_name, ' ', last_name)
			FROM customer
			WHERE last_name LIKE '%___ez';
			
			
 -- 18. Figure out how many payment transactions were greater than $5.
 
			SELECT COUNT(*) 
			FROM payment 
			WHERE amount > 5;
			
			
-- 19. Figure out how many actors' first names start with "P."

			SELECT COUNT(*) 
			FROM actor 
			WHERE first_name LIKE 'P%';
			
			
-- 20. How many unique districts are customers from?

			SELECT COUNT(DISTINCT district) 
			FROM address;
			
			
-- 21. For each unique district, print the name.

			SELECT DISTINCT district
			FROM address
			ORDER BY district ASC;
			
			
-- 22. Determine how many films have an R rating and replacement fee between $5 and $15.

			SELECT COUNT(*) 
			FROM film 
			WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;
			
			
-- 23. How many films have "Truman" somewhere in the title?

			SELECT COUNT(*) 
			FROM film 
			WHERE title LIKE '%Truman%';
			
			
--- 24. 