select sum(gross_sales_amount)/1000000 from (
select concat(monthname(s.date),' ', '(', year(s.date), ')') as month , s.fiscal_year,
round(sum(g.gross_price * s.sold_quantity),2) as gross_sales_amount 
from fact_sales_monthly s
join fact_gross_price g
on s.product_code = g.product_code 
join dim_customer c
on c.customer_code = s.customer_code
where c.customer = "Atliq Exclusive"
group by s.date, fiscal_year
order by fiscal_year) x
where fiscal_year=2021
