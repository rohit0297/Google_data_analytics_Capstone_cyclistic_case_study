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
The data has been properly structured and is ready for analysis. I queried several relevant tables and created visualizations using Tableau to support the analysis.
__Analyzing Usage Patterns: A Comparison Between Annual Members and Casual Riders of Cyclistic Bikes__

Initially member and casual riders are compared by the types of bikes they are using.

![Bike Types](https://github.com/user-attachments/assets/87e6d166-293f-4925-8751-b97928aa8be0)

Members make up 62.36% of all users, while casual riders account for the remaining 37.64%. The bike type distribution chart reflects percentages based on the total number of rides. Classic bikes are the most commonly used, followed by electric bikes. electric scooters are the least used and are exclusively ridden by casual users.

Next, the number of trips was analyzed based on their distribution across months, days of the week, and hours of the day.

![Total trips per month_day_hour (2)](https://github.com/user-attachments/assets/b3ec42f6-17b3-426c-9416-6ec090bab15d)

__Months__: Member riders maintain consistently high trip volumes throughout the year, with peaks in summer months (May to September). Casual riders show a sharp increase during summer, especially from May to August, indicating strong seasonal behavior. Both groups show a drop in trips during winter (December–February), likely due to colder weather.
__Days of week__: Members ride more on weekdays (Monday to Friday), especially midweek, indicating commute-based usage. Casual riders prefer weekends (Saturday and Sunday), showing a more recreational or leisure-focused pattern. Both groups see a dip mid-week for casuals and a more even distribution for members across the weekdays.
__Hours of the day__: Member trips spike during traditional commute times: around 8 AM and 5–6 PM, aligning with a workday schedule. Casual users gradually increase usage through the morning, peaking in the afternoon (2 PM–4 PM), reflecting flexible or leisure activities. Minimal activity is observed during late-night and early morning hours for both groups.

Based on the previous observations, it can be inferred that members likely use bikes for commuting during weekdays, while casual riders tend to use them throughout the day, especially on weekends, primarily for leisure. Both groups show peak activity during the spring and summer months.

A comparison of ride durations was conducted to better understand the differing usage patterns of casual riders and members.

![Average ride duration per month_day_hour](https://github.com/user-attachments/assets/c8436db1-1372-47e6-a029-3ba6133e458f)

It is observed that casual riders tend to have longer ride durations on average compared to members. While the average ride length for members remains relatively consistent throughout the year, week, and day, casual riders show notable variations in their cycling behavior. They tend to take longer trips during spring and summer, on weekends, and between 10 a.m. and 2 p.m., suggesting a more leisure-oriented usage pattern. In contrast, shorter trips occur between 5 a.m. and 8 a.m., possibly aligning with early commuting or shorter recreational rides.

These findings suggest that casual riders travel approximately twice as long as members but do so less frequently. Their longer, less routine rides—especially on weekends and during daytime hours in warmer seasons—indicate a recreational purpose, while members likely use the bikes for commuting with consistent and shorter travel times.

To gain deeper insights into usage differences, the starting and ending station locations were analyzed. By filtering for stations with the highest number of trips, several location-based patterns emerged that help distinguish the riding habits of members and casual users.

![Trips starting locations](https://github.com/user-attachments/assets/3a1b6e0d-d4d1-4410-895d-6901fa0735cb)

Casual riders often begin their trips from stations located near museums, parks, beaches, harbors, and aquariums, indicating a preference for recreational and tourist-friendly areas. In contrast, members typically start their journeys from stations situated near universities, residential neighborhoods, restaurants, hospitals, grocery stores, theaters, schools, banks, factories, train stations, parks, and plazas, suggesting more utilitarian and commute-focused usage.

![Trips ending locations](https://github.com/user-attachments/assets/49fdf9f4-e96a-4b74-9763-4e11b49c0b3d)

A similar trend is observed in the ending station locations. Casual riders often conclude their trips near parks, museums, and other recreational destinations, while members typically end their journeys near universities, residential neighborhoods, and commercial areas. This further supports the conclusion that casual riders primarily use bikes for leisure activities, whereas members rely on them more consistently for daily commuting purposes.

#### Summary
|Member|Casual|
|------|------|
|Casual riders prefer using bikes throughout the day, with higher usage on weekends during spring and summer, primarily for leisure activities.|In contrast, members tend to ride bikes on weekdays, particularly during commute hours (around 8 a.m. and 5 p.m.), also peaking in spring and summer, indicating a focus on commuting rather than recreational use.|
|Members ride more frequently, but their trips are shorter, with an average duration about half that of casual riders.|Casual riders have longer trips, traveling twice the duration of members, but they do so less often|
|Begin and end their trips near universities, residential neighborhoods, and commercial zones.|Begin and conclude their trips near parks, museums, coastal areas, and other recreational destinations.|

## Act
After identifying the differences between casual and member riders, targeted marketing strategies can be developed to encourage casual riders to become members.

Recommendations:
1.  Seasonal Marketing Campaigns: Launch campaigns during the spring and summer months at tourist and recreational spots that are popular with casual riders.

2.  Targeted Membership Offers: Since casual riders are most active on weekends and during the warmer months, consider offering seasonal or weekend-only memberships to appeal to their usage patterns.

3.  Incentives for Longer Rides: Given that casual riders tend to use bikes for longer durations, offering discounts for extended rides could encourage both casual riders to extend their trips and entice members to explore longer cycling sessions.
