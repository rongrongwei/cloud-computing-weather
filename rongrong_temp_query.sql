--run with `hive -f temp_query.sql`
USE project;
SELECT
    state,
    MAX(t_daily_max) AS max_temp,
    AVG(t_daily_max) AS avg_max_temp,
    MIN(t_daily_max) AS min_max_temp
FROM 
    weather
WHERE
    t_daily_max <> -9999.0
GROUP BY 
    state
ORDER BY 
    max_temp DESC
LIMIT 10;

-- RESULT:
-- CA	53.7	22.558890654717	-7.9
-- AZ	49.3	24.939883292383215	-14.4
-- OK	45.8	22.241039933444142	-16.2
-- NV	45.0	18.201156136192736	-14.3
-- TX	44.9	26.447457002989204	-12.6
-- KS	44.7	19.5939222440946	-18.2
-- AR	44.3	21.247857142857136	-12.4
-- OR	44.0	16.575610074383388	-17.6
-- SD	43.7	13.355033815597936	-25.3
-- MT	43.7	11.360199152124698	-31.4