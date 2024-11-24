SELECT 
      stocks.stock_id
    , stocks.store_id
    , stores.store_name
    , stocks.product_id
    , products.product_name
    , stocks.quantity                               AS stock_quantity

FROM {{ ref('stg_production__stocks') }}            AS stocks

LEFT JOIN {{ ref('stg_sales__stores') }}            AS stores 
    ON stocks.store_id = stores.store_id

LEFT JOIN {{ ref('stg_production__products') }}     AS products 
    ON products.product_id = stocks.product_id