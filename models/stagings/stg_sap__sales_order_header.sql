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
            , cast(status as int) as status
            , cast(shipdate as string) as ship_date
            , cast(orderdate as string) as order_date
            , cast(duedate as string) as due_date
            , cast(subtotal as numeric) as subtotal
            , cast(taxamt as numeric) as tax_amount
            , cast(freight as numeric) as freight
            , cast(totaldue as numeric) as total

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
  
        