# Write your MySQL query statement below
select
    sig.user_id,
    coalesce(
        round(
            sum(case when con.action = 'confirmed' then 1 end) / count(*),
            2
        ),
        0
     ) as confirmation_rate
from signups as sig
left join confirmations as con
    on sig.user_id = con.user_id
group by 1;
