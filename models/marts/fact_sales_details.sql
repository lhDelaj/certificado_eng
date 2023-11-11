with    
    sales_order_header as (
        select *
        from {{ ref('stg_sap__sales_order_header') }}
    )

    , sales_order_details as (
        select *
        from {{ ref('stg_sap__sales_order_details') }}
    )
    
    , join_tables as (
        select 
            sales_order_details.order_detail_id
            , sales_order_details.order_id
            , sales_order_details.product_id
            , sales_order_header.order_date
            , sales_order_details.order_quantity
            , sales_order_details.unit_price
            , sales_order_details.unit_price_discount
            , cast(sales_order_details.unit_price*sales_order_details.order_quantity as numeric) as total_sale
        from sales_order_details
        left join sales_order_header on
            sales_order_details.order_id = sales_order_header.order_id
    )

    , generate_key as (
    select  
        row_number() over(order by order_detail_id) as sk_order_detail
        , *
    from join_tables
    
    )


    select *
    from generate_key
