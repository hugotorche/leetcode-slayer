# Write your MySQL query statement below
with employee_rn as (
    select
        id,
        name,
        salary,
        departmentid,
        dense_rank() over (partition by departmentid order by salary desc) as rn
    from employee
)

select
    dep.name as department,
    emp.name as employee,
    emp.salary as salary
from employee_rn as emp
inner join department as dep
    on emp.departmentid = dep.id
where emp.rn < 4;
