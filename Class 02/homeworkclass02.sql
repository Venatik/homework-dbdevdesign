-- PART 1
SELECT * FROM employee
WHERE firstname = 'Ana';

SELECT * FROM employee
WHERE dateofbirth > '01.01.1979';

SELECT * FROM employee
WHERE gender = 'M';

SELECT * FROM employee
WHERE lastname LIKE 'T%';

SELECT * FROM employee
WHERE EXTRACT(MONTH FROM hiredate) = 1 AND EXTRACT(YEAR FROM hiredate) = 2012;

SELECT * FROM employee
WHERE lastname LIKE 'P%' AND EXTRACT(MONTH FROM hiredate) = 1 AND EXTRACT(YEAR FROM hiredate) = 2013;

SELECT * FROM product
WHERE name ILIKE '%soy%';

-- PART 2
SELECT * FROM employee
WHERE firstname LIKE 'A%'
ORDER BY lastname;

SELECT * FROM employee
ORDER BY firstname;

SELECT * FROM employee
WHERE gender = 'M'
ORDER BY hiredate DESC;

SELECT * FROM employee
WHERE LENGTH(firstname) <= 5
ORDER BY firstname;

SELECT DISTINCT regionname
FROM customer
ORDER BY regionname DESC;

-- PART 3
SELECT region FROM businessentity
UNION ALL
SELECT regionname FROM customer

SELECT region FROM businessentity
UNION
SELECT regionname FROM customer

SELECT region from businessentity
INTERSECT
SELECT regionname FROM customer

-- PART 4
ALTER TABLE "Order"
ADD CONSTRAINT restrict_order_date_2010 
CHECK (orderdate >= '01.01.2010');

ALTER TABLE product
ADD CONSTRAINT price_higher_than_cost
CHECK (price >= cost * 1.2);
-- ERROR:  check constraint "price_higher_than_cost" of relation "product" is violated by some row 
-- SQL state: 23514
-- Ne najdov sto e errorot

ALTER TABLE product
ADD CONSTRAINT description_unique
UNIQUE (description);

-- Na table creation level:
CREATE TABLE IF NOT EXISTS Product (
Id serial PRIMARY KEY NOT NULL,
Code varchar(50) NULL,
Name varchar(100) NULL,
Description varchar(5000) UNIQUE NULL,
Weight float(2) NULL,
Price float(2) NULL,
Cost float(2) NULL);

-- PART 5
ALTER TABLE orderdetails
ADD COLUMN order_id integer,
ADD COLUMN product_id integer;

ALTER TABLE orderdetails
ADD CONSTRAINT fk_orderdetails_order
FOREIGN KEY (order_id) REFERENCES "Order"(Id),
ADD CONSTRAINT fk_orderdetails_product
FOREIGN KEY (product_id) REFERENCES product(id);

-- PART 6