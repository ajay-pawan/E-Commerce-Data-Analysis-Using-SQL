
-- 5.3 Find out the top 5 states with the highest & lowest average delivery time.

select c.customer_state, round(avg(date_diff(extract(date from order_delivered_customer_date),extract(date from order_purchase_timestamp),day)),0) as time_to_deliver,count(distinct o.order_id) AS delivered_orders
 from `EcommerceDb.fact_orders` o
  join `EcommerceDb.dim_customers` c
 on c.customer_id =o.customer_id
 group by c.customer_state
 order by time_to_deliver desc
 limit 5;
 

 select c.customer_state,round(avg(date_diff(extract(date from order_delivered_customer_date),extract(date from order_purchase_timestamp),day)),0) as time_to_deliver,count(distinct o.order_id) AS delivered_orders
 from `EcommerceDb.fact_orders` o
  join `EcommerceDb.dim_customers` c
 on c.customer_id =o.customer_id
 group by c.customer_state
 order by time_to_deliver asc
 limit 5;