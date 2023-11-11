with    
    total_sales as  (
        select sum(unit_price*order_quantity) as total
        from {{ ref('fact_sales_details') }} 
        where order_date between '2011-01-01' and '2011-12-31'  
)

select total
from total_sales
where total not between 12646111 and 12646113