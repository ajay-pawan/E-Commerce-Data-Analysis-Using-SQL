-- In-depth Exploration:


-- 2.1 Is there a growing trend in the no. of orders placed over the past years?

 with yearly_orders as (select extract(YEAR from order_purchase_timestamp) as year , count(distinct order_id) as total_orders from `EcommerceDb.fact_orders`
 group by year
 order by year)
 select year,total_orders,lag(total_orders) over ( order by year) as pervious_year_orders,round((total_orders -
 lag(total_orders) over ( order by year))/nullif( lag(total_orders) over ( order by year),0)*100,2) as yoy_growth,
 from yearly_orders;



