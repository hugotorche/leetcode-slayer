# Write your MySQL query statement below
select
    t1.id,
    min(
        case
            when t1.p_id is null then 'Root'
            when t2.p_id is null then 'Leaf'
            else 'Inner'
        end
    ) as type
from tree t1
left join tree t2
    on t1.id = t2.p_id
group by 1;
