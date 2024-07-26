/* 
This query returns the German store that had the highest revenue in 2022.
*/


SELECT
    SUM(o.product_quantity * p.cost_price) AS revenue,
    s.store_code
FROM
    orders AS o
LEFT JOIN
    dim_date AS d ON o.order_date = d.date
LEFT JOIN
    dim_product AS p ON o.product_code = p.product_code
LEFT JOIN
    dim_store AS s ON o.store_code = s.store_code
WHERE
    d.year = '2022'
    AND s.country_code = 'DE'
GROUP BY
    s.store_code
ORDER BY
    revenue DESC
LIMIT
    1
; 