with
    source_sales_territories as (
        select 
         --pk
            cast(territoryid as int) as territory_id
         -- columns used tabled
            , cast(`group` as string) as continent            
            , cast(countryregioncode as string) as country_region_code
            , cast(name as string) as country	
         --ignored columns  
            , costlastyear	
            , salesytd
	        , saleslastyear	
            , costytd	
            , rowguid					
            , modifieddate
        from {{ source('sap', 'salesterritory') }}
    )

select * from source_sales_territories