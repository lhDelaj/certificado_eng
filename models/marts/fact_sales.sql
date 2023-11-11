with    
    dim_territories as (
        select *
        from {{ ref('dim_territories') }}
    )
    , sales_order_header as (
        select *
        from {{ ref('stg_sap__sales_order_header') }}
    )

    , creditcard as (
        select *
        from {{ ref('stg_sap__creditcard') }}
    )
    
    , join_tables as (
        select 
            sales_order_header.order_id
            , sales_order_header.sales_person_id
            , sales_order_header.customer_id
            , sales_order_header.ship_to_address_id
            , sales_order_header.status
            , sales_order_header.order_date
            , sales_order_header.ship_date
            , sales_order_header.due_date
            , dim_territories.country_region_code
            , dim_territories.state_province_id
            , creditcard.creditcard_type
            , sales_order_header.subtotal
            , sales_order_header.tax_amount
            , sales_order_header.freight
            , sales_order_header.total
        from sales_order_header
        left join creditcard on
            sales_order_header.creditcard_id = creditcard.creditcard_id
        left join dim_territories on
            sales_order_header.ship_to_address_id = dim_territories.address_id
    )

    , generate_key as (
    select  
        row_number() over(order by order_id) as sk_order
        , *
    from join_tables
    
    )


    select *
    from generate_key
