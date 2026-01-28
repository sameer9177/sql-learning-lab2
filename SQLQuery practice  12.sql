--Show all orders with order_id, order_date, customer_name, product_name, price, quantity

select
c.customer_name,
o.order_id,
o.order_date,
p.product_name,
p.price,
o.quantity
from customers c
join orders o
on c.customer_id=o.customer_id
join products p
on o.product_id=p.product_id
select * from orders

--Show total revenue for each order 
select 
o.order_id,
o.customer_id,
sum(o.quantity*p.price) as total_revenue_per_orders
from orders o
join products p
on o.product_id=p.product_id
group by o.order_id,
o.customer_id;

--Show customer name and product name for every order.

select * from products
select * from customers
select * from orders

select 
p.product_name,
c.customer_name
from products p
join orders o
on p.product_id=o.product_id
join customers c
on c.customer_id=o.customer_id

--Show all orders placed by customers from India.
select 
customer_name,country
from customers
where country = 'india'

select
c.customer_name,
c.country,
o.order_id
from orders o
join customers c
on c.customer_id=o.customer_id
where c.country = 'india';

--Find total revenue per customer
select 
o.customer_id,
sum(o.quantity*p.price) as total_revenue_per_customer
from products p
join orders o
on p.product_id=o.product_id
group by 
o.customer_id;


--Find total quantity purchased per product

select 
p.product_name,
sum(o.quantity) as total_quantity
from products p
join orders o
on p.product_id=o.product_id
group by product_name

--Find total revenue per product category.
  select
  p.category,
  sum(p.price * o.quantity) as total_revenue_per_product_category
  from products p
  join orders o
  on p.product_id=o.product_id
  group by p.category;

  --Find number of orders per country.
select 
c.country,
count(order_id) as numbers_of_order_per_country
from customers c
join orders o
on c.customer_id=o.customer_id
group by 
c.country;

--Find customers who have never placed an order.

select 
o.order_id,
c.customer_id,
c.customer_name
from customers c
left join orders o 
on c.customer_id=o.customer_id
where o.order_id is null;


--Show all customers and their total number of orders
select 
o.order_id,
c.customer_id,
c.customer_name
from customers c
left join orders o 
on c.customer_id=o.customer_id

--Find the highest spending customer.

select 
c.customer_id,
c.customer_name,
sum(o.quantity * p.price) as highest_spending_customer
from customers  c
join orders o
on o.customer_id=c.customer_id
join products p
on p.product_id=o.product_id
group by c.customer_id,
c.customer_name
order by  
highest_spending_customer desc;
 --Find the most sold product (by quantity).

 select 
 p.product_name,
 sum(o.quantity) as most_sold_product
 from products p
 join orders o
 on p.product_id=o.product_id
 group by  p.product_name
 order by most_sold_product desc

 --Find the product category that generated the highest revenue. 
 select 
 p.category,
 sum(p.price*o.quantity) as highest_revenue
 from products p
 join orders o
 on p.product_id=o.product_id
 group by  
 p.category 
 order by highest_revenue desc;