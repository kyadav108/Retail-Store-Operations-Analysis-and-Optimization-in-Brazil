-- The no. of days taken to deliver each order from the order’s purchase date  as delivery time.

select order_id,
        date_diff(order_estimated_delivery_date,order_delivered_customer_date,day) as `estimated_delivery_time`,
        date_diff(order_delivered_customer_date,order_purchase_timestamp,day) as `actual_deliver_time`
from `Target.orders`;

-- The top 5 states with the highest average delivery time and 5states with lowest delivery time

with `cte` as
(
  select customer_state,
  round(avg(date_diff(order_delivered_customer_date,order_purchase_timestamp,day))) as `avg_delivery_time`,
  dense_rank()over(order by avg(date_diff(order_delivered_customer_date,order_purchase_timestamp,day))desc) as `rnk_desc`,
  dense_rank()over(order by avg(date_diff(order_delivered_customer_date,order_purchase_timestamp,day))asc) as `rnk_asc`
from `Target.orders` o inner join `Target.customers` c
      on o.customer_id=c.customer_id
group by customer_state
)
select c1.rnk_desc,
      c1.customer_state,
      c1.avg_delivery_time as `higest_avg_delivery_time`,
      c2.customer_state,
      c2.avg_delivery_time as `lowest_avg_delivery_time`
from cte c1 inner join cte c2
    on c1.rnk_desc=c2.rnk_asc
where c1.rnk_desc<=5
order by c1.rnk_desc,c2.rnk_asc
;

-- The top 10 states where the order delivery is really fast as compared to  the estimated date of delivery.

with order_delivery_time as
(
  select customer_state,
          date_diff(order_delivered_customer_date,order_purchase_timestamp, day) as `actual_delivery_time`,
          date_diff(order_estimated_delivery_date,order_purchase_timestamp,day) as `estimated_delivery_time`
from `Target.orders` o inner join `Target.customers` c 
      on o.customer_id=c.customer_id
where order_status="delivered" 
)
select customer_state, round(avg(estimated_delivery_time),2) as `avg_estimated_delivery_time`,
        round(avg(estimated_delivery_time - actual_delivery_time),2) as `avg_actual_delivery_time`
from order_delivery_time
group by customer_state
order by `avg_actual_delivery_time` desc
limit 10
;
