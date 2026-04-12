# Write your MySQL query statement below
select
    u.name,
    sum(t.amount) as balance
from transactions as t
inner join users as u
    on t.account = u.account
group by u.name
having sum(t.amount) > 10000;
