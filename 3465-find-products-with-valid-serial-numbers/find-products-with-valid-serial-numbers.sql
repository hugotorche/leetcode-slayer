# Write your MySQL query statement below
select *
from products
WHERE REGEXP_LIKE(description, '(^| )SN[0-9]{4}-[0-9]{4}( |$)', 'c')
order by product_id;
