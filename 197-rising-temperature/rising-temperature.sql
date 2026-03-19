# Write your MySQL query statement below
select wcur.id
from weather as wcur
left join weather as wprev
    on date_add(wcur.recorddate, interval -1 day) = wprev.recorddate 
where wcur.temperature > wprev.temperature;
