# Write your MySQL query statement below
select
    vis.customer_id,
    count(case when tra.transaction_id is null then vis.visit_id end) as count_no_trans
from visits as vis
left join transactions as tra
    on vis.visit_id = tra.visit_id
group by 1
having count_no_trans > 0;
