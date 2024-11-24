SELECT
      p.product_id
    , p.product_name
    , p.product_price
    , p.model_year
    , cat.category_name
    , b.brand_name

FROM {{ ref('stg_production__products') }}       as p

LEFT JOIN {{ ref('stg_production__categories')}} as cat 
    ON cat.category_id = p.category_id

LEFT JOIN {{ ref('stg_production__brands') }}    as b 
    ON b.brand_id = p.brand_id