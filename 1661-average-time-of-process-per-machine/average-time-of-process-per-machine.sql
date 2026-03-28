# Write your MySQL query statement below
select
    machine_id,
    round(avg(end_timestamp - start_timestamp), 3) as processing_time
from (
    select
        machine_id,
        process_id,
        min(case when activity_type = 'start' then timestamp end) as start_timestamp,
        min(case when activity_type = 'end' then timestamp end) as end_timestamp
    from activity
    group by 1,2
) as activity_timestamp
group by 1;
