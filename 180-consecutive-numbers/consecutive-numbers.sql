# Write your MySQL query statement below
with logs_previous_next as (
    select
        id,
        num,
        lag(num) over (order by id) as previous_num,
        lead(num) over (order by id) as next_num
    from logs
)

select distinct num as consecutivenums
from logs_previous_next
where
    previous_num = num
    and num = next_num;
