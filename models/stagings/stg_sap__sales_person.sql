with
    source_sales_person as (
        select 
         --pk
            cast(businessentityid as int) as sales_person_id
         --fk
            , cast(territoryid as string) as territory_id
         --ignored columns
            , salesquota
            , bonus
            , commissionpct
            , salesytd
            , saleslastyear
            , rowguid
            , modifieddate
        
        from {{ source('sap', 'salesperson') }}
        
    )

select * from source_sales_person
   
        