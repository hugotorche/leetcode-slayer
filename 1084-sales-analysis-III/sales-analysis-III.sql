# Write your MySQL query statement below
with not_2019_q1 as (
    select distinct p.product_id
    from sales as s
    inner join product as p
        on s.product_id = p.product_id
    where not s.sale_date between '2019-01-01' and '2019-03-31' 
)

select distinct p.product_id, p.product_name
from sales as s
inner join product as p
    on s.product_id = p.product_id
where
     s.sale_date between '2019-01-01' and '2019-03-31' 
     and p.product_id not in (select product_id from not_2019_q1);
