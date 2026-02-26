# 📉 Customer Churn Analysis Dashboard  

## 📌 Overview  
This project analyzes customer churn behavior to identify key drivers impacting customer retention and revenue loss.  

The objective was to transform raw customer subscription data into actionable business insights using SQL for data preparation and validation and Power BI for interactive dashboard reporting.  

The analysis helps stakeholders understand high-risk customer segments and design targeted retention strategies.  

---

## 📂 Dataset  

The analysis is based on a structured customer-level dataset containing:

### 1️⃣ Customer Information  
- Customer ID  
- Gender  
- Age  
- Marital Status  
- State  

### 2️⃣ Subscription & Account Details  
- Tenure in Months  
- Contract Type  
- Payment Method  
- Monthly Charges  
- Total Revenue  

### 3️⃣ Services Used  
- Internet Type  
- Online Security  
- Device Protection  
- Streaming Services  
- Premium Support  

### 4️⃣ Churn Information  
- Customer Status (Joined / Stayed / Churned)  
- Churn Category  
- Churn Reason  

All data was cleaned and structured into a production-ready table before visualization.

---

## 🗄 Data Preparation & SQL Analysis  

### 🔹 Data Engineering  
- Created structured churn table  
- Generated churn flag using CASE logic  
- Calculated churn rate using SQL aggregations  
- Performed null value audit across all columns  
- Created cleaned production table `prod_churn`  
- Built analytical views:  
  - `vw_ChurnData`  
  - `vw_JoinData`  

### 🔹 Exploratory Data Analysis (EDA)  
Performed analysis using:  
- `SUM()` and `COUNT()` aggregations  
- `GROUP BY` analysis  
- State-level churn ranking  
- Contract & payment churn comparison  
- Revenue impact of churn  

Validated all KPIs before connecting to Power BI.

---

## 🛠 Tools & Technologies  
- **SQL** – Data modeling, EDA queries, data validation  
- **Power BI** – Data modeling, dashboard development  
- **DAX** – KPI calculations and churn rate metrics  
- **Data Transformation** – Segmentation & unpivoting  

---

## ❓ Business Questions Solved  
- What is the overall churn rate?  
- Which contract type has the highest churn?  
- Which states show the highest customer attrition?  
- Do payment methods influence churn behavior?  
- Which age and tenure groups are most at risk?  
- Which services reduce churn probability?  
- What are the top churn reasons?  
- What is the revenue impact of churned customers?  

---

## 📊 Dashboard Highlights  

The Power BI dashboard presents:

- **6,418** total customers  
- **1,732** total churned customers  
- **27%** churn rate  
- Churn by Gender  
- Churn by Contract Type  
- Churn by State  
- Churn by Payment Method  
- Churn by Internet Type  
- Churn Category & Reason distribution  

### Interactive Slicers:
- Monthly Charge Range  
- Marital Status  
- Contract Type  
- State  
- Internet Type  

---

## 📊 Key Project Insights  

### 🔥 Contract Type Is the Strongest Churn Driver  
- Month-to-month churn rate: **46.5%**  
- Two-year contract churn rate: **2.7%**

### 👩 Gender-Based Churn Insight  
Female customers contribute a significantly higher proportion of total churn compared to male customers, indicating a noticeable gender-based churn gap.

### 🌍 Geographic Risk Concentration  
- Jammu & Kashmir shows **57% churn**  
- Certain states contribute disproportionately to attrition  

### 💳 Payment Behavior Impact  
- Customers using mailed checks show higher churn  
- Credit card users show significantly lower churn  

### 🌐 Service Influence  
- Fiber optic users show higher churn  
- Customers without value-added services churn more  

### 🏆 Primary Churn Reason  
Competitor is the leading churn category.

---

## 💡 Business Recommendations  
- Incentivise upgrades to long-term contracts  
- Promote auto-payment adoption  
- Improve fiber internet service quality  
- Launch region-specific retention campaigns  
- Develop competitor-matching offers  
- Improve onboarding for new customers  
- Design targeted retention campaigns specifically for high-churn gender segments through personalized offers and engagement strategies  

---

## ▶️ How to Run  

1. Create churn table in SQL  
2. Execute SQL scripts for KPI validation  
3. Import production table into Power BI  
4. Create relationships & segmentation logic  
5. Build DAX measures  
6. Explore insights using interactive filters  

---

## 🚀 Skills Demonstrated  
- SQL Table Creation & Data Modeling  
- Data Cleaning & Null Handling  
- Business KPI Validation  
- Customer Segmentation  
- Revenue Impact Analysis  
- Power BI Dashboard Development  
- DAX Measures  
- Translating Data into Strategic Insights  
