SELECT
      o.customer_id
    , c.city                                            AS customer_city
    , c.state                                           AS customer_state
    , oi.order_id
    , oi.order_item_id
    , o.order_status
    , o.order_date
    , o.required_date
    , stores.store_name
    , CONCAT(staff.first_name, ' ', staff.last_name)    AS seller
    , oi.product_id
    , oi.quantity
    , oi.item_price
    , oi.discount
    , oi.item_price_with_discount
    , oi.item_price_with_discount * oi.quantity         AS final_item_price

FROM {{ ref('stg_sales__order_items') }}                AS oi

LEFT JOIN {{ ref('stg_sales__orders') }}                AS o 
    ON o.order_id = oi.order_id

LEFT JOIN {{ ref('stg_sales__customers') }}             AS c
    ON c.customer_id = o.customer_id

LEFT JOIN {{ ref('stg_sales__stores') }}                AS stores
    ON stores.store_id = o.store_id

LEFT JOIN {{ ref('stg_sales__staffs') }}                AS staff
    ON staff.staff_id = o.staff_id
    