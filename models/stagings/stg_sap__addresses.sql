with
    source_addresses as (
        select 
         --pk
            cast(addressid as int) as address_id
         --fk
            , cast(stateprovinceid as int) as state_province_id
         --columns to be used
            , cast(city as string) as city
            , cast(postalcode as string) as postal_code
         --ignored columns
            , addressline1
            , addressline2
            , spatiallocation				
            , rowguid					
            , modifieddate
        from {{ source('sap', 'address') }}
    )

select * from source_addresses
