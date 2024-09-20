select m.product_code, p.product, m.manufacturing_cost
from fact_manufacturing_cost m
join dim_product p
on m.product_code = p.product_code
where m.manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost)
or m.manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost)
order by m.manufacturing_cost desc;

