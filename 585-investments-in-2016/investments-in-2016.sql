# Write your MySQL query statement below
with tiv_2015_dup as (
    select
        tiv_2015,
        count(distinct pid) as pid_nb
    from insurance
    group by 1
    having count(distinct pid) > 1
),

location_dup as (
    select
        concat(lat, ', ', lon) as location,
        count(*) as rows_nb
    from insurance
    group by 1
    having count(*) > 1
)

select
    round(sum(tiv_2016), 2) as tiv_2016
from insurance
where 
    tiv_2015 in (select tiv_2015 from tiv_2015_dup)
    and concat(lat, ', ', lon) not in (select location from location_dup);
