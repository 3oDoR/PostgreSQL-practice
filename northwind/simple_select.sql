SELECT * 
FROM products;

SELECT product_id, product_name, unit_price
FROM products;

SELECT product_id, product_name, unit_price * units_in_stock - unit_price * discontinued
FROM products;

SELECT DISTINCT country, city
FROM employees;

SELECT COUNT(order_id)
FROM orders;

SELECT order_id, customer_id, ship_postal_code
FROM orders
WHERE ship_city =  'London';

SELECT *
FROM orders
WHERE order_date >'1996-12-31' AND  order_date <='1997-07-31';

SELECT * 
FROM customers
WHERE country = 'USA' OR country = 'Mexico' OR country = 'Germany';

SELECT * 
FROM customers
WHERE country IN ('USA','Mexico','Germany');

SELECT contact_name
FROM customers
ORDER BY contact_name;

SELECT contact_name
FROM customers
ORDER BY contact_name DESC;

SELECT *
FROM customers
ORDER BY contact_name DESC, city DESC;

SELECT employee_id, postal_code
FROM employees
WHERE postal_code LIKE '%1';

SELECT order_id, ship_name, ship_region
FROM orders 
WHERE ship_region IS NOT NULL;

SELECT order_id, ship_name, ship_region
FROM orders 
WHERE ship_region IS NULL;

SELECT category_id, SUM(units_in_stock)
FROM products
GROUP BY category_id
ORDER BY category_id;

SELECT order_id, ship_country
FROM orders
WHERE ship_country LIKE 'U%';

SELECT order_id, customer_id, freight, ship_country;
FROM orders
WHERE ship_country LIKE 'N%'
ORDER BY freight DESC
LIMIT 10;

SELECT first_name, last_name, home_phone, region
FROM employees
WHERE region IS NULL;

SELECT COUNT(*)
FROM customers
WHERE region IS NOT NULL;

SELECT country, COUNT(*)
FROM suppliers
GROUP BY country
ORDER BY COUNT DESC;

SELECT ship_country, SUM(freight)
FROM orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY SUM(freight) DESC;

SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country;