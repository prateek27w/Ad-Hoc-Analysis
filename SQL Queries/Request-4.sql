SELECT p.segment,  (select count(distinct product_code) from fact_sales_monthly where fiscal_year=2020) as product_count_2020,
(select count(distinct product_code) from fact_sales_monthly where fiscal_year=2021) as product_count_2021
FROM gdb023.fact_sales_monthly s
join dim_product p
on p.product_code = s.product_code
group by p.segment;


with cte1 as (select p.segment, count(distinct s.product_code) as product_count_2020 
					from fact_sales_monthly s
                    join dim_product p
                    on p.product_code = s.product_code
                    where s.fiscal_year = 2020
                    group by p.segment
                    order by product_count_2020 desc),
    cte2 as (select p.segment, count(distinct s.product_code) as product_count_2021 
					from fact_sales_monthly s
                    join dim_product p
                    on p.product_code = s.product_code
                    where s.fiscal_year = 2021
                    group by p.segment
                    order by product_count_2021 desc)
                      
	select cte1.segment, product_count_2020, product_count_2021,
    abs(product_count_2021 - product_count_2020) as difference
    from cte1
    join cte2
    on cte1.segment = cte2.segment
    order by difference desc;