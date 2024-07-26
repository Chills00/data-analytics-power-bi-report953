/* 
This query creates a view where the rows are the store types 
and the columns are the total sales, 
percentage of total sales and the count of orders.
*/

CREATE VIEW store_type_sales_a AS
SELECT
    sales.store_type,
    sales.total_sales,
    100 * sales.total_sales / SUM(sales.total_sales) OVER () AS percentage_total_sales,
    sales.order_count
FROM
    (SELECT
        s.store_type,
        SUM(o.product_quantity * p.cost_price) AS total_sales,
        COUNT(o.order_date_uuid) AS order_count
    FROM
        orders AS o
    LEFT JOIN
        dim_store AS s ON o.store_code = s.store_code
    LEFT JOIN
        dim_product AS p ON o.product_code = p.product_code
    GROUP BY
        s.store_type
    ) AS sales
;
