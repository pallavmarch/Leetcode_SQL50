--Step 1: All records from 2019-06-28 to future values

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM Activity 
WHERE activity_date >= (DATE '2019-07-27' - INTERVAL '29 DAYS')
GROUP BY activity_date

  
--Step 2: Using BETWEEN to limit the date range

  SELECT activity_date AS day,
        COUNT(DISTINCT user_id) AS active_users 
FROM Activity 
WHERE activity_date BETWEEN (DATE'2019-07-27' - INTERVAL '29 days') AND DATE '2019-07-27'
GROUP BY activity_date
