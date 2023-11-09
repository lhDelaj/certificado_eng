with
    source_country_regions as (
        select 
        --pk
            cast(countryregioncode as string) as country_region_code

            , cast(name as string) as country_name

            , modifieddate
        from {{ source('sap', 'countryregion') }}
    )

select * from  source_country_regions