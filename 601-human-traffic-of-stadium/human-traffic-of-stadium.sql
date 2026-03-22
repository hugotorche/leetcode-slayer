# Write your MySQL query statement below
with stadium_ids as (
    select
        id,
        lag(id) over (order by visit_date) as previous_id,
        lead(id) over (order by visit_date) as next_id
    from stadium
    where people > 99
),

consecutive_ids as (
    select
        previous_id,
        id,
        next_id
    from stadium_ids
    where
        id = previous_id + 1
        and id = next_id - 1
),

consecutive_ids_all as (
    select previous_id as id
    from consecutive_ids
    union
    select id
    from consecutive_ids
    union
    select next_id as id
    from consecutive_ids
)

select
    id,
    visit_date,
    people
from stadium
where id in (select id from consecutive_ids_all)
order by visit_date;
