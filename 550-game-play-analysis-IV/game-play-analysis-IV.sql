# Write your MySQL query statement below
with first_login as (
    select
        player_id,
        min(event_date) as first_login
    from activity
    group by 1
),

second_login as (
    select
        fl.player_id,
        fl.first_login,
        act.event_date as second_login
    from first_login as fl
    left join activity as act
        on
            fl.player_id = act.player_id
            and date_add(fl.first_login, interval 1 day) = act.event_date
)

select
    round(
        count(distinct case when second_login is not null then player_id end) / count(distinct player_id),
        2
    ) as fraction
from second_login;
