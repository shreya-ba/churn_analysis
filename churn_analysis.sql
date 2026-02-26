-- 1. Create database
CREATE DATABASE db_churn;

-- 2. Use database
USE db_churn;


-- 3. Create churn table
CREATE TABLE churn (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT,
    Married BOOLEAN,
    State_Name VARCHAR(50),
    Number_of_Referrals INT,
    Tenure_in_Months INT,
    Value_Deal VARCHAR(50),
    Phone_Service BOOLEAN,
    Multiple_Lines VARCHAR(20),
    Internet_Service BOOLEAN,
    Internet_Type VARCHAR(50),
    Online_Security BOOLEAN,
    Online_Backup BOOLEAN,
    Device_Protection_Plan BOOLEAN,
    Premium_Support BOOLEAN,
    Streaming_TV BOOLEAN,
    Streaming_Movies BOOLEAN,
    Streaming_Music BOOLEAN,
    Unlimited_Data BOOLEAN,
    Contract VARCHAR(30),
    Paperless_Billing BOOLEAN,
    Payment_Method VARCHAR(50),
    Monthly_Charge DECIMAL(10,2),
    Total_Charges DECIMAL(12,2),
    Total_Refunds DECIMAL(12,2),
    Total_Extra_Data_Charges DECIMAL(12,2),
    Total_Long_Distance_Charges DECIMAL(12,2),
    Total_Revenue DECIMAL(14,2),
    Customer_Status VARCHAR(30),
    Churn_Category VARCHAR(50),
    Churn_Reason VARCHAR(255)
);


-- 4. View data
SELECT * FROM churn;


-- 5. Total customers
SELECT COUNT(*) AS Total_Customers
FROM Churn;


-- 6. Generate churn flag 
SELECT 
    Customer_ID,
    Customer_Status,
    CASE 
        WHEN Customer_Status = 'Churned' THEN 1
        ELSE 0
    END AS Churn_Status
FROM Churn;


-- 7. Total churned customers
SELECT 
    SUM(CASE 
            WHEN Customer_Status = 'Churned' THEN 1 
            ELSE 0 
        END) AS Total_Churn
FROM Churn;


-- 8. Overall churn rate
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE 
            WHEN Customer_Status = 'Churned' THEN 1 
            ELSE 0 
        END) AS Total_Churn,
    ROUND(
        SUM(CASE 
                WHEN Customer_Status = 'Churned' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*), 2
    ) AS Churn_Rate_Percentage
FROM Churn;


-- 9. Revenue impact
SELECT 
    SUM(Total_Revenue) AS Total_Revenue,
    SUM(CASE 
            WHEN Customer_Status = 'Churned' 
            THEN Total_Revenue 
            ELSE 0 
        END) AS Lost_Revenue
FROM Churn;


-- 10. Gender distribution
SELECT 
    Gender,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / 
          (SELECT COUNT(*) FROM Churn), 2) AS Percentage
FROM Churn
GROUP BY Gender;


-- 11. Contract distribution
SELECT 
    Contract,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / 
          (SELECT COUNT(*) FROM Churn), 2) AS Percentage
FROM Churn
GROUP BY Contract;


-- 12. Revenue by customer status
SELECT 
   Customer_Status,
   COUNT(*) AS TotalCount,
   SUM(Total_Revenue) AS TotalRev,
   ROUND(SUM(Total_Revenue) * 100.0 / 
        (SELECT SUM(Total_Revenue) FROM Churn), 2) AS Rev_Percentage
FROM Churn
GROUP BY Customer_Status;


-- 13. State distribution
SELECT 
   State_name,
   COUNT(*) AS TotalCount,
   ROUND(COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM Churn), 2) AS Percentage
FROM Churn
GROUP BY State_name
ORDER BY Percentage DESC;


-- 14. Top 5 states by churn rate
SELECT 
    State_name,
    COUNT(*) AS Total_Customers,
    SUM(CASE 
            WHEN Customer_Status = 'Churned' THEN 1 
            ELSE 0 
        END) AS Churned_Customers,
    ROUND(
        SUM(CASE 
                WHEN Customer_Status = 'Churned' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM Churn
GROUP BY State_name
ORDER BY Churn_Rate DESC
LIMIT 5;


-- 15. Null value check
SELECT 
    COUNT(*) - COUNT(Customer_ID) AS Customer_ID_Null_Count,
    COUNT(*) - COUNT(Gender) AS Gender_Null_Count,
    COUNT(*) - COUNT(Age) AS Age_Null_Count,
    COUNT(*) - COUNT(Married) AS Married_Null_Count,
    COUNT(*) - COUNT(State_name) AS State_Null_Count,
    COUNT(*) - COUNT(Total_Revenue) AS Total_Revenue_Null_Count,
    COUNT(*) - COUNT(Customer_Status) AS Customer_Status_Null_Count
FROM Churn;


-- 16. Create cleaned production table
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State_name,
    Number_of_Referrals,
    Tenure_in_Months,
    COALESCE(Value_Deal, 'None') AS Value_Deal,
    Phone_Service,
    COALESCE(Multiple_Lines, 'No') AS Multiple_Lines,
    Internet_Service,
    COALESCE(Internet_Type, 'None') AS Internet_Type,
    COALESCE(Online_Security, FALSE) AS Online_Security,
    COALESCE(Online_Backup, FALSE) AS Online_Backup,
    COALESCE(Device_Protection_Plan, FALSE) AS Device_Protection_Plan,
    COALESCE(Premium_Support, FALSE) AS Premium_Support,
    COALESCE(Streaming_TV, FALSE) AS Streaming_TV,
    COALESCE(Streaming_Movies, FALSE) AS Streaming_Movies,
    COALESCE(Streaming_Music, FALSE) AS Streaming_Music,
    COALESCE(Unlimited_Data, FALSE) AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    COALESCE(Churn_Category, 'Others') AS Churn_Category,
    COALESCE(Churn_Reason, 'Others') AS Churn_Reason
INTO prod_churn
FROM Churn;


-- 17. Create view for churned and stayed customers
CREATE VIEW vw_ChurnData AS
SELECT *
FROM prod_Churn
WHERE Customer_Status IN ('Churned', 'Stayed');


-- 18. Create view for joined customers
CREATE VIEW vw_JoinData AS
SELECT *
FROM prod_Churn
WHERE Customer_Status = 'Joined';