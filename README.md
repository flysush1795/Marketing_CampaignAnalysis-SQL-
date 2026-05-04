# Work Overview: Marketing Campaign Analsysis (SQL)

**Work Title**: Marketing Campaign Analysis  
**Database**: `campaign Perfomance`

This overview is designed to demonstrate SQL skills and techniques typically used to explore, clean, and analyze marketing campaign performance data. It involves setting up a campaign Perfomance database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Overview

- **Database Creation**: The project starts by creating a database named `campaign Perfomance`.
- **Table Creation**: Four tables with following table names are created - customers, campaigns, transactions, campaign_performance.

```sql
create database `campaign Perfomance`;

Create table customers(
customer_id int primary key auto_increment,
name varchar(100),
signup_date date,
channel_source varchar(50)
);

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
```

### Data Exploration

1. **CTR for each campaign**:

```sql
with ctr_perf as(
select campaign_id, (sum(clicks) / sum(impressions)) * 100 as CTR
from campaign_performance
group by campaign_id)
select campaign_id, ctr, case
when ctr > 4.5 then "Good"
else "Bad"
end Analysis
from ctr_perf;
```

2. **Total cost per campaign**:

```sql
select c.campaign_id, c.campaign_name, c.channel_source, cp.cost from campaigns c 
join campaign_performance cp 
on c.campaign_id = cp.campaign_id;
```

3. **Revenue generated per campaign**:

```sql
select c.campaign_id, c.campaign_name, sum(t.amount) as Revenue from campaigns c 
join customers cu 
on c.channel_source = cu.channel_source
join transactions t 
on cu.customer_id = t.customer_id
group by c.campaign_id;
```

4. **ROI calculation**:

```sql
with final_amount as (
select sum(amount) as final_value 
from transactions),
initial_invest_roi as (
select sum(cost) as initial_invest
from campaign_performance
)
select ((f.final_value - i.initial_invest) / i.initial_invest) * 100 as ROI 
from initial_invest_roi i, final_amount f;
```

### Customer Aquisition Analysis:

1. **Customers per channel**:

```sql
select channel_source, count(*) as total_customers
from customers
group by channel_source;
```

2. **Revenue per channel**:

```sql
select channel_source, sum(t.amount) from customers c
join transactions t 
on c.customer_id = t.customer_id
group by c.channel_source;
```

3. **Average revenue per customer**:

```sql
SELECT AVG(total_spent) AS avg_revenue_per_customer
FROM (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM transactions
    GROUP BY customer_id
) t;
```

### Customer Behavior & Segmentation

1. **Top 5 Customers**:

```sql
with final_rank as (
select c.customer_id, c.name, dense_rank () over(order by t.amount desc) rnk
from customers c 
join transactions t
on c.customer_id = t.transaction_id)
select customer_id, name, rnk from final_rank
where rnk <= 5;
```

2. **Repeat vs one-time customers**:

```sql
select customer_id, case when count(transaction_id) = 1 then "One-time Customer"
else "Repeat Customer" end customer_type
from transactions
group by customer_id;
```

3. **Customer segmentation (High / Medium / Low spenders)**:

```sql
with cust_seg as (
select customer_id, case when amount > 2000 then "High"
when amount > 1000 then "Medium"
else "Low" end cust_type from transactions
)
select c.customer_id, c.name, cs.cust_type from customers c 
join cust_seg cs 
on c.customer_id = cs.customer_id;
```

4. **Daily revenue**:

```sql
select transaction_date, sum(amount) as daily_transact
from transactions
group by transaction_date;
```

5. **Running total (Window Function)**:

```sql
SELECT transaction_date,
       SUM(amount) AS daily_revenue,
       SUM(SUM(amount)) OVER (ORDER BY transaction_date) AS running_total
FROM transactions
GROUP BY transaction_date;
```
