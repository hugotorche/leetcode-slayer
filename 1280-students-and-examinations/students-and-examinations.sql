# Write your MySQL query statement below
select
    stu.student_id,
    stu.student_name,
    sub.subject_name,
    count(exa.student_id) as attended_exams
from students as stu
left join subjects as sub
    on true
left join examinations as exa
    on stu.student_id = exa.student_id
    and sub.subject_name = exa.subject_name
where sub.subject_name is not null
group by 1,2,3
order by 1,3;
