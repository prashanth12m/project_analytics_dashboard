WITH parsed_invoices AS (
    SELECT 
        CAST(JSON_EXTRACT_PATH_TEXT(payload::json, 'date') AS TIMESTAMP) as invoice_date,
        JSON_EXTRACT_PATH_TEXT(payload::json, 'currency') as currency,
        CAST(JSON_EXTRACT_PATH_TEXT(payload::json, 'amount') AS NUMERIC) as amount
    FROM raw_finance.invoice
    WHERE JSON_EXTRACT_PATH_TEXT(payload::json, 'date') IS NOT NULL
)
SELECT 
    DATE_TRUNC('day', invoice_date) as time,
    SUM(amount) as value,
    currency as metric
FROM parsed_invoices
WHERE invoice_date IS NOT NULL
GROUP BY DATE_TRUNC('day', invoice_date), currency
ORDER BY time;