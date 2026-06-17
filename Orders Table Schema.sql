--Orders Table Schema
select COLUMN_NAME, DATA_TYPE
from ecommerce-406417.Target.INFORMATION_SCHEMA.COLUMNS
where table_name = 'orders'


-- The time range between the orders were place 

select min(order_purchase_timestamp) as first_order,
       max(order_purchase_timestamp) as last_order
from `Target.orders`

