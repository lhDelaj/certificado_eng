with
    source_business_entity_addresses as (
        select 
         --pk
            cast(addressid as int) as address_id
         --fk
            , cast(businessentityid as int) as customer_id
         --columns to be used
            , addresstypeid
            , rowguid					
            , modifieddate
        from {{ source('sap', 'businessentityaddress') }}
    )

select * from source_business_entity_addresses
order by address_id