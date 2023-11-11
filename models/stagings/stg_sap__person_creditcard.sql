with
    source_person_creditcard as (
        select 
        --pk
            cast(businessentityid as int) as entity_id 
        --fk   
            , cast(creditcardid as int) as creditcard_id
         --ignored colum
            , modifieddate
        from {{ source('sap', 'personcreditcard') }}


    )

select * from source_person_creditcard