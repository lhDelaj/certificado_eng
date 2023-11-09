with
    source_products_category as (
        select 
        --pk
            cast(productcategoryid as int) as product_category_id 
        --colums to be used
            , cast(name as string) as category_name
        --colums discarted 
            , modifieddate
            , rowguid
        from {{ source('sap', 'productcategory') }}
    )

select * from source_products_category