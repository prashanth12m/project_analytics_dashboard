WITH parsed_invoices AS (
    SELECT 
        JSON_EXTRACT_PATH_TEXT(payload::json, 'currency') as currency,
        CAST(JSON_EXTRACT_PATH_TEXT(payload::json, 'amount') AS NUMERIC) as amount
    FROM raw_finance.invoice
    WHERE JSON_EXTRACT_PATH_TEXT(payload::json, 'currency') IS NOT NULL
)
SELECT 
    currency,
    COUNT(*) as "Transaction Count",
    SUM(amount) as "Total Amount"
FROM parsed_invoices
GROUP BY currency
ORDER BY "Total Amount" DESC;