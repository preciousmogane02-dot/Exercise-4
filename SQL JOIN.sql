CREATE CATALOG IF NOT EXISTS exercise4;
CREATE SCHEMA IF NOT EXISTS exercise4.KPM;
CREATE TABLE IF NOT EXISTS exercise4.KPM.users (
    user_id INT,
    user_name STRING,
    country STRING
) USING DELTA;

INSERT INTO exercise4.KPM.users VALUES
(1,'Nomvula','Johannesburg'),
(2,'David','Cape Town'),
(3,'Anele','Durban'),
(4,'Kabelo','Pretoria'),
(5,'Lerato','Port Elizabeth');


CREATE TABLE IF NOT EXISTS exercise4.KPM.plans (
    plan_id INT,
    plan_name STRING,
    monthly_price INT
) USING DELTA;

INSERT INTO exercise4.KPM.plans VALUES
(10,'Basic',79),
(11,'Standard',129),
(12,'Premium',199),
(13,'Family',249),
(14,'Mobile',59);
DROP TABLE exercise4.KPM.plans;

CREATE TABLE IF NOT EXISTS exercise4.KPM.subscriptions (
    subscription_id INT,
    user_id INT,
    plan_id INT,
    start_date DATE
) USING DELTA;

INSERT INTO exercise4.KPM.subscriptions VALUES
(501,1,10,'2026-01-15'),
(502,2,11,'2026-02-01'),
(503,1,12,'2026-03-10'),
(504,6,11,'2026-03-20'),
(505,3,13,'2026-04-05');
DROP TABLE exercise4.KPM.subscriptions

CREATE TABLE IF NOT EXISTS exercise4.KPM.shows (
    show_id INT,
    show_title STRING,
    genre STRING
) USING DELTA;

INSERT INTO exercise4.KPM.shows VALUES
(701,'Comedy Hour','Comedy'),
(702,'Crime Time','Drama'),
(703,'Tech Tales','Documentary'),
(704,'Cooking Lab','Lifestyle'),
(706,'Wild Earth','Documentary');

CREATE TABLE IF NOT EXISTS exercise4.KPM.viewing_sessions (
    session_id INT,
    user_id INT,
    show_id INT,
    watch_minutes INT
) USING DELTA;

INSERT INTO exercise4.KPM.viewing_sessions VALUES
(901,1,701,45),
(902,2,703,30),
(903,1,702,60),
(904,7,701,20),
(905,3,705,90);

CREATE TABLE IF NOT EXISTS exercise4.KPM.viewing_sessions (
    session_id INT,
    user_id INT,
    show_id INT,
    watch_minutes INT
) USING DELTA;

INSERT INTO exercise4.KPM.viewing_sessions VALUES
(901,1,701,45),
(902,2,703,30),
(903,1,702,60),
(904,7,701,20),
(905,3,705,90);


--QUESTION1
SELECT A.user_id,
       A.user_name,
       B.subscription_id,
       B.start_date
FROM exercise4.KPM.users AS A
INNER JOIN exercise4.KPM.subscriptions AS B
ON A.user_id = B.user_id;
--QUESTION 2
SELECT B.subscription_id,
       B.user_id,
       C.plan_name,
       C.monthly_price
FROM exercise4.KPM.subscriptions AS B
INNER JOIN exercise4.KPM.plans AS C
ON B.plan_id = C.plan_id;
--QUESTION3
SELECT D.session_id,
       D.user_id,
       E.show_title,
       E.genre,
       D.watch_minutes
FROM exercise4.KPM.viewing_sessions AS D
INNER JOIN exercise4.KPM.shows AS E
ON D.show_id = E.show_id;
--QUESTION 4
SELECT A.user_name,
       A.country,
       D.session_id,
       D.show_id,
       D.watch_minutes
FROM exercise4.KPM.users AS A
INNER JOIN exercise4.KPM.viewing_sessions AS D
ON A.user_id = D.user_id;
--QUESTION 5
SELECT A.user_name,
       A.country,
       C.plan_name,
       C.monthly_price,
       B.start_date
FROM exercise4.KPM.users AS A
INNER JOIN exercise4.KPM.subscriptions AS B ON A.user_id = B.user_id
INNER JOIN exercise4.KPM.plans AS C ON B.plan_id = C.plan_id;
--QUESTION 6
SELECT A.user_id,
       A.user_name,
       B.subscription_id,
       B.start_date
FROM exercise4.KPM.users AS A
LEFT JOIN exercise4.KPM.subscriptions AS B
ON A.user_id = B.user_id;
--QUESTION7
SELECT C.plan_id,
       C.plan_name,
       B.subscription_id,
       B.user_id
FROM exercise4.KPM.plans AS C
LEFT JOIN exercise4.KPM.subscriptions AS B
ON C.plan_id = B.plan_id;
--QUESTION 8
SELECT E.show_id,
       E.show_title,
       D.session_id,
       D.watch_minutes
FROM exercise4.KPM.shows AS E
LEFT JOIN exercise4.KPM.viewing_sessions AS D
ON E.show_id = D.show_id;
--QUESTION 9
SELECT A.session_id,
       A.show_id,
       A.watch_minutes,
       B.user_id,
       B.user_name
FROM exercise4.KPM.viewing_sessions AS A
LEFT JOIN exercise4.KPM.users AS B
ON A.user_id = B.user_id;

--QUESTION 10
SELECT A.user_name,
       A.country,
       C.plan_name,
       C.monthly_price
FROM exercise4.KPM.users AS A
LEFT JOIN exercise4.KPM.subscriptions AS B ON A.user_id = B.user_id
LEFT JOIN exercise4.KPM.plans AS C ON B.plan_id = C.plan_id;
--QUESTION 11
SELECT A.user_id,
       A.user_name,
       B.subscription_id,
       B.start_date
FROM exercise4.KPM.users AS A
FULL OUTER JOIN exercise4.KPM.subscriptions AS B
ON A.user_id = B.user_id;
--QUESTION 12
SELECT C.plan_id,
       C.plan_name,
       B.subscription_id,
       B.user_id
FROM exercise4.KPM.plans AS C
FULL OUTER JOIN exercise4.KPM.subscriptions AS B
ON C.plan_id = B.plan_id;
--QUESTION13
SELECT E.show_id,
       E.show_title,
       D.session_id,
       D.watch_minutes
FROM exercise4.KPM.shows AS E
FULL OUTER JOIN exercise4.KPM.viewing_sessions AS D
ON E.show_id = D.show_id;
--QUESTION 14
SELECT A.user_id,
       A.user_name,
       D.session_id,
       D.show_id,
       D.watch_minutes
FROM exercise4.KPM.users AS A
FULL OUTER JOIN exercise4.KPM.viewing_sessions AS D
ON A.user_id = D.user_id;
--QUESTION 15
SELECT A.user_id,
       A.user_name,
       B.subscription_id,
       C.plan_id,
       C.plan_name
FROM exercise4.KPM.users AS A
FULL OUTER JOIN exercise4.KPM.subscriptions AS B ON A.user_id = B.user_id
FULL OUTER JOIN exercise4.KPM.plans AS C ON B.plan_id = C.plan_id;
