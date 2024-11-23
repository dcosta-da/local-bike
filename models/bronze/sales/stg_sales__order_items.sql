with 

source as (

    select * from {{ source('sales', 'order_items') }}

),

renamed as (

    select
          CONCAT(order_id, item_id)     AS order_item_id
        , order_id
        , item_id
        , product_id
        , quantity
        , list_price                    AS item_price
        , discount

    from source

)

select * from renamed
