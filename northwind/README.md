# PostgreSQL practice

To practice queries, I decided to take the ready-made northwind database taken from [here](https://github.com/pthom/northwind_psql).

![DB](https://github.com/pthom/northwind_psql/blob/master/ER.png)


## Select
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










