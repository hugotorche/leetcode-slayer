# Write your MySQL query statement below
with top_students as (
    select
        user_id,
        count(*) as nb_courses,
        avg(course_rating) as avg_rating
    from course_completions
    group by 1
    having
        nb_courses >= 5
        and avg_rating >= 4
),

top_students_courses as (
    select
        user_id,
        course_name as first_course,
        completion_date,
        lead(course_name) over (partition by user_id order by completion_date) as second_course
    from course_completions
    where
        user_id in (select distinct user_id from top_students)
)

select
    first_course,
    second_course,
    count(*) as transition_count
from top_students_courses
where
    second_course is not null
group by 1, 2
order by transition_count desc, first_course, second_course;
