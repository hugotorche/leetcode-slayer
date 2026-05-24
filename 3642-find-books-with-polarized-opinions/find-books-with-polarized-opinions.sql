# Write your MySQL query statement below
select
    rs.book_id,
    b.title,
    b.author,
    b.genre,
    b.pages,
    max(session_rating) - min(session_rating) rating_spread,
    round(
        count(
            case
                when rs.session_rating <= 2 or rs.session_rating >= 4
                then rs.session_id
            end
        ) / count(session_id),
        2
    ) as polarization_score 
from reading_sessions as rs
inner join books as b
    on rs.book_id = b.book_id
group by 1, 2, 3, 4, 5
having
    count(session_id) >= 5
    and count(case when rs.session_rating <= 2 then rs.session_id end) > 0
    and count(case when rs.session_rating >= 4 then rs.session_id end) > 0
    and polarization_score >= 0.6
order by polarization_score desc, b.title desc;
