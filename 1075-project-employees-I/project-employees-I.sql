# Write your MySQL query statement below
select
    pro.project_id,
    round(avg(emp.experience_years), 2) as average_years
from project as pro
inner join employee as emp
    on pro.employee_id = emp.employee_id
group by 1;
