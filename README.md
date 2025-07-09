# sql-mini-project
## Designing database
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

## Write SQL queries for:

* Get all orders with price > ₹1000

* Get the total amount spent by each customer

* List customers with their order details (use JOIN)

