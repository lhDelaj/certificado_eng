with   
    customer_card as (
        select creditcard_id
                , customer_id
                , modifieddate
        from {{ ref('stg_sap__sales_order_header') }}
        where creditcard_id IS NOT NULL
    
    )

    , generate_key as (
        select  
            row_number() over(order by customer_id) as pk_customer_card
            , *
        from customer_card
        where modifieddate = (select max(modifieddate) from customer_card )  --taking only 1 set of creditcard/customer
    )
    select * 
    from generate_key
 