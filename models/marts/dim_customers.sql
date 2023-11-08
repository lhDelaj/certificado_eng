with
    stg_person as (
        select *
        from {{ ref('stg_sap__person') }}
    )
       stg_person_creditcard as (
        select *
        from {{ ref('stg_sap__person_creditcard') }}
    )
       stg_creditcard as (
        select *
        from {{ ref('stg_sap__creditcard') }}
    )
        stg_customer as (
            select * 
            from {{ ref('customer') }}
        
    )
      customer_card as (
        select *
        from {{ ref('int_customer_card') }}
    )

    , join_tables as (
        select 
            stg_customer.customer_id
            , stg_customer.person_id
            , stg_creditcard.creditcard_id
            , stg_person.person_first_name
            , stg_person.person_last_name
            , stg_creditcard.creditcard_type
        from stg_customer
            left join customer_card on
                customer_card.customer_id = stg_customer.customer_id
            left join stg_creditcard on 
                stg_creditcard.creditcard_id = customer_card.creditcard_id
            left join stg_person_creditcard on
                stg_person_creditcard.creditcard_id = stg_creditcard.creditcard_id
            left join stg_person on
                stg_person.entity_id = stg_person_creditcard.entity_id
        
    )
    
    , generate_key as (
        select  
            row_number() over(order by customer_id) as pk_customer
            , *
        from join_tables
    )

    select *
    from generate_key