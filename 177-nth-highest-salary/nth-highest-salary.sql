CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    # Write your MySQL query statement below.
    with employee_rn as (
        select
            id,
            salary,
            dense_rank() over (order by salary desc) as rn
        from employee
    )

    select
        max(case when rn = N then salary end) as "getNthHighestSalary"
    from employee_rn

  );
END
