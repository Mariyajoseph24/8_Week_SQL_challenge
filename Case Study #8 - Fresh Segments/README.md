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
  <ul>
  <li><strong>Drop Column Command:</strong> Removes the <code>month_year</code> column from the <code>interest_metrics</code> table.</li>
  
  <li><strong>Alter Table - Add Column Command:</strong> Adds a new <code>month_year</code> column of type <code>DATE</code> to the <code>interest_metrics</code> table.</li>
  
  <li><strong>Update Command:</strong> Updates the <code>month_year</code> column for existing records in the <code>interest_metrics</code> table. It calculates the <code>month_year</code> value based on <code>_year</code> and <code>_month</code> variables using the <code>TO_DATE</code> function.</li>
  
  <li><strong>Select All Records Command:</strong> Retrieves and displays all records from the <code>interest_metrics</code> table, presumably to view the changes made.</li>
</ul>

  
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
  <ul>
  <li><strong>Select Command:</strong> Retrieves data from the <code>interest_metrics</code> table.</li>
  
  <li><strong>Columns Selected:</strong>
    <ul>
      <li><code>month_year</code>: Represents the month and year of the records.</li>
      <li><code>COUNT(*)</code>: Calculates the number of records for each <code>month_year</code>.</li>
    </ul>
  </li>
  
  <li><strong>Group By Clause:</strong> Groups the records based on the <code>month_year</code> column.</li>
  
  <li><strong>Order By Clause:</strong> Arranges the results in ascending order of <code>month_year</code>. Records with NULL <code>month_year</code> values are listed first (NULLS FIRST).</li>
</ul>

  
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
  <ul>
  <li><strong>Select Command:</strong> Retrieves data from the <code>interest_metrics</code> table.</li>
  
  <li><strong>Columns Selected:</strong>
    <ul>
      <li><code>month_year</code>: Represents the month and year of the records.</li>
      <li><code>COUNT(*)</code>: Calculates the number of records for each <code>month_year</code>.</li>
    </ul>
  </li>
  
  <li><strong>Where Clause:</strong> Filters out records where <code>month_year</code> is not NULL.</li>
  
  <li><strong>Group By Clause:</strong> Groups the non-null records based on the <code>month_year</code> column.</li>
  
  <li><strong>Order By Clause:</strong> Arranges the results in ascending order of <code>month_year</code>.</li>
</ul>

  
  <li><h5>How many interest_id values exist in the fresh_segments.interest_metrics table but not in the fresh_segments.interest_map table? What about the other way around?</h5></li>

  ```sql
SELECT COUNT(DISTINCT im.interest_id) AS count_interest_metrics_not_in_map
FROM interest_metrics im
LEFT JOIN interest_map map ON im.interest_id::integer = map.id
WHERE map.id IS NULL;

```
   <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/f7b5d5eb-8cfc-4c58-ab97-5093f982b253">
  <ul>
  <li><strong>Select Command:</strong> Retrieves data from the <code>interest_metrics</code> table.</li>
  
  <li><strong>Columns Selected:</strong>
    <ul>
      <li><code>COUNT(DISTINCT im.interest_id)</code>: Counts the number of distinct <code>interest_id</code> values that are not present in the <code>interest_map</code> table.</li>
    </ul>
  </li>
  
  <li><strong>Join:</strong> Performs a left join between <code>interest_metrics</code> and <code>interest_map</code> using the <code>interest_id</code> and <code>id</code> columns.</li>
  
  <li><strong>Where Clause:</strong> Filters out rows where the <code>id</code> column in the <code>interest_map</code> table is NULL, indicating that the <code>interest_id</code> is not found in the map.</li>
</ul>


  ```sql
SELECT COUNT(DISTINCT map.id) AS count_interest_map_not_in_metrics
FROM interest_map map
LEFT JOIN interest_metrics im ON map.id = im.interest_id::integer
WHERE im.interest_id IS NULL;
```

   <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/638f8715-0afb-4a12-82f2-31ce06c0bbff">
  <ul>
  <li><strong>Select Command:</strong> Retrieves data from the <code>interest_map</code> table.</li>
  
  <li><strong>Columns Selected:</strong>
    <ul>
      <li><code>COUNT(DISTINCT map.id)</code>: Counts the number of distinct <code>id</code> values that are not present in the <code>interest_metrics</code> table.</li>
    </ul>
  </li>
  
  <li><strong>Join:</strong> Performs a left join between <code>interest_map</code> and <code>interest_metrics</code> using the <code>id</code> and <code>interest_id</code> columns.</li>
  
  <li><strong>Where Clause:</strong> Filters out rows where the <code>interest_id</code> column in the <code>interest_metrics</code> table is NULL, indicating that the <code>id</code> is not found in the metrics.</li>
</ul>

  
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
  <ul>
  <li><strong>Select Command:</strong> Retrieves data from the <code>interest_map</code> and <code>interest_metrics</code> tables.</li>
  
  <li><strong>Columns Selected:</strong>
    <ul>
      <li><code>id</code>: The unique identifier of the interest in the <code>interest_map</code> table.</li>
      <li><code>interest_name</code>: The name of the interest in the <code>interest_map</code> table.</li>
      <li><code>COUNT(*)</code>: Calculates the count of records.</li>
      <li><code>AS record_count</code>: Renames the count column as <code>record_count</code>.</li>
    </ul>
  </li>
  
  <li><strong>Join:</strong> Performs an inner join between <code>interest_map</code> and <code>interest_metrics</code> using the <code>id</code> and <code>interest_id</code> columns.</li>
  
  <li><strong>Group By:</strong> Groups the result set by <code>id</code> and <code>interest_name</code>.</li>
  
  <li><strong>Order By:</strong> Orders the results in descending order based on the <code>record_count</code> column.</li>
</ul>

 
  
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
  <ul>
  <li><strong>Select Command:</strong> Retrieves data from the <code>interest_metrics</code> and <code>interest_map</code> tables.</li>
  
  <li><strong>Columns Selected:</strong>
    <ul>
      <li><code>im.*</code>: Selects all columns from the <code>interest_metrics</code> table.</li>
      <li><code>map.interest_name AS mapped_interest_name</code>: Retrieves the <code>interest_name</code> column from the <code>interest_map</code> table and aliases it as <code>mapped_interest_name</code>.</li>
      <li><code>map.interest_summary AS mapped_interest_summary</code>: Retrieves the <code>interest_summary</code> column from the <code>interest_map</code> table and aliases it as <code>mapped_interest_summary</code>.</li>
      <li><code>map.created_at AS mapped_created_at</code>: Retrieves the <code>created_at</code> column from the <code>interest_map</code> table and aliases it as <code>mapped_created_at</code>.</li>
      <li><code>map.last_modified AS mapped_last_modified</code>: Retrieves the <code>last_modified</code> column from the <code>interest_map</code> table and aliases it as <code>mapped_last_modified</code>.</li>
    </ul>
  </li>
  
  <li><strong>Join:</strong> Performs a left join between <code>interest_metrics</code> and <code>interest_map</code> using the <code>interest_id</code> and <code>id</code> columns, casting both to <code>VARCHAR</code> for comparison.</li>
  
  <li><strong>Where:</strong> Filters the result to only include rows where <code>interest_id</code> is equal to '21246'.</li>
</ul>

  
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
  <ul>
  <li><strong>Select Command:</strong> Retrieves data from the <code>interest_metrics</code> and <code>interest_map</code> tables.</li>
  
  <li><strong>Columns Selected:</strong>
    <ul>
      <li><code>im.*</code>: Selects all columns from the <code>interest_metrics</code> table.</li>
      <li><code>im.month_year AS interest_metrics_month_year</code>: Aliases the <code>month_year</code> column from <code>interest_metrics</code> table as <code>interest_metrics_month_year</code>.</li>
      <li><code>map.created_at AS interest_map_created_at</code>: Retrieves the <code>created_at</code> column from the <code>interest_map</code> table and aliases it as <code>interest_map_created_at</code>.</li>
    </ul>
  </li>
  
  <li><strong>Join:</strong> Performs a left join between <code>interest_metrics</code> and <code>interest_map</code> using the <code>interest_id</code> column from <code>interest_metrics</code> and casting <code>id</code> to <code>VARCHAR</code> for comparison.</li>
  
  <li><strong>Where:</strong> Filters the result to only include rows where <code>month_year</code> from <code>interest_metrics</code> is less than <code>created_at</code> from <code>interest_map</code>.</li>
  
  <li><strong>Order By:</strong> Orders the results first by <code>interest_id</code> and then by <code>month_year</code> in ascending order.</li>
</ul>
</ol>
-----------------------------------------------------------------------------------------------------------------------------------------
<h4><a name="b.interestanalysis"></a>B. Interest Analysis</h4>
<ol>
  <li><h5>Which interests have been present in all month_year dates in our dataset?</h5></li>

  ```sql
SELECT DISTINCT interest_id
FROM interest_metrics 
GROUP BY interest_id
HAVING COUNT(DISTINCT month_year) = (SELECT COUNT(DISTINCT month_year) FROM interest_metrics);
```
   <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/09507e1c-1a7f-4bc0-8f8c-cd9eb183abff">
  <ul>
  <li><strong>Select Command:</strong> Retrieves distinct <code>interest_id</code> values from the <code>interest_metrics</code> table.</li>
  
  <li><strong>Distinct:</strong> Ensures that only unique <code>interest_id</code> values are selected.</li>
  
  <li><strong>Group By:</strong> Groups the data in the <code>interest_metrics</code> table by <code>interest_id</code>.</li>
  
  <li><strong>Having Clause:</strong> Filters the grouped results to include only those groups where the count of distinct <code>month_year</code> values is equal to the total count of distinct <code>month_year</code> values in the entire <code>interest_metrics</code> table.</li>
  
  <li><strong>Subquery:</strong> The subquery <code>(SELECT COUNT(DISTINCT month_year) FROM interest_metrics)</code> calculates the total count of distinct <code>month_year</code> values in the <code>interest_metrics</code> table.</li>
</ul>

  
  <li><h5>Using this same total_months measure - calculate the cumulative percentage of all records starting at 14 months - which total_months value passes the 90% cumulative percentage value?</h5></li>

  ```sql
WITH MonthlyInterestCounts AS (
    SELECT interest_id, COUNT(DISTINCT month_year) AS month_count
    FROM interest_metrics
    GROUP BY interest_id
),
InterestCumulativePercentage AS (
    SELECT
        month_count,
        COUNT(interest_id) AS interest_count,
        SUM(COUNT(interest_id)) OVER (ORDER BY month_count DESC) AS total_interest_count
    FROM MonthlyInterestCounts
    GROUP BY month_count
)
SELECT
    month_count,
    total_interest_count,
    ROUND(total_interest_count * 100.0 / (SELECT SUM(interest_count) FROM InterestCumulativePercentage), 2) AS cumulative_percent
FROM InterestCumulativePercentage
WHERE ROUND(total_interest_count * 100.0 / (SELECT SUM(interest_count) FROM InterestCumulativePercentage), 2) > 90;
```
  <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/0fd8c0e6-7122-4e7f-ac96-0b3ac8ae02c1">
  <ul>
  <li><strong>Common Table Expressions (CTEs):</strong></li>
  <ul>
    <li><strong><code>MonthlyInterestCounts:</code></strong> Calculates the count of distinct <code>month_year</code> values for each <code>interest_id</code> from the <code>interest_metrics</code> table.</li>
    <li><strong><code>InterestCumulativePercentage:</code></strong> Computes the cumulative percentage of interests based on the count of <code>interest_id</code>s and their <code>month_count</code>. It uses a window function to calculate the cumulative sum of <code>interest_count</code>.</li>
  </ul>
  
  <li><strong>Main Query:</strong></li>
  <ul>
    <li><strong><code>month_count:</code></strong> Represents the number of distinct <code>month_year</code> values for each <code>interest_id</code>.</li>
    <li><strong><code>total_interest_count:</code></strong> Shows the total count of <code>interest_id</code>s considered up to the current <code>month_count</code> in descending order.</li>
    <li><strong><code>cumulative_percent:</code></strong> Calculates the cumulative percentage of <code>interest_id</code>s based on the <code>total_interest_count</code> and the total sum of <code>interest_count</code> from the <code>InterestCumulativePercentage</code> CTE.</li>
    <li><strong><code>WHERE:</code></strong> Filters the results to include only rows where the calculated cumulative percentage is greater than 90.</li>
  </ul>
</ul>

  
  <li><h5>If we were to remove all interest_id values which are lower than the total_months value we found in the previous question - how many total data points would we be removing?</h5></li>

  ```sql
WITH InterestMonthsCounts AS (
    SELECT interest_id, COUNT(DISTINCT month_year) AS month_count
    FROM interest_metrics
    GROUP BY interest_id
),
TotalMonths AS (
    SELECT MAX(month_count) AS total_months
    FROM InterestMonthsCounts
)
SELECT SUM(imc.month_count) AS total_data_points_to_keep,
       (SELECT COUNT(*) FROM interest_metrics) - SUM(imc.month_count) AS total_data_points_removed
FROM InterestMonthsCounts imc
JOIN TotalMonths tm ON imc.month_count >= tm.total_months;
```
  <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/e89487bf-8087-406f-892b-bd876016f781">
  <ul>
  <li><strong>Common Table Expressions (CTEs):</strong></li>
  <ul>
    <li><strong><code>InterestMonthsCounts:</code></strong> Calculates the count of distinct <code>month_year</code> values for each <code>interest_id</code> from the <code>interest_metrics</code> table using the <code>COUNT</code> and <code>GROUP BY</code> aggregation.</li>
    <li><strong><code>TotalMonths:</code></strong> Determines the maximum <code>month_count</code> from the <code>InterestMonthsCounts</code> CTE as the <code>total_months</code>.</li>
  </ul>
  
  <li><strong>Main Query:</strong></li>
  <ul>
    <li><strong><code>total_data_points_to_keep:</code></strong> Calculates the total count of data points to keep, which is the sum of <code>month_count</code> values from the <code>InterestMonthsCounts</code> CTE.</li>
    <li><strong><code>total_data_points_removed:</code></strong> Computes the total count of data points to be removed, which is the difference between the total count of data points in the <code>interest_metrics</code> table and the sum of <code>month_count</code> values from the <code>InterestMonthsCounts</code> CTE.</li>
    <li><strong><code>JOIN:</code></strong> Joins the <code>InterestMonthsCounts</code> CTE with the <code>TotalMonths</code> CTE based on the condition that <code>month_count</code> in <code>InterestMonthsCounts</code> is greater than or equal to <code>total_months</code> in <code>TotalMonths</code>.</li>
  </ul>
</ul>
</ol>
------------------------------------------------------------------------------------------------------------------------------------------------


