-- checking the data types of all columns
SELECT column_name, data_type
FROM `cyclistic-case-study-455810.tripdata`.INFORMATION_SCHEMA.COLUMNS 
WHERE table_name = 'combined_tripdata';
-- we can also check for the data types in the big query

-- checking for number of null values in all columns

SELECT
  COUNTIF(ride_id IS NULL) AS ride_id_nulls,
  COUNTIF(rideable_type IS NULL) AS rideable_type_nulls,
  COUNTIF(started_at IS NULL) AS started_at_nulls,
  COUNTIF(ended_at IS NULL) AS ended_at_nulls,
  COUNTIF(start_station_name IS NULL) AS start_station_name_nulls,
  COUNTIF(start_station_id IS NULL) AS start_station_id_nulls,
  COUNTIF(end_station_name IS NULL) AS end_station_name_nulls,
  COUNTIF(end_station_id IS NULL) AS end_station_id_nulls,
  COUNTIF(start_lat IS NULL) AS start_lat_nulls,
  COUNTIF(start_lng IS NULL) AS start_lng_nulls,
  COUNTIF(end_lat IS NULL) AS end_lat_nulls,
  COUNTIF(end_lng IS NULL) AS end_lng_nulls,
  COUNTIF(member_casual IS NULL) AS member_casual_nulls
FROM `cyclistic-case-study-455810.tripdata.combined_tripdata`;

-- checking for duplicate rows

SELECT 
  COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM
  `cyclistic-case-study-455810.tripdata.combined_tripdata`;

-- checking the length of ride_id
SELECT  
  LENGTH(ride_id) AS length_ride_id,
  COUNT(*) AS no_of_rows
FROM
  `cyclistic-case-study-455810.tripdata.combined_tripdata`
GROUP BY length_ride_id;

-- finding out types of bikes and their count
SELECT 
  DISTINCT rideable_type,
  COUNT(rideable_type) AS no_of_trips
FROM 
  `cyclistic-case-study-455810.tripdata.combined_tripdata`
GROUP BY rideable_type;

-- 

SELECT 
  started_at, 
  ended_at
FROM 
  `cyclistic-case-study-455810.tripdata.combined_tripdata`
LIMIT 10;


-- number of bikes which were used for longer duration than a day
SELECT COUNT(*) AS longer_than_a_day
FROM
  `cyclistic-case-study-455810.tripdata.combined_tripdata`
WHERE (
  EXTRACT(HOUR FROM(ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM(ended_at - started_at)) +
  EXTRACT(SECOND FROM(ended_at - started_at)) / 60) >= 1440;

-- number of bikes which were used for less than a minute
SELECT COUNT(*) AS less_than_a_min
FROM
  `cyclistic-case-study-455810.tripdata.combined_tripdata`
WHERE (
  EXTRACT(HOUR FROM(ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM(ended_at - started_at)) +
  EXTRACT(SECOND FROM(ended_at - started_at)) / 60) <=1;


SELECT DISTINCT start_station_name
FROM
  `cyclistic-case-study-455810.tripdata.combined_tripdata`
ORDER BY start_station_name;

-- total number of rides which are missing start station name or id
SELECT COUNT(*) AS rides_with_start_station_missing
FROM
  `cyclistic-case-study-455810.tripdata.combined_tripdata`
WHERE
  start_station_name IS NULL 
  OR start_station_id IS NULL;


-- total number of rides which are missing end station name or id
SELECT COUNT(*) AS rides_with_end_station_missing
FROM
  `cyclistic-case-study-455810.tripdata.combined_tripdata`
WHERE
  end_station_name IS NULL 
  OR end_station_id IS NULL;

-- types of users and no. of trips they took
SELECT 
  DISTINCT member_casual,
  COUNT(*) AS no_of_trips
FROM
  `cyclistic-case-study-455810.tripdata.combined_tripdata`
GROUP BY 
  member_casual;
