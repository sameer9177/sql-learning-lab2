--Show only customer_name and country from the customers table.
select customer_name,country
from customers

---Find all customers who are from India.
select *from customers
where country = 'india';

 --List customers who signed up after 1st March 2023.
select * from customers
where signup_date > '2023-3-1';

---Display all products whose price is greater than 5,000.
select * from products
where price > '5000';

---Find products that belong to the Electronics category.
select * from products
where  category like 'Electronics';

---Show all orders placed on or after 1st June 2023.
select * from orders
where order_date > '2023-06-01';

--Display orders where quantity is more than 1.
select * from orders
where quantity > '1';

--Show all products sorted by price in descending order.
select * from  products
  order by price desc

--Show the top 3 most expensive products.
select top 3 *  from products
order by price desc

--List customers ordered by signup_date (oldest first).
  
  select * from customers
 order by signup_date asc

-- Display the latest 3 orders based on order_date.
select top 3 * from orders
order by order_date desc

--Show all unique countries from the customers table.
select distinct country  from customers

--Show all unique product categories from the products table.
select distinct category from products

--Find products priced between 2,000 and 10,000.
select * from products
where price > '2000'  and price  < '10000';

--Show customers who are from India OR USA.
  select * from customers
  where country in ('india','USA')

  --Display orders where product_id is 101 OR 102.
  select * from orders 
  where product_id in ('101','102')

  --Find customers who signed up in January 2023.
  select * from customers
  where signup_date <= '2023-01-31'
  
  select top 2 * from customers
  order by signup_date  asc

  --Find all orders placed by customer_id = 1.
  select * from orders
  where customer_id = '1'

 --- Display products that are NOT in the Accessories category.
 select * from products
 where category ! = 'Accessories' 