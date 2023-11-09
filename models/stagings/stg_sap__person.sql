with
    source_person as (
        select 
        --pk
            cast(businessentityid as int) as entity_id 
   --colums to be used
            , cast(firstname as string) as person_first_name 
            , cast(lastname as string) as person_last_name 
        --colums discarted 
            , persontype
            , namestyle
            , title
            , middlename
            , suffix
            , emailpromotion
            , additionalcontactinfo
            , demographics
            , rowguid
            , modifieddate
        from {{ source('sap', 'person') }}
        order by entity_id
    )

select * from source_person