--Step by Step:
-- 1. Select all the columns

-- 2. For has_start column:
CASE WHEN LEFT(dna_sequence, 3) = 'ATG' 
THEN 1 ELSE 0 END AS has_start

-- 3. For has_stop column:
CASE WHEN RIGHT(dna_sequence,3) IN ('TAA','TAG','TGA') 
THEN 1 ELSE 0 END AS has_stop
  
-- 4. For Detecting ATAT Pattern:
CASE WHEN dna_sequence LIKE '%ATAT%' 
THEN 1 ELSE 0 END AS has_atat
  
-- 5. For Detecting GGG Pattern:
CASE WHEN dna_sequence LIKE '%GGG%' 
THEN 1 ELSE 0 END AS has_ggg

  
-- Code

SELECT *,
       CASE WHEN LEFT(dna_sequence,3)='ATG' THEN 1 ELSE 0 END AS has_start,
       CASE WHEN RIGHT(dna_sequence,3) IN ('TAA','TAG','TGA') THEN 1 ELSE 0 END AS has_stop,
       CASE 
            WHEN dna_sequence LIKE '%ATAT%' 
                THEN 1 ELSE 0 END AS has_atat,
        CASE 
            WHEN dna_sequence LIKE '%GGG%' 
                THEN 1 ELSE 0 END AS has_ggg 
