with
    source_creditcard as (
        select 
         --pk
            cast(creditcardid as int) as creditcard_id
         --columns to be used
            , cast(cardnumber as int) as creditcard_number
            , cast(cardtype as string) as creditcard_type
         --ignored columns
            , expmonth					
            , expyear					
            , modifieddate
            
        from {{ source('sap', 'creditcard') }}
    )

select * from source_creditcard