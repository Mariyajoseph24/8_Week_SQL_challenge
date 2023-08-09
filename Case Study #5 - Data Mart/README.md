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
  <li><a href="3.before&afternalysis">3. Before & After Analysis</a></li>

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
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/ba1afa8c-5fc5-43d4-88d4-4fe2c660ab84">
<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>
-------------------------------------------------------------------------------------------------------------------------------------------------------
<h4><a name="1.datacleansingsteps"></a>1. Data Cleansing Steps</h4>
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
</ul>


</h5></li>
