with
    source_person_creditcard as (
        select 
        --pk
            cast(businessentityid as int) as entity_id 
        --fk   
            , cast(creditcardid as int) as creditcard_id
            , modifieddate
        from {{ source('sap', 'personcreditcard') }}
        order by entity_id

    )

select * from source_person_creditcard