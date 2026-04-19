# Write your MySQL query statement below
select
    uni.unique_id,
    emp.name
from employees as emp
left join employeeuni as uni
    on emp.id = uni.id;
