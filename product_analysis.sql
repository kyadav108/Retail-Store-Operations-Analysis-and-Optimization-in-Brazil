-- Top-performing product categories 

select p.product_category, 
        count(o.order_id) as order_count, 
        round(sum(payment_value),2) as order_value
from `Target.orders` o inner join `Target.payments` pm
        on o.order_id= pm.order_id
        inner join `Target.order_items` oi
        on o.order_id= oi.order_id
        inner join `Target.products` p
        on oi.product_id= p.product_id
group by 1
 order by 2 desc
limit 10;

-- Most reviewed Products

select
    p.product_category,
    count(r.review_id) as total_reviews
from `Target.order_reviews` r inner join `Target.orders` o
        on r.order_id = o.order_id
        inner join `Target.order_items` oi
        on o.order_id = oi.order_id
        inner join `Target.products` p
        on oi.product_id = p.product_id
group by p.product_category
order by total_reviews desc
limit 10;