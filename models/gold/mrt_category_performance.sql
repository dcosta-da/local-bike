SELECT 
      DATE_TRUNC(order_date,MONTH)                                         AS month_date
    , co.store_name
    , p.category_name
    , COUNT(DISTINCT co.order_id)                                         AS nb_orders
    , SUM(co.quantity)                                                    AS nb_bikes_sold
    , COUNT(DISTINCT co.customer_id)                                      AS nb_customers
    , ROUND(SUM(co.final_item_price),2)                                   AS total_revenues
    , ROUND(SUM(co.final_item_price)/COUNT(DISTINCT co.customer_id),2)    AS avg_order_amount_per_customer
    , ROUND(SUM(co.final_item_price)/COUNT(DISTINCT co.order_id),2)       AS avg_order_amount_per_order
    , ROUND(SUM(co.quantity)/ COUNT(DISTINCT co.order_id),2)              AS avg_quantity_per_order
    , GENERATE_UUID()                                                     AS unique_id

FROM {{ ref('int_local_bike__customer_order_items') }}                    AS co

INNER JOIN {{ ref('int_local_bike__products') }}                          AS p
    ON co.product_id = p.product_id

WHERE co.order_status IN ('settled','shipped')

GROUP BY 
      month_date
    , co.store_name
    , p.category_name
