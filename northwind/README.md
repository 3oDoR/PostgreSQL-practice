# PostgreSQL practice

1. [Simple SELECT query](#select)
2. [Simple JOIN query](#)

To practice queries, I decided to take the ready-made northwind database taken from [here](https://github.com/pthom/northwind_psql).

![DB](https://github.com/pthom/northwind_psql/blob/master/ER.png)


## <a id="select">Select</a>

First, let's look at all the columns in the table **products**.


```SQL
SELECT * 
FROM products
```

Now output the **product_id, product_name, unit_price columns** in the table **products**.

```SQL
SELECT product_id, product_name, unit_price
FROM products
```

Now we use mathematical expressions in our query.

```SQL
SELECT product_id, product_name, unit_price * units_in_stock - unit_price * discontinued
FROM products
```

Now in the workers table we get a list of countrys and citys without repetition

```SQL
SELECT DISTINCT country, city
FROM employees
```

Let's count the number of orders

```SQL
SELECT COUNT(order_id)
FROM orders
```

Let's use WHERE in the query.

```SQL
SELECT order_id, customer_id, ship_postal_code
FROM orders
WHERE ship_city =  'London';

SELECT *
FROM orders
WHERE order_date >'1996-12-31' AND  order_date <='1997-07-31'
```

In order not to write a lot of OR, since it is bad to read, it is better to use IN.

```SQL
SELECT * 
FROM customers
WHERE country = 'USA' OR country = 'Mexico' OR country = 'Germany'


SELECT * 
FROM customers
WHERE country IN ('USA','Mexico','Germany')
```

To sort the sequence, you need to use ORDER BY

```SQL
SELECT contact_name
FROM customers
ORDER BY contact_name;

SELECT contact_name
FROM customers
ORDER BY contact_name DESC;

SELECT *
FROM customers
ORDER BY contact_name DESC, city DESC;
```

Use LIKE

```SQL
SELECT employee_id, postal_code
FROM employees
WHERE postal_code LIKE '%1'
```
Use  IS NOT NULL and  IS NULL
```SQL
SELECT order_id, ship_name, ship_region
FROM orders 
WHERE ship_region IS NOT NULL

SELECT order_id, ship_name, ship_region
FROM orders 
WHERE ship_region IS NULL
```

USE GROUP BY

```SQL 
SELECT category_id, SUM(units_in_stock)
FROM products
GROUP BY category_id
ORDER BY category_id
```

1. Select all order records in which the name of the country of shipment begins with 'U'

2. Select the order records (include columns of order ID, customer ID, weight and country of shipment) that should be shipped to countries whose name begins with 'N', sort by weight (descending) and display only the first 10 records.

3. Select employee records (include columns of first name, last name, phone number, region) in which the region is unknown

4. Count the number of customers whose region is known

5. Count the number of suppliers in each of the countries and sort the results of grouping in descending order

6. Calculate the total weight of orders (in which the region is known) by country, then filter by total weight (output only those records where the total weight is greater than 2750) and sort in descending order of total weight.

7. Select all the unique countries of customers and suppliers and sort the countries in ascending order

```SQL
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
```

## <a id="join">JOIN</a>













