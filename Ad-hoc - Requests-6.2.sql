-- 6.2  Find the no. of orders placed on the basis of the payment installments that have been paid.

 select payment_installments,count(distinct order_id) as total_orders from `EcommerceDb.dim_payments`
 group by payment_installments
 order by total_orders desc;