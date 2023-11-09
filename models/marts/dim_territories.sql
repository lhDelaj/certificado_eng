with    
    
    stg_addresses as (
        select *
        from {{ ref('stg_sap__addresses') }}
    )
    

    , stg_state_provinces as (
        select *
        from {{ ref('stg_sap__state_provinces') }}
    )

    , stg_sales_territories as (
        select *
        from {{ ref('stg_sap__sales_territories') }}
    )


    , stg_country_region as (
        select *
        from {{ ref('stg_sap__country_regions') }}
    )
    
    , join_tables as (
        select 
            stg_addresses.address_id
            , stg_addresses.city
            , stg_addresses.postal_code
            , stg_country_region.country_name
            , stg_state_provinces.state_province_name
            , stg_sales_territories.continent
        from  stg_addresses
        left join stg_state_provinces on
            stg_addresses.state_province_id = stg_state_provinces.state_province_id
        left join stg_sales_territories on
            stg_state_provinces.territory_id = stg_sales_territories.territory_id
        left join stg_country_region on
            stg_sales_territories.country_region_code = stg_country_region.country_region_code
    )
    
    , generate_key as (
    select  
        row_number() over(order by address_id) as sk_territory
        , *
    from join_tables
    
    )


    select *
    from generate_key
 
    
    
    
