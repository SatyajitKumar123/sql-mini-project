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










