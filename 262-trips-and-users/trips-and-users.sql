# Write your MySQL query statement below
select
    request_at as "Day",
    round(
        count(case when status like '%cancelled%' then id end) / count(id),
        2
     ) as "Cancellation Rate"
from trips as tri
inner join users as cli
    on tri.client_id = cli.users_id and cli.role = 'client'
inner join users as dri
    on tri.driver_id = dri.users_id and dri.role = 'driver'
where
    cli.banned = 'No'
    and dri.banned = 'No'
    and tri.request_at between "2013-10-01" and "2013-10-03"
group by 1
order by 1;
