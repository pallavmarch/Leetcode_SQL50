-- Step 1: Find each player’s Day 0 and Day 1

SELECT player_id, MIN(event_date) AS day_one, MIN(event_date) + 1 AS day_two
FROM Activity
GROUP BY player_id

-- Step 2: Flag the rows for activity happened on Day 1
SELECT
    CASE WHEN (player_id, event_date) IN (
            SELECT player_id, MIN(event_date) + 1
            FROM Activity
            GROUP BY player_id
        ) THEN 1 END 
FROM Activity

  -- no ELSE needed for CASE when counting

  
-- Step 3: Count the number of Day 1 activities
SELECT
    COUNT(CASE WHEN (player_id, event_date) IN (
        SELECT player_id, MIN(event_date) + 1
        FROM Activity
        GROUP BY player_id
    ) THEN 1 END) AS day1_active_count
FROM Activity
  
-- Step 4: Divide by total distinct players and multiply by 1.0 for decimal division
SELECT
    COUNT(CASE WHEN (player_id, event_date) IN (
                SELECT player_id, MIN(event_date) + 1
                FROM Activity
                GROUP BY player_id
        ) THEN 1 END) * 1.0 
    / COUNT(DISTINCT player_id) AS fraction
FROM Activity
  
-- Step 5: Final Step
SELECT ROUND(
    COUNT(CASE WHEN (player_id, event_date) IN (
            SELECT player_id, MIN(event_date) + 1
            FROM Activity
            GROUP BY player_id
        ) THEN 1 END) * 1.0 
    / COUNT(DISTINCT player_id),
2) AS fraction
FROM Activity
  
-- Code
SELECT ROUND(
    COUNT (CASE WHEN (player_id, event_date) IN (
                SELECT player_id, MIN(event_date) + 1 FROM Activity GROUP BY player_id)
                THEN 1 END) *1.0/
            COUNT(DISTINCT player_id)*1.0
            ,2) AS fraction 
FROM Activity
