# Fintech Marketing Campaign Analysis

A portfolio project demonstrating SQL-driven marketing analytics using the UCI Bank Marketing dataset. The project simulates a real-world campaign performance analysis performed by Data Analysts and Business Analysts in fintech organizations.

---

## Project Objective

The objective of this project is to analyze a bank marketing campaign, identify high-converting customer segments, evaluate campaign effectiveness, and recommend strategies for improving future marketing performance.

The project combines SQL, cloud technologies, Python, and Power BI into a complete analytics workflow.

---

## Dataset

**Source:** UCI Machine Learning Repository – Bank Marketing Dataset

**Records:** 45,211

**Features:** 17 customer demographic, financial, and campaign attributes.

**Target Variable:** Customer subscription to a term deposit (`y`).

---

## Tech Stack

| Category | Tools |
|----------|-------|
| Cloud Storage | AWS S3 |
| SQL | AWS Athena |
| Programming | Python |
| Data Analysis | Pandas, NumPy |
| Visualization | Matplotlib, Seaborn |
| Dashboard | Power BI |
| Version Control | Git & GitHub |

---

## Project Architecture

```
Raw CSV
     │
     ▼
 AWS S3 Bucket
     │
     ▼
 AWS Athena
(SQL Analysis)
     │
     ▼
Python Analysis
(Jupyter Notebook)
     │
     ▼
Power BI Dashboard
     │
     ▼
Business Recommendations
```

---

## Repository Structure

```
fintech-marketing-campaign-analysis/

├── architecture/
├── data/
├── notebooks/
├── python/
├── query_results/
├── SQL/
├── visuals/
├── README.md
└── requirements.txt
```

---

## SQL Analysis

Business questions answered using AWS Athena:

- Overall campaign conversion rate
- Conversion by age segment
- Conversion by occupation
- Conversion by marital status
- Conversion by education
- Contact frequency analysis
- Account balance tier analysis
- Communication channel effectiveness
- Monthly campaign performance
- Daily campaign performance
- Previous campaign outcome analysis
- Best-performing customer segments
- Call duration analysis

---

## Python Analysis

Python was used to perform supporting exploratory analysis, including:

- Dataset validation
- Statistical summaries
- Correlation analysis
- Distribution analysis
- Boxplot comparisons
- Customer profiling

---

## Dashboard

The Power BI dashboard contains three pages:

### Executive Summary

- Overall conversion rate
- Campaign KPIs
- Customer overview

### Customer Segmentation

- Age
- Occupation
- Education
- Balance
- Marital status

### Campaign Optimization

- Contact frequency
- Communication channel
- Call duration
- Previous campaign performance
- Monthly trends

---

## Key Findings

- The overall marketing campaign achieved a **conversion rate of 11.70%**, establishing the baseline for campaign performance.
- **Students (28.68%)** and **retired customers (22.79%)** demonstrated the highest conversion rates among customer segments.
- Customers with **medium and high account balances** converted significantly more often than those with low or negative balances.
- **Cellular communication** proved substantially more effective than unknown communication channels.
- Customers with a **successful previous campaign interaction** exhibited the highest likelihood of converting again.
- The **first contact attempt** delivered the strongest conversion performance, with conversion rates declining as additional contact attempts increased.
- **Longer customer conversations** showed a strong positive relationship with successful campaign outcomes.
- Correlation analysis indicated that customer behaviour is influenced more by **segment characteristics and campaign strategy** than by strong linear relationships among numerical variables.

---

## Business Recommendations

Based on the analysis, the following actions are recommended to improve future marketing campaign performance:

1. **Prioritize High-Converting Customer Segments**
   - Allocate a larger share of campaign resources toward students, retired customers, and customers maintaining medium to high account balances, as these groups consistently achieved above-average conversion rates.

2. **Optimize Contact Strategy**
   - Focus on maximizing the effectiveness of the initial customer interaction rather than increasing the number of follow-up calls, since conversion rates decline noticeably after the first few contact attempts.

3. **Improve Communication Channel Selection**
   - Prioritize cellular communication wherever possible and reduce reliance on unknown or poorly documented communication channels.

4. **Leverage Previous Campaign History**
   - Incorporate previous campaign outcomes into customer targeting strategies by giving higher priority to customers who responded positively to earlier marketing campaigns.

5. **Increase Customer Engagement Quality**
   - Emphasize meaningful customer conversations through improved agent training and personalized communication, as longer and more engaging calls were consistently associated with higher conversion rates.

---

## Future Improvements

### Version 2 Roadmap

The next version of this project will extend the current descriptive analytics workflow into a more advanced business analytics solution by introducing:

- Customer segmentation using clustering techniques (K-Means)
- Campaign ROI and marketing budget optimization analysis
- Interactive Power BI dashboard enhancements with drill-through functionality
- Automated data pipeline integrating AWS S3, Athena, and Power BI refresh
- Performance comparison across multiple marketing campaign scenarios

---

## Author

**Meenansh Chauhan**

Business Analytics • Data Analytics • SQL • Python • Power BI • AWS