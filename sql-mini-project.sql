create table customers(
	id serial PRIMARY KEY
	name varchar(20),
	state varchar(20)
);

CREATE TABLE orders2(
	id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(id), 
	product VARCHAR(50),
	price INT
);

INSERT INTO customers(name, state) VALUES
('Ravi', 'Bihar'),
('Satyajit', 'Jharkhand'),
('Anita', 'Odisha');


INSERT INTO orders2 (customer_id, product, price) VALUES
(1, 'Laptop', 60000),
(2, 'Mouse', 500),
(1, 'Keyboard', 800),
(3, 'Laptop', 62000);


SELECT * FROM orders2;

-- 1. Get all orders with price > 1000

SELECT * FROM orders2
WHERE price > 1000;

-- 2. Get the total amount spent by each customer

SELECT c.name, SUM(o.price) AS total_spent
FROM customers c
JOIN orders2 o ON c.id=o.customer_id
GROUP BY c.name;

-- 3. List customers with their order details
SELECT c.name, c.state, o.product, o.price
FROM customers c
JOIN orders2 o ON c.id=o.customer_id;

-- 1. Get all orders with price > 1000

SELECT * FROM orders2
WHERE price > 1000;

-- 2. Get the total amount spent by each customer

SELECT c.name, SUM(o.price) AS total_spent
FROM customers c
JOIN orders2 o ON c.id=o.customer_id
GROUP BY c.name;

-- 3. List customers with their order details
SELECT c.name, c.state, o.product, o.price
FROM customers c
JOIN orders2 o ON c.id=o.customer_id;


-- 1. Show all orders made by customers from "Bihar".
SELECT o.*
FROM orders2 o
JOIN customers c ON o.customer_id=c.id
WHERE c.state = 'Bihar';

-- 2. List all customers who have not placed any order.

SELECT c.*
FROM customers c
LEFT JOIN orders2 o ON c.id=o.customer_id
WHERE o.id IS NULL;

-- 3. Find the most expensive product ordered.

SELECT * FROM orders2
ORDER BY price DESC
LIMIT 1;

-- 4. Show the number of orders per customer.

SELECT c.name, COUNT(o.id) AS order_count
FROM customers c
LEFT JOIN orders2 o ON c.id=o.customer_id
GROUP BY c.name;

--  5. Find the average price of orders by each customer.

SELECT c.name, ROUND(AVG(o.price), 2) AS avg_ord_price
FROM customers c
JOIN orders2 o ON c.id=o.customer_id
GROUP BY c.name;

-- 6. Show all orders where the product name contains the letter "o".

SELECT * FROM orders2
WHERE product LIKE '%o%';

--  7. List all unique products sold.

SELECT DISTINCT product
FROM orders2;

-- 8. Find total revenue from all orders.

SELECT SUM(price) AS total_revenue
FROM orders2;

--  9. Show customers who bought a "Laptop".

SELECT DISTINCT c.name
FROM customers c
JOIN orders2 o ON c.id=o.customer_id
WHERE o.product = 'Laptop';

-- 10. Find the customer who spent the least total amount.

SELECT c.name, SUM(o.price) AS total_spent
FROM customers c
JOIN orders2 o ON c.id=o.customer_id
GROUP BY c.name
ORDER BY total_spent ASC
LIMIT 1;









