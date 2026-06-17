--Number of unique customers 

select count(distinct customer_unique_id) as coustomer_count
from `Target.customers`;

--Total States and Cities

select count(distinct customer_state),count(distinct customer_city)
from `Target.customers`

--Top States by Number of Customers

select  customer_state, count(customer_unique_id) as customer_count
from `Target.customers`
group by 1
order by 2 desc;

-- Top cities by Number of Customers

select   customer_city, count(customer_unique_id) as customer_count
from `Target.customers`
group by 1
order by 2 desc;