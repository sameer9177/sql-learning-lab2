--– CASE WHEN with AGGREGATES (Intermediate)--Categorize customers based on total spending--High Spender → > 50,000--Medium Spender → 20,000 – 50,000 --Low Spender → < 20,000

select c.customer_id,
c.customer_name,
sum(o.quantity*p.price) as total_spending,
case
when sum(o.quantity*p.price) > 50000 then 'high spender'
when  sum(o.quantity*p.price) between  20000  and 50000 then 'medium spender' 
when sum(o.quantity*p.price) < 20000 then 'low_spender'
end as customer_type
from  customers c 
 join orders o 
on c.customer_id=o.customer_id
join products p
on o.product_id=p.product_id
group by c.customer_id,c.customer_name;


---Classify products based on total quantity sold:--Best Seller → > 2 units---Average Seller → 1-2 units---Low Seller → < 0 units

select 
p.product_name,p.category,o.quantity,
case 
when quantity >= 2 then 'best seller'
when quantity  = 1  then 'average_seller'
else 'low_seller' 
end as product_performance
from products p
join orders o
on p.product_id=o.product_id;

--Create a column discount_eligibility:Eligible → total customer spending > average spending--Not Eligible → otherwise
select c.customer_id,
c.customer_name,
sum(o.quantity*p.price) as total_spending,
case
when sum(o.quantity*p.price) > 50000 then 'high spender'
when  sum(o.quantity*p.price) between  20000  and 50000 then 'medium spender' 
when sum(o.quantity*p.price) < 20000 then 'low_spender'
end as customer_type,
case 
when sum(o.quantity*p.price) > 500000 then 'eligible'
when sum(o.quantity*p.price) between  20000 and 50000 then 'eligible'
else 'not_eligible' end as discount_eligibility
from  customers c 
 join orders o 
on c.customer_id=o.customer_id
join products p
on o.product_id=p.product_id
group by c.customer_id,c.customer_name;

--Premium → High Spender + Frequent Buyer--Regular → Medium Spender--Basic → Low Spender
select 
c.customer_id,c.customer_name,
sum(o.quantity*p.price) as total_spender,
count(order_id) as total_order,
case 
when sum(o.quantity*p.price) >50000 and count(order_id)>5 then 'premium '
when  sum(o.quantity*p.price) between 20000 and 50000 then ' regular'
else 'besic' end as csutomer_tier
from customers c
join orders o
on c.customer_id=o.customer_id
join products p
on o.product_id = p.product_id
group by c.customer_id,c.customer_name;

--Classify customers based on last order date:--Active → ordered in last 30 days--Inactive → otherwise
select c.customer_id,c.customer_name,
max(o.order_date) as last_order_date,
case 
WHEN MAX(o.order_date) >= DATEADD(DAY, -30, GETDATE())
then 'active'
else 'inactive'
end as csutomer_status
from customers c
join orders o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

---Flag orders as:--Profit Order → revenue ≥ 20,000--Loss Order → revenue < 20,000
select c.customer_id,c.customer_name,
sum(o.quantity*p.price) as revenue,
case
when sum(o.quantity*p.price)>20000 then 'profit order'
when sum(o.quantity*p.price)<20000 then 'loss order'
end as order_status
from customers c
join orders o
on c.customer_id=o.customer_id
join products p
on o.product_id=p.product_id
group by c.customer_id,c.customer_name;