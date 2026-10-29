-- 4.2 Calculate the Total & Average value of order price for each state.

select c.customer_state as state,round(sum(i.price),2) as total_price,round(avg(i.price),2) as avg_price from
 `EcommerceDb.fact_order_items` i join
 `EcommerceDb.fact_orders` o on
 i.order_id = o.order_id 
 join `EcommerceDb.dim_customers` c
 on c.customer_id =o.customer_id
 group by c.customer_state;