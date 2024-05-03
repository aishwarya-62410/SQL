use Weather;
-- 11. Rank locations based on the highest wind speed recorded.
SELECT location_id, wind_speed,
RANK() OVER (ORDER BY wind_speed DESC) AS wind_speed_rank
FROM Weather_Data;

-- 12. Determine the average humidity for each month across all locations.
SELECT EXTRACT(MONTH FROM timestamp) AS month, AVG(humidity) AS avg_humidity
FROM Weather_Data
GROUP BY EXTRACT(MONTH FROM timestamp);

-- 13. List locations with precipitation greater than 5mm.
SELECT location_id
FROM Weather_Data
WHERE precipitation > 5;

-- 14. Find the timestamp with the highest recorded temperature across all locations.
SELECT timestamp
FROM Weather_Data
WHERE temperature = (SELECT MAX(temperature) FROM Weather_Data);

-- 15. Calculate the total precipitation for each location in the last 7 days.
SELECT location_id, SUM(precipitation) AS total_precipitation
FROM Weather_Data
WHERE timestamp >= CURRENT_DATE - INTERVAL 7 day
GROUP BY location_id;

-- OR Solution for MYSQL
SELECT location_id, SUM(precipitation) AS total_precipitation
FROM Weather_Data
WHERE timestamp >= CURRENT_DATE - INTERVAL 7 DAY
GROUP BY location_id;

-- 16. Identify locations where the temperature is higher than the average temperature across all locations.
SELECT location_id
FROM Weather_Data
WHERE temperature > (SELECT AVG(temperature) FROM Weather_Data);

-- 17. Display the top 5 locations with the highest humidity levels.
SELECT location_id, humidity
FROM Weather_Data
ORDER BY humidity DESC
LIMIT 5;

-- 18. Rank locations based on the number of weather data entries.
SELECT location_id, COUNT(*) AS entry_count,
RANK() OVER (ORDER BY COUNT(*) DESC) AS entry_rank
FROM Weather_Data
GROUP BY location_id;

-- 19. Find the locations with the most frequent occurrences of rainy weather conditions.
SELECT location_id
FROM Weather_Data
WHERE weather_condition = 'Rainy'
GROUP BY location_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 20. List all locations and their respective weather conditions at the latest timestamp.
SELECT location_id, weather_condition
FROM Weather_Data
WHERE timestamp = (SELECT MAX(timestamp) FROM Weather_Data);

-- 21. Calculate the difference between the maximum and minimum temperatures for each location.
SELECT location_id, MAX(temperature) - MIN(temperature) AS temperature_difference
FROM Weather_Data
GROUP BY location_id;

-- 22. Identify locations where the temperature has been steadily increasing over the past week.
WITH TempDiff AS (
  SELECT location_id, temperature,
  LAG(temperature) OVER (PARTITION BY location_id ORDER BY timestamp) AS prev_temp
  FROM Weather_Data
)
SELECT location_id
FROM TempDiff
WHERE temperature > prev_temp;

-- 23. Display the weather conditions for the most recent entry of each location.
WITH LatestEntry AS (
  SELECT location_id, weather_condition,
  ROW_NUMBER() OVER (PARTITION BY location_id ORDER BY timestamp DESC) AS rn
  FROM Weather_Data
)
SELECT location_id, weather_condition
FROM LatestEntry
WHERE rn = 1;

-- 24. Determine the month with the highest average temperature across all locations.
SELECT EXTRACT(MONTH FROM timestamp) AS month, AVG(temperature) AS avg_temperature
FROM Weather_Data
GROUP BY EXTRACT(MONTH FROM timestamp)
ORDER BY AVG(temperature) DESC
LIMIT 1;

SELECT location_id, SUM(precipitation) AS total_precipitation,
RANK() OVER (ORDER BY SUM(precipitation) DESC) AS precipitation_rank
FROM Weather_Data
WHERE timestamp >= CURRENT_DATE - INTERVAL 1 month
GROUP BY location_id;

-- 26. Find locations where the wind speed is higher than the average wind speed.
SELECT location_id, wind_speed
FROM Weather_Data
WHERE wind_speed > (SELECT AVG(wind_speed) FROM Weather_Data);

-- 27. Calculate the moving average of temperature for each location over the last 7 days.
SELECT location_id, timestamp, temperature,
AVG(temperature) OVER (PARTITION BY location_id ORDER BY timestamp ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg_temperature
FROM Weather_Data;

-- 28. Identify locations that experienced a temperature drop of more than 5 degrees Celsius within an hour.
WITH TempWithPrev AS (
    SELECT location_id, timestamp, temperature,
           LAG(temperature) OVER (PARTITION BY location_id ORDER BY timestamp) AS prev_temp
    FROM Weather_Data
)
SELECT location_id, timestamp, temperature
FROM TempWithPrev
WHERE ABS(temperature - prev_temp) > 5;



-- 29. Display the top 3 locations with the highest average temperature in the last month.
SELECT location_id, AVG(temperature) AS avg_temperature
FROM Weather_Data
WHERE timestamp >= CURRENT_DATE - INTERVAL 1 month
GROUP BY location_id
ORDER BY AVG(temperature) DESC
LIMIT 3;

-- for MYSQL

SELECT location_id, AVG(temperature) AS avg_temperature
FROM Weather_Data
WHERE timestamp >= CURRENT_DATE - INTERVAL 1 MONTH
GROUP BY location_id
ORDER BY avg_temperature DESC
LIMIT 3;

-- 30. Find the location with the maximum temperature variation within a day.
SELECT location_id, MAX(temperature) - MIN(temperature) AS temp_variation
FROM Weather_Data
GROUP BY location_id
ORDER BY temp_variation DESC
LIMIT 1;

-- 31. Display Real-Time Weather Conditions for Different Locations:

SELECT l.location_name, w.timestamp, w.temperature, w.humidity, w.precipitation, w.wind_speed, w.weather_condition
FROM Weather_Data w
JOIN Locations l ON w.location_id = l.location_id
WHERE w.timestamp = (SELECT MAX(timestamp) FROM Weather_Data WHERE location_id = w.location_id);

-- 32. Calculate Trends and Patterns in Weather Data Over Time:
SELECT DATE_FORMAT(timestamp, '%Y-%m-%d %H:00:00') AS hour_slot, AVG(temperature) AS avg_temperature
FROM Weather_Data
GROUP BY hour_slot
ORDER BY hour_slot;









