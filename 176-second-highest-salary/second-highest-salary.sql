# Write your MySQL query statement below
with employee_rn as (
    select
        id,
        salary,
        dense_rank() over (order by salary desc) as rn
    from employee
)

select
    max(case when rn = 2 then salary end) as "SecondHighestSalary"
from employee_rn;
