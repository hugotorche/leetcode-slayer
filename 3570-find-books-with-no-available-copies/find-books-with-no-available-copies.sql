# Write your MySQL query statement below
select
    lib.book_id,
    lib.title,
    lib.author,
    lib.genre,
    lib.publication_year,
    count(rec.record_id) as current_borrowers
from borrowing_records as rec
inner join library_books as lib
    on rec.book_id = lib.book_id
where
    rec.return_date is null
group by 1,2,3,4,5
having current_borrowers = min(lib.total_copies)
order by current_borrowers desc, lib.title;
