SELECT * 
FROM world_life_expectancy;

SELECT Country,
MIN(`Life expectancy`),
MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS difference
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
ORDER BY difference DESC
;

SELECT Year, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year
;


SELECT Country, ROUND(AVG(`Life expectancy`),1) AS avg_life_expect, ROUND(AVG(GDP),2) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING avg_life_expect <> 0
AND GDP <> 0
ORDER BY GDP DESC;


SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count,
ROUND(AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END),1) AS High_GDP_Life_Expectancy ,
SUM(CASE WHEN GDP < 1500 THEN 1 ELSE 0 END) AS Low_GDP_Count,
ROUND(AVG(CASE WHEN GDP < 1500 THEN `Life expectancy` ELSE NULL END),1) AS Low_GDP_Life_Expectancy
FROM world_life_expectancy;


SELECT Status, COUNT(DISTINCT Country) AS How_Many_Countries, ROUND(AVG(`Life expectancy`),1) AS avg_Life_Expectancy
FROM world_life_expectancy
GROUP BY Status;

SELECT Country, ROUND(AVG(`Life expectancy`),1) AS avg_life_expect, ROUND(AVG(BMI),2) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING avg_life_expect <> 0
AND BMI <> 0
ORDER BY BMI DESC;



SELECT * 
FROM world_life_expectancy;

SELECT Country,
Year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy;


















































































