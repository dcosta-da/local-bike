SELECT
      order_item_id
    , final_item_price

FROM{{ ref('int_local_bike__customer_order_items') }}

WHERE final_item_price < 0