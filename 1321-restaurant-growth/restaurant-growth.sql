# Write your MySQL query statement below
with moving_amount as (
    select
        visited_on,
        (
            select count(distinct visited_on)
            from customer AS c2 
            where c2.visited_on between date_sub(c1.visited_on, interval 6 day) and c1.visited_on
        ) as nb_dates,
        (
            select sum(amount)
            from customer AS c2 
            where c2.visited_on between date_sub(c1.visited_on, interval 6 day) and c1.visited_on
        ) as amount
    from customer as c1
)

select
    visited_on,
    amount,
    round(amount / 7, 2) as average_amount
from moving_amount
where nb_dates >= 7
group by 1
order by 1;
