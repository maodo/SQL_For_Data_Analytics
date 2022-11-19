-- Salespeople schema examination
SELECT * FROM salespeople;

-- Getting the usernames of female salespeople sorted by their hire_date values and set LIMIT as 10
 SELECT username FROM salespeople
 WHERE gender = 'Female'
 ORDER BY hire_date
 LIMIT 10;

-- Customers table examination
SELECT * FROM customers;

--« Write a query that pulls all emails for ZoomZoom customers in the state of Florida in alphabetical order. »
SELECT email, "state" FROM customers
WHERE "state"='FL'
ORDER BY email;

--« Write a query that pulls all the first names, last names and email details for ZoomZoom customers in New York City in the state of New York. They should be ordered alphabetically by the last name followed by the first name. »

SELECT first_name,last_name, email FROM customers
WHERE "state" ='NY'
ORDER BY last_name,first_name;

--« Write a query that returns all customers with a phone number ordered by the date the customer was added to the database. »

SELECT * FROM customers
WHERE phone IS NOT NULL
ORDER BY date_added;

-- Multple JOIN
SELECT
	customers.first_name,
	customers.last_name,
	customers.phone
FROM
	sales
	JOIN customers ON customers.customer_id = sales.customer_id
	JOIN products ON sales.product_id = products.product_id
WHERE
	products.product_type = 'automobile'
	AND customers.phone IS NOT NULL;

-- NULLIF function
SELECT
	*
FROM
	customers
WHERE title = 'Honorable';

SELECT
	customer_id,
	NULLIF(title, 'Honorable') AS title,
	first_name,
	last_name
FROM
	customers
ORDER BY 1;