# Write your MySQL query statement below
select customer_id
from customer
group by 1
having count(distinct product_key) = (select count(*) from product);
