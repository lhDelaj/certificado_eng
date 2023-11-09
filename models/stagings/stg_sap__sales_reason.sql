with
    source_sales_reason as (
        select 
            cast(salesreasonid as int) as sales_reason_id

            , cast(reasontype as string) as reason_type
            , cast(name as string) as reason_description
            
            , modifieddate
        
        from {{ source('sap', 'salesreason') }}
        
    )

select * from source_sales_reason
   
        