1. Project Overview

The Bright TV Viewership Analysis project focuses on analyzing audience viewing behavior using structured datasets in a Databricks SQL environment. The goal is to transform raw viewership and demographic data into meaningful insights that can support business decisions around content strategy, scheduling, and audience engagement.

The project combines viewing activity data with user demographic information to provide a comprehensive understanding of who is watching, what they are watching, and when they are most active. The analysis emphasizes time-based trends, audience segmentation, and channel performance.

2. Objectives

The main objectives of this case study are:

Analyze overall viewership trends across different time periods
Identify peak viewing times (hour-of-day and time segments)
Understand audience behavior across User Profile:
Province
Gender
Race
Age 
Determine top-performing channels by time segment and audience group
Provide actionable insights to improve programming and scheduling decisions
Build a scalable SQL-based solution using Databricks

3. Tools & Technologies
    
Databricks SQL (Spark SQL)
Used for data cleaning, transformation, aggregation, and analysis
SQL
Core language used to implement all business logic and calculations
Microsoft Excel / CSV Files
Source format for the datasets
Miro (Optional)
Used for designing data flow and architecture diagrams
Data Visualization Tools (Optional)
Tools such as Power BI or Tableau can be used to present insights

4. Data Sources

The project uses two primary datasets:

4.1 Viewership Dataset

This dataset contains user viewing activity and is the core of the analysis.

Key fields include:

RecordDate2 – Timestamp of viewing (format: dd/MM/yyyy HH)
Channel2 – Channel name watched
Viewing activity records per session

Purpose:

Track when users are watching
Identify viewing patterns and trends
Analyze channel popularity over time

4.2 User Profile Dataset

This dataset provides User profile attributes.

Key fields include:

UserID – Unique identifier
Province – Geographic location
Gender – Gender of the viewer
Race – Race classification
Age – Age of the viewer

Purpose:

Segment audiences
Enable User Profile based analysis
Support targeted insights

4.3 Data Integration

The two datasets are joined using:

UserID (common key)

This integration allows:

Mapping viewing behavior to user profile
Performing grouped analysis across different audience segments

5. Summary
This case study demonstrates how raw data can be transformed into valuable insights using SQL in a modern data platform. By combining time-based analysis with demographic segmentation,
 the project enables Bright TV to better understand its audience and optimize its content strategy.


This case study demonstrates how raw data can be transformed into valuable insights using SQL in a modern data platform. By combining time-based analysis with demographic segmentation, the project enables Bright TV to better understand its audience and optimize its co
