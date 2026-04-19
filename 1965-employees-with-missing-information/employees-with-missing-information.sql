# Write your MySQL query statement below
select employee_id
from (
    select employee_id
    from employees
    where employee_id not in (select employee_id from salaries)
    union all
    select employee_id
    from salaries
    where employee_id not in (select employee_id from employees)
) as emp
order by employee_id;
