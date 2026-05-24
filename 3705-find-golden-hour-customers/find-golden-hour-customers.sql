# Write your MySQL query statement below
select
    customer_id,
    count(order_id) as total_orders,
    round(
        count(
            case
                when time(order_timestamp) between '11:00:00' and '14:00:00'
                or time(order_timestamp) between '18:00:00' and '21:00:00'
            then order_id end
        ) / count(order_id) * 100,
        0
    ) as peak_hour_percentage,
    round(avg(order_rating), 2) as average_rating
from restaurant_orders
group by customer_id
having
    total_orders >= 3
    and peak_hour_percentage >= 60
    and average_rating >= 4
    and count(case when order_rating is not null then order_id end) / count(order_id) >= 0.5
order by average_rating desc, customer_id desc;
