-- 4.3 Calculate the Total & Average value of order freight for each state.

select c.customer_state as state,round(sum(i.freight_value),2) as total_freight,round(avg(i.freight_value),2) as avg_freight from
 `EcommerceDb.fact_order_items` i join
 `EcommerceDb.fact_orders` o on
 i.order_id = o.order_id 
 join `EcommerceDb.dim_customers` c
 on c.customer_id =o.customer_id
 group by c.customer_state
 order by total_freight desc;