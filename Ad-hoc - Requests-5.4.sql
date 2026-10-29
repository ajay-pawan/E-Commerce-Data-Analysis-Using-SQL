-- 5.4 Find out the top 5 states where the order delivery is really fast as compared to the estimated date of delivery. You can use the difference between the averages of actual & estimated delivery date to figure out how fast the delivery was for each state.

select c.customer_state,round(avg(date_diff(extract(date from order_estimated_delivery_date),extract(date from order_delivered_customer_date),day)),0) as
avg_diff_delivery_date,count(distinct o.order_id) AS delivered_orders
 from `EcommerceDb.fact_orders` o
 join `EcommerceDb.dim_customers` c
 on c.customer_id =o.customer_id
 group by c.customer_state
 order by avg_diff_delivery_date desc
 limit 5;
