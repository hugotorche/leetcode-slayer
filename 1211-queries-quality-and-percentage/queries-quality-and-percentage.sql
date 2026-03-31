# Write your MySQL query statement below
select
    query_name,
    round(avg(rating/position), 2) as quality,
    round(
        (count(case when rating < 3 then query_name end) / count(query_name)) * 100,
        2
    ) as poor_query_percentage
from queries
group by 1;
