<h1>Case Study #8 - Fresh Segments👨🏼‍💻</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/258ce694-8aaf-4575-95d7-8c82a15f145b">
<h1>Contents</h1>

<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>

<ul>
  <li><a href="#a.dataexplorationandcleansing">A. Data Exploration and Cleansing</a></li>
  <li><a href="#b.interestanalysis">B. Interest Analysis</a></li>
  <li><a href="#c.segmentanalysis">C. Segment Analysis</a></li>
</ul>
</ul>

<h1><a name="introduction">Introduction</a></h1>
<p>Discover the transformative journey of Fresh Segments, a pioneering digital marketing agency founded by Danny. By decoding online ad click behavior trends tailored to individual businesses, Fresh Segments empowers companies to understand their customer base like never before.<br>

In this case study, we delve into Fresh Segments' innovative methodology. Clients entrust their customer lists to Fresh Segments, which then compiles and analyzes interest metrics, creating a comprehensive dataset for detailed examination.<br>

The agency's forte lies in unraveling interest composition and rankings for each client, spotlighting the proportions of customers interacting with specific online assets. These insights, presented monthly, offer a holistic view of evolving customer interests.<br>

Danny seeks our expertise in deciphering aggregated metrics for a sample client. Our mission is to distill key insights from this data, shedding light on customer lists and the array of captivating interests. Through this analysis, we illuminate overarching patterns, offering strategic guidance to propel Fresh Segments forward.<br></p>

<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>
----------------------------------------------------------------------------------------------------------------------------------------------------
<h4><a name="a.dataexplorationandcleansing"></a>A. Data Exploration and Cleansing</h4>
<ol> 
  <li><h5>Update the fresh_segments.interest_metrics table by modifying the month_year column to be a date data type with the start of the month</h5></li>

  ```sql
alter table  interest_metrics
drop column month_year
```
```sql
alter table  interest_metrics
add month_year date
```
```sql
UPDATE interest_metrics
SET month_year = TO_DATE(_year || '-' || LPAD(_month::text, 2, '0') || '-01', 'YYYY-MM-DD');
```
```sql
SELECT*
FROM interest_metrics
```
  <h6>Answer:</h6>
  <img width="450" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/7666ff1a-0661-49fa-b578-1e45d8e32eb1">
  
  <li><h5>What is count of records in the fresh_segments.interest_metrics for each month_year value sorted in chronological order (earliest to latest) with the null values appearing first?</h5></li>

  ```sql
SELECT
  month_year,
  COUNT(*) AS record_count
FROM interest_metrics
GROUP BY month_year
ORDER BY month_year NULLS FIRST;

```

   <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/dfbf1e11-fd90-4aeb-964b-392ab512669d">
  
  <li><h5>What do you think we should do with these null values in the fresh_segments.interest_metrics</h5></li>

  ```sql
SELECT month_year, COUNT(*) AS record_count
FROM interest_metrics
WHERE month_year IS NOT NULL
GROUP BY month_year
ORDER BY month_year;
```
   <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/cf287df5-38cc-4069-a535-31ae73e89bc7">
  
  <li><h5>How many interest_id values exist in the fresh_segments.interest_metrics table but not in the fresh_segments.interest_map table? What about the other way around?</h5></li>

  ```sql
SELECT COUNT(DISTINCT im.interest_id) AS count_interest_metrics_not_in_map
FROM interest_metrics im
LEFT JOIN interest_map map ON im.interest_id::integer = map.id
WHERE map.id IS NULL;

```
   <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/f7b5d5eb-8cfc-4c58-ab97-5093f982b253">

  ```sql
SELECT COUNT(DISTINCT map.id) AS count_interest_map_not_in_metrics
FROM interest_map map
LEFT JOIN interest_metrics im ON map.id = im.interest_id::integer
WHERE im.interest_id IS NULL;
```

   <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/638f8715-0afb-4a12-82f2-31ce06c0bbff">
  
  <li><h5>Summarise the id values in the fresh_segments.interest_map by its total record count in this table</h5></li>

  ```sql
SELECT id,interest_name, COUNT(*) AS record_count
FROM interest_map im
join interest_metrics ime on im.id=ime.interest_id::integer
GROUP BY id,interest_name
ORDER BY record_count DESC;
```
   <h6>Answer:</h6>
  <img width="350" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/df329e24-6123-46ae-ba9c-b2b7ae6d3584">
 
  
  <li><h5>What sort of table join should we perform for our analysis and why? Check your logic by checking the rows where interest_id = 21246 in your joined output and include all columns from fresh_segments.interest_metrics and all columns from fresh_segments.interest_map except from the id column.</h5></li>

  ```sql
SELECT
    im.*,
    map.interest_name AS mapped_interest_name,
    map.interest_summary AS mapped_interest_summary,
    map.created_at AS mapped_created_at,
    map.last_modified AS mapped_last_modified
FROM interest_metrics AS im
LEFT JOIN interest_map AS map ON im.interest_id::VARCHAR = map.id::VARCHAR
WHERE im.interest_id = '21246';
```
   <h6>Answer:</h6>
  <img width="800" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/2172c5ad-4c56-496f-b2c8-6fe2c2bada0b">
  
  <li><h5>Are there any records in your joined table where the month_year value is before the created_at value from the fresh_segments.interest_map table? Do you think these values are valid and why?
</h5></li>

```sql
SELECT
    im.*,
    im.month_year AS interest_metrics_month_year,
    map.created_at AS interest_map_created_at
FROM
    interest_metrics AS im
LEFT JOIN
    interest_map AS map
ON
    im.interest_id = map.id::varchar
WHERE
    im.month_year < map.created_at
ORDER BY
    im.interest_id, im.month_year;
```
 <h6>Answer:</h6>
  <img width="800" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/5de42509-a2ce-42e6-a066-0561887d07aa">
