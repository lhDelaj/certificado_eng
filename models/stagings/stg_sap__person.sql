with
    source_person as (
        select 
        --pk
            cast(businessentityid as int) as person_id 
   --colums to be used
            , cast(firstname as string) as person_first_name 
            , cast(lastname as string) as person_last_name 
        --colums discarted 
            , modifieddate
            , rowguid
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
    )

select * from source_person