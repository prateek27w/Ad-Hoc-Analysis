select * from
(with cte1 as (select p.division, p.product_code, p.product, sum(sold_quantity) as total_sold_qty
from fact_sales_monthly s
join dim_product p
on p.product_code = s.product_code
where s.fiscal_year = 2021
group by p.division, p.product_code, p.product)
select *, rank() over(partition by division order by total_sold_qty desc) as rank_order from cte1) x
where x.rank_order<4; 

