# Write your MySQL query statement below
with categories as (
    select 'High Salary' as category
    union all
    select 'Average Salary' as category
    union all
    select 'Low Salary' as category
),

accounts_counts as (
    select
        case
            when income > 50000 then 'High Salary'
            when income >= 20000 then 'Average Salary'
            else 'Low Salary'
        end as category,
        count(account_id) as accounts_count
    from accounts
    group by 1
)

select
    c.category,
    coalesce(a.accounts_count, 0) as accounts_count
from categories as c
left join accounts_counts as a
    on c.category = a.category;
