-- Activity 4

--« Create a new table called customers_nyc that pulls all rows from the customers table where the customer lives in New York City in the state of New York. »

CREATE TABLE customers_nyc AS (
SELECT * FROM customers
WHERE "state"='NY'
);

-- « Delete from the new table all customers in postal code 10014. Due to local laws, they will not be eligible for marketing. »

DELETE FROM customers_nyc
WHERE postal_code='10014';

-- Checking if deletion has passed
SELECT * FROM customers_nyc
WHERE postal_code='10014';

-- « Add a new text column called event. »

ALTER TABLE customers_nyc
ADD COLUMN event TEXT;

-- Checking if column creation is OK
SELECT * FROM customers_nyc;

-- « Set the value of the event to thank-you party. »
UPDATE customers_nyc
SET EVENT = 'thank-you party';


-- Checking if update is done
SELECT * FROM customers_nyc;

-- customers_nyc table deletion
DROP TABLE customers_nyc;