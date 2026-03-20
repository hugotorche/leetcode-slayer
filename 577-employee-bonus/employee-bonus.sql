# Write your MySQL query statement below
select emp.name, bon.bonus
from employee as emp
left join bonus as bon
    on emp.empid = bon.empid
where
    coalesce(bon.bonus, 0) < 1000;
