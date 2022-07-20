CREATE DATABASE IF NOT EXISTS project;
USE project;
CREATE TABLE IF NOT EXISTS weather
(
    ROW_NUM int,
    WBANNO int,
    LST_DATE string,
    CRX_VN double,
    LONGITUDE double,
    LATITUDE double,
    T_DAILY_MAX double,
    T_DAILY_MIN double,
    T_DAILY_MEAN double,
    T_DAILY_AVG double,
    P_DAILY_CALC double,
    SOLARAD_DAILY double,
    SUR_TEMP_DAILY_TYPE string,
    SUR_TEMP_DAILY_MAX double,
    SUR_TEMP_DAILY_MIN double,
    SUR_TEMP_DAILY_AVG double,
    RH_DAILY_MAX double,
    RH_DAILY_MIN double,
    RH_DAILY_AVG double,
    SOIL_MOISTURE_5_DAILY double,
    SOIL_MOISTURE_10_DAILY double,
    SOIL_MOISTURE_20_DAILY double,
    SOIL_MOISTURE_50_DAILY double,
    SOIL_MOISTURE_100_DAILY double,
    SOIL_TEMP_5_DAILY double,
    SOIL_TEMP_10_DAILY double,
    SOIL_TEMP_20_DAILY double,
    SOIL_TEMP_50_DAILY double,
    SOIL_TEMP_100_DAILY double,
    STATE string,
    STATION_CODE string
) row format delimited fields terminated by ',';

--make weather dir on hadoop
--hadoop fs -mkdir /weather
--copy data file to /weather/weather_data.csv on hadoop
--hadoop fs -copyFromLocal ~/weather_data.csv /weather/
--then
load data inpath '/weather/weather_data.csv' overwrite into table weather;