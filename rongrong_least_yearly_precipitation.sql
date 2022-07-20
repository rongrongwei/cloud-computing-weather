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
    WBANNO,
    YEAR,
    STATE,
    LATITUDE,
    LONGITUDE, 
    Yearly_Precipitation 
FROM
    Yearly
ORDER BY
    Yearly_Precipitation ASC
LIMIT 10
;