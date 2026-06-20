# Write your MySQL query statement below
with emp as (
    select
        employee_id,
        department_id,
        primary_flag,
        count(*) over (partition by employee_id) as nb_departments
    from employee
)

select
    employee_id,
    department_id
from emp
where
    primary_flag = 'Y'
    or nb_departments = 1;
