Create database TelcoCustomerChurn;

use TelcoCustomerChurn;

show tables;

-- 1 View all records

select * from customer_churn;

-- 2 Number of customers

select count(*) from customer_churn;

-- 3 Distinct Internet Services

 select distinct InternetService from customer_churn;
 
 -- 4 Count male and female customers
 
 select gender , count(*) AS TotalCustomers 
 from customer_churn
 group by gender;

-- 5 Count churn and non churn Customers
 
 select churn ,count(*) AS Total
 from customer_churn
 group by churn;
 
 -- 6 Average monthly charges
 
 Select avg(MonthlyCharges) from customer_churn;
 
 -- 7 Maximum Monthly Charges
 
 select max(MonthlyCharges) from customer_churn;
 
 -- 8 minimum Monthly Charges
 
 select min(MonthlyCharges) from customer_churn;
 
 -- 9 Average tenure
 
 select avg(tenure) from customer_churn;
 
 -- 10 Customers with tenure greater than 60 months
 
 select * from customer_churn
 where tenure>60;
 
 -- 11 Customers by contract type
 
 Select Contract , count(*) from customer_churn
 group by Contract;
 
 -- 12 Average Monthly charges by Contract
 
 select Contract , Avg(MonthlyCharges) as AverageMonthCharges from customer_churn
 group by Contract;  
 
 -- 13 Churn by Contract
 select Contract , Churn , count(*) from customer_churn
 group by Contract,churn;
 
 -- 14 Customers using Fiber optic
 
 select InternetService ,count(*) from customer_churn
 where InternetService="Fiber optic";
 
 -- 15 Senior citizen Count
 
 select count(*) from customer_churn
 where SeniorCitizen=1;
 
 -- 16 Average of total charges
 
 select avg(TotalCharges) from customer_churn;
 
 -- 17 Customer with Tech Support

select  Count(*) from customer_churn
where TechSupport='Yes';

-- 18 Customer without TechSupport

select count(*) from customer_churn
where TechSupport='No';

-- 19 Payment method count

select PaymentMethod,count(*) from customer_churn
group by PaymentMethod;

-- 20 Top 10 Highest paying

select CustomerID, TotalCharges
From customer_churn
order by TotalCharges DESC
limit 10;

-- 21 Churn percentage

select 
round((sum(CASE WHEN Churn='Yes' Then 1 else 0 END)*100.0)/COUNT(*),2) AS Churn_Percentage
From customer_churn;

-- 22 Average Monthly charges by churn

select  Churn , Avg(MonthlyCharges) From Customer_churn
group by Churn;

-- 23 Churn By gender

Select Churn , Gender , Count(*) From Customer_churn
group by Churn,Gender;

-- 24 churn By Internet Services

Select InternetService ,Churn , Count(*) From Customer_churn
group by InternetService , Churn ;

-- 25 Customers With Highest Tenure

select customerID , tenure from Customer_churn
order by tenure DESC;

-- 26 Revenue by Contract

select Contract, sum(TotalCharges) from Customer_churn
Group by Contract;

-- 27 Average Monthly charges by payment method

select PaymentMethod, Avg(MonthlyCharges) from Customer_churn
Group by PaymentMethod;

-- 28 Customers having online Security and tech Support

select count(*) From Customer_churn
Where OnlineSecurity='Yes' and TechSupport='Yes';

-- 29. Month-to-month customers who churned

SELECT COUNT(*)
FROM customer_churn
WHERE Contract='Month-to-month'
AND Churn='Yes';

-- 30. Top 5 contract types with highest average total charges

SELECT Contract, AVG(TotalCharges) AS Avg_TotalCharges
FROM customer_churn
GROUP BY Contract
ORDER BY Avg_TotalCharges DESC
LIMIT 5;
 