with 

source as (

    select * from {{ source('sales', 'customers') }}

),

renamed as (

    select
          customer_id
        , first_name
        , last_name
        , IFNULL(phone, "Not provided") AS phone_number
        , email
        , street
        , city
        , state
        , zip_code

    from source

)

select * from renamed
