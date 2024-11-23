with 

source as (

    select * from {{ source('sales', 'staffs') }}

),

renamed as (

    select
          staff_id
        , first_name
        , last_name
        , email
        , phone
        , active                                        AS is_currently_employee
        , store_id
        , IF(manager_id = 'NULL', '-2', manager_id)     AS manager_id

    from source

)

select * from renamed
