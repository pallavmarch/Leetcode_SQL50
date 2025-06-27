SELECT employee_id 
FROM Employees
WHERE salary < 30000
AND manager_id IS NOT NULL
AND manager_id NOT IN (SELECT employee_id  FROM Employees)
ORDER BY employee_id


-- Code 2
WITH manager AS (
    SELECT * 
    FROM Employees
    WHERE salary < 30000
    AND manager_id IS NOT NULL
    AND manager_id NOT IN (SELECT employee_id  FROM Employees)
)
SELECT employee_id 
FROM manager
ORDER BY employee_id
