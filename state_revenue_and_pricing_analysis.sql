-- Revenue Growth Over Year 

with order_amount as
(
   select  extract(year from o.order_purchase_timestamp) order_year,
           extract(month from o.order_purchase_timestamp) order_month,
           round(sum(p.payment_value),2) as order_value
from `Target.orders` o inner join `Target.payments` p
      on o.order_id = p.order_id
group by 1,2
order by 1,2
),
per_year_order_amount as
(
  select order_month, 
      sum(case when order_year=2017 then order_value else 0 end) as order_value_17,
      sum(case when order_year=2018 then order_value else 0 end) as order_value_18
  from order_amount
  where order_month between 0 and 8
  group by 1
  order by 1
)
select order_month,
       order_value_17, 
       order_value_18, 
       round(((order_value_18 - order_value_17)/order_value_17)*100,2) as order_value_growth_percentage
from per_year_order_amount

-- Total and Average Revenue Across States

-- top 10 state
select c.customer_state, 
      round(sum(pm.payment_value),2) as total_revenue,
      round(avg(pm.payment_value),2) as avg_revenue
from `Target.orders` o inner join `Target.customers` c
      on o.customer_id= c.customer_id
      inner join `Target.payments` pm
      on o.order_id= pm.order_id
group by 1
order by 2 desc
limit 10
;

-- lowest 10 States
select c.customer_state, 
      round(sum(pm.payment_value),2) as total_revenue,
      round(avg(pm.payment_value),2) as avg_revenue
from `Target.orders` o inner join `Target.customers` c
      on o.customer_id= c.customer_id
      inner join `Target.payments` pm
      on o.order_id= pm.order_id
group by 1
order by 2 asc
limit 10;

-- Total & Average Order Price Acros States
select c.customer_state,
      round(sum(price),2) as `total_order_price`,
      round(avg(price),2) as `avg_order_price`
from `Target.orders` o inner join `Target.customers` c
      on o.customer_id=c.customer_id
      inner join `Target.order_items` oi
      on o.order_id=oi.order_id
group by c.customer_state
order by c.customer_state;

--Total & Average Freight Charges Across States
select c.customer_state,
      round(sum(freight_value),2) as `total_freight_value`,
      round(avg(freight_value),2) as `avg_freight_value`
from `Target.orders` o inner join `Target.customers` c
      on o.customer_id=c.customer_id
      inner join `Target.order_items` oi
      on o.order_id=oi.order_id
group by c.customer_state
order by c.customer_state
;