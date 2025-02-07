WITH parsed_invoices AS (
    SELECT 
        JSON_EXTRACT_PATH_TEXT(payload::json, 'department') as department,
        CAST(JSON_EXTRACT_PATH_TEXT(payload::json, 'amount') AS NUMERIC) as amount
    FROM raw_finance.invoice
    WHERE JSON_EXTRACT_PATH_TEXT(payload::json, 'department') IS NOT NULL
)
SELECT 
    department,
    COUNT(*) as "Transaction Count",
    SUM(amount) as "Total Amount"
FROM parsed_invoices
GROUP BY department
ORDER BY "Total Amount" DESC;