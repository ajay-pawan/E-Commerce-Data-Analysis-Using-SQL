-- 5.2 Find out the top 5 states with the highest & lowest average freight value.

select c.customer_state as state,round(avg(i.freight_value),2) as avg_freight from
 `EcommerceDb.fact_order_items` i join
 `EcommerceDb.fact_orders` o on
 i.order_id = o.order_id 
 join `EcommerceDb.dim_customers` c
 on c.customer_id =o.customer_id
 group by c.customer_state
 order by avg_freight desc
 limit 5;

select c.customer_state as state,round(avg(i.freight_value),2) as avg_freight from
 `EcommerceDb.fact_order_items` i join
 `EcommerceDb.fact_orders` o on
 i.order_id = o.order_id 
 join `EcommerceDb.dim_customers` c
 on c.customer_id =o.customer_id
 group by c.customer_state
 order by avg_freight
 limit 5;