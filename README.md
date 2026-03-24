# 🚀 Retail & Electronics Sales Analytics (End-to-End Data Analyst Project)

## 📌 Business Problem

As a Data Analyst, I was tasked with analyzing sales, product, store, and warranty data to uncover:

* Revenue fluctuations
* Store performance issues
* Product optimization opportunities
* Warranty cost drivers
* Pricing and seasonal trends

---

## 📊 Dataset Overview

* Sales Data (transactions)
* Product Data (category, pricing)
* Store Data (location)
* Warranty Claims Data

---

## 🛠️ Tools Used

* SQL (MySQL)
* Python (Pandas, Matplotlib, Seaborn)
* Power BI
* Excel

---

## 🔍 Key Business Insights

### 📉 Revenue Drop

* Revenue dropped **61% in Nov 2024**
* Likely causes:

  * Seasonal dip
  * Inventory or data issues

👉 **Recommendation:** Run promotions & validate data pipeline

---

### 🏪 Store Performance

* Bottom stores generate **~10% less revenue**

👉 **Recommendation:** Optimize marketing before closure decisions

---

### 📦 Product Strategy (Pareto Insight)

* **~60% products generate 80% revenue**

👉 **Recommendation:** Focus on high-performing SKUs & reduce dead inventory

---

### 🛠️ Warranty Analysis

* High warranty claims in specific products

👉 **Recommendation:** Investigate quality issues & supplier performance

---

### 💰 Pricing Insight

* High-priced products show lower demand

👉 **Recommendation:** Introduce EMI / discounts for premium products

---

### 📅 Seasonal Trends

* Peak: October (festival season)
* Low: February

👉 **Recommendation:** Align inventory & campaigns with seasonality

---

## 📊 Dashboard (Power BI)

Includes:

* Revenue KPI
* Store comparison
* Product performance
* Monthly trends
* Warranty insights

---

## 🧠 SQL Highlights

```sql
-- Top Revenue Products
SELECT p.product_name, SUM(s.total_amount) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;
```

---

## 🎯 Business Impact

* Identified revenue leakage
* Improved inventory decisions
* Enabled data-driven pricing strategy
* Highlighted underperforming stores

---

## 🚀 What Makes This Project Unique

✔ Real-world business case
✔ End-to-end analysis (SQL + Python + BI)
✔ Actionable insights (not just charts)
✔ Decision-making focus

---

## 👨‍💻 Author

**M Dilli Babu**
Aspiring Data Analyst | SQL | Python | Power BI
