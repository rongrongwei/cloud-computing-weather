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
    Yearly_Precipitation DESC
LIMIT 10
;

-- 21515   2018    HI      19.65   -155.08 5708.5999999999985
-- 21515   2015    HI      19.65   -155.08 4966.299999999999
-- 21515   2006    HI      19.65   -155.08 4542.999999999999
-- 4237    2016    WA      47.51   -123.81 4540.700000000001
-- 4237    2017    WA      47.51   -123.81 4425.299999999999
-- 4237    2014    WA      47.51   -123.81 4400.8
-- 4237    2007    WA      47.51   -123.81 4387.8
-- 4237    2010    WA      47.51   -123.81 4374.300000000002
-- 4237    2012    WA      47.51   -123.81 4192.299999999999
-- 21515   2009    HI      19.65   -155.08 4176.099999999996