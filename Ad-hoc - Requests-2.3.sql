-- 2.3 During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night)


select 
 case 
 when extract(hour from order_purchase_timestamp) <= 6 then "Dawn"
 when extract(hour from order_purchase_timestamp) <= 12 then "Morning"
 when extract(hour from order_purchase_timestamp) <= 18 then "evening"
 else "night"
 end as Order_time_period,
 count(distinct order_id) as total_orders,
 round(count(distinct order_id) * 100.0 /
        (select count(distinct order_id) from `EcommerceDb.fact_orders`), 2) as  order_share_pct
  from `EcommerceDb.fact_orders`
  group by Order_time_period
  order by total_orders Desc ;