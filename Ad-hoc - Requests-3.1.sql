-- Evolution of E-commerce orders in the Brazil region:

-- 3.1 Get the month on month no. of orders placed in each state.

select c.customer_state,extract(month from order_purchase_timestamp) as month,count(distinct order_id) as total_orders 
from `EcommerceDb.fact_orders` o
join `EcommerceDb.dim_customers` c on
c.customer_id =o.customer_id
group by c.customer_state,month
order by c.customer_state,month;


