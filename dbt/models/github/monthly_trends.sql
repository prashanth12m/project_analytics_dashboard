-- models/github/monthly_trends.sql
WITH monthly_trends AS (
   SELECT 
    DATE_TRUNC('month', created_at) as month,
    COUNT(*) as total_issues,
    COUNT(CASE WHEN state = 'open' THEN 1 END) as open_issues,
    COUNT(CASE WHEN state = 'closed' THEN 1 END) as closed_issues
FROM raw_github.issues
GROUP BY DATE_TRUNC('month', created_at)
ORDER BY month DESC
)
SELECT * FROM monthly_trends