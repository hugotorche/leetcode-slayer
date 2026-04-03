# Write your MySQL query statement below
with friend_union as (
    select requester_id as id
    from requestaccepted
    union all
    select accepter_id as id
    from requestaccepted
)

select
    id,
    count(*) as num
from friend_union
group by 1
order by num desc
limit 1;
