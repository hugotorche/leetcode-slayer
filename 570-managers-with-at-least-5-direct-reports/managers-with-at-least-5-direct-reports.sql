# Write your MySQL query statement below
with manager_reports as(
    select
        man.id,
        man.name,
        count(*) as direct_reports
    from employee man
    inner join employee emp
        on man.id = emp.managerid
    group by 1, 2
)

select name
from manager_reports
where direct_reports > 4;
