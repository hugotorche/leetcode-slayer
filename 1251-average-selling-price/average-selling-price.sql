# Write your MySQL query statement below
select
    p.product_id,
    coalesce(
        round(
            sum(us.units * p.price) / sum(us.units),
            2
        ),
        0
     ) as average_price
from prices as p
left join unitssold as us
    on us.product_id = p.product_id
    and us.purchase_date between p.start_date and p.end_date
group by 1;
