with
    source_sales_order_header as (
        select 
         --pk
            cast(salesreasonid as int) as sales_reason_id
         -- fk
            , cast(salesorderid as int) as order_id
         -- ignored columns
            , modifieddate
        
        from {{ source('sap', 'salesorderheadersalesreason') }}
        order by order_id
        
    )

select * from source_sales_order_header
   
        