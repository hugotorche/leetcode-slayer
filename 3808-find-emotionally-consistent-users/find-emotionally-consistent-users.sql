# Write your MySQL query statement below
with user_reactions as (
    select
        user_id,
        count(content_id) over (partition by user_id) as total_reactions,
        content_id,
        reaction
    from reactions
)

select
    user_id,
    reaction as dominant_reaction,
    round(count(content_id) / total_reactions, 2) as reaction_ratio
from user_reactions
where total_reactions >= 5
group by 1,2
having reaction_ratio >= 0.6
order by reaction_ratio desc, user_id;
