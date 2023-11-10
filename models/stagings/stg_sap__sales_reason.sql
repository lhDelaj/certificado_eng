with
    source_sales_reason as (
        select 
         --pk
            cast(salesreasonid as int) as sales_reason_id
         -- columns used tabled
            , cast(reasontype as string) as reason_type
            , cast(name as string) as reason_description
         --ignored columns    
            , modifieddate
        
        from {{ source('sap', 'salesreason') }}
        
    )

select * from source_sales_reason
   
        