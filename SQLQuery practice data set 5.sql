/*create database practice_sql

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    country VARCHAR(30),
    signup_date DATE
);

INSERT INTO customers VALUES
(1, 'Amit', 'India', '2023-01-10'),
(2, 'Sara', 'USA', '2023-02-15'),
(3, 'Rahul', 'India', '2023-03-20'),
(4, 'John', 'UK', '2023-01-25'),
(5, 'Neha', 'India', '2023-04-10');


CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT
);

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Mobile', 'Electronics', 30000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Keyboard', 'Accessories', 2000),
(105, 'Chair', 'Furniture', 7000);*/

CREATE TABLE orders (
    order_id INT, 
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

INSERT INTO orders VALUES
(1001, 1, 101, '2023-05-01', 1),
(1002, 1, 103, '2023-05-03', 2),
(1003, 2, 102, '2023-05-05', 1),
(1004, 3, 104, '2023-06-01', 1),
(1005, 3, 101, '2023-06-10', 1),
(1006, 4, 105, '2023-06-15', 2),
(1007, 1, 102, '2023-07-01', 1);


select * from customers
select 
Product_id,
product_name,
category,
avg(price) as average_price
from Products
group by 
PRODUCT_ID, 
product_name,
category,
HAVINIG avg(price) > 10000;

SELECT 
    product_id,
    product_name,
    category,
    AVG(price) AS average_price
FROM products
GROUP BY 
    product_id,
    product_name,
    category
HAVING AVG(price) > 10000;
