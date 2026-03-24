# Write your MySQL query statement below
with sales_red as (
    select
        pers.sales_id
    from orders as orde
    inner join salesperson as pers 
        on orde.sales_id = pers.sales_id
    inner join company as comp
        on orde.com_id = comp.com_id
        and comp.name = 'RED'
)

select name
from salesperson
where sales_id not in (select sales_id from sales_red);
