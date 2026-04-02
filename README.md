#  Apple Retail Performance Analytics & Revenue Optimization

> End-to-end retail analytics using SQL · Python · Power BI · Business Decision-Making

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)

---

## 📊 Key Metrics

| Total Sales | Total Orders | Warranty Claims | Claim Rate |
|:-----------:|:------------:|:---------------:|:----------:|
| **6M** | **1M** | **30K** | **2.90%** |

---

## 🚨 Executive Summary

| Tag | Insight |
|-----|---------|
| 🔴 ALERT | Revenue dropped **61% in Nov 2024** — possible data pipeline gap or operational disruption |
| 🟠 STORE | Bottom-tier stores generate **~10% less revenue** than average — targeted intervention needed |
| 🔵 PARETO | Top **60% of products** drive **80% of total revenue** — classic Pareto distribution confirmed |
| 🟢 SEASON | Sales **peak in October** (festival season) and **dip in February** — inventory alignment opportunity |
| 🟡 PRICE | High-priced products show **lower demand** — price sensitivity signals EMI/bundle potential |

> 👉 This project focuses on **business insights and decision-making**, not just analysis.

---

## 📌 Business Problem

As a Data Analyst at a retail electronics company, I was tasked with:

- Understanding revenue fluctuations across time
- Identifying underperforming stores
- Optimizing the product portfolio
- Reducing warranty and after-sales costs
- Improving pricing and inventory strategy

---

## 📂 Dataset Access

Due to file size limitations, the dataset is hosted externally:

🔗 **[Download Dataset (OneDrive)](https://1drv.ms/x/c/6fe1d6168636f39e/IQCAAA2nPo5WTZCk_EWoYOOUAUL_y1rhfOUX9BHsQzHuUPc?e=GmzIMa)**

**Files included:**
```
📁 dataset/
├── sales.csv
├── products.csv
├── stores.csv
├── category.csv
└── warranty.csv
```

---

## 🧾 Data Dictionary

| Column | Description |
|--------|-------------|
| `sale_id` | Unique transaction identifier |
| `product_id` | Product reference key |
| `store_id` | Store reference key |
| `sale_date` | Date of transaction |
| `quantity` | Units sold per transaction |
| `total_amount` | Total revenue for the sale |
| `warranty_claim` | Flag indicating if warranty was claimed |

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **MySQL** | Data extraction, transformation, window functions |
| **Python** (Pandas, Matplotlib, Seaborn) | EDA, trend analysis, visualizations |
| **Power BI** | Interactive dashboards & KPI reporting |
| **Excel** | Data validation & quick analysis |

---

## 🔍 Key Business Analysis

### 📈 1. Revenue Trend Analysis
- Identified monthly revenue fluctuations across 2019–2024
- Detected a sharp **61% revenue drop in Nov 2024**

> **Recommendation:** Validate data pipeline integrity & run targeted promotions to recover Nov–Dec revenue

---

### 🏪 2. Store Performance Benchmarking
- Ranked all stores by total revenue using `RANK()` window function
- Identified consistently underperforming stores (~10% below average)

> **Recommendation:** Improve local marketing & foot traffic strategies before considering closures

---

### 📦 3. Product Performance (Pareto Analysis)
- Mapped revenue contribution per product
- Confirmed 80/20 rule: top 60% of products drive 80% of revenue

> **Recommendation:** Focus inventory investment on high-performers; reduce dead stock

---

### 🛠️ 4. Warranty Claims Analysis
- Identified products with disproportionately high claim rates
- Correlated claim spikes with specific time periods and store locations

> **Recommendation:** Investigate quality issues; audit supplier performance

---

### 💰 5. Pricing Strategy
- Observed inverse relationship between price and demand volume
- High-price segments show demand elasticity

> **Recommendation:** Introduce EMI options, product bundles, or seasonal discounts

---

### 📅 6. Seasonal Trends
- **Peak:** October (festival/holiday season)
- **Dip:** February (post-holiday lull)

> **Recommendation:** Align inventory stocking and marketing campaigns to seasonal demand patterns

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
-- Store Ranking by Revenue
SELECT
    store_id,
    SUM(total_amount) AS revenue,
    RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rank
FROM sales
GROUP BY store_id;
```

```sql
-- Category-wise Top 3 Products (Window Function)
WITH ranked_products AS (
    SELECT
        c.category_name,
        p.product_name,
        SUM(s.quantity) AS total_sales,
        RANK() OVER (PARTITION BY c.category_name ORDER BY SUM(s.quantity) DESC) AS rnk
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    JOIN category c ON p.category_id = c.category_id
    GROUP BY c.category_name, p.product_name
)
SELECT * FROM ranked_products WHERE rnk <= 3;
```

```sql
-- 7-Day Moving Average for Sales Smoothing
SELECT
    sale_date,
    daily_sales,
    AVG(daily_sales) OVER (
        ORDER BY sale_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7_days
FROM (
    SELECT sale_date, SUM(quantity) AS daily_sales
    FROM sales
    GROUP BY sale_date
) t;
```

---

## 📊 Power BI Dashboard

The dashboard includes:
- Revenue KPIs (Total Sales, Orders, Claims, Claim %)
- Store performance comparison & ranking
- Product & category revenue breakdown
- Monthly sales trend (2019–2024)
- Warranty claim insights

📌 Screenshots available in `/dashboard/screenshots/`

---

## 🏗️ Project Architecture

```
Raw Data → SQL (MySQL) → Python EDA → Power BI → Insights → Business Decisions
```

---

## 💼 Business Impact

- ✅ Identified revenue leakage patterns and anomalies
- ✅ Enabled data-driven inventory decision-making
- ✅ Surfaced pricing sensitivity for strategic bundling
- ✅ Highlighted underperforming stores with actionable steps
- ✅ Provided seasonal demand insights for campaign planning

---

## 🚀 What Makes This Project Stand Out

- ✔ Real-world business scenario (not a toy dataset)
- ✔ End-to-end analytics workflow (SQL → Python → BI)
- ✔ Focus on insights and recommendations, not just charts
- ✔ Combines multiple tools in a unified pipeline
- ✔ Decision-making oriented storytelling throughout

---

## 👨‍💻 Author

**M Dilli Babu** — Aspiring Data Analyst

[![Portfolio](https://img.shields.io/badge/Portfolio-000000?style=for-the-badge&logo=vercel&logoColor=white)](https://dillibabu-data-9flxw8v.gamma.site/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/m-dilli-babu/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Dilli57)

---

⭐ **If you found this project useful, give it a star — it helps others discover it!**
