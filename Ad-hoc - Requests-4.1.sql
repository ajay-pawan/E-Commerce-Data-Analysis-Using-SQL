 -- Impact on Economy: Analyze the money movement by e-commerce by looking at order prices, freight and others.
 
-- 4.1 Get the % increase in the cost of orders from year 2017 to 2018 (include months between Jan to Aug only) You can use the "payment_value" column in the payments table to get the cost of orders

with cte1 as (
select extract(year from order_purchase_timestamp) as year ,
extract(month from order_purchase_timestamp)  as month,
round(sum(payment_value),2) as total_payment
 from `EcommerceDb.fact_orders` o
 join
  `EcommerceDb.dim_payments` p
  on o.order_id =p.order_id
  group by year,month
  order by year,month),
  cte2 as (
  select year,month,total_payment as payment_2017
  from cte1
  where year =2017 and month between 1 and 8),
   cte3 as (
  select year,month,total_payment as payment_2018
  from cte1
  where year =2018 and month between 1 and 8)
    select c2.month,payment_2017,payment_2018,round(((payment_2018 - payment_2017)/payment_2017)*100,2) as percentage_growth_17_vs_18
    from cte2 c2 join cte3 c3 on c2.month =c3.month
    order by month;

  
  





