with 

source as (

    select * from {{ source('sales', 'orders') }}

),

renamed as (

    select
          order_id
        , customer_id
        , CASE order_status 
            WHEN 1 THEN 'pending'
            WHEN 2 THEN 'settled'
            WHEN 3 THEN 'cancelled'
            WHEN 4 THEN 'shipped'
          END                           AS order_status
        , order_date
        , required_date
        , shipped_date
        , store_id
        , staff_id

    from source

)

select * from renamed
