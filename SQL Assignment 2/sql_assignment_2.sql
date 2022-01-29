-- Create a list of album titles and the unit prices for the artist “Audioslave”.
SELECT al.title, tr.unit_price
FROM albums al
         INNER JOIN tracks tr ON al.id = tr.album_id
         INNER JOIN artists ar ON ar.id = al.artist_id
WHERE ar.name = 'Audioslave'
;

SELECT al.title, sum(tr.unit_price)
FROM albums al
         INNER JOIN tracks tr ON al.id = tr.album_id
         INNER JOIN artists ar ON ar.id = al.artist_id
WHERE ar.name = 'Audioslave'
GROUP BY al.title
;

-- Using a subquery, find the names of all the tracks for the album “Californication”.
SELECT tr.name
FROM tracks tr
WHERE tr.album_id IN (SELECT a.id FROM albums a WHERE a.title = 'Californication')
;


-- Find the total number of invoices for each customer along with the customer’s full name, city and email.
SELECT c.first_name,
       c.last_name,
       c.city,
       c.email,
       COUNT(i.customer_id)
FROM customers c
         INNER JOIN invoices i
                    ON c.id = i.customer_id
GROUP BY c.id
ORDER BY c.id
;


-- After running the query described above, what is the email address of the 5th person, František Wichterlová?
SELECT c.first_name,
       c.last_name,
       c.city,
       c.email,
       COUNT(i.customer_id)
FROM customers c
         INNER JOIN invoices i
                    ON c.id = i.customer_id
WHERE c.id = 5
GROUP BY c.id
;


-- Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT tr.name, al.title, ar.id, tr.id
FROM ((tracks tr INNER JOIN albums al
    ON tr.album_id = al.id)
         INNER JOIN artists ar
                    ON ar.id = al.artist_id)
;


-- What is the song title of trackID 12 from the “For Those About to Rock We Salute You” ?
SELECT al.title, tr.name, tr.id
FROM tracks tr
         LEFT OUTER JOIN albums al ON tr.album_id = al.id
WHERE al.title = 'For Those About To Rock We Salute You'
  AND tr.id = 12
;


-- Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
-- Who are the reports for the manager named Mitchell?
SELECT sup.last_name, e.last_name
FROM employees e
         LEFT OUTER JOIN employees sup ON e.reports_to = sup.id
;

SELECT sup.last_name, e.last_name
FROM employees e
         LEFT OUTER JOIN employees sup ON e.reports_to = sup.id
WHERE sup.last_name LIKE 'Mitchell'
;


-- Find the name and ID of the artists who do not have albums.
SELECT ar.name,
       ar.id,
       al.title
FROM artists ar
         LEFT OUTER JOIN albums al
                         ON ar.id = al.artist_id
WHERE al.title IS NULL
;


-- Use a UNION to create a list of all the employee’s and customer’s first names and last names ordered by the last name in descending order.
-- Determine what is the last name of the 6th record Remember to order things in descending order to be sure to get the correct answer.
SELECT e.first_name,
       e.last_name
FROM employees e
UNION
SELECT c.first_name,
       c.last_name
FROM customers c
ORDER BY last_name DESC
;
-- 6. Eintrag: Mark Taylor

SELECT e.first_name,
       e.last_name
FROM employees e
UNION
SELECT c.first_name,
       c.last_name
FROM customers c
ORDER BY last_name DESC
LIMIT 1 OFFSET 5
;


-- See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT c.first_name,
       c.last_name,
       c.city,
       i.billing_city
FROM customers c
         LEFT OUTER JOIN invoices i
                         ON c.id = i.customer_id
WHERE c.city != i.billing_city
;
