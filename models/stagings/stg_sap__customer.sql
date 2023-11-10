with
    source_customers as (
        select 
         --pk
            cast(customerid as int) as customer_id
         --fk   
            , cast(personid as int) as person_id
         -- used
            , cast(territoryid as string) as territory_id
         --to be discarted
            , storeid
            , rowguid
            , modifieddate
        from {{ source('sap', 'customer') }}
        order by customer_id
    )

select * from source_customers