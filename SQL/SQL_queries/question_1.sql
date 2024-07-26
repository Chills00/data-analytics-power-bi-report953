/* 
This query returns the total number of staff in all of the UK stores.
*/


SELECT
    sum(staff_numbers),
    country_code
FROM
    dim_store
WHERE
    country_code = 'GB'
GROUP BY
    country_code
;