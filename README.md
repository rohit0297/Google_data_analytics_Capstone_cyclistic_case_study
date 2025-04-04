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
We merged 12 csv files 

