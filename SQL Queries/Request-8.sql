select CASE
		WHEN month(date) IN (9,10,11) THEN "Q1"
		WHEN month(date) IN (12,1,2) THEN "Q2"
		WHEN month(date) IN (3,4,5) THEN "Q3"
ELSE "Q4"
END
as Quarters,
sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly
where fiscal_year = 2020
group by Quarters
order by total_sold_quantity desc;

