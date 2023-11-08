with
    source_creditcard as (
        select 
        --pk
            cast(creditcardid as int) as creditcard_id
        --fk   
            , cast(cardnumber as int) as creditcard_number

            , cast(cardtype as string) as creditcard_type
        from {{ source('sap', 'creditcard') }}
    )

select * from source_creditcard