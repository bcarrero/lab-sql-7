USE sakila;
-- Instructions
--  1  Which last names are not repeated?
select distinct last_name, count(last_name) AS 'appearing'
from actor
group by last_name
having appearing = 1;
--  2  Which last names appear more than once?
select last_name, count(last_name) AS total 
from actor
Group by last_name
having total > 1;
--  3  Rentals by employee.
select staff_id, count(staff_id) AS number_of_rentals from rental
group by staff_id;
--   4 Films by year.
select release_year, count(title) AS number_of_movies
from film
group by release_year;
--   5 Films by rating.
select rating, count(title) AS number_of_movies
from film
Group by rating;
--   6 Mean length by rating.
select rating, round(avg(length),2)
from film
Group by rating;
--   7 Which kind of movies (rating) have a mean duration of more than two hours?
select rating, round(avg(length),0) AS average_length, count(title) AS number_of_movies
from film
Group by rating
having avg(length) > 120;
--    8 List movies and add information of average duration for their rating and original language.
select rating, title,
avg(length) over (partition by rating) as avg_length
from film;
--   9  Which rentals are longer than expected?
select * from rental;
select inventory_id, rental_id, datediff(return_date,rental_date) AS 'rental_duration'
from rental
group by inventory_id
having datediff(return_date,rental_date) > "Average_duration"
ORDER BY inventory_id;
select inventory_id, rental_id, datediff(return_date,rental_date) AS 'rental_duration',
avg(datediff(return_date,rental_date)) OVER (partition by inventory_id) as 'average_rent'
FROM rental
where 'rental_duration' > average_rent;
-- having avg(datediff(return_date,rental_date)) > 'average_rent';

select * from 
select * from film;

