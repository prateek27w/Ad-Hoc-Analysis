WITH cte1 AS (
    SELECT COUNT(DISTINCT product_code) AS unique_product_2020
    FROM gdb023.fact_sales_monthly
    WHERE fiscal_year = 2020
),

cte2 AS (
    SELECT COUNT(DISTINCT product_code) AS unique_product_2021
    FROM gdb023.fact_sales_monthly
    WHERE fiscal_year = 2021
)

SELECT cte1.*, cte2.*,
round((unique_product_2021-unique_product_2020)*100/unique_product_2020,2) as pct_chg
FROM cte1
CROSS JOIN cte2;

