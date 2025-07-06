-- Approach 1: SELF JOIN

-- STEP1: Join current row with next row
SELECT L1.num, L2.num
FROM Logs L1
JOIN Logs L2
ON L1.id=L2.id-1

-- STEP 2: Join it a second time
SELECT L1.num, L2.num, L3.num
FROM Logs L1
JOIN Logs L2
ON L1.id=L2.id-1
JOIN Logs L3
ON L2.id=L3.id-1

-- STEP 3: Final Step
SELECT distinct l1.num AS ConsecutiveNums 
FROM Logs l1
JOIN Logs l2
ON l1.id = l2.id-1
JOIN Logs l3
ON l2.id = l3.id-1
WHERE l1.num= l2.num
AND  l2.num= l3.num

  
-- Approach 2: Using Window Function

-- STEP 1: Using LEAD()
SELECT num, 
    LEAD(num) OVER (ORDER BY id) AS one
FROM Logs 

-- STEP 2: Use LEAD() a second time
SELECT num, 
    LEAD(num) OVER (ORDER BY id) AS one,
    LEAD(num,2) OVER (ORDER BY id) AS two
FROM Logs 

-- STEP 3: Compare all three values
SELECT DISTINCT num AS ConsecutiveNums 
FROM (SELECT num,
        LEAD(num) OVER(ORDER BY id) AS one,
        LEAD(num,2) OVER(ORDER BY id) AS two
        FROM logs)
WHERE num= one 
AND one= two
