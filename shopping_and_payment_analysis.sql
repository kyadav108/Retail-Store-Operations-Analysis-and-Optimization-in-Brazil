-- Customer Shopping behaviour 

with `cte` as
(
    select order_time,
            count(order_id) as `order_count`
from
(select 
    order_id,
    extract(year from order_purchase_timestamp) as `year`,
    extract(month from order_purchase_timestamp) as `month`,
    case when extract(time from order_purchase_timestamp) between ("00:00:00") and ("06:59:59") then "Dawn"
        when extract(time from order_purchase_timestamp) between ("07:00:00") and ("12:59:59") then "Morning"
        when extract(time from order_purchase_timestamp) between ("13:00:00") and ("18:59:59") then "aftenon"
        when extract(time from order_purchase_timestamp) between ("19:00:00") and ("23:59:59") then "night"
    end as `order_time`
from Target.orders)
group by order_time
order by order_time
)
select order_time,order_count
from cte
order by order_count desc
;

-- Diifferent payment_methods used by customers

--select distinct payment_type from `Target.payments`;

select extract(month from order_purchase_timestamp) as `month`,
        count(case when payment_Type='credit_card' then o.order_id else null end) as `credit_card`,
        count(case when payment_Type='debit_card' then o.order_id else null end) as `debit_card`,
        count(case when payment_Type='voucher' then o.order_id else null end) as `voucher`,
        count(case when payment_Type='UPI' then o.order_id else null end) as `UPI`,
        count(case when payment_Type !='credit_card' and payment_Type!='debit_card' and payment_Type!='voucher' and payment_Type!='UPI' then o.order_id else null end) as `not_defined`
from  `Target.payments` p full join `Target.orders` o
        on p.order_id=o.order_id
group by month
order by month;

-- The distribution of payment installments

select p.payment_installments , 
        count(o.order_id) order_count,
        round(count(o.order_id)*100/sum(count(o.order_id)) over(),2) as inst_percentage
from `Target.orders` o inner join `Target.payments` p 
    on o.order_id= p.order_id
group by 1
order by 2 desc;
