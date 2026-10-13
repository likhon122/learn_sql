-- Active: 1790780941583@@127.0.0.1@5432@bookstore_db


CREATE DATABASE bookstore_db;

CREATE TABLE books(
    id SERIAL PRIMARY KEY,
    title VARCHAR(300) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK(price >= 0),
    stock INT NOT NULL CHECK(stock >= 0),
    published_year SMALLINT NOT NULL
);


CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    joined_date DATE NOT NULL
);

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) NOT NULL,
    book_id INTEGER REFERENCES books(id) NOT NULL,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    order_date DATE NOT NULL
);



INSERT INTO books (title, author, price, stock, published_year) VALUES 
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

INSERT INTO customers (name, email, joined_date) VALUES 
('Alice', 'alice@email.com', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');



INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES 
(1, 2, 1, '2024-03-10'),
(2, 1, 1, '2024-02-20'),
(1, 3, 2, '2024-03-05');



-- Find books that are out of stock.
SELECT title FROM books
    WHERE stock = 0;

-- Retrieve the most expensive book in the store.
SELECT * FROM books
    ORDER BY price DESC
    LIMIT 1;

-- Find the total number of orders placed by each customer.
SELECT name, count(*) FROM orders
    JOIN customers ON customer_id = customers.id
    GROUP BY name;

-- Calculate the total revenue generated from book sales.
SELECT sum(price) as total_revenue FROM orders
    JOIN books ON book_id = books.id

    
-- List all customers who have placed more than one order.
SELECT name, count(*) as orders_count FROM orders
    JOIN customers ON customer_id = customers.id
    GROUP BY name
    HAVING count(*) > 1;

--  Find the average price of books in the store.
SELECT round(avg(price)) as avg_book_price FROM books;

-- Increase the price of all books published before 2000 by 10%.
UPDATE books 
    SET price = ROUND(price+((price*10)/100), 2)
    WHERE published_year < 2000;

SELECT * FROM books;

-- Delete customers who haven't placed any orders.

DELETE FROM customers c
    WHERE NOT EXISTS(
        SELECT 1
        FROM orders o
        WHERE o.customer_id = c.id
    );

SELECT * FROM customers;