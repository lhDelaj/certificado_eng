with
    source_products as (
        select 
        --pk
            cast(productid as int) as product_id 
        --fk   
            , cast(productsubcategoryid as int) as product_sub_category_id 
        --colums to be used
            , cast(name as string) as product_name
            , cast(color as string) as color
            , cast(productline as string) as product_line
            , cast(style as string) as style
            , cast(size as string) as size
            , cast(`weight` as numeric) as `weight`
            , cast(listprice as numeric) as list_price
            , cast(standardcost as numeric) as standard_cost
        --colums discarted 
            , productmodelid
            , sellstartdate	
            , sellenddate
            , safetystocklevel
            , finishedgoodsflag
            , class
            , makeflag
            , productnumber
            , daystomanufacture
            , reorderpoint
            , weightunitmeasurecode
            , sizeunitmeasurecode
            , modifieddate
            , rowguid
        from {{ source('sap', 'product') }}
        where finishedgoodsflag = True
    )

select * from source_products