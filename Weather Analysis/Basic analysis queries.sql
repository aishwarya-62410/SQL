-- 1. List all locations stored in the Locations table.
SELECT location_name FROM Locations;

-- 2. Retrieve the temperature and humidity for a specific location at a particular timestamp.
SELECT temperature, humidity
FROM Weather_Data
WHERE location_id = 25
AND timestamp = '2024-02-29 12:00:00';

-- 3. Display the total count of weather data entries for each location.
SELECT location_id, COUNT(*) AS entry_count
FROM Weather_Data
GROUP BY location_id;

-- 4. Find the average temperature for all locations.
SELECT AVG(temperature) AS avg_temperature
FROM Weather_Data;

-- 5. List all locations with their respective latitude and longitude.
SELECT location_name, latitude, longitude
FROM Locations;

-- 6. Calculate the highest recorded temperature for each location.
SELECT location_id, MAX(temperature) AS max_temperature
FROM Weather_Data
GROUP BY location_id;

-- 7. Display the weather conditions for a specific location and timestamp.
SELECT weather_condition
FROM Weather_Data
WHERE location_id =6
AND timestamp = '2024-02-29 12:00:00';

-- 8. Find the locations with the lowest humidity levels.
SELECT location_id, MIN(humidity) AS min_humidity
FROM Weather_Data
GROUP BY location_id;

-- 9. List the timestamps for which weather data is available.
SELECT DISTINCT timestamp
FROM Weather_Data;

-- 10. Identify locations with temperatures above 25 degrees Celsius.
SELECT location_id
FROM Weather_Data
WHERE temperature > 25;
