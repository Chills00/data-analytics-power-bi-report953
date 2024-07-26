/* 
This query returns the month in 2022 that had the highest revenue.
*/


SELECT
    SUM(o.product_quantity * p.cost_price) AS revenue,
    d.month_name
FROM
    orders AS o
LEFT JOIN
    dim_date AS d ON o.order_date = d.date
LEFT JOIN
    dim_product AS p ON o.product_code = p.product_code
WHERE
    d.year = '2022'
GROUP BY
    d.month_name
ORDER BY
    revenue DESC
LIMIT
    1
;