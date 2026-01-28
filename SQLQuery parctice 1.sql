---Find the total number of customers.
select count(customer_id) as number_of_customer
from customers

--Find the total number of orders.
select  count(order_id) as total_orders
from orders

---Find the total quantity of products sold.
select sum(quantity)  as total_quantity from orders


--Find the maximum product price.

select max(price) as maximum_product_price
from products
select * from products

--Find the average product price.

select avg(price) as maximum_product_price
from products

--Find the total number of orders per customer.

select customer_id,
count(order_id) as total_orders
from orders
group by customer_id


--Find the total quantity ordered per product.
select * from orders

select product_id,
count(quantity) as total_quantity
from orders
group by product_id

--Find the number of products in each category.
select category,
select * from products

select 
min(order_date) AS earliest_order_date,
max(order_date) as latest_order_date
from orders

--Find the total revenue per product

select p.product_id,p.product_name,p.category,
sum(o.quantity * p.price) as total_revenue
from products p
join orders o
on o.product_id=p.product_id
group by 
  p.product_id,
p.product_name,
p.category;

--Find the total revenue per customer.
select * from orders
select * from products

select p.customer_id,
sum(p.quantity*o.price) as  total_revenue
from orders p
join products o
on p.product_id=o.product_id
group by customer_id

--Find the total revenue per category.
select p.category,
sum(o.quantity*p.price ) as total_revenue_per_category
from products p
join orders o
on p.product_id=o.product_id
group by category

--Find the average order quantity per customer.

select customer_id,
avg(quantity) as avg_quantity_per_customer
from orders
group by customer_id

--Find customers who have placed more than 1 order.
select customer_id,
count(order_id) as total_orders
from orders
group by customer_id
having count(order_id) > 1;

---Find products with total quantity sold greater than 1.

select product_id,quantity as total_quantity_sold
from orders 
where quantity >1;

SELECT product_id,
SUM(quantity) AS total_quantity_sold
FROM orders
GROUP BY product_id
HAVING SUM(quantity) > 1;

--Find categories where average product price is greater than 10,000.
select Product_id,product_name,category,
avg(price) as average_price
from Products
group by 
product_id,product_name,category
having avg(price) > 10000;

--Find customers whose total spending is more than 50,000.
select * from products
select* from orders
--
select 
o.customer_id,o.order_id,p.category,
sum(o.quantity*p.price) as total_spending
from orders o
join products p
on o.product_id=p.product_id
group by o.customer_id,o.order_id,p.category
having sum(o.quantity*p.price) >50000;


--Which product generated the highest revenue?
select top 1
p.product_id,
p.category,
p.product_name,
sum(o.quantity*p.price) as total_revenue
from orders o
join products p
on o.product_id=p.product_id
group by p.product_id,p.category,p.product_name
order by total_revenue desc;


SELECT p.product_id,p.product_name,p.category,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_id,p.product_name,p.category
HAVING SUM(o.quantity * p.price) = (
    SELECT MAX(total_rev)
    FROM (
        SELECT SUM(o.quantity * p.price) AS total_rev
        FROM orders o
        JOIN products p
            ON o.product_id = p.product_id
        GROUP BY p.product_id
    ) t
);






