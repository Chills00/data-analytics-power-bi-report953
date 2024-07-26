/* 
This query returns the product category that generated the most profit 
for the Wiltshire, UK region in 2021.
*/


SELECT
    p.category,
    SUM(o.product_quantity * (p.sale_price - p.cost_price)) AS profit
FROM
    orders as o
LEFT JOIN
    dim_store AS s ON o.store_code = s.store_code
LEFT JOIN
    dim_product AS p ON o.product_code = p.product_code
LEFT JOIN
    dim_date AS d ON o.order_date = d.date
WHERE
    s.full_region = 'Wiltshire, UK'
    AND d.year = '2021'
GROUP BY
    p.category
ORDER BY
    profit DESC
LIMIT
    1
;