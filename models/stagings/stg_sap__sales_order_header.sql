with
    source_sales_order_header as (
        select 
         --pk
            cast(salesorderid as int) as order_id
         --fk   
            , cast(customerid as int) as customer_id
            , cast(creditcardid as int) as creditcard_id
            , cast (salespersonid as int) as sales_person_id
            , cast(shiptoaddressid as int) as ship_to_address_id
         --columns to be used
            , cast(status as int) as status
            , DATE(shipdate) as ship_date
            , DATE(orderdate) as order_date
            , DATE(duedate) as due_date
            , cast(subtotal as numeric) as subtotal
            , cast(taxamt as numeric) as tax_amount
            , cast(freight as numeric) as freight
            , cast(totaldue as numeric) as total
         --ignored columns
            , revisionnumber
            , onlineorderflag
            , purchaseordernumber
            , accountnumber
            , territoryid
            , billtoaddressid
            , shipmethodid
            , creditcardapprovalcode
            , currencyrateid
            , comment
            , rowguid
            , modifieddate
        from {{ source('sap', 'salesorderheader') }}
        order by customer_id
        
    )

select * from source_sales_order_header
  
        