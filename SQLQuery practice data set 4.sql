select top 1
p.product_id,
p.category,
p.product_name,
sum(o.quantity*p.price) as total_revenue
from orders o
join products p
on o.product_id=p.product_id
group by 
p.product_id,
p.category,
p.product_name
order by total_revenue desc;




