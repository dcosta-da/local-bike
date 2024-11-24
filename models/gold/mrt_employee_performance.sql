SELECT 
      DATE_TRUNC(order_date,MONTH)                                            AS month_date
    , store_name
    , seller
    , SUM(quantity)                                                           AS nb_bikes_sold
    , ROUND(SUM(final_item_price), 2)                                         AS total_revenues
    , GENERATE_UUID()                                                         AS unique_id

FROM {{ ref('int_local_bike__customer_order_items') }} 

WHERE order_status IN ('settled','shipped')

GROUP BY 
      month_date
    , store_name
    , seller
