# Write your MySQL query statement below
(
    select u.name as results
    from movierating as mr
    inner join users as u
        on mr.user_id = u.user_id
    group by 1
    order by count(mr.rating) desc, u.name
    limit 1
)

union all

(
    select m.title as results
    from movierating as mr
    inner join movies as m
        on mr.movie_id = m.movie_id
    where mr.created_at like '2020-02%'
    group by 1
    order by avg(mr.rating) desc, m.title
    limit 1
);
