# Write your MySQL query statement below
with products_date as (
    select 
        product_id,
        new_price,
        change_date,
        max(case when change_date <= '2019-08-16' then change_date end) over (partition by product_id) as last_change_date
    from products
)

select
    product_id,
    coalesce(max(case when change_date = last_change_date then new_price end), 10) as price
from products_date
group by 1;
