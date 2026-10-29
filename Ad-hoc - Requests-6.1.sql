-- Find the month on month no. of orders placed using different payment types.

-- 6.1 select distinct payment_type from `EcommerceDb.dim_payments`;

select * from 
 (
 select extract(month from order_purchase_timestamp) as month ,p.payment_type,p.order_id
 from `EcommerceDb.fact_orders` o
 join `EcommerceDb.dim_payments` p on
 p.order_id =o.order_id) as s
pivot( 
  count(distinct order_id)
  for payment_type in ("credit_card","voucher","debit_card","UPI","not_defined")
 )
 order by month;




