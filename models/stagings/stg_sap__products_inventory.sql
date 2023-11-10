with
    source_products_inventory as (
        select
         --pk 
            cast(productid as int) as product_id
         --columns to be used
            , cast(quantity as int) as quantity_in_stock
         --ignored columns
            , shelf
            , bin    
        from {{ source('sap', 'productinventory') }}
        order by product_id
    )

select * from source_products_inventory