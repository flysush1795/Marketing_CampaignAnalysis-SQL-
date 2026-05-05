-- Work Overview - Campaign Performance Analysis

create database `campaign Perfomance`;
use `campaign Perfomance`;

Create table customers(
customer_id int primary key auto_increment,
name varchar(100),
signup_date date,
channel_source varchar(50)
);

alter table customers modify customer_id int;  -- remove auto increment

desc customers;

create table campaigns(
campaign_id int primary key,
campaign_name varchar(100),
channel_source varchar(50),
start_date date,
end_date date
);

create table transactions(
transaction_id int primary key,
customer_id int,
transaction_date date,
amount dec
);

create table campaign_performance(
campaign_id int,
`date` date,
impressions int,
clicks int,
cost dec
);

INSERT INTO customers VALUES
(1,'Amit','2024-01-01','Facebook'),
(2,'Riya','2024-01-02','Google'),
(3,'John','2024-01-03','Instagram'),
(4,'Sara','2024-01-04','LinkedIn'),
(5,'Raj','2024-01-05','Facebook'),
(6,'Anu','2024-01-06','Google'),
(7,'Tom','2024-01-07','Instagram'),
(8,'Priya','2024-01-08','LinkedIn'),
(9,'Karan','2024-01-09','Facebook'),
(10,'Neha','2024-01-10','Google'),
(11,'Vikram','2024-01-11','Instagram'),
(12,'Sneha','2024-01-12','LinkedIn'),
(13,'Arjun','2024-01-13','Facebook'),
(14,'Meera','2024-01-14','Google'),
(15,'Rahul','2024-01-15','Instagram'),
(16,'Pooja','2024-01-16','LinkedIn'),
(17,'Rohit','2024-01-17','Facebook'),
(18,'Nisha','2024-01-18','Google'),
(19,'Dev','2024-01-19','Instagram'),
(20,'Simran','2024-01-20','LinkedIn'),
(21,'Aman','2024-01-21','Facebook'),
(22,'Isha','2024-01-22','Google'),
(23,'Varun','2024-01-23','Instagram'),
(24,'Kriti','2024-01-24','LinkedIn'),
(25,'Manish','2024-01-25','Facebook'),
(26,'Tina','2024-01-26','Google'),
(27,'Nitin','2024-01-27','Instagram'),
(28,'Rashmi','2024-01-28','LinkedIn'),
(29,'Yash','2024-01-29','Facebook'),
(30,'Divya','2024-01-30','Google'),
(31,'Sameer','2024-02-01','Instagram'),
(32,'Aarti','2024-02-02','LinkedIn'),
(33,'Gaurav','2024-02-03','Facebook'),
(34,'Payal','2024-02-04','Google'),
(35,'Deepak','2024-02-05','Instagram'),
(36,'Shreya','2024-02-06','LinkedIn'),
(37,'Harsh','2024-02-07','Facebook'),
(38,'Kavya','2024-02-08','Google'),
(39,'Ramesh','2024-02-09','Instagram'),
(40,'Anjali','2024-02-10','LinkedIn'),
(41,'Suresh','2024-02-11','Facebook'),
(42,'Komal','2024-02-12','Google'),
(43,'Ajay','2024-02-13','Instagram'),
(44,'Rekha','2024-02-14','LinkedIn'),
(45,'Sunil','2024-02-15','Facebook'),
(46,'Pallavi','2024-02-16','Google'),
(47,'Kishore','2024-02-17','Instagram'),
(48,'Monika','2024-02-18','LinkedIn'),
(49,'Naveen','2024-02-19','Facebook'),
(50,'Lakshmi','2024-02-20','Google');

INSERT INTO campaigns VALUES
(1,'FB_NewYear','Facebook','2024-01-01','2024-01-10'),
(2,'Google_Sale','Google','2024-01-02','2024-01-12'),
(3,'Insta_Ads','Instagram','2024-01-03','2024-01-13'),
(4,'Linked_B2B','LinkedIn','2024-01-04','2024-01-14'),
(5,'FB_Festive','Facebook','2024-01-15','2024-01-25'),
(6,'Google_Leads','Google','2024-01-16','2024-01-26'),
(7,'Insta_Growth','Instagram','2024-01-17','2024-01-27'),
(8,'Linked_Hiring','LinkedIn','2024-01-18','2024-01-28'),
(9,'FB_Discount','Facebook','2024-02-01','2024-02-10'),
(10,'Google_Brand','Google','2024-02-02','2024-02-12');

INSERT INTO campaign_performance VALUES
(1,'2024-01-01',10000,500,2000),
(2,'2024-01-02',12000,600,2500),
(3,'2024-01-03',9000,450,1800),
(4,'2024-01-04',8000,300,1500),
(5,'2024-01-15',15000,700,3000),
(6,'2024-01-16',14000,650,2800),
(7,'2024-01-17',11000,500,2200),
(8,'2024-01-18',10000,400,2000),
(9,'2024-02-01',16000,800,3500),
(10,'2024-02-02',17000,850,3700);

INSERT INTO transactions VALUES
(1,1,'2024-01-02',500),
(2,2,'2024-01-03',1200),
(3,3,'2024-01-04',800),
(4,4,'2024-01-05',600),
(5,5,'2024-01-06',1500),
(6,6,'2024-01-07',700),
(7,7,'2024-01-08',900),
(8,8,'2024-01-09',400),
(9,9,'2024-01-10',1100),
(10,10,'2024-01-11',1000),
(11,11,'2024-01-12',750),
(12,12,'2024-01-13',650),
(13,13,'2024-01-14',1300),
(14,14,'2024-01-15',1400),
(15,15,'2024-01-16',500),
(16,16,'2024-01-17',600),
(17,17,'2024-01-18',1200),
(18,18,'2024-01-19',1100),
(19,19,'2024-01-20',900),
(20,20,'2024-01-21',800),
(21,21,'2024-01-22',1500),
(22,22,'2024-01-23',1600),
(23,23,'2024-01-24',700),
(24,24,'2024-01-25',600),
(25,25,'2024-01-26',1700),
(26,26,'2024-01-27',1800),
(27,27,'2024-01-28',500),
(28,28,'2024-01-29',400),
(29,29,'2024-01-30',900),
(30,30,'2024-01-31',1000),
(31,31,'2024-02-01',1100),
(32,32,'2024-02-02',1200),
(33,33,'2024-02-03',1300),
(34,34,'2024-02-04',1400),
(35,35,'2024-02-05',1500),
(36,36,'2024-02-06',1600),
(37,37,'2024-02-07',1700),
(38,38,'2024-02-08',1800),
(39,39,'2024-02-09',1900),
(40,40,'2024-02-10',2000),
(41,41,'2024-02-11',2100),
(42,42,'2024-02-12',2200),
(43,43,'2024-02-13',2300),
(44,44,'2024-02-14',2400),
(45,45,'2024-02-15',2500),
(46,46,'2024-02-16',2600),
(47,47,'2024-02-17',2700),
(48,48,'2024-02-18',2800),
(49,49,'2024-02-19',2900),
(50,50,'2024-02-20',3000);

select * from customers;
select * from campaigns;
select * from campaign_performance;
select * from transactions;

-- 1. Calculate CTR for each campaign
with ctr_perf as(
select campaign_id, (sum(clicks) / sum(impressions)) * 100 as CTR
from campaign_performance
group by campaign_id)
select campaign_id, ctr, case
when ctr > 4.5 then "Good"
else "Bad"
end Analysis
from ctr_perf;      

-- 2. Total cost per campaign
select c.campaign_id, c.campaign_name, c.channel_source, cp.cost from campaigns c 
join campaign_performance cp 
on c.campaign_id = cp.campaign_id;

-- 3. Revenue genrated per campaign
select c.campaign_id, c.campaign_name, sum(t.amount) as Revenue from campaigns c 
join customers cu 
on c.channel_source = cu.channel_source
join transactions t 
on cu.customer_id = t.customer_id
group by c.campaign_id;                         -- Incorrect Schema, revenue is getting based in channel and not campaigns

-- 4. Total ROI Calculation
with final_amount as (
select sum(amount) as final_value 
from transactions),
initial_invest_roi as (
select sum(cost) as initial_invest
from campaign_performance
)
select ((f.final_value - i.initial_invest) / i.initial_invest) * 100 as ROI 
from initial_invest_roi i, final_amount f;

select * from customers;
select * from campaigns;
select * from campaign_performance;
select * from transactions;

-- 1. Customers per channel
select channel_source, count(*) as total_customers
from customers
group by channel_source;

-- 2. Revenue per channel
select channel_source, sum(t.amount) from customers c
join transactions t 
on c.customer_id = t.customer_id
group by c.channel_source;

-- 3. Average revenue per customer
SELECT AVG(total_spent) AS avg_revenue_per_customer
FROM (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM transactions
    GROUP BY customer_id
) t;

-- 1. Top 5 Customers
with final_rank as (
select c.customer_id, c.name, dense_rank () over(order by t.amount desc) rnk
from customers c 
join transactions t
on c.customer_id = t.transaction_id)
select customer_id, name, rnk from final_rank
where rnk <= 5;

-- Repeat vs one time customers
select customer_id, case when count(transaction_id) = 1 then "One-time Customer"
else "Repeat Customer" end customer_type
from transactions
group by customer_id;

-- Customer Segmentation (High/Medium/Low)
with cust_seg as (
select customer_id, case when amount > 2000 then "High"
when amount > 1000 then "Medium"
else "Low" end cust_type from transactions
)
select c.customer_id, c.name, cs.cust_type from customers c 
join cust_seg cs 
on c.customer_id = cs.customer_id;

-- Daily Revenue
select transaction_date, sum(amount) as daily_transact
from transactions
group by transaction_date;

-- Running Total
SELECT transaction_date,
       SUM(amount) AS daily_revenue,
       SUM(SUM(amount)) OVER (ORDER BY transaction_date) AS running_total
FROM transactions
GROUP BY transaction_date;

-- Revenue before and after campaigns

