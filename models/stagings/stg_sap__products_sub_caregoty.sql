with
    source_products_sub_category as (
        select 
        --pk
            cast(productsubcategoryid as int) as product_sub_category_id 
        --fk   
            , cast(productcategoryid as int) as product_category_id 
        --colums to be used
            , cast(name as string) as sub_category_name
        --ignored columns
            , modifieddate
            , rowguid
        from {{ source('sap', 'productsubcategory') }}
    )

select * from source_products_sub_category