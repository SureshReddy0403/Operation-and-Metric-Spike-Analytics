CREATE DATABASE job_case; 
use job_case; 
CREATE TABLE job_data 
(
    ds DATE,
    job_id INT NOT NULL,
    actor_id INT NOT NULL,
    `event` VARCHAR(15) NOT NULL,
    `language` VARCHAR(15) NOT NULL,
    time_spent INT NOT NULL,
    org CHAR(2)
);
INSERT INTO job_data(ds,job_id,actor_id,event,language,time_spent,org)
VALUES('2020-11-30','21','1001','skip','English','15','A'),
('2020-11-30','22','1006','transfer','Arabic','25','B'),
('2020-11-29','23','1003','decision','Persian','20','C'),
('2020-11-28','23','1005','transfer','Persian','22','D'),
('2020-11-28','25','1002','decision','Hindi','11','B'),
('2020-11-27','11','1007','decision','French','104','D'),
('2020-11-26','23','1004','skip','Persian','56','A'),
('2020-11-25','20','1003','transfer','Italian','45','C'); 

drop database job_case;
/*-------------------------------------------------------------CASE STUDY-1 TASK-1---------------------------------------------------------*/
select distinct ds AS dates,
(SUM(time_spent) / 3600) AS time_spent_in_hours,
round(count(job_id)/(SUM(time_spent) / 3600)) AS jobs_reviewed_per_day_per_hour
from job_data  
Group by DATES;

/*--------------------------------------------------------------CASE STUDY-1 TASK-2------------------------------------------------------*/
SELECT ds AS dates,
COUNT(event) / SUM(time_spent) AS daily_metric,
AVG(COUNT(event) / SUM(time_spent)) over (order by ds rows between 6 preceding and current row) AS 7_day_rolling_throughput
from job_data
group by ds order by ds;

/*---------------------------------------------------------------CASE STUDY-1 TASK-3-----------------------------------------------------*/
SELECT language AS content_language,
count(job_id) AS no_of_jobs,
count(job_id)*100 / sum(count(*)) OVER() AS Percentage_Share
FROM job_data
WHERE ds BETWEEN'2020-11-01' AND '2020-11-30'
GROUP BY language ORDER BY 1 desc;

/*---------------------------------------------------------------CASE STUDY-1 TASK-4-----------------------------------------------------*/
SELECT *
FROM job_data
WHERE (ds, job_id, actor_id, event, language, time_spent, org) IN (
    SELECT ds, job_id, actor_id, event, language, time_spent, org
    FROM job_data
    GROUP BY ds, job_id, actor_id, event, language, time_spent, org
    HAVING COUNT(*) > 1
);

SELECT *
FROM job_data
WHERE (actor_id) IN (
    SELECT actor_id
    FROM job_data
    GROUP BY actor_id
    HAVING COUNT(*) > 1
);

SELECT *
FROM job_data
WHERE (job_id) IN (
    SELECT job_id
    FROM job_data
    GROUP BY job_id
    HAVING COUNT(*) > 1
);




