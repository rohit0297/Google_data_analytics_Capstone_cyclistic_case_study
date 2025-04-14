# Google data analytics Capstone cyclistic case study
Data driven case study analyzing Cyclistic's bike-share usage to identify strategies for converting casual riders into annual members. This includes data cleaning, analysis and visualization.

## Introduction
This case study explores how Cyclistic, a bike-share program in Chicago, can convert more casual riders into annual members using data-driven insights. By analyzing ride patterns, trip durations, and user behaviors, we'll uncover trends that inform targeted marketing strategies.
In this project we are applying real-world data skills to solve a business challenge. The insights gained here can help shape promotional campaigns, pricing strategies, and overall service improvements.

## Background
### 🚲 Cyclistic
Cyclistic is a bike-share program in Chicago with a fleet of 5,824 bicycles across 692 docking stations. The company offers both single-ride passes and annual memberships. While casual riders (pay-per-ride users) make up a significant portion of trips, annual members provide more consistent revenue.

### Scenario
My role as a Junior Data Analyst at Cyclistic involves helping the marketing team increase annual memberships. We'll analyze how different customer groups use our bikes to develop a targeted marketing strategy. Our findings, supported by strong data and visuals, will be presented to executives for approval.

### Tools used
Excel / Google sheets - Initial data exploration & cleaning
SQL / BigQuery - Data processing & querying
Tableau / Power BI - Dashboards & storytelling

## Ask - Defining the Problem
#### Business Goal: Increase the number of annual members by converting casual riders through data-driven marketing strategies.
#### Key Questions: 
* How do casual riders and annual members use Cyclistic bikes differently?
* What patterns can help target casual riders for membership conversion?
* How can Cyclistic use digital media to influence casual riders to become members?

## Prepare - Collect & Understand the data
#### Data Source: Public Cyclistic trip data [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

WE will be using Cyclistic's historical trip data to analyze and identify trends from April 2024 to March 2025. This is a public data which can be used to explore how different customer types are using Cyclistic bikes.
#### Data Structure:
*  Trip start & end times
*  Ride duration
*  User type (casual rider vs annual member)
*  Start & end station locations
##### Limitations:
*  Data does not include personally identifiable information.
*  External factors like weather or city events are not considered in the dataset.

## Process - Clean & Prepare the Data
Due to limitations of Excel/ google sheet to handle the large amount of data, We have used BigQuery to combine the various datasets into one dataset and clean it.

#### Data Merging
We merged 12 csv files are uploaded in the dataset 'tripdata'. One more table created named 'combined_tripdata', merged all 12 csv files and moved into it. The 'combined_tripdata' contains 5,066,388 rows of data for past 4 quarters. [Data Merging](https://github.com/rohit0297/Google_data_analytics_Capstone_cyclistic_case_study/blob/main/data_merging.sql)

#### Exploratory Data Analysis
We are exploring the data, finding the inconsistencies and cleaning the data. [Exploratory Data Analysis](https://github.com/rohit0297/Google_data_analytics_Capstone_cyclistic_case_study/blob/main/exploratory_data_analysis.sql)

#### Observation
1.  Table below shows all column names and their data types. Here __ride_id__ column is our primary key.

![Image](https://github.com/user-attachments/assets/a10b1998-3570-45bf-a1e0-06aa47dc1833)

2.  The following table shows number of __null_values__ in each column.

![image](https://github.com/user-attachments/assets/d2ef39d0-686a-452f-9b66-0d418e720dad)

Note that some columns share the same number of missing values, which could indicate that the missing data occurs in the same rows—for example, a station’s name and ID missing together, or latitude and longitude missing for the same ending station.

3.  We noticed __ride_id__ has no null values, so we checked for if any duplicates are present.

![image](https://github.com/user-attachments/assets/cb8d9419-60db-407d-b1fd-d7579e04ceab)

No duplicates were found.

4.  __ride_id__ values lenght is 16 so there is no need to clean it.

5.  Found 3 unique types of bikes(__rideable_type__) in the data.

6.  The started_at and ended_at columns indicate the trip's start and end times in the format YYYY-MM-DD hh:mm:ss UTC. A new column, ride_length, can be created to calculate the total trip duration. There are __6096__ trips that last more than a day and __112927__ trips that are either shorter than a minute or have an end time earlier than the start time—these need to be removed. Additionally, the day_of_week and month columns can be useful for analyzing trip patterns across different times of the year.

7.  A total of __961,100__ rows with missing __start_station_name__ and __start_station_id__, and __984,416__ rows missing both __end_station_name__ and __end_station_id__, need to be removed from the dataset.

8.  __member_casual__ column has 2 unique values as member or casual riders.

![image](https://github.com/user-attachments/assets/78509f9b-a6c6-4b75-ae51-22b9c9064284)

9.  The __start_station_id__ and __end_station_id__ columns can be dropped as they don't contribute meaningful insights for the current analysis. While the longitude and latitude columns may not be directly used in the analysis, they can be useful for creating visualizations such as maps.

## Data Cleaning

SQL query's can be found in the [Data Cleaning](https://github.com/rohit0297/Google_data_analytics_Capstone_cyclistic_case_study/blob/main/data_cleaning.sql).

All rows containing missing values have been removed. Additionally, three new columns—ride_length (trip duration), day_of_week, and month—have been added. Trips lasting less than a minute or longer than a day were excluded, resulting in the removal of a total of 1,562,188 rows during this step.

## Analyze and Share

SQL query's can be found in the [Data Analysis](https://github.com/rohit0297/Google_data_analytics_Capstone_cyclistic_case_study/blob/main/data_analysis.sql)

Data viz can be accessed from [Tableau](https://public.tableau.com/views/bike_ride_analysis/BikeTypes?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
