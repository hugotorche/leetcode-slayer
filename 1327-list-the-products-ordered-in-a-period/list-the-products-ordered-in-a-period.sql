# Write your MySQL query statement below
select
    p.product_name,
    sum(o.unit) as unit
from orders as o
inner join products as p
    on o.product_id = p.product_id
where o.order_date like '2020-02%'
group by 1
having unit >= 100;
