with
    source_sales_order_header as (
        select 
            cast(salesreasonid as int) as sales_reason_id

            , cast(salesorderid as int) as order_id

            , modifieddate
        
        from {{ source('sap', 'salesorderheadersalesreason') }}
        order by order_id
        
    )

select * from source_sales_order_header
   
        