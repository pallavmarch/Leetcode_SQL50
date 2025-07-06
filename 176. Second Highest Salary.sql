--Approach 1: Using subquery and WHERE < MAX

SELECT MAX(salary) AS SecondHighestSalary 
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee)

  
--Approach 2: Using LIMIT and OFFSET

SELECT 
(SELECT DISTINCT salary 
     FROM Employee 
     ORDER BY salary DESC 
     LIMIT 1 OFFSET 1) AS SecondHighestSalary
Next
Second Highest Salary
