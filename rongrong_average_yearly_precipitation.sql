USE project;
WITH Yearly AS (
    SELECT 
        WBANNO,
        STATE,
        LATITUDE,
        LONGITUDE,
        SUBSTRING(LST_DATE,1,4) AS YEAR,
        SUM(P_DAILY_CALC) AS Yearly_Precipitation
    FROM 
        weather
    WHERE
        P_DAILY_CALC <> -9999.0
    GROUP BY
        WBANNO,
        STATE,
        LATITUDE,
        LONGITUDE,
        SUBSTRING(LST_DATE,1,4) 
)
SELECT 
    AVG(Yearly_Precipitation)
FROM
    Yearly
LIMIT 10
;

-- 790.8168384879721