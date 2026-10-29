-- Analysis based on sales, freight and delivery time.

-- 5.1 Find the no. of days taken to deliver each order from the order’s purchase date as delivery time. Also, calculate the difference (in days) between the estimated & actual delivery date of an order. Do this in a single query.

select distinct order_id,order_purchase_timestamp,order_delivered_customer_date,order_estimated_delivery_date ,date_diff(extract(date from order_delivered_customer_date),extract(date from order_purchase_timestamp),day) as time_to_deliver,date_diff(extract(date from order_estimated_delivery_date),extract(date from order_delivered_customer_date),day) as
diff_delivery_date
 from `EcommerceDb.fact_orders`;




