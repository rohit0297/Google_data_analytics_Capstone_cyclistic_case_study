
-- bike types used by riders

SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips;

-- number of trips per month

SELECT  month, member_casual, COUNT(*) AS total_trips
FROM `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
GROUP BY month, member_casual
ORDER BY member_casual;


-- number of trips per day of week

SELECT day_of_week, member_casual, COUNT(*) AS total_trips
FROM `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
GROUP BY day_of_week, member_casual
ORDER BY member_casual;


-- number of trips per hour

SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, COUNT(*) AS total_trips
FROM `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
GROUP BY hour_of_day, member_casual
ORDER BY member_casual;

-- average ride duration per month

SELECT month, member_casual, ROUND(AVG(ride_length),2) AS avg_ride_duration
FROM `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
GROUP BY month, member_casual;

-- average ride duration per day of week

SELECT day_of_week, member_casual, ROUND(AVG(ride_length),2) AS avg_ride_duration
FROM `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
GROUP BY day_of_week, member_casual;

-- average ride duration per hour

SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, ROUND(AVG(ride_length),2) AS avg_ride_duration
FROM `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
GROUP BY hour_of_day, member_casual;

-- starting station locations

SELECT start_station_name, member_casual, AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng, COUNT(*) AS total_trips
FROM `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
GROUP BY start_station_name, member_casual;

-- ending station locations

SELECT end_station_name, member_casual, AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng, COUNT(*) AS total_trips
FROM `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
GROUP BY end_station_name, member_casual;

