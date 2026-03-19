# Write your MySQL query statement below
select
    emp.name as employee
from employee as emp
left join employee as man
    on emp.managerid = man.id
where
    emp.salary > man.salary;
