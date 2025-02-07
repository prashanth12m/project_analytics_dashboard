--models/marts/finance/monthly_cost_analysis.sql:
SELECT 
    DATE_TRUNC('month', invoice_date) as month,
    SUM(amount) as total_amount,
    COUNT(DISTINCT department) as departments,
    STRING_AGG(DISTINCT currency, ', ') as currencies_used,
    COUNT(*) as transaction_count
FROM {{ ref('stg_finance_invoices') }}
GROUP BY DATE_TRUNC('month', invoice_date)
ORDER BY month