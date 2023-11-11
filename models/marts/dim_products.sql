with    
    stg_products as (
        select *
        from {{ ref('stg_sap__products') }}
    )

    , stg_products_sub_category as (
        select *
        from {{ ref('stg_sap__products_sub_caregoty') }}
    )

    , stg_products_category as (
        select *
        from {{ ref('stg_sap__products_caregoty') }}
    )
    , total_in_stock as (
        select *
        from {{ ref('int_total_in_stock') }}
        
    )


    , join_tables as (
        select
             stg_products.product_id
            , stg_products.product_sub_category_id
            , stg_products_category.product_category_id
            , stg_products.product_name
            , stg_products_category.category_name
            , stg_products_sub_category.sub_category_name
            , total_in_stock.total_quantity_in_stock
            , stg_products.product_size
            , stg_products.color
            , stg_products.weight
        from stg_products
        left join stg_products_sub_category on  
            stg_products.product_sub_category_id = stg_products_sub_category.product_sub_category_id
        left join stg_products_category on 
            stg_products_category.product_category_id = stg_products_sub_category.product_category_id
        left join total_in_stock on
            total_in_stock.product_id = stg_products.product_id
    

    )

    , generate_key as (
        select  
            row_number() over(order by product_id) as sk_product
            , *
        from join_tables
    )

    select *
    from generate_key