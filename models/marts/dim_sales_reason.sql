with 
    sales_reason as (
        select *
        from {{ ref('stg_sap__sales_reason') }}
    )

    , sales_order_header_reason as (
        select * 
        from {{ ref('stg_sap__sales_order_header_reason') }}
    )

    , join_tables as (
        select 
            sales_order_header_reason.order_id
            , sales_reason.reason_type
            , sales_reason.reason_description
        from sales_order_header_reason
        left join sales_reason on 
        sales_order_header_reason.sales_reason_id = sales_reason.sales_reason_id
    )

   , generate_key as (
        select  
            row_number() over(order by order_id) as sk_order_reason
            , *
        from join_tables
    )

    select *
    from generate_key

