with   
    total_in_stock as (
        select product_id
                , sum(quantity_in_stock) as total_quantity_in_stock
        from {{ ref('stg_sap__products_inventory') }}
        where quantity_in_stock IS NOT NULL
        group by product_id
        order by product_id
        
    )

    , generate_key as (
        select  
            row_number() over(order by product_id) as pk_products_in_stock
            , *
        from total_in_stock
    )
    select * 
    from generate_key