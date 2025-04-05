-- moving all the cleaned data in a new table
CREATE TABLE IF NOT EXISTS `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata` AS (
  SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length, -- calculating ride length 
    FORMAT_DATE('%a', DATE(started_at)) AS day_of_week, -- Extracting day of week
    FORMAT_DATE('%b', DATE(started_at)) AS month, -- Extracting month
    
    start_station_name,
    end_station_name,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
  FROM `cyclistic-case-study-455810.tripdata.combined_tripdata` a
  WHERE
    start_station_name IS NOT NULL AND  --
    end_station_name IS NOT NULL AND    --
    end_lat IS NOT NULL AND             --  Making sure only the cleaned data is being stored in the new table
    end_lng IS NOT NULL AND             --
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >1 AND
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440 
  );


-- setting ride_id as a primary key
ALTER TABLE `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`
ADD PRIMARY KEY (ride_id) NOT ENFORCED;

SELECT
  COUNT(*) AS num_of_rides
FROM
  `cyclistic-case-study-455810.tripdata.cleaned_combined_tripdata`;

SELECT
  COUNT(*) AS num_of_rides
FROM
  `cyclistic-case-study-455810.tripdata.combined_tripdata`;
