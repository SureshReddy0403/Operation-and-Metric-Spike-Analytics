# Operation-and-Metric-Spike-Analytics
As a Lead Data Analyst, you'll analyze diverse data sets to address company department queries, leveraging advanced SQL skills to enhance operations and explain metric shifts.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
A)Case Study 1: Job Data Analysis
  You will be working with a table named "CaseStudy1 Dataset" with the following columns:
    job_id: Unique identifier of jobs
    actor_id: Unique identifier of actor
    event: The type of event (decision/skip/transfer).
    language: The Language of the content
    time_spent: Time spent to review the job in seconds.
    org: The Organization of the actor
    ds: The date in the format yyyy/mm/dd (stored as text).
Tasks:
  1)Jobs Reviewed Over Time:
    Objective: Calculate the number of jobs reviewed per hour for each day in November 2020.
    Your Task: Write an SQL query to calculate the number of jobs reviewed per hour for each day in November 2020.
  2)Throughput Analysis:
    Objective: Calculate the 7-day rolling average of throughput (number of events per second).
    Your Task: Write an SQL query to calculate the 7-day rolling average of throughput. Additionally, explain whether you prefer using the daily metric or the 7-day rolling average for throughput, and why.
  3)Language Share Analysis:
    Objective: Calculate the percentage share of each language in the last 30 days.
    Your Task: Write an SQL query to calculate the percentage share of each language over the last 30 days.
  4)Duplicate Rows Detection:
    Objective: Identify duplicate rows in the data.
    Your Task: Write an SQL query to display duplicate rows from the "CaseStudy1 Dataset" table.

B)Case Study 2: Investigating Metric Spike
  You will be working with three tables:
    users: Contains one row per user, with descriptive information about that user’s account.
    events: Contains one row per event, where an event is an action that a user has taken (e.g., login, messaging, search).
    email_events: Contains events specific to the sending of emails.
Tasks:
  1)Weekly User Engagement:
    Objective: Measure the activeness of users on a weekly basis.
    Your Task: Write an SQL query to calculate the weekly user engagement.
  2)User Growth Analysis:
    Objective: Analyze the growth of users over time for a product.
    Your Task: Write an SQL query to calculate the user growth for the product.
  3)Weekly Retention Analysis:
    Objective: Analyze the retention of users on a weekly basis after signing up for a product.
    Your Task: Write an SQL query to calculate the weekly retention of users based on their sign-up cohort.
  4)Weekly Engagement Per Device:
    Objective: Measure the activeness of users on a weekly basis per device.
    Your Task: Write an SQL query to calculate the weekly engagement per device.
  5)Email Engagement Analysis:
    Objective: Analyze how users are engaging with the email service.
    Your Task: Write an SQL query to calculate the email engagement metrics.
