# Retail Performance Analytics & Revenue Optimization Using SQL and Power BI

## 🚨 Executive Summary (Key Insights)

* 📉 Revenue dropped **61% in Nov 2024** → possible data gap or operational issue
* 🏪 Bottom stores generate **~10% less revenue than average**
* 📦 **Top 60% of products contribute 80% of total revenue (Pareto Principle)**
* 📅 Sales peak in **October (festival season)** and dip in **February**
* 💰 High-priced products show **lower demand → price sensitivity observed**

👉 This project focuses on **business insights and decision-making**, not just analysis.

---

## 📌 Business Problem

As a Data Analyst at a retail electronics company, I was tasked with:

* Understanding revenue fluctuations
* Identifying underperforming stores
* Optimizing product portfolio
* Reducing warranty costs
* Improving pricing and inventory strategy

---

## 📂 Dataset Access

Due to file size limitations, the dataset is hosted externally:

🔗 **Download Dataset (OneDrive):**
👉 https://1drv.ms/x/c/6fe1d6168636f39e/IQCAAA2nPo5WTZCk_EWoYOOUAUL_y1rhfOUX9BHsQzHuUPc?e=GmzIMa

📌 Files included:

* sales.csv
* products.csv
* stores.csv
* category.csv
* warranty.csv

---

## 🧾 Data Dictionary

| Column         | Description                   |
| -------------- | ----------------------------- |
| sale_id        | Unique transaction ID         |
| product_id     | Product identifier            |
| store_id       | Store identifier              |
| sale_date      | Date of sale                  |
| quantity       | Units sold                    |
| total_amount   | Total revenue                 |
| warranty_claim | Indicates if warranty claimed |

---

## 🛠️ Tools & Technologies

* SQL (MySQL)
* Python (Pandas, Matplotlib, Seaborn)
* Power BI
* Excel

---

## 🔍 Key Business Analysis

### 📊 1. Revenue Trend Analysis

* Identified monthly revenue fluctuations
* Detected sharp drop in Nov 2024

👉 **Recommendation:** Validate data pipeline & run targeted promotions

---

### 🏪 2. Store Performance

* Ranked stores by revenue
* Identified consistently underperforming stores

👉 **Recommendation:** Improve marketing before considering closure

---

### 📦 3. Product Performance (Pareto Analysis)

* Majority revenue driven by limited products

👉 **Recommendation:** Focus on high-performing products & reduce dead stock

---

### 🛠️ 4. Warranty Analysis

* Identified products with high warranty claims

👉 **Recommendation:** Investigate quality issues & supplier performance

---

### 💰 5. Pricing Strategy

* High price → lower demand observed

👉 **Recommendation:** Introduce EMI, bundles, or discounts

---

### 📅 6. Seasonal Trends

* Peak: October
* Low: February

👉 **Recommendation:** Align inventory & marketing campaigns

---

## 📊 Dashboard (Power BI)

The dashboard includes:

* Revenue KPIs
* Store performance comparison
* Product & category analysis
* Monthly trends
* Warranty insights

📌 *Dashboard screenshots available in `/dashboard/screenshots/`*

---

## 🧠 SQL Highlights

```sql
-- Monthly Revenue Trend
SELECT 
DATE_FORMAT(sale_date, '%Y-%m') AS month,
SUM(total_amount) AS revenue
FROM sales
GROUP BY month
ORDER BY month;
```

```sql
-- Store Ranking
SELECT 
store_id,
SUM(total_amount) AS revenue,
RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rank
FROM sales
GROUP BY store_id;
```

---

## 🏗️ Project Architecture

Data → SQL → Python → Power BI → Insights → Business Decisions

---

## 💼 Business Impact

* Identified revenue leakage patterns
* Improved inventory decision-making
* Enabled data-driven pricing strategies
* Highlighted underperforming stores
* Provided actionable business recommendations

---

## 🚀 What Makes This Project Stand Out

✔ Real-world business scenario
✔ End-to-end analytics workflow
✔ Focus on insights, not just charts
✔ Combines SQL, Python, and BI tools
✔ Decision-making oriented

---

## 👨‍💻 Author

**M Dilli Babu**
Aspiring Data Analyst
🔗 Portfolio: https://dillibabu-data-9flxw8v.gamma.site/
🔗 LinkedIn: https://www.linkedin.com/in/m-dilli-babu/
🔗 GitHub: https://github.com/Dilli57

---

## ⭐ If you found this project useful, give it a star!
