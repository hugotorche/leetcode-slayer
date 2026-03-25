# Write your MySQL query statement below
select
    u.name,
    sum(coalesce(distance, 0)) as travelled_distance
from rides as r
right join users as u
    on r.user_id = u.id
group by u.id, u.name
order by travelled_distance desc, u.name;
