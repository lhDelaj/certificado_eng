with
    source_customers as (
        select 
        --pk
            cast(customerid as int) as customer_id
        --fk   
            , cast(personid as int) as person_id
        --to be discarted
            , storeid
            , territoryid
            , rowguid
            , modifieddate
        from {{ source('sap', 'customer') }}
        where personid IS NOT NULL
    )

select * from source_customers