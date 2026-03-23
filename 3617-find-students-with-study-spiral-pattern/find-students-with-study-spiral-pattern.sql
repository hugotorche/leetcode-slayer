# Write your MySQL query statement below
with sessions_window as (
    select
        student_id,
        lag(subject) over (partition by student_id order by session_date) as previous_subject,
        subject,
        lead(subject) over (partition by student_id order by session_date) as next_subject,
        lag(session_date) over (partition by student_id order by session_date) as previous_session_date,
        session_date,
        lead(session_date) over (partition by student_id order by session_date) as next_session_date,
        hours_studied
    from study_sessions
),

sessions_spiral_pattern as (
    select
        student_id,
        subject,
        (case
            when
                subject <> previous_subject
                and subject <> next_subject
                and previous_subject <> next_subject
                and (session_date - previous_session_date) < 3
                and (next_session_date - session_date) < 3
            then 1
            else 0
        end) as is_spiral_pattern,
        hours_studied
    from sessions_window
),

sessions_final as (
    select
        student_id,
        subject,
        is_spiral_pattern,
        max(is_spiral_pattern) over (partition by student_id) as has_spiral_pattern,
        sum(is_spiral_pattern) over (partition by student_id) as total_spiral_pattern,
        hours_studied
    from sessions_spiral_pattern
)

select
    stu.student_id,
    stu.student_name,
    stu.major,
    count(distinct case when ses.is_spiral_pattern then ses.subject end) as cycle_length,
    sum(ses.hours_studied) as total_study_hours
from sessions_final as ses 
inner join students as stu
    on ses.student_id = stu.student_id
where
    ses.has_spiral_pattern = 1
    and ses.total_spiral_pattern >= 4
group by 1,2,3
having cycle_length >= 3
order by cycle_length desc, total_study_hours desc;
