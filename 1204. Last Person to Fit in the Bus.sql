-- STEP 1:
SELECT person_name, turn, SUM(weight) OVER(ORDER BY turn) AS weigh
    FROM Queue 

-- STEP 2:
SELECT person_name, weigh
FROM( 
    SELECT person_name, turn, SUM(weight) OVER(ORDER BY turn) AS weigh
    FROM Queue)
WHERE weigh <= 1000
  
-- STEP 3:
SELECT person_name
FROM( 
    SELECT person_name, turn, SUM(weight) OVER(ORDER BY turn) AS weigh
    FROM Queue)
WHERE weigh <= 1000
ORDER BY turn DESC
LIMIT 1
