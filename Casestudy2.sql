create database metric_spike;
use metric_spike;


drop database metric_spike;

/*--------------------------------------------------------IMPORTING USERS TABLE--------------------------------------------------*/
create table users(
	user_id int,
    created_at varchar(100),
    company_id int,
    language varchar(50),
    activated_at varchar(100),
    state varchar(50)
);

show variables like 'secure_file_priv';

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users.csv"
into table users
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

alter table users add column temp_created_at datetime;
SET SQL_SAFE_UPDATES = 0;
update users set temp_created_at = STR_TO_DATE(created_at, '%d-%m-%Y %H:%i');
alter table users drop column created_at;
alter table users change column temp_created_at created_at datetime;

select * from users;

/*----------------------------------------------------IMPORTING EVENTS TABLE--------------------------------------------------------*/
create table events(  
	user_id int,
    occurred_at varchar(100),
    event_type varchar(50),
    event_name varchar(100),
    location varchar(50) ,
    device varchar(50),
    user_type int
);

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/events.csv"
into table events
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

alter table events add column temp_occurred_at datetime;
SET SQL_SAFE_UPDATES = 0;
update events set temp_occurred_at = STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i');
alter table events drop column occurred_at;
alter table events change column temp_occurred_at occurred_at datetime;

select * from events;

/*-------------------------------------------IMPORTING EMAIL-EVENTS TABLE--------------------------------------------*/
create table email_events(  
	user_id int,
    occurred_at varchar(100),
    action varchar(50),
    user_type int
);

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/email_events.csv"
into table email_events
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

alter table email_events add column temp_occurred_at datetime;
SET SQL_SAFE_UPDATES = 0;
update email_events set temp_occurred_at = STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i');
alter table email_events drop column occurred_at;
alter table email_events change column temp_occurred_at occurred_at datetime;

select * from email_events;

/*--------------------------------------------------------CASE STUDY 2 TASK-A-----------------------------------------------------------*/
SELECT 
	WEEK(events.occurred_at) AS week,
	COUNT(DISTINCT events.user_id) AS active_users
FROM 
	events
GROUP BY 
	week
order by week;

/*--------------------------------------------------------CASE STUDY 2 TASK-B-----------------------------------------------------------*/

SELECT
    YEAR(users.created_at) AS year,
    MONTH(users.created_at) AS month,
    COUNT(DISTINCT users.user_id) AS new_users
FROM
    users
WHERE
    YEAR(users.created_at)
GROUP BY
    YEAR(users.created_at),
    MONTH(users.created_at)
ORDER BY
    YEAR(users.created_at), MONTH(users.created_at);




/*--------------------------------------------------------CASE STUDY 2 TASK-C-----------------------------------------------------------*/
SELECT
    WEEK(e.occurred_at) AS active_week,
    COUNT(DISTINCT u.user_id) AS cohort_size,
    COUNT(DISTINCT CASE WHEN WEEK(e.occurred_at) = WEEK(u.created_at) THEN e.user_id END) AS active_users,
    COUNT(DISTINCT CASE WHEN WEEK(e.occurred_at) >= WEEK(u.created_at) THEN e.user_id END) AS retained_users,
    COUNT(DISTINCT CASE WHEN WEEK(e.occurred_at) >= WEEK(u.created_at) THEN e.user_id END) / COUNT(DISTINCT u.user_id) AS retention_rate
FROM
    users u
LEFT JOIN
    events e ON u.user_id = e.user_id
GROUP BY
    active_week
ORDER BY
    active_week;
    
/*--------------------------------------------------------CASE STUDY 2 TASK-D-----------------------------------------------------------*/
SELECT
    WEEK(events.occurred_at) AS week_number,
    events.device,
    COUNT(DISTINCT events.user_id) AS active_users
FROM
    events
GROUP BY
    week_number, events.device
ORDER BY
    week_number, events.device;
    
/*--------------------------------------------------------CASE STUDY 2 TASK-E-----------------------------------------------------------*/
SELECT 
    WEEK(occurred_at) AS Week,
    COUNT(DISTINCT (CASE
            WHEN action = 'sent_weekly_digest' THEN user_id
        END)) AS user_engagement,
    COUNT(DISTINCT (CASE
            WHEN action = 'email_open' THEN user_id
        END)) AS User_opened_email,
    COUNT(DISTINCT (CASE
            WHEN action = 'email_clickthrough' THEN user_id
        END)) AS Email_clickthrough
FROM
    email_events
GROUP BY WEEK(occurred_at)
ORDER BY Week;





















