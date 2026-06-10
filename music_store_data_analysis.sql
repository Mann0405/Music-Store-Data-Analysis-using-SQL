/*Q1. Who is the senior most employee based on the job title?*/

select * from employee
ORDER BY levels desc
limit 1;

/*Q2. Which countries have the most invoices?*/

select billing_country, COUNT(*) from invoice
group by billing_country
order by count(*) desc;

/* Q3. What are the top 3 values of total invoice? */

select total from invoice
order by total desc
limit 3;

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

select billing_city, sum(total) as sum from invoice
group by billing_city
order by sum desc
limit 1;

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

select invoice.customer_id, customer.first_name, customer.last_name, sum(invoice.total) 
from invoice
join customer 
on invoice.customer_id = customer.customer_id
group by (invoice.customer_id, customer.first_name, customer.last_name)
order by sum(invoice.total) desc
limit 1;

/* Q6: Write query to return the email, first name, last name for all Rock Genre Music listeners. 
Return your list ordered alphabetically by email starting with A. */

select distinct c.email, c.first_name, c.last_name
from customer as c
join invoice as i on c.customer_id = i.customer_id
join invoice_line as il on i.invoice_id = il.invoice_id
where track_id in(
	select track_id from track
	join genre on track.genre_id = genre.genre_id
	where genre.name = 'Rock')
order by c.email;

/* Q7: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

select artist.artist_id, artist.name, count(*) as no_of_songs from track 
join album on track.album_id = album.album_id
join artist on album.artist_id = artist.artist_id
where track.genre_id = '1'
group by artist.artist_id
order by no_of_songs desc
limit 10;

/* Q8: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

select name, milliseconds from track
where milliseconds > (select avg(milliseconds) from track) 
order by milliseconds desc;

/* Q9: Find how much amount spent by each customer on the best-selling artist? Write a query to return customer name, artist name and total spent */

with best_selling_artist as (
	select ar.artist_id, ar.name as artist_name, sum(il.unit_price*il.quantity) as total_sales
	from invoice_line il
	join track t on il.track_id = t.track_id
	join album a on t.album_id = a.album_id
	join artist ar on a.artist_id = ar.artist_id
	group by 1
	order by 3 desc
	limit 1
)
select c.customer_id, c.first_name, c.last_name, bsa.artist_name, sum(il.unit_price*il.quantity) as amount_spent 
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line il on i.invoice_id = il.invoice_id
join track t on il.track_id = t.track_id
join album al on t.album_id = al.album_id
join best_selling_artist as bsa on al.artist_id = bsa.artist_id
group by 1,2,3,4
order by 5 desc;

/* Q10: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres. */

with popular_genre as (
	select c.country, g.genre_id, g.name, count(il.quantity) as purchases, 
	row_number() over(partition by c.country order by count(il.quantity) desc) as row_no
	from customer c 
	join invoice i on c.customer_id = i.customer_id
	join invoice_line il on i.invoice_id = il.invoice_id
	join track t on il.track_id = t.track_id
	join genre g on t.genre_id = g.genre_id
	group by 1,2,3
	order by 1 asc, 4 desc
)
select * from popular_genre where row_no<=1;

/* Q11: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

with top_cust as(
	select c.country, c.first_name, c.last_name, sum(i.total),
	row_number() over(partition by c.country order by sum(i.total) desc) as row_no
	from customer c
	join invoice i on c.customer_id = i.customer_id
	group by 1,2,3
	order by 1 asc, 4 desc
)
select * from top_cust
where row_no<=1;