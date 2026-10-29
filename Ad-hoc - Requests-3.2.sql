-- 3.2 How are the customers distributed across all the states?

select customer_state,count(distinct customer_id) as total_customers,round(count(distinct customer_id)/(select count(distinct customer_id) from `EcommerceDb.dim_customers`)*100,2) as customer_percentage from `EcommerceDb.dim_customers`
group by customer_state
order by total_customers desc;