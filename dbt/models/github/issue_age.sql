-- models/github/issue_age.sql
SELECT 
    repository,
    state,
    ROUND(AVG(EXTRACT(EPOCH FROM (COALESCE(closed_at, CURRENT_TIMESTAMP) - created_at))/86400), 1) as avg_age_days
FROM raw_github.issues
GROUP BY repository, state