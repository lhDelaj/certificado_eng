with
    source_state_provinces as (
        select 
        --pk
            cast(stateprovinceid as int) as state_province_id
       
            , cast(territoryid as int) as territory_id

            , cast(stateprovincecode as string) as state_province_code

            , cast(`name` as string) as state_province_name
            
            , cast(countryregioncode as string) as country_region_code
            , isonlystateprovinceflag				
            , rowguid					
            , modifieddate
        from {{ source('sap', 'stateprovince') }}
    )

select * from source_state_provinces