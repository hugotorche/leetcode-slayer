# Write your MySQL query statement below
with customers as (
    select
        user_id,
        count(
            case when event_type = 'downgrade' then event_id end
        ) over (partition by user_id) as nb_downgrade,
        count(
            case when event_type = 'cancel' then event_id end
        ) over (partition by user_id) as nb_cancel,
        max(monthly_amount) over (partition by user_id) as max_historical_amount,
        event_date,
        plan_name,
        monthly_amount,
        row_number() over (partition by user_id order by event_date desc) as rn
    from subscription_events
)

select
    user_id,
    max(case when rn = 1 then plan_name end) as current_plan,
    max(case when rn = 1 then monthly_amount end) as current_monthly_amount,
    max_historical_amount,
    datediff(max(event_date), min(event_date)) as days_as_subscriber
from customers
where
    nb_cancel = 0
    and nb_downgrade > 0
group by user_id, max_historical_amount
having
    days_as_subscriber >= 60
    and current_monthly_amount < 0.5 * max_historical_amount
order by days_as_subscriber desc, user_id;
