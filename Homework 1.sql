use sakila;

# 1a
select first_name, last_name
from actor;

# 1b
select upper(concat(actor.first_name, actor.last_name)) AS 'Actor Name'
from actor;

# 2a
select actor_id, first_name, last_name
from actor
where first_name = 'Joe';

# 2b
select last_name
from actor
where last_name like '%GEN%';

# 2c
select last_name, first_name
from actor
where last_name like '%LI%';

# 2d
select country_id, country
from country
where country in ("Afghanistan","Bangladesh","China");

# 3a
alter table actor add column middle_name varchar(30) after first_name;

# 3b
alter table actor modify middle_name blob;

# 3c
alter table actor drop middle_name;

# 4a
select last_name, count(last_name) as last_name_count
from actor
group by last_name;

# 4b
select last_name, count(last_name) as last_name_count
from actor
group by last_name
having (last_name_count>1);

# 4c
update actor
set first_name = "HARPO"
where first_name = "GROUCHO" and last_name = "WILLIAMS";

# 4d
update actor
set first_name = "GROUCHO"
where actor_id = 172;

# 5
describe address;

# 6a
select first_name, last_name, address
from address a
join staff s
on(a.address_id=s.address_id);

# 6b
select first_name, last_name, sum(amount) as total
from staff s
join payment p
on(s.staff_id=s.staff_id);

# 6c
select f.film_id, title, count(actor_id) as total_actors
from film f
inner join film_actor a
on f.film_id = a.film_id
group by actor_id;

# 6d
select title,
(select count(*) from inventory where film.film_id=inventory.film_id) 
as 'Number of Copies'
from film
where title = 'Hunchback Impossible';

# 6e
select last_name, first_name, 
(select sum(amount) from payment)
as 'Amount Paid'
from customer c
join payment p 
on(c.customer_id=p.customer_id)
group by last_name;

# 7a
select title, language_id
from film
where title like 'K%' or title like 'Q%'
and language_id = 1;

# 7b
