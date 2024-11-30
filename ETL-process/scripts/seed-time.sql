use hurtownie

;WITH Hours AS (
    SELECT Number AS Hour_
    FROM (VALUES 
        (0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), 
        (13), (14), (15), (16), (17), (18), (19), (20), (21), (22), (23)
    ) AS H(Number)
),
TimeOfDay AS (
    SELECT 
        Hour_,
        CASE 
            WHEN Hour_ BETWEEN 0 AND 8 THEN 'między 0 a 8'
            WHEN Hour_ BETWEEN 9 AND 12 THEN 'między 9 a 12'
            WHEN Hour_ BETWEEN 13 AND 15 THEN 'między 13 a 15'
            WHEN Hour_ BETWEEN 16 AND 20 THEN 'między 16 a 20'
            WHEN Hour_ BETWEEN 21 AND 23 THEN 'między 21 a 23'
        END AS Time_of_day
    FROM Hours
)
INSERT INTO Time_ (Hour_, Time_of_day)
SELECT Hour_, Time_of_day
FROM TimeOfDay;
