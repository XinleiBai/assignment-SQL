use sakila;
select first_name, last_name
from actor
select concat(first_name, ' ',last_name) as 'Actor Name'
FROM actor
select actor_id,first_name, last_name 
from actor
where first_name ='Joe';
Select actor_id,first_name, last_name
from actor
where last_name like '%GEN%';
select actor_id,first_name,last_name
from actor
where last_name like '%LI%'
order by last_name,first_name;
select country_id, country 
from country
where country IN ('Afghanistan','Bangladesh','China');
select * from actor;
alter table actor
add column description BLOB(50) after last_name;
alter table actor
drop column description;
select last_name, count(*) as 'Count' 
from actor
group by last_name;
select last_name, count(*) as 'Count'
from actor
group by last_name
having count >=2
update actor
set first_name='HARPO'
where first_name='GROUCHO' and last_name='WILLIAMS';
UPDATE actor
set first_name='GROUCHO'
WHERE first_name='HAPRO' and last_name='WILLIAMS';
DESCRIBE sakila.address
select staff.first_name, staff.last_name, address.address
from staff left join address on staff.address_id=address.address_id;
select s.first_name, s.last_name,sum(p.amount) as 'TOTAL'
from staff s left join payment p on s.staff_id=p.staff_id
group by s.first_name,s.last_name;
select f.title,count(a.actor_id) as 'TOTAL'
from film f inner join film_actor a on f.film_id=a.film_id
group by f.title;
select f.title, count(f.film_id) as 'total'
from film f inner join inventory on f.film_id=inventory.film_id
where f.title='Hunchback Impossible';
select c.first_name, c.last_name, sum(p.amount) as 'TOTAL'
from customer c inner join payment p on c.customer_id=p.customer_id
group by c.first_name, c.last_name
order by c.last_name
select title
from film
where (title like 'K%' or title like 'Q%')
AND language_id =(
select language_id from language where name ='English')
select first_name, last_name from actor
where actor_id in (
select actor_id from film_actor where film_id in (
select film_id from film where title='ALONE TRIP'))
select c.first_name, c.last_name, c.email
from customer c join address a on (c.address_id=a.address_id)
join city ci on (a.city_id=ci.city_id)
join country cty on (ci.country_id=cty.country_id);
select title from film f
join film_category fc on (f.film_id=fc.film_id)
join category c on (fc.category_id=c.category_id);
select title, count(f.film_id) as 'Count'
from film f 
join inventory i on (f.film_id=i.film_id)
join rental r on (i.inventory_id=r.inventory_id)
group by title 
order by Count desc;
select s.store_id, sum(p.amount)
from payment p
join staff s on (p.staff_id=s.staff_id)
group by store_id;
select store_id, city, country from store s
join address a on (s.address_id=a.address_id)
join city c on (a.city_id=c.city_id)
join country on (c.country_id=country.country_id);
create view TOPFIVE as 
select c.name as  "Top Five", sum(p.amount) as "Total" 
from category c
join film_category fc on (c.category_id=fc.category_id)
join inventory i on (fc.film_id=i.film_id)
join rental r on (i.inventory_id=r.inventory_id)
join payment p on (r.rental_id=p.rental_id)
group by c.name order by Total limit 5;
select * from TOPFIVE
drop view TOPFIVE

