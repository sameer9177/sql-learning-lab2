--Find customers whose total revenue is greater than average customer revenue.
with customer_revenue as (
select
o.customer_id,
sum(o.quantity*p.price) as total_revenue
from orders o 
join products p
on o.product_id=p.product_id
group by o. customer_id
),
average_revenue as (
select avg(total_revenue) as avg_customer_revenue from customer_revenue 
)
select 
c.customer_id,cr.total_revenue
from customer_revenue cr
join average_revenue ar
on cr.total_revenue>ar.avg_customer_revenue
join customers c
on c.customer_id=cr.customer_id

---Find top 3 customers by total revenue.

with customer_revenue as (
select 
o.customer_id,
sum(o.quantity*p.price) as total_revenue
from orders o
join products p
on o.product_id=p.product_id
group by o.customer_id ),
ranked_customer as (
select customer_id,total_revenue,
dense_rank () over(order by total_revenue desc) as revenue_ranked
from customer_revenue )
select
customer_id,revenue_ranked
from ranked_customer
where revenue_ranked<=3;

---Find customers who placed more orders than the average number of orders.

with orders_per_customer as (
select 
o.customer_id,
c.customer_name,
count(order_id) as number_of_orders
from orders o
join customers c
on o.customer_id=c.customer_id
group by 
o.customer_id,
c.customer_name ),
avg_orders  as ( 
select 
avg(number_of_orders) as avg_order_count
from orders_per_customer 
)
select 
opc.customer_id,
opc.customer_name,
opc.number_of_orders
from orders_per_customer opc
cross join  avg_orders ao
where opc.number_of_orders > ao.avg_order_count;




