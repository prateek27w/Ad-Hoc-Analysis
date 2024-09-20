select pre.customer_code, c.customer,
round(avg(pre.pre_invoice_discount_pct)*100,2) as avg_discount_pct
from fact_pre_invoice_deductions pre
join dim_customer c
on c.customer_code = pre.customer_code
where pre.fiscal_year = 2021 and c.market = "India"
group by pre.customer_code, c.customer
order by avg_discount_pct desc
limit 5;

