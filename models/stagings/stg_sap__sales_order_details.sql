with
    source_sales_order_details as (
        select 
         --pk
            cast(salesorderdetailid as int) as order_detail_id
         --fk
            , cast(salesorderid as int) as order_id
            , cast(productid as integer) as product_id
         --columns to be used
            , cast(orderqty as integer) as order_quantity
            , cast(unitprice as numeric) as unit_price
            , cast(unitpricediscount as numeric) as unit_price_discount
         --ignored columns
            , carriertrackingnumber
            , modifieddate
            , rowguid
        from {{ source('sap', 'salesorderdetail') }}
    )

select * from source_sales_order_details