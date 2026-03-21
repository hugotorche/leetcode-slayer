# Write your MySQL query statement below
with app_events_agg as (
    select
        session_id,
        user_id,
        timestampdiff(minute, min(event_timestamp), max(event_timestamp)) as session_duration_minutes,
        count(distinct case when event_type = 'scroll' then event_id end) as scroll_count,
        (
            count(distinct case when event_type = 'click' then event_id end) /
            count(distinct case when event_type = 'scroll' then event_id end)
        ) as click_to_scroll_ratio,
        count(distinct case when event_type = 'purchase' then event_id end) as purchase_count
    from app_events
    group by 1,2
)

select
    session_id,
    user_id,
    session_duration_minutes,
    scroll_count
from app_events_agg
where
    session_duration_minutes > 30
    and scroll_count >= 5
    and click_to_scroll_ratio < 0.2
    and purchase_count = 0
order by scroll_count desc, session_id;
