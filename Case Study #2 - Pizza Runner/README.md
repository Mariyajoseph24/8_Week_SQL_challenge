<h1>Case Study #2 Pizza Runner🍕</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8fbb6bcb-31bd-4b7e-8083-07596fdd911d">
<h1>Contents</h1>
<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#entityrelationshipdiagram">Entity Relationship Diagram</a></li>
  <li><a href="#datacleaninganddatatransformation">Data Cleaning & Data Transformation</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>
  
  <ul>
  <li><a href="#a.pizzametrics">A. Pizza Metrics</a></li>
  <li><a href="#b.runnerandcustomerexperience">B. Runner And Customer Experience</a></li>
  <li><a href="#c.ingredientoptimisation">C. Ingredient Optimisation</a></li>
  </ul>
  
  <li><a href="#keyinsights">Key Insights</a></li>
</ul>

<h1><a name="introduction">Introduction</a></h1>
<p>Welcome to the Pizza Runner Case Study! Follow Danny's journey as he combines the irresistible allure of "80s Retro Styling and Pizza Is The Future" to launch Pizza Runner, an innovative venture in the pizza delivery industry. With his background in data science, Danny understands the significance of data collection for business growth. Now, he seeks assistance in cleaning and analyzing the data to optimize Pizza Runner's operations and guide his runners more efficiently. Join us as we explore how data-driven decisions propel Pizza Runner towards success and elevate the pizza delivery experience to new heights.</p>

<h1><a name="entityrelationshipdiagram"></a>Entity Relationship Diagram</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/38cb5eb7-522d-4081-adb5-0b47ac2ef0a8">

<h1><a name="datacleaninganddatatransformation"></a>Data Cleaning & Data Transformation</h1>

<ul>
<li><h5>customer_orders table Before</h5></li>
  <ul>
  <li>The customer_orders table consists of individual pizza orders, with each row representing a unique pizza.</li>
  <li>Key columns in the table are pizza_id, exclusions, and extras.</li>
  <li>Before utilizing the data for queries, the exclusions and extras columns require a data cleaning process to ensure accuracy and consistency.</li>
  <li>Data cleaning involves handling missing or null values in the exclusions and extras columns.</li>
  <li>The ingredient_id values in the exclusions and extras columns need to be standardized for uniformity.</li>
  <li>Inconsistencies and duplicates in the exclusions and extras data should be resolved to eliminate ambiguities.</li>
  <li>By performing thorough data cleaning, the customer_orders table will be optimized for effective analysis.</li>
  <li>The cleaned data will provide valuable insights into customer preferences, enabling better decision-making for Pizza Runner's operations.</li>
  <li>With accurate data, Pizza Runner can efficiently meet customer demands and deliver an enhanced pizza ordering experience.</li>
</ul>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/2ba5364c-d9b5-48f1-bb31-b010a28ad9b6">
<li><h5>customer_orders table After AS customer_order_tempp</h5></li>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/2d344d6f-695f-4128-befe-09d692b7a115">
<li><h5>runner_orders table Before</h5></li>
  <ul>
  <p>The data in the orders table of Pizza Runner contains valuable information regarding the assignment of orders to runners, including pickup times, distances, and durations. However, it is crucial to note that the table may have some known data issues that require careful handling during data cleaning.</p><br>

<p>Here are the key points to consider when cleaning the data in the orders table:</p>

<li>Verify Data Types: Before proceeding with data cleaning, it is essential to check the data types for each column in the schema SQL. Ensuring accurate data types will prevent potential data type mismatches and errors in subsequent queries.</li>

<li>Handle Incomplete Orders: Some orders may not be fully completed and can be canceled by either the restaurant or the customer. It is necessary to identify and properly handle these incomplete orders during the data cleaning process.</li>

<li>Address Null Values: The table may contain null values in certain columns, such as pickup_time, distance, and duration. Properly handling these null values is crucial to avoid inaccuracies in the analysis.</li>

<li>Validate Timestamps: The pickup_time column represents the timestamp when the runner arrives at Pizza Runner headquarters to pick up the pizzas. Validating and ensuring the consistency of these timestamps will be essential to maintain data integrity.</li>

<li>Clean Distance and Duration: The distance and duration fields provide information about the runner's travel to deliver the order. Cleaning these fields involves checking for any outliers or inconsistencies that may affect analysis results.</li>

<li>Address Known Data Issues: As there are known data issues in the table, special attention must be given to resolving these issues during the data cleaning process. Identifying and rectifying data discrepancies will enhance the accuracy and reliability of the dataset.</li>
</ul>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/086a9085-3f8b-4f49-8ef0-101e198f91eb">
<li><h5>runner_orders table After AS runner_orders_temp</h5></li>
<img width="500" alt="Coding" src='https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/16580860-979b-450c-9cd4-c726659995a5'>
</ul>


<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>

<h4><a name="a.pizzametrics"></a>A. Pizza Metrics</h4>
<h4><a name="b.runnerandcustomerexperience"></a>B. Runner And Customer Experience</h4>
<h4><a name="c.ingredientoptimisation"></a>C. Ingredient Optimisation</h4>

<h1><a name="keyinsights"></a>Key Insights</h1>
 

