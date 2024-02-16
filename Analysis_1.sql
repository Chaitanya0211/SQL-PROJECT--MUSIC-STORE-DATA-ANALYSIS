-- QUE 1. Who is the senior most employee based on job title? 
SELECT * FROM employee
order by levels desc
limit 1;

-- QUE 2. Which countries have the most Invoices? 
select 
	billing_city,
	count(*) as billing_count
from invoice 
group by billing_city
order by billing_count desc;

-- QUE 3. What are top 3 values of total invoice?
select 
	* 
from invoice
order by total desc
limit 3;

-- QUE 4. Which city has the best customers? We would like to throw a promotional Music Festival 
-- in the city we made the most money. Write a query that returns one city that has 
-- the highest sum of invoice totals. Return both the city name & sum of all invoice totals 
SELECT
	billing_city,
    sum(total) as invoice_totals
FROM music_database.invoice
group by billing_city
order by invoice_totals desc
limit 1;

-- QUE 5. Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money
select
	c.customer_id,
	c.first_name,
    c.last_name,
    sum(i.total) as total_spending
from customer c
join invoice i
on i.customer_id = c.customer_id
group by 
	c.customer_id,
	c.first_name,
    c.last_name
order by total_spending desc
limit 1
