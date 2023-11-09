with    
    
    stg_customer as (
        select *
        from {{ ref('stg_sap__customer') }}
    )
    

    , stg_creditcard as (
        select *
        from {{ ref('stg_sap__creditcard') }}
    )

    , stg_person_creditcard as (
        select *
        from {{ ref('stg_sap__person_creditcard') }}
    )


    , stg_person as (
        select *
        from {{ ref('stg_sap__person') }}
    )
    
    , join_tables as (
        select 
            stg_customer.customer_id
            , stg_customer.person_id
            , stg_creditcard.creditcard_id
            , stg_person.person_first_name
            , stg_person.person_last_name
            , stg_customer.territory_id
            , stg_creditcard.creditcard_type
        from stg_customer
        left join stg_person on
        stg_customer.person_id = stg_person.entity_id
        left join stg_person_creditcard on
        stg_person.entity_id = stg_person_creditcard.entity_id
        left join stg_creditcard on
            stg_person_creditcard.creditcard_id = stg_creditcard.creditcard_id
        where stg_creditcard.creditcard_id is not null
     
    )
    
    , generate_key as (
    select  
        row_number() over(order by customer_id) as sk_customer
        , *
    from join_tables
    
    )


    select *
    from generate_key
 
    
    
    
