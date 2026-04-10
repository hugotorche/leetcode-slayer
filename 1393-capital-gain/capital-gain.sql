# Write your MySQL query statement below
select
    stock_name,
    sum(case when operation = 'Sell' then price else price * -1 end) as capital_gain_loss
from stocks
group by 1;
