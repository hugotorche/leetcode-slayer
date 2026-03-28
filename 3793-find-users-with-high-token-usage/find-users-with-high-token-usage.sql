# Write your MySQL query statement below
select
    user_id,
    count(prompt) as prompt_count,
    round(avg(tokens), 2) as avg_tokens
from prompts
group by 1
having
    prompt_count >= 3
    and max(tokens) > avg_tokens
order by avg_tokens desc, user_id;
