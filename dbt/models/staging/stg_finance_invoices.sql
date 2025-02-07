--models/staging/stg_finance_invoices.sql
WITH parsed_invoices AS (
    SELECT 
        CAST(JSON_EXTRACT_PATH_TEXT(payload::json, 'date') AS DATE) as invoice_date,
        JSON_EXTRACT_PATH_TEXT(payload::json, 'currency') as currency,
        CAST(JSON_EXTRACT_PATH_TEXT(payload::json, 'amount') AS NUMERIC) as amount,
        JSON_EXTRACT_PATH_TEXT(payload::json, 'department') as department,
        JSON_EXTRACT_PATH_TEXT(payload::json, 'comment') as comment
    FROM raw_finance.invoice
)
SELECT * FROM parsed_invoices