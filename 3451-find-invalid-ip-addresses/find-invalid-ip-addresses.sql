# Write your MySQL query statement below
with ip_logs as (
    select
        ip,
        case
            when cast(substring_index(ip, '.', 1) as unsigned) > 255
                or cast(substring_index(substring_index(ip, '.', 2), '.', -1) as unsigned) > 255
                or cast(substring_index(substring_index(ip, '.', 3), '.', -1) as unsigned) > 255
                or cast(substring_index(substring_index(ip, '.', 4), '.', -1) as unsigned) > 255
            then 1
            else 0
        end as greater_octet,
        case
            when substring_index(ip, '.', 1) like '0%'
                or substring_index(substring_index(ip, '.', 2), '.', -1) like '0%'
                or substring_index(substring_index(ip, '.', 3), '.', -1) like '0%'
                or substring_index(substring_index(ip, '.', 4), '.', -1) like '0%'
            then 1
            else 0
        end as leading_zeros,
        case
            when length(ip) - length(replace(ip, '.', '')) <> 3
            then 1
            else 0
        end as less_more_octets
    from logs
)

select
    ip,
    sum(greater_octet + leading_zeros + less_more_octets) as invalid_count
from ip_logs
group by 1
having invalid_count > 0
order by invalid_count desc, ip desc;
