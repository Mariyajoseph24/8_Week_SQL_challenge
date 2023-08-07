<h1>Case Study #3 - Foodie-Fi🫕🥑</h1>
<img width="300" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/abd6c8a0-371d-4c17-8e36-4a22fd894c20">
<h1>Contents</h1>

<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#entityrelationshipdiagram">Entity Relationship Diagram</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>

<ul>
  <li><a href="#a.customerjourney">A. Customer Journey</a></li>
  <li><a href="#b.dataanalysisquestions">B. Data Analysis Questions</a></li>
  <li><a href="#c.challengepaymentquestion">C. Challenge Payment Question</a></li>
  </ul>
  
  <li><a href="#keyinsights">Key Insights</a></li>
</ul>

<h1><a name="introduction">Introduction</a></h1>
<p>In response to the growing popularity of subscription-based businesses, Danny recognized a significant market gap. He saw an opportunity to introduce a distinctive streaming service, one that exclusively featured culinary content—a culinary counterpart to platforms like Netflix. With this vision in mind, Danny collaborated with a group of astute friends to establish Foodie-Fi, a startup launched in 2020. The company quickly began offering monthly and annual subscription plans, granting subscribers unrestricted access to an array of exclusive culinary videos sourced from across the globe.

At the heart of Foodie-Fi's foundation lies Danny's commitment to data-driven decision-making. He was resolute in leveraging data to inform all future investments and innovative features. This case study delves into the realm of subscription-style digital data, where insights derived from data analysis are pivotal in addressing critical business inquiries and steering the company toward sustained growth and success.</p>

<h1><a name="entityrelationshipdiagram"></a>Entity Relationship Diagram</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/82dd908e-38b9-4d7f-a17e-743bc745469d">

<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>
--------------------------------------------------------------------------------------------------------------------------------------------------------------
<h4><a name="a.customerjourney"></a>A. Customer Journey🫕🥑</h4>

<ol> 
  <li><h5>Based off the 8 sample customers provided in the sample from the subscriptions table, write a brief description about each customer’s onboarding journey.</h5></li>

  ```sql
SELECT
    s.customer_id,
    p.plan_name,
    s.start_date
FROM
    subscriptions s
JOIN
    plans p ON s.plan_id = p.plan_id
ORDER BY
    s.customer_id, s.start_date;
```

<h6>Answer:</h6>
<img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/eb8df25b-8606-4bea-9008-e67b15c27a77">
</ol>

<ol>
  <li>
    <strong>Customer 1:</strong>
    <ul>
      <li>Started with a trial plan on 2020-08-01.</li>
      <li>Upgraded to the basic monthly plan on 2020-08-08.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 2:</strong>
    <ul>
      <li>Started with a trial plan on 2020-09-20.</li>
      <li>Upgraded to the pro annual plan on 2020-09-27.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 11:</strong>
    <ul>
      <li>Started with a trial plan on 2020-11-19.</li>
      <li>Downgraded to the churn plan on 2020-11-26.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 13:</strong>
    <ul>
      <li>Started with a trial plan on 2020-12-15.</li>
      <li>Upgraded to the basic monthly plan on 2020-12-22.</li>
      <li>Upgraded to the pro monthly plan on 2021-03-29.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 15:</strong>
    <ul>
      <li>Started with a trial plan on 2020-03-17.</li>
      <li>Upgraded to the pro monthly plan on 2020-03-24.</li>
      <li>Downgraded to the churn plan on 2020-04-29.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 16:</strong>
    <ul>
      <li>Started with a trial plan on 2020-05-31.</li>
      <li>Upgraded to the basic monthly plan on 2020-06-07.</li>
      <li>Upgraded to the pro annual plan on 2020-10-21.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 18:</strong>
    <ul>
      <li>Started with a trial plan on 2020-07-06.</li>
      <li>Upgraded to the pro monthly plan on 2020-07-13.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 19:</strong>
    <ul>
      <li>Started with a trial plan on 2020-06-22.</li>
      <li>Upgraded to the pro monthly plan on 2020-06-29.</li>
      <li>Upgraded to the pro annual plan on 2020-08-29.</li>
    </ul>
  </li>
</ol>
</ol>
-------------------------------------------------------------------------------------------------------------------------------------------------------------

