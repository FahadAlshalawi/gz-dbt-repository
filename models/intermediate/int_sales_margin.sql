
    select *
    from (
        SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchse_price AS FLOAT64) AS purchase_price, 
    ROUND(s.quantity*CAST(p.purchse_price AS FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchse_price AS FLOAT64),2) AS margin
FROM `idyllic-anvil-414008`.`dbt_fahad`.`stg_raw__sales` s
LEFT JOIN `idyllic-anvil-414008`.`dbt_fahad`.`stg_raw__product` p 
    ON s.pdt_id = p.products_id
    ) as model_limit_subq