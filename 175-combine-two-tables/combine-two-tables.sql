# Write your MySQL query statement below
select
    pe.firstname,
    pe.lastname,
    ad.city,
    ad.state
from person pe
left join address ad
    on pe.personid = ad.personid;
