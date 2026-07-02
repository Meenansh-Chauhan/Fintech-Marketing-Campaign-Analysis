# SQL Analysis Documentation

## Overview

This folder contains the complete SQL analysis for the **Fintech Marketing Campaign Analysis** project.

The analysis was performed using **Amazon Athena**, with the dataset stored in **Amazon S3**. SQL was used as the primary analytical tool to answer business-focused marketing questions related to customer segmentation, campaign effectiveness, communication strategy, and conversion optimization.

---

## SQL Environment

- Query Engine: Amazon Athena
- Cloud Storage: Amazon S3
- SQL Dialect: Presto (Athena SQL)

---

## SQL Concepts Demonstrated

- Views
- Common Table Expressions (CTEs)
- Conditional Aggregation
- CASE Statements
- Aggregate Functions
- GROUP BY
- ORDER BY
- CROSS JOIN
- Business KPI Calculations

---

## Analysis Roadmap

| File | Business Objective |
|------|--------------------|
| 00_create_clean_view.sql | Create reusable analytical view |
| 01_overall_conversion_rate.sql | Calculate campaign baseline KPI |
| 02_conversion_by_age_segment.sql | Analyze conversion by age group |
| 03_conversion_by_job_type.sql | Evaluate occupation performance |
| 04_conversion_by_marital_status.sql | Compare marital status segments |
| 05_conversion_by_education.sql | Analyze education-level performance |
| 06_contact_frequency_analysis.sql | Evaluate campaign contact strategy |
| 07_balance_tier_analysis.sql | Compare financial segments |
| 08_channel_effectiveness.sql | Evaluate communication channels |
| 09_conversion_by_month.sql | Identify seasonal campaign trends |
| 10_conversion_by_day_of_month.sql | Analyze intra-month campaign timing |
| 11_previous_campaign_analysis.sql | Measure impact of previous campaigns |
| 12_customer_profile_summary.sql | Build ideal customer profile |
| 13_call_duration_analysis.sql | Analyze customer engagement duration |

---

## Key Business Outcomes

The SQL analysis identified:

- High-performing customer demographics
- Optimal campaign contact strategy
- Most effective communication channel
- Financial segments with strongest conversion
- Seasonal campaign trends
- Impact of previous campaign history
- Executive-level customer profile for future targeting

---

## Supporting Files

Each SQL file has a corresponding query output stored in the `query_results` folder.

These outputs were exported directly from Amazon Athena after query execution and were used for validation and dashboard development.