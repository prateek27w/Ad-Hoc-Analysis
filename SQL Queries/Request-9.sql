with cte1 as (select c.channel,
round(sum(g.gross_price*s.sold_quantity)/1000000,2) as gross_sales_mln
from fact_sales_monthly s
join fact_gross_price g
on s.product_code = g.product_code
join dim_customer c
on c.customer_code = s.customer_code
where s.fiscal_year = 2021
group by c.channel)
select *,
round(gross_sales_mln*100/sum(gross_sales_mln) over(),2) as percentage 
from cte1
order by percentage desc

