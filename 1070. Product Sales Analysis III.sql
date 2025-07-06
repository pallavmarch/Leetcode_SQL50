-- Approach 1: Using WHERE with GROUP BY + Subquery

SELECT product_id, year AS first_year, quantity, price
FROM Sales 
WHERE (product_id, year) IN (SELECT product_id, MIN(year)
                            FROM Sales 
                            GROUP BY product_id)

-- Approach 2: Using a Window Function (RANK())

SELECT product_id, year AS first_year, quantity, price
FROM (
    SELECT *, 
           RANK() OVER(PARTITION BY product_id ORDER BY year) AS rn
    FROM Sales
) sub
WHERE rn = 1;
Next
Product Sales Analysis III
