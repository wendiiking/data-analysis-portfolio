---1. Display the customers name that share the same address (eg husband and wife)---
SELECT c.first_name, c.last_name, a.address
FROM address AS a
JOIN customer AS c ON a.address_id = c.address_id
GROUP BY c.first_name, c.last_name, a.address
HAVING COUNT (a.address)>1;
---There are no customers with the same address---

---2. What is the name of the customer with the highest total payments---
SELECT p.customer_id, c.first_name, c.last_name, SUM(p.amount) AS highest_payments
FROM payment p
LEFT JOIN customer c ON p.customer_id = c.customer_id
GROUP BY p.customer_id, c.first_name, c.last_name
ORDER BY highest_payments DESC LIMIT 1;
---Eleanor hunt is the customer with the highest total payments = 211.55---

---3. What is the movie(s) that was rented the most---
SELECT i.film_id, f.title, COUNT (i.film_id) AS rents 
FROM inventory i
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN film AS f ON i.film_id = f.film_id
GROUP BY i.film_id, f.title
HAVING COUNT (i.film_id)> 1
ORDER BY rents DESC LIMIT 2;
---Bucket Brotherhood is the movie with the most rental at 34--

---4. Which movies have been rented so far--
SELECT i.film_id, f.title
FROM inventory AS i
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN film AS f ON i.film_id = f.film_id
GROUP BY i.film_id, f.title;
---958 movies have been rented so far---

---5. Which movies have not been rented so far--
SELECT f.film_id, f.title
FROM film AS f
LEFT JOIN inventory AS i ON f.film_id = i.film_id
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS null
ORDER BY f.title;
---43 movies have not been rented so far---

---6. Which customers have not rented any movies so far--
SELECT c.first_name, c.last_name, c.customer_id, r.rental_id
FROM customer AS c
LEFT JOIN rental AS r ON c.customer_id = r.customer_id
WHERE r.rental_id IS null;
---There are no customers that have not rented any movies so far---

---7. Display each movies and the number of times it got rented---
SELECT i.film_id, f.title, COUNT(f.film_id) AS no_of_times_rented
FROM inventory As i
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN film AS f ON i.film_id = f.film_id
GROUP BY i.film_id, f.title
HAVING COUNT (i.film_id) >= 1
ORDER BY no_of_times_rented DESC;
---The movies and number of times rented are shown below---

---8. Show the first and last names and the number of films each actor acted in---
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS no_of_films_acted
FROM film_actor AS fa
JOIN actor AS a ON fa.actor_id = a.actor_id
JOIN film AS f ON fa.film_id =f.film_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY no_of_films_acted DESC;
--- There are over 200 actors and Gina acted in the highest number of films (42)---

---9. Display the names of the actors that acted in more than 20 movies---
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS no_of_films_acted
FROM film_actor AS fa
JOIN actor AS a ON fa.actor_id = a.actor_id
JOIN film AS f ON fa.film_id =f.film_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT (fa.film_id) >20
ORDER BY no_of_films_acted DESC;
---181 actors have acted in more than 20 movies---

---10. For all the movies rated "PG" show the movie and the number of times it got rented---
SELECT i.film_id, f.title, COUNT(f.film_id) AS no_of_times_rented
FROM rental As r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
WHERE rating = 'PG'
GROUP BY i.film_id, f.title
ORDER BY no_of_times_rented DESC;
---183 movies were rated 'PG'---

---11. Display the movies offered for rent in store_id 1 and not store_id 2---
SELECT i.film_id, f.title, i.store_id 
FROM inventory AS i
JOIN film AS f ON i.film_id = f.film_id
GROUP BY i.film_id, f.title, i.store_id
HAVING i.store_id = 1 AND i.store_id != 2;
--- There are 759 films offered for rent in store_id 1 and not in store_id 2---

---12. Display the movies offered for rent in any of the 2 stores---
SELECT i.film_id, f.title, i.store_id 
FROM inventory AS i
JOIN film AS f ON i.film_id = f.film_id
GROUP BY i.film_id, f.title, i.store_id
HAVING i.store_id = 1 OR i.store_id = 2;
---There are 1521 movies offered in any of the 2 stores---

---13. Display the movies titles of those movies offered in both stores at the same time
SELECT i.film_id, f.title, i.store_id 
FROM inventory AS i
JOIN film AS f ON i.film_id = f.film_id
GROUP BY i.film_id, f.title, i.store_id
HAVING i.store_id = 1 AND i.store_id = 2;
---There are no movies offered in both stores at the same time---

---14. Display the movie title for the most rented movie in the store with store_id 1---
SELECT f.film_id, f.title, i.store_id, COUNT(r.customer_id) AS no_of_rents 
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title, i.store_id
HAVING i.store_id = 1 AND COUNT(r.customer_id) >1
ORDER BY no_of_rents DESC LIMIT 1;
---Love suicides is the most rented in store 1

---15. How many movies are not offered for rent in the stores yet. There are two stores only 1 and 2---
SELECT i.film_id, f.title, i.store_id 
FROM inventory AS i
JOIN film AS f ON i.film_id = f.film_id
GROUP BY i.film_id, f.title, i.store_id
HAVING i.store_id != 1 AND i.store_id != 2;
---There are no movies not offered for rent in either store---

---16. Show the number of rented movies under each rating---
SELECT f.rating, COUNT(r.rental_id) AS no_of_rented_movies
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.rating
ORDER BY no_of_rented_movies DESC;
---PG-13 movies had the highest number of rental at 3585--

---17. Show the profit of each of the stores 1 and 2---
SELECT i.store_id, SUM(p.amount) 
FROM payment AS p
JOIN rental AS r ON p.rental_id = r.rental_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
GROUP BY i.store_id
ORDER BY SUM DESC;
---Store_id 2 has the highest amount in profits at 30683.13---





