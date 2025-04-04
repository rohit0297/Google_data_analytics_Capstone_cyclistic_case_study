-- merging all the 12 months data tables in a single table "combined_tripdata"
CREATE TABLE
  `cyclistic-case-study-455810.tripdata.combined_tripdata` AS (
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202405`
UNION ALL
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202406`
UNION ALL
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202407`
UNION ALL
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202408`
UNION ALL
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202409`
UNION ALL
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202410`
UNION ALL
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202411`
UNION ALL
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202412`
UNION ALL
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202501`
UNION ALL
SELECT * FROM `cyclistic-case-study-455810`.`tripdata`.`tripdata_202502`);


-- Checking number of rows

SELECT COUNT(*) FROM `cyclistic-case-study-455810.tripdata.combined_tripdata`;
