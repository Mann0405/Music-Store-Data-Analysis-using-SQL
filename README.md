# Music-Store-Data-Analysis-using-SQL

## Project Overview
The goal is to examine the dataset and help the store understand its business growth by answering questions. Use SQL to perform **Exploratory Data Analysis (EDA)** and write **business-driven SQL queries** to derive insights around  popular artists, music genres, best customers, revenue and so on.

## Dataset used
[Music Store Dataset](https://github.com/Mann0405/Music-Store-Data-Analysis-using-SQL/blob/main/music%20store%20data.zip)

## Database and Tools
* Postgre SQL
* PgAdmin4

Schema- Music Store Database  
![MusicDatabaseSchema](https://github.com/Mann0405/Music-Store-Data-Analysis-using-SQL/blob/main/schema_diagram.png)

## Questions
- Who is the senior most employee based on the job title?

- Which countries have the most invoices?

- What are the top 3 values of total invoice?

- Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals

- Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money.

- Write query to return the email, first name, last name for all Rock Genre Music listeners. Return your list ordered alphabetically by email starting with A.

- Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands.

- Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

- Find how much amount spent by each customer on the best-selling artist? Write a query to return customer name, artist name and total spent.

- We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres.

- Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount.

## Insights
- Mohan Madan, the Senior General Manager is the senior most employee having level L7.
- The countries having the most number of invoices are- USA (131), Canada (76), and Brazil (61).
- The top 3 values of total invoice are - $23.76, $19.8, $19.8.
- The best customers are from the city Prague having total invoice sum as $273.24.
- The best customer is R Madhav spending a total of $144.54.
- Returned a list ordered alphabetically, of all the 59 customers who are rock genre listeners, with their first name, last name and email id.
- The artists who have written the most rock music tracks are - Led Zeppelin (114), U2 (112), Deep Purple (92), Iron Maiden (81), Pearl Jam (54), Van Halen (52), Queen (45), The Rolling Stones (41), Creedence Clearwater Revival (40), Kiss (35).
- The average song length is 393599.21 milliseconds. The query returned a list of 494 song tracks having song length more than average.
- The query returned a list of 43 customers who spent money on the best-selling artist with the maximum amount being $27.72.
- The query returned a list of the most popular music genre of each country with the total number of purchases of that genre.
- The query returned a list of the top spending customer of each country along with the amount spent by them.
