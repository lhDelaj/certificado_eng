with 
    customer_card as (
    select
        creditcard_id,
        customer_id,
        modifieddate,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY modifieddate DESC) as last_update  --gets most recent data od credit card - customer
    from {{ ref('stg_sap__sales_order_header') }}
    
)

SELECT 
    *
FROM customer_card
WHERE last_update = 1
order by customer_id