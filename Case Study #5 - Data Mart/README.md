<h1>Case Study #5 - Data Mart🛒</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/27ccdc75-1219-490c-b68a-195f90458498">
<h1>Contents</h1>

<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#entityrelationshipdiagram">Entity Relationship Diagram</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>

<ul>
  <li><a href="#1.datacleansingsteps">1. Data Cleansing Steps</a></li>
  <li><a href="#2.dataexploration">2. Data Exploration</a></li>
  <li><a href="#3.beforeandafteranalysis">3. Before & After Analysis</a></li>

  </ul>
</ul>

<h1><a name="introduction">Introduction</a></h1>
<p>In the focal point of our case study is Danny's latest enterprise, Data Mart, which emerges following his successful oversight of global operations for an online grocery store specializing in fresh produce. Danny now seeks our collaboration to dissect his sales performance analysis.<br>

In the juncture of June 2020, Data Mart underwent significant supply chain modifications. Embracing sustainability, the company transitioned all its products to employ eco-friendly packaging throughout the entire journey from the farm to the end consumer.<br>

Danny is enlisting our expertise to quantify the ramifications of this alteration on Data Mart's sales performance across its distinct business sectors.<br>

Central to this inquiry are the subsequent pivotal questions:<br>
<ul>
<li>What is the measurable impact resulting from the changes implemented in June 2020?</li><br>
<li>Among platforms, regions, segments, and customer categories, which experienced the most pronounced effects due to these adjustments?</li><br>
<li>How can we strategize for potential future implementations of analogous sustainability enhancements to the business, with the aim of mitigating any adverse consequences on sales?</li><br></p>

<h1><a name="entityrelationshipdiagram"></a>Entity Relationship Diagram</h1>
<img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/ba1afa8c-5fc5-43d4-88d4-4fe2c660ab84">
<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>

<h4><a name="1.datacleansingsteps"></a>1. Data Cleansing Steps📊</h4>
<ol> 
  <li><h5>

<p>In a single query, the following operations are performed to generate a new table named <code>clean_weekly_sales</code> in the <code>data_mart</code> schema:</p>

<ul>
  <li>Convert the <code>week_date</code> to a <code>DATE</code> format</li>
  <li>Add a <code>week_number</code> as the second column for each <code>week_date</code> value, where the week number corresponds to the range of dates within that week</li>
  <li>Add a <code>month_number</code> with the calendar month for each <code>week_date</code> value as the third column</li>
  <li>Add a <code>calendar_year</code> column as the fourth column containing values of 2018, 2019, or 2020 based on the year of the <code>week_date</code></li>
  <li>Add a new column called <code>age_band</code> after the original <code>segment</code> column using predefined mappings for age groups</li>
  <li>Add a new demographic column using the following mapping for the first letter in the segment values</li>
  <li>Ensure all null string values with an "unknown" string value in the original segment column as well as the new age_band and demographic columns</li>
  <li>Generate a new avg_transaction column as the sales value divided by transactions rounded to 2 decimal places for each record</li>
</ul></h5></li>

```sql
DROP TABLE IF EXISTS clean_weekly_sales;
CREATE TABLE clean_weekly_sales AS
SELECT
    TO_DATE(week_date, 'DD/MM/YY') AS week_date,
    DATE_PART('week', TO_DATE(week_date, 'DD/MM/YY')) AS week_number,
    EXTRACT(MONTH FROM TO_DATE(week_date, 'DD/MM/YY')) AS month_number,
    DATE_TRUNC('month', TO_DATE(week_date, 'DD/MM/YY')) AS transaction_month,
    CASE
        WHEN EXTRACT(YEAR FROM TO_DATE(week_date, 'DD/MM/YY')) = 2018 THEN 2018
        WHEN EXTRACT(YEAR FROM TO_DATE(week_date, 'DD/MM/YY')) = 2019 THEN 2019
        WHEN EXTRACT(YEAR FROM TO_DATE(week_date, 'DD/MM/YY')) = 2020 THEN 2020
    END AS calendar_year,
     CASE 
    WHEN RIGHT(segment,1) = '1' THEN 'Young Adults'
    WHEN RIGHT(segment,1) = '2' THEN 'Middle Aged'
    WHEN RIGHT(segment,1) in ('3','4') THEN 'Retirees'
    ELSE 'unknown' END AS age_band,platform,
    CASE
        WHEN LEFT(segment, 1) = 'C' THEN 'Couples'
        WHEN LEFT(segment, 1) = 'F' THEN 'Families'
        ELSE 'unknown'
    END AS demographic,
    COALESCE(NULLIF(segment, ''), 'unknown') AS segment,
    region,
    transactions,
    sales,
    ROUND(sales::NUMERIC / transactions, 2) AS avg_transaction
FROM weekly_sales;

SELECT *
FROM clean_weekly_sales;
```
 <h6>Answer:</h6>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/5c8f38c9-c299-4d52-a870-b2d292c83f2a">
<ul>
  <li>The SQL script begins by creating a new table named <code>clean_weekly_sales</code> by selecting and transforming data from an existing table named <code>weekly_sales</code>.</li>
  <li>Within the <code>SELECT</code> statement, various operations are performed on the <code>week_date</code> column to extract different date-related information like <code>week_number</code>, <code>month_number</code>, <code>transaction_month</code>, and <code>calendar_year</code> based on the year of the <code>week_date</code>.</li>
  <li>Using <code>CASE</code> statements, the <code>age_band</code> column is determined based on the last digit of the <code>segment</code> column.</li>
  <li>Similarly, the <code>demographic</code> column is determined based on the first letter of the <code>segment</code> column.</li>
  <li>The <code>COALESCE</code> function ensures that the <code>segment</code> column is replaced with 'unknown' if it's an empty string.</li>
  <li>Finally, the <code>transactions</code>, <code>sales</code>, and <code>avg_transaction</code> columns are calculated using appropriate formulas.</li>
  <li>After the transformation, the script selects all columns from the newly created <code>clean_weekly_sales</code> table.</li>
  <li>As a result, the <code>clean_weekly_sales</code> table contains transformed and cleaned data from the <code>weekly_sales</code> table with various columns representing date information, age band, demographic, platform, sales metrics, and more.</li>
</ul>
</ol>

<h4><a name="2.dataexploration"></a>2. Data Exploration🤯📊</h4>
<ol>
  <li><h5>What day of the week is used for each week_date value?</h5></li>

  ```sql
SELECT DISTINCT(TO_CHAR(week_date, 'day')) AS day 
FROM clean_weekly_sales;
```
  <h6>Answer:</h6>
  <img width="100" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/7979aa79-bb6b-443b-b6b1-d6093575c289">
  <ul>
  <li>The SQL query selects distinct weekdays from the <code>clean_weekly_sales</code> table.</li>
  <li>The <code>TO_CHAR</code> function is used to format the <code>week_date</code> column as a weekday string.</li>
  <li>The format 'day' specifies that only the name of the day of the week should be extracted.</li>
  <li>The result is a list of unique weekday names present in the <code>week_date</code> column of the <code>clean_weekly_sales</code> table.</li>
</ul>

  
  <li><h5>What range of week numbers are missing from the dataset?</h5></li>

  ```sql
WITH week_number_cte AS (
    SELECT GENERATE_SERIES(1, 52) AS week_num
)
SELECT DISTINCT w.week_num
FROM week_number_cte AS w
LEFT JOIN clean_weekly_sales AS s
    ON w.week_num = s.week_number
WHERE s.week_number IS NULL
ORDER BY w.week_num;
```

  <h6>Answer:</h6>
  <img width="100" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/ccad3c23-842b-41bb-abec-412bf6439f91">
  <ul>
  <li>The SQL query uses a common table expression (CTE) named <code>week_number_cte</code> to generate a series of week numbers from 1 to 52.</li>
  <li>The <code>GENERATE_SERIES</code> function is used to create a sequence of numbers within the specified range.</li>
  <li>The main <code>SELECT</code> statement then selects distinct <code>week_num</code> values from the <code>week_number_cte</code> CTE.</li>
  <li>A <code>LEFT JOIN</code> is performed between the <code>week_number_cte</code> CTE and the <code>clean_weekly_sales</code> table on the condition that the <code>week_num</code> matches the <code>week_number</code> column in the sales data.</li>
  <li>The <code>WHERE</code> clause filters rows where the <code>week_number</code> in the sales data is <code>NULL</code>, indicating missing data for that week.</li>
  <li>The result is a list of week numbers that are missing data in the <code>clean_weekly_sales</code> table.</li>
  <li>The list is ordered in ascending order of week numbers.</li>
</ul>

  
  <li><h5>How many total transactions were there for each year in the dataset?</h5></li>

  ```sql
SELECT calendar_year, SUM(transactions) AS total_transactions
FROM clean_weekly_sales
GROUP BY calendar_year
ORDER BY calendar_year;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/e4e02db3-2fdd-4727-9cc8-7ec81d99b8c4">
  <ul>
  <li>The SQL query selects the <code>calendar_year</code> and calculates the total number of transactions for each calendar year from the <code>clean_weekly_sales</code> table.</li>
  <li>The <code>SUM</code> function is used to add up the <code>transactions</code> values for each year.</li>
  <li>The results are grouped by the <code>calendar_year</code> column.</li>
  <li>The <code>ORDER BY</code> clause sorts the results in ascending order based on the <code>calendar_year</code>.</li>
  <li>The outcome is a list that displays the total number of transactions for each calendar year present in the <code>clean_weekly_sales</code> table.</li>
</ul>

  
  <li><h5>What is the total sales for each region for each month?</h5></li>

  ```sql
SELECT region, SUM(sales) AS total_sales
FROM clean_weekly_sales
WHERE month_number=7
GROUP BY region
ORDER BY region;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/44f582a6-db59-40df-aaeb-91cd768d8246">
  <ul>
  <li>The SQL query selects the <code>region</code> and calculates the total sales for each region from the <code>clean_weekly_sales</code> table.</li>
  <li>The <code>SUM</code> function is used to add up the <code>sales</code> values for each region.</li>
  <li>The <code>WHERE</code> clause filters the rows to include only data where the <code>month_number</code> is 7, indicating July.</li>
  <li>The results are grouped by the <code>region</code> column.</li>
  <li>The <code>ORDER BY</code> clause sorts the results in ascending order based on the <code>region</code>.</li>
  <li>The outcome is a list that displays the total sales for each region in the month of July from the <code>clean_weekly_sales</code> table.</li>
</ul>

  
  <li><h5>What is the total count of transactions for each platform</h5></li>

  ```sql
SELECT platform, SUM(transactions) AS total_transactions
FROM clean_weekly_sales
GROUP BY platform
ORDER BY platform;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/cd1ea6cb-0cae-441a-bb43-373c43fb6c45">
  <ul>
  <li>The SQL query selects the <code>platform</code> column and calculates the total number of transactions for each platform from the <code>clean_weekly_sales</code> table.</li>
  <li>The <code>SUM</code> function is used to add up the <code>transactions</code> values for each platform.</li>
  <li>The results are grouped by the <code>platform</code> column.</li>
  <li>The <code>ORDER BY</code> clause sorts the results in ascending order based on the <code>platform</code>.</li>
  <li>The outcome is a list that displays the total number of transactions for each platform in the <code>clean_weekly_sales</code> table.</li>
</ul>

  
  <li><h5>What is the percentage of sales for Retail vs Shopify for each month?</h5></li>

  ```sql
WITH monthly_platform_sales AS (
  SELECT 
    calendar_year, 
    month_number, 
    platform, 
    SUM(sales) AS monthly_sales
  FROM clean_weekly_sales
  GROUP BY calendar_year, month_number, platform
)

SELECT 
  calendar_year, 
  month_number, 
  ROUND(100 * SUM(CASE WHEN platform = 'Retail' THEN monthly_sales ELSE 0 END) / SUM(monthly_sales), 2) AS retail_percentage,
  ROUND(100 * SUM(CASE WHEN platform = 'Shopify' THEN monthly_sales ELSE 0 END) / SUM(monthly_sales), 2) AS shopify_percentage
FROM monthly_platform_sales
GROUP BY calendar_year, month_number
ORDER BY calendar_year, month_number;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/3a646eaa-5d9d-48c7-b23d-f8c943e567e5">
  <ul>
  <li>The SQL query first creates a Common Table Expression (CTE) named <code>monthly_platform_sales</code>.</li>
  <li>In the CTE, the query calculates the total monthly sales for each combination of <code>calendar_year</code>, <code>month_number</code>, and <code>platform</code> from the <code>clean_weekly_sales</code> table using the <code>SUM</code> function.</li>
  <li>The results are grouped by <code>calendar_year</code>, <code>month_number</code>, and <code>platform</code>.</li>
  <li>The main part of the query selects data from the <code>monthly_platform_sales</code> CTE.</li>
  <li>It calculates the percentage of retail sales by dividing the sum of monthly sales from the 'Retail' platform by the total monthly sales, multiplied by 100. The <code>ROUND</code> function is used to round the result to two decimal places.</li>
  <li>Similarly, it calculates the percentage of Shopify sales by dividing the sum of monthly sales from the 'Shopify' platform by the total monthly sales, multiplied by 100.</li>
  <li>The results are grouped by <code>calendar_year</code> and <code>month_number</code>.</li>
  <li>The <code>ORDER BY</code> clause sorts the results in ascending order based on <code>calendar_year</code> and <code>month_number</code>.</li>
  <li>The outcome is a table that displays the percentage of retail and Shopify sales for each month and calendar year based on the data from the <code>clean_weekly_sales</code> table.</li>
</ul>

  
  <li><h5>What is the percentage of sales by demographic for each year in the dataset?</h5></li>

  ```sql
WITH yearly_demographic_sales AS (
    SELECT 
        calendar_year, 
        demographic,
        SUM(sales) AS yearly_sales
    FROM clean_weekly_sales
    GROUP BY calendar_year, demographic
)

SELECT 
    calendar_year,
    demographic,
    ROUND(100 * yearly_sales / SUM(yearly_sales) OVER (PARTITION BY calendar_year), 2) AS sales_percentage
FROM yearly_demographic_sales
ORDER BY calendar_year, demographic;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/5d1c7183-1c2b-4da6-b377-ea5103fe1a4a">
  <ul>
  <li>The SQL query creates a Common Table Expression (CTE) named <code>yearly_demographic_sales</code>.</li>
  <li>In the CTE, the query calculates the total yearly sales for each combination of <code>calendar_year</code> and <code>demographic</code> from the <code>clean_weekly_sales</code> table using the <code>SUM</code> function.</li>
  <li>The results are grouped by <code>calendar_year</code> and <code>demographic</code>.</li>
  <li>The main part of the query selects data from the <code>yearly_demographic_sales</code> CTE.</li>
  <li>It calculates the sales percentage for each demographic in a given year by dividing the yearly sales for that demographic by the total yearly sales for the same year, multiplied by 100. The <code>ROUND</code> function is used to round the result to two decimal places.</li>
  <li>The <code>SUM(yearly_sales) OVER (PARTITION BY calendar_year)</code> calculates the total yearly sales for each year and is used as the denominator for calculating the percentage.</li>
  <li>The results are displayed with columns for <code>calendar_year</code>, <code>demographic</code>, and <code>sales_percentage</code>.</li>
  <li>The results are ordered in ascending order based on <code>calendar_year</code> and <code>demographic</code>.</li>
</ul>

  
  <li><h5>Which age_band and demographic values contribute the most to Retail sales?</h5></li>

  ```sql
SELECT 
  age_band, 
  demographic, 
  SUM(sales) AS retail_sales
FROM clean_weekly_sales
WHERE platform = 'Retail'
GROUP BY age_band, demographic
ORDER BY retail_sales DESC;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/2178524a-a18d-4557-b298-4384d9007462">
  <ul>
  <li>The SQL query selects data from the <code>clean_weekly_sales</code> table.</li>
  <li>It retrieves the columns <code>age_band</code> and <code>demographic</code> along with the calculated sum of <code>sales</code> as <code>retail_sales</code>.</li>
  <li>The query filters the data to include only rows where the <code>platform</code> is 'Retail' using the <code>WHERE</code> clause.</li>
  <li>The results are grouped by <code>age_band</code> and <code>demographic</code> using the <code>GROUP BY</code> clause.</li>
  <li>The calculated sum of <code>sales</code> for each group is displayed as <code>retail_sales</code>.</li>
  <li>The results are ordered in descending order based on <code>retail_sales</code> using the <code>ORDER BY</code> clause with the <code>DESC</code> keyword.</li>
</ul>

  
  <li><h5>Can we use the avg_transaction column to find the average transaction size for each year for Retail vs Shopify?</h5></li>

  ```sql
SELECT 
    calendar_year,
    platform,
    AVG(avg_transaction) AS average_transaction_size
FROM clean_weekly_sales
GROUP BY calendar_year, platform
ORDER BY calendar_year, platform;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/770f621c-55f4-406f-8940-4ab8baacc0f1">
  <ul>
  <li>The SQL query selects data from the <code>clean_weekly_sales</code> table.</li>
  <li>It retrieves the columns <code>calendar_year</code> and <code>platform</code> along with the calculated average of <code>avg_transaction</code> as <code>average_transaction_size</code>.</li>
  <li>The query calculates the average transaction size using the <code>AVG</code> function on the <code>avg_transaction</code> column.</li>
  <li>The results are grouped by <code>calendar_year</code> and <code>platform</code> using the <code>GROUP BY</code> clause.</li>
  <li>The calculated average transaction size for each group is displayed as <code>average_transaction_size</code>.</li>
  <li>The results are ordered in ascending order based on <code>calendar_year</code> and <code>platform</code> using the <code>ORDER BY</code> clause.</li>
</ul>
</ol>

<h4><a name="3.beforeandafteranalysis"></a>3. Before & After Analysis📈📉</h4>
<ol>
  <li><h5>This technique is usually used when we inspect an important event and want to inspect the impact before and after a certain point in time.

Taking the week_date value of 2020-06-15 as the baseline week where the Data Mart sustainable packaging changes came into effect.

We would include all week_date values for 2020-06-15 as the start of the period after the change and the previous week_date values would be before

Using this analysis approach - answer the following questions:
<ol>
<li>What is the total sales for the 4 weeks before and after 2020-06-15? What is the growth or reduction rate in actual values and percentage of sales?</h5></li>

```sql
   WITH CTE AS (
    SELECT 
        week_date, 
        week_number, 
        SUM(sales) AS totl_sales
    FROM clean_weekly_sales
    WHERE (week_number BETWEEN 21 AND 28) 
        AND (EXTRACT(YEAR FROM week_date) = 2020)
    GROUP BY week_date, week_number
),
CTE2 AS (
    SELECT 
        SUM(CASE 
            WHEN week_number BETWEEN 21 AND 24 THEN totl_sales END) AS before_sales,
        SUM(CASE 
            WHEN week_number BETWEEN 25 AND 28 THEN totl_sales END) AS after_sales
    FROM CTE
)

SELECT 
    after_sales - before_sales AS sales_va, 
    ROUND(100 * 
        (after_sales - before_sales) 
        / before_sales, 2) AS variance_percent
FROM CTE2;
```

<h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/e03860bc-a44f-4eba-8651-99252edeeffc">
  <ul>
  <li>The SQL query uses two Common Table Expressions (CTEs) to perform calculations on the <code>clean_weekly_sales</code> table.</li>
  <li>The first CTE named <code>CTE</code> calculates the total sales for each week within the specified range (week numbers 21 to 28) of the year 2020.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>week_date</code> and <code>week_number</code>.</li>
  <li>The second CTE named <code>CTE2</code> further processes the data from the <code>CTE</code>.</li>
  <li>It calculates the sum of total sales for the weeks before (week numbers 21 to 24) and after (week numbers 25 to 28) the specified range.</li>
  <li>The main query calculates the variance in sales between the "after" and "before" periods by subtracting the <code>before_sales</code> from the <code>after_sales</code>.</li>
  <li>The query also calculates the percentage variance by dividing the variance by the <code>before_sales</code> and then multiplying by 100. It rounds the percentage to 2 decimal places using the <code>ROUND</code> function.</li>
  <li>The calculated sales variance and percentage variance are displayed as <code>sales_va</code> and <code>variance_percent</code>, respectively.</li>
</ul>

  
<li><h5>What about the entire 12 weeks before and after?</li></ol></h5></li>

```sql
WITH packaging_sales AS (
    SELECT 
        week_date, 
        week_number, 
        SUM(sales) AS total_sales
    FROM clean_weekly_sales
    WHERE week_date >= '2020-04-06' AND week_date <= '2020-07-05' -- Include 12 weeks before and after
    GROUP BY week_date, week_number
),
before_after_changes AS (
    SELECT 
        SUM(CASE 
            WHEN week_date >= '2020-04-06' AND week_date <= '2020-06-07' THEN total_sales END) AS before_packaging_sales,
        SUM(CASE 
            WHEN week_date >= '2020-06-15' AND week_date <= '2020-08-02' THEN total_sales END) AS after_packaging_sales
    FROM packaging_sales
)

SELECT 
    after_packaging_sales - before_packaging_sales AS sales_variance, 
    ROUND(100 * 
        (after_packaging_sales - before_packaging_sales) 
        / before_packaging_sales, 2) AS variance_percentage
FROM before_after_changes;
```
<h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/0ae5ef49-65de-4ceb-8217-223c2159b138">
  <ul>
  <li>The SQL query consists of two Common Table Expressions (CTEs) to perform calculations on the <code>clean_weekly_sales</code> table.</li>
  <li>The first CTE named <code>packaging_sales</code> calculates the total sales for each week within a specific date range, including 12 weeks before and after a central period.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>week_date</code> and <code>week_number</code>.</li>
  <li>The second CTE named <code>before_after_changes</code> further processes the data from the <code>packaging_sales</code>.</li>
  <li>It calculates the sum of total sales for the weeks before the central period (weeks from '2020-04-06' to '2020-06-07') and after the central period (weeks from '2020-06-15' to '2020-08-02').</li>
  <li>The main query calculates the variance in sales between the "after" and "before" periods by subtracting the <code>before_packaging_sales</code> from the <code>after_packaging_sales</code>.</li>
  <li>The query also calculates the percentage variance by dividing the variance by the <code>before_packaging_sales</code> and then multiplying by 100. It rounds the percentage to 2 decimal places using the <code>ROUND</code> function.</li>
  <li>The calculated sales variance and percentage variance are displayed as <code>sales_variance</code> and <code>variance_percentage</code>, respectively.</li>
</ul>
</ol>

  

  



