with    
    credit_card as (
    select * 
    from {{ ref('stg_sap__creditcard') }}
    )
    , sales_order_header as (
        select *
        from {{ ref('stg_sap__sales_order_header') }}
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
            , credit_card.creditcard_type
            , sales_order_header.subtotal
            , sales_order_header.tax_amount
            , sales_order_header.freight
            , sales_order_header.total
        from sales_order_header
        left join credit_card on
            sales_order_header.creditcard_id = credit_card.creditcard_id
    )
    , generate_key as (
    select  
        row_number() over(order by order_id) as sk_order
        , *
    from join_tables 
    )


    select *
    from generate_key
