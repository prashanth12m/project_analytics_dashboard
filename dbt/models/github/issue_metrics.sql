-- models/github/issue_metrics.sql
WITH issue_metrics AS (
    SELECT 
    repository,
    COUNT(*) as total_issues,
    COUNT(CASE WHEN state = 'open' THEN 1 END) as open_issues,
    ROUND((COUNT(CASE WHEN state = 'closed' THEN 1 END)::float / 
           COUNT(*) * 100)::numeric, 2) as closure_rate
FROM raw_github.issues
WHERE repository IN (
    'waku-org/nwaku',
    'waku-org/js-waku',
    'waku-org/go-waku'
)  -- Top 3 repositories
GROUP BY repository
ORDER BY total_issues DESC
)
SELECT * FROM issue_metrics
