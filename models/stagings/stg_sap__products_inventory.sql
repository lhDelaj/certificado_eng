with
    source_products_inventory as (
        select cast(productid as int) as product_id
            , locationid
            , shelf
            , bin
            , quantity     
        from {{ source('sap', 'productinventory') }}
        order by product_id
    )

select * from source_products_inventory