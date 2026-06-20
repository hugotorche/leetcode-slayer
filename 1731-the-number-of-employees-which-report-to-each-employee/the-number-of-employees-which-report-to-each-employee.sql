# Write your MySQL query statement below
select
    man.employee_id,
    man.name,
    count(*) as reports_count,
    round(avg(emp.age), 0) as average_age
from employees as man
left join employees as emp
    on man.employee_id = emp.reports_to
group by 1, 2
having reports_count > 0
and average_age is not null
order by man.employee_id;
