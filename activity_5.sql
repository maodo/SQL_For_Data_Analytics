-- Activity 5 : Building a sales model using SQL techniques --

-- 1. Write a query to join customers table and sales table

SELECT
	*
FROM
	customers
	JOIN sales ON customers.customer_id = sales.customer_id;

-- 2. Write a query to join products table and sales table

SELECT
	*
FROM
	products
	JOIN sales ON products.product_id = sales.product_id;

-- 3. Write a query to left join dealership table and sales table
SELECT
	*
FROM
	dealerships
	LEFT JOIN sales ON dealerships.dealership_id = sales.dealership_id;

-- 4. Return all columns of the customers table and the products table
SELECT
	customers.*,
	products.*
FROM
	customers
	JOIN sales ON customers.customer_id = sales.customer_id
	JOIN products ON sales.product_id = products.product_id;

-- 5. Return the dealership_id column from the sales table, but fill in dealership_id in sales with -1 if it is NULL
SELECT * FROM sales;
SELECT
	dealership_id,
	COALESCE(dealership_id,-1)
FROM
	sales;

-- 6. Add a column called high_savings that returns 1 if the sales amount was 500 less than base_msrp or lower. Otherwise it returns O.

SELECT *,
CASE 
	WHEN sales_amount < 500 THEN  1
	ELSE 0
END AS high_savings
FROM sales;

-- Now let's put it together

SELECT
	customers.*,
	products.*,
	COALESCE(dealerships.dealership_id, - 1),
	CASE WHEN sales_amount < 500 THEN
		1
	ELSE
		0
	END AS high_savings
FROM
	customers
	JOIN sales ON customers.customer_id = sales.customer_id
	JOIN products ON sales.product_id = products.product_id
	LEFT JOIN dealerships ON dealerships.dealership_id = sales.dealership_id;