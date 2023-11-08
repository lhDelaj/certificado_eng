with
    source_sales_order_header as (
        select 
        --pk
            cast(salesorderid as int) as sales_order_id
        --fk   
            , cast(customerid as int) as customer_id
            , cast(creditcardid as int) as creditcard_id
            , revisionnumber
            , orderdate
            , duedate
            , shipdate
            , status
            , onlineorderflag
            , purchaseordernumber
            , accountnumber
            , salespersonid
            , territoryid
            , billtoaddressid
            , shiptoaddressid
            , shipmethodid
            , creditcardapprovalcode
            , currencyrateid
            , subtotal
            , taxamt
            , freight
            , totaldue
            , comment
            , rowguid
            , modifieddate
        from {{ source('sap', 'salesorderheader') }}
        order by customer_id
    )

select * from source_sales_order_header
    where modifieddate = (select 
                            max(modifieddate)
                        from source_sales_order_header 
                        )
        