with
    source_products_inventory as (
        select cast(productid as int) as product_id
            , cast(quantity as int) as quantity_in_stock
            , shelf
            , bin    
        from {{ source('sap', 'productinventory') }}
        order by product_id
    )

select * from source_products_inventory