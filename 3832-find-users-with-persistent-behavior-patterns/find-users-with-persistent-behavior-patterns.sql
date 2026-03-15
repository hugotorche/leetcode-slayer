# Write your MySQL query statement below
select
    user_id,
    action,
    count(action_date) as streak_length,
    min(action_date) as start_date,
    max(action_date) as end_date
from activity
group by 1, 2
having streak_length > 4
order by streak_length desc;
