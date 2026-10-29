-- Import the dataset and do usual exploratory analysis steps like checking the structure & characteristics of the dataset:


-- 1.1 Data type of all columns in the "customers" table.

-- Please verfiy all datatypes and inconsistency in data 

-- 1.2 Get the time range between which the orders were placed.


select min(order_purchase_timestamp) as startime_period,max(order_purchase_timestamp) end_time_period from `EcommerceDb.fact_orders`;

-- 1.3 Count the Cities & States of customers who ordered during the given period.

select 
count(distinct customer_city) as city,
count(distinct customer_state) as sate
from `EcommerceDb.fact_orders` o join
`EcommerceDb.dim_customers` c on
c.customer_id =o.customer_id;