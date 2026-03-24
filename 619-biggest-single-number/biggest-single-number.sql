# Write your MySQL query statement below
select max(num) as num
from (
    select num, count(*)
    from mynumbers
    group by 1
    having count(*) = 1
) as single_numbers;
