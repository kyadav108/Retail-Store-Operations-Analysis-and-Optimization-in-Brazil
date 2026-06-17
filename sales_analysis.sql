-- Order Sale Over The Years

select year , 
count(order_id) as order_count
from 
(select extract(year from order_purchase_timestamp) `year`, order_id 
from `Target.orders`)t
group by 1
order by 1;

-- Sale growth over the years

with order_per_year as
(select year , 
count(order_id) as order_count
from 
(select extract(year from order_purchase_timestamp) `year`, order_id 
from `Target.orders`)t
group by 1
order by 1
)
select year, order_count,
lag(order_count) over (order by year) as prev_order_count,
round(100*(order_count - lag(order_count) over (order by year))/lag(order_count) over (order by year),2) as growth_percent
from order_per_year
;

-- Seasonality
with order_per_month as
(select extract(year from order_purchase_timestamp) `year`,
extract(month from order_purchase_timestamp) `month`,
count(order_id) as order_count
from `Target.orders`
group by 1,2
order by 1,2
)
select month,
sum(case when year=2016 then order_count else 0 end) as y_2016,
sum(case when year=2017 then order_count else 0 end) as y_2017,
sum(case when year=2018 then order_count else 0 end) as y_2018
from order_per_month
group by 1
order by 1;


-- Year-Over-Year Order Trends Across States
Create View `ecommerce-406417`.`Target`.`order_details` as
select c.customer_state,
extract(year from o.order_purchase_timestamp) as `year`,
extract(month from o.order_purchase_timestamp) as `month`,
count(o.customer_id) as `order_count`
from `Target.orders` o inner join `Target.customers` c
on o.customer_id=c.customer_id
group by c.customer_state,year,month
order by year,month
;

select customer_state,
sum(case when year=2016 then order_count else 0 end) as y_2016,
sum(case when year=2017 then order_count else 0 end) as y_2017,
sum(case when year=2018 then order_count else 0 end) as y_2018
from `Target.order_details`
group by customer_state
order by 2 desc,3,4
;