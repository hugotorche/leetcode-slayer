# Write your MySQL query statement below
select
    u.user_id as buyer_id,
    u.join_date,
    count(case when year(o.order_date) = 2019 then o.order_id end) as orders_in_2019
from users as u
left join orders as o
    on u.user_id = o.buyer_id
group by 1,2;
