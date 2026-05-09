# Write your MySQL query statement below
with total_users as (
    select count(*) as nb_users
    from users
)

select
    re.contest_id,
    round(
        (count(re.user_id) / tu.nb_users) * 100,
        2
    ) as percentage
from register as re
left join total_users as tu
    on true
group by 1
order by percentage desc, re.contest_id;
