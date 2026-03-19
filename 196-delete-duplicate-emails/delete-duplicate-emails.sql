# Write your MySQL query statement below
delete from person
where id in (
    select distinct id
    from (
        select
            id,
            row_number() over (partition by email order by id) as rn
        from person
    ) as prn
    where rn > 1
);
