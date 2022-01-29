-- Run Query:
-- Retrieve all data from the artists table.
-- Look at the list of artists, how many artists are you familiar with (there is no wrong answer here)
SELECT *
FROM artists
LIMIT 5
;
-- bis auf "Accept" alle ;-)

-- Run Query:
-- Find all the tracks that have a length of 5,000,000 milliseconds or more.
-- How many tracks are returned?
SELECT COUNT(id)
FROM tracks
WHERE milliseconds >= 5000000
;

-- Run Query:
-- Find all the invoices whose total is between 5 and 15 dollars.
SELECT *
FROM invoices
WHERE total BETWEEN 5 AND 15
;

-- Run Query:
-- Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT *
FROM customers
WHERE State IN ('RJ','DF','AB','BC','CA','WA','NY')
;

-- What company does Jack Smith work for?
SELECT company
FROM customers
WHERE last_name = 'Smith' AND first_name = 'Jack'
;

-- Run Query:
-- Find all the invoices for customer 56 and 58 where the total was between 1.00 and 5.00 dollars.
SELECT id, customer_id, total
FROM invoices
WHERE customer_id IN (56, 58) AND
      (total BETWEEN 1.00 AND 5.00)
;

-- What was the invoice date for invoice ID 315?
SELECT invoice_date
FROM invoices
WHERE id = 315
;

-- Run Query:
-- Find all the tracks whose name starts with ‘All’. How many total records there are for this query?
SELECT COUNT(*)
FROM tracks
WHERE name LIKE 'All%'
;

-- Run Query:
-- Find all the customer emails that start with “J” and are from gmail.com.
SELECT email
FROM customers
WHERE email LIKE lower('J%gmail.com')
;

-- Run Query:
-- Find the albums with 12 or more tracks.
SELECT t.album_id, a.title, COUNT(*)
FROM albums a, tracks t
WHERE a.id = t.album_id
GROUP BY t.album_id, a.title
HAVING COUNT(*) >= 12
ORDER BY 3
;