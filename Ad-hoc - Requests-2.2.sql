-- Can we see some kind of monthly seasonality in terms of the no. of orders being placed?
 
 select * from 
 (
 select extract(YEAR FROM order_purchase_timestamp) AS year,
 extract(month from order_purchase_timestamp) as month , 
 order_id from `EcommerceDb.fact_orders`) as s
pivot( 
  count(distinct order_id)
  for year in (2016,2017,2018)
 )
 order by month;