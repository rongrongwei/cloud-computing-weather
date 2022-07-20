--run with `hive -f top_temp_lat.sql`
USE project;
WITH top_temp AS (
    SELECT
        MAX(T_DAILY_MAX) AS max_temp
    FROM 
        weather
)
SELECT 
    STATE,
    LATITUDE,
    LONGITUDE
FROM 
    weather
WHERE
    T_DAILY_MAX IN (SELECT max_temp FROM top_temp)


-- RESULT:
-- CA	36.6	-117.14
-- It's death valley
-- https://www.google.com/maps/place/36%C2%B036'00.0%22N+117%C2%B008'24.0%22W/@35.5807871,-122.4425325,5.71z/data=!4m5!3m4!1s0x0:0x0!8m2!3d36.6!4d-117.14
