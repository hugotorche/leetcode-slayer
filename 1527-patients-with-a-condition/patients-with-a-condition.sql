# Write your MySQL query statement below
select *
from patients
where REGEXP_LIKE(conditions, '(^| )DIAB1', 'c')
