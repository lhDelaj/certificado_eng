with   
    customer_card as (
        select creditcard_id
                , customer_id
        from {{ ref('stg_sap__sales_order_header') }}
        where creditcard_id IS NOT NULL
    
    )

    , generate_key as (
        select  
            row_number() over(order by customer_id) as pk_customer_card
            , *
        from customer_card
    )
    select * 
    from generate_key