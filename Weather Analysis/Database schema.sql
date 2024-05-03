CREATE DATABASE Weather;

use Weather;

-- Create Locations Table
CREATE TABLE Locations (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(255),
    latitude DECIMAL(10, 6),
    longitude DECIMAL(10, 6)
);

-- Insert data into Locations Table
INSERT INTO Locations (location_id, location_name, latitude, longitude) VALUES
(1, 'New York', 40.7128, -74.0060),
(2, 'Los Angeles', 34.0522, -118.2437),
(3, 'Chicago', 41.8781, -87.6298),
(4, 'Houston', 29.7604, -95.3698),
(5, 'Phoenix', 33.4484, -112.0740),
(6, 'Philadelphia', 39.9526, -75.1652),
(7, 'San Antonio', 29.4241, -98.4936),
(8, 'San Diego', 32.7157, -117.1611),
(9, 'Dallas', 32.7767, -96.7970),
(10, 'San Jose', 37.3382, -121.8863),
(11, 'Austin', 30.2672, -97.7431),
(12, 'Jacksonville', 30.3322, -81.6557),
(13, 'Fort Worth', 32.7555, -97.3308),
(14, 'Columbus', 39.9612, -82.9988),
(15, 'Charlotte', 35.2271, -80.8431),
(16, 'San Francisco', 37.7749, -122.4194),
(17, 'Indianapolis', 39.7684, -86.1581),
(18, 'Seattle', 47.6062, -122.3321),
(19, 'Denver', 39.7392, -104.9903),
(20, 'Washington', 38.9072, -77.0369),
(21, 'Boston', 42.3601, -71.0589),
(22, 'El Paso', 31.7619, -106.4850),
(23, 'Nashville', 36.1627, -86.7816),
(24, 'Portland', 45.5051, -122.6750),
(25, 'Las Vegas', 36.1699, -115.1398),
(26, 'Oklahoma City', 35.4676, -97.5164),
(27, 'Memphis', 35.1495, -90.0490),
(28, 'Louisville', 38.2527, -85.7585),
(29, 'Baltimore', 39.2904, -76.6122),
(30, 'Milwaukee', 43.0389, -87.9065),
(31, 'Miami', 25.7617, -80.1918),
(32, 'Atlanta', 33.7490, -84.3880),
(33, 'New Orleans', 29.9511, -90.0715),
(34, 'Honolulu', 21.3069, -157.8583),
(35, 'Orlando', 28.5383, -81.3792),
(36, 'Toronto', 43.6511, -79.3832),
(37, 'Vancouver', 49.2827, -123.1207),
(38, 'Montreal', 45.5017, -73.5673),
(39, 'Calgary', 51.0486, -114.0708),
(40, 'Ottawa', 45.4215, -75.6919),
(41, 'New York', 40.7128, -74.0060),
(42, 'Los Angeles', 34.0522, -118.2437),
(43, 'Chicago', 41.8781, -87.6298),
(44, 'Houston', 29.7604, -95.3698),
(45, 'Phoenix', 33.4484, -112.0740);

-- Create Weather Data Table
CREATE TABLE Weather_Data (
    data_id INT PRIMARY KEY,
    location_id INT,
    timestamp TIMESTAMP,
    temperature DECIMAL(5, 2),
    humidity INT,
    precipitation DECIMAL(5, 2),
    wind_speed DECIMAL(5, 2),
    weather_condition VARCHAR(50),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- Insert data into Weather Data Table
INSERT INTO Weather_Data (data_id, location_id, timestamp, temperature, humidity, precipitation, wind_speed, weather_condition) VALUES
(1, 1, '2024-02-29 12:00:00', 10.5, 70, 0.0, 3.2, 'Cloudy'),
(2, 2, '2024-02-29 12:00:00', 20.3, 65, 0.0, 2.8, 'Sunny'),
(3, 3, '2024-02-29 12:00:00', 15.8, 80, 0.2, 4.5, 'Rainy'),
(4, 4, '2024-02-29 12:00:00', 18.2, 75, 0.0, 3.0, 'Partly Cloudy'),
(5, 5, '2024-02-29 12:00:00', 25.6, 50, 0.0, 3.7, 'Sunny'),
(6, 6, '2024-02-29 12:00:00', 11.0, 90, 0.8, 2.0, 'Rainy'),
(7, 7, '2024-02-29 12:00:00', 22.1, 55, 0.0, 3.9, 'Sunny'),
(8, 8, '2024-02-29 12:00:00', 19.5, 68, 0.0, 3.5, 'Cloudy'),
(9, 9, '2024-02-29 12:00:00', 21.3, 63, 0.0, 4.2, 'Sunny'),
(10, 10, '2024-02-29 12:00:00', 24.8, 57, 0.0, 4.8, 'Partly Cloudy'),
(11, 11, '2024-02-29 12:00:00', 16.7, 78, 0.3, 3.1, 'Rainy'),
(12, 12, '2024-02-29 12:00:00', 13.2, 85, 0.5, 2.4, 'Cloudy'),
(13, 13, '2024-02-29 12:00:00', 17.9, 72, 0.0, 3.6, 'Sunny'),
(14, 14, '2024-02-29 12:00:00', 20.0, 60, 0.0, 4.0, 'Sunny'),
(15, 15, '2024-02-29 12:00:00', 23.4, 53, 0.0, 4.5, 'Partly Cloudy'),
(16, 16, '2024-02-29 12:00:00', 12.5, 88, 1.2, 2.2, 'Rainy'),
(17, 17, '2024-02-29 12:00:00', 14.8, 82, 0.4, 3.3, 'Cloudy'),
(18, 18, '2024-02-29 12:00:00', 18.6, 70, 0.0, 3.8, 'Sunny'),
(19, 19, '2024-02-29 12:00:00', 26.2, 48, 0.0, 4.2, 'Partly Cloudy'),
(20, 20, '2024-02-29 12:00:00', 15.0, 75, 0.1, 3.7, 'Rainy'),
(21, 21, '2024-02-29 12:00:00', 11.3, 92, 0.6, 2.1, 'Cloudy'),
(22, 22, '2024-02-29 12:00:00', 24.5, 58, 0.0, 4.1, 'Sunny'),
(23, 23, '2024-02-29 12:00:00', 17.2, 76, 0.0, 3.4, 'Sunny'),
(24, 24, '2024-02-29 12:00:00', 21.8, 65, 0.0, 4.6, 'Partly Cloudy'),
(25, 25, '2024-02-29 12:00:00', 27.0, 45, 0.0, 4.9, 'Sunny'),
(26, 26, '2024-02-29 12:00:00', 13.8, 80, 0.2, 3.0, 'Rainy'),
(27, 27, '2024-02-29 12:00:00', 16.5, 77, 0.4, 3.5, 'Cloudy'),
(28, 28, '2024-02-29 12:00:00', 19.2, 68, 0.0, 3.9, 'Sunny'),
(29, 29, '2024-02-29 12:00:00', 22.7, 62, 0.0, 4.3, 'Partly Cloudy'),
(30, 30, '2024-02-29 12:00:00', 14.0, 83, 0.3, 2.5, 'Rainy');
