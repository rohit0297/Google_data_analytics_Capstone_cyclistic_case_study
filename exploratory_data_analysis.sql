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

