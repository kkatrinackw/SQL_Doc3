1.
select customer.first_name, last_name, address.district
from customer 
left join address 
on customer.address_id  = address.address_id
where address.district  = 'Texas';

2.
select customer.first_name , last_name, payment.customer_id, amount
from customer
right join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99;

3.
select first_name ,last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id, amount
	having sum(amount) > 175
);

4.
select customer.first_name, last_name, country.country 
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

5.
select staff_id, first_name, last_name
from staff
where staff_id in (
	select staff_id
	from payment
	group by staff_id 
	order by count(payment_id) desc 
	limit 1
);

6.
select distinct rating, count(film_id)
from film 
group by rating
order by count(film_id) desc 

7.
select customer.first_name, last_name, customer_id 
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id, amount
	having amount > 6.99
);

8.
select count(amount) 
from payment 
where amount = 0;

