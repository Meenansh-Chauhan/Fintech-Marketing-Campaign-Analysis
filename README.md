# Fintech-Marketing-Campaign-Analysis [IN Progress]
End-to-end marketing analytics project on a 45K+ record bank marketing  campaign dataset. Raw data stored on AWS S3 and queried via AWS Athena. SQL-first approach covering conversion rates by customer segment, contact  frequency impact, and channel effectiveness. Final deliverable includes an interactive dashboard and 5 business recommendations.

Project 4 — Detailed Summary
Fintech Marketing Campaign Analysis

Project Objective
Analyze a real-world bank marketing campaign dataset to identify high-converting customer segments, evaluate campaign effectiveness, and deliver actionable budget reallocation recommendations — simulating the kind of marketing analytics work done at fintech companies like American Express, Visa, and Mastercard.
The project is intentionally SQL-first and dashboard-forward, with cloud integration as a supporting credential and Python in a lightweight supporting role.

Dataset
Source: UCI Machine Learning Repository — Bank Marketing Dataset
Size: 45,000+ records
Content: Customer demographic data, account information, contact history, campaign details, and subscription outcome (converted / not converted) from a Portuguese bank's telemarketing campaign.
This dataset is industry-recognized, realistic in structure, and large enough to demonstrate meaningful SQL querying and segmentation work.

Project Architecture
Layer 1 — Cloud Data Storage (AWS S3)
The raw UCI dataset (CSV) will be uploaded to an AWS S3 bucket, simulating a real data lake environment. The S3 bucket will be structured cleanly with a logical folder organization (raw data, processed data). This setup will be documented in the README with a simple architecture diagram showing data flow from S3 through Athena to the dashboard.
AWS free tier will be used throughout — no cost involved.
Layer 2 — SQL Analysis (AWS Athena)
Athena connects directly to the S3 bucket and allows standard SQL queries to run against the data without any database setup or server management. This is the spine of the entire project.
SQL analysis will cover the following business questions:

Overall campaign conversion rate as the baseline KPI
Conversion rate broken down by age band, job type, marital status, and education level
Impact of contact frequency — does calling a customer more times improve or hurt conversion?
Channel effectiveness — telephone vs. cellular contact outcomes
Conversion rate by month and day of week — identifying peak campaign timing
Account balance tier analysis — do higher balance customers convert at higher rates?
Average call duration comparison between converted and non-converted customers
Previous campaign outcome analysis — how does prior contact history affect current conversion?

Each business question will be a separate, clearly commented .sql file uploaded to the GitHub repository. File naming will follow a consistent convention such as 01_overall_conversion_rate.sql, 02_conversion_by_age_segment.sql, and so on. This makes SQL work immediately visible and organized for any recruiter reviewing the repository.
Layer 3 — Python Supporting Analysis
Python's role is limited to analysis that SQL cannot handle cleanly or visually:

Distribution plots for key variables (age, balance, call duration)
Correlation heatmap across numerical features
Conversion rate visualizations by segment (bar charts, grouped plots)
A brief customer profiling section identifying the characteristics of the highest-converting customer profile

All Python work will be in a single clean Jupyter notebook with markdown cells explaining each step in business language, not just code comments.
Layer 4 — Power BI Dashboard
The dashboard will have three pages:
Page 1 — Executive Summary
Headline KPIs: overall conversion rate, total customers contacted, best performing month, average call duration for converted customers, and estimated campaign efficiency score.
Page 2 — Segment Performance
Conversion rate broken down by demographic and behavioral segments. Visuals will highlight which customer profiles respond best to campaigns and which segments are being over-contacted with low return.
Page 3 — Campaign Optimization
Contact strategy analysis — frequency, timing, channel, and duration insights combined into one view that directly supports the business recommendations.
The dashboard will be designed for an executive audience — clean layout, consistent color scheme, minimal clutter, clear titles on every visual.
Layer 5 — Business Recommendations
This is the final and most important deliverable. Five specific, numbered recommendations will be written based entirely on the SQL and dashboard findings. Each recommendation will follow this format:

The finding (what the data shows)
The implication (what it means for the business)
The action (what the marketing team should do differently)

Example of the target quality level: "Customers aged 30–40 with account balances above a defined threshold showed 2.8x higher conversion rates than the overall average. Recommend reallocating 20–25% of contact volume from the lowest-performing age bands into this segment for the next campaign cycle."

Tech Stack
LayerToolCloud StorageAWS S3SQL QueryingAWS AthenaData AnalysisPython, Pandas, Matplotlib, SeabornDashboardPower BIVersion ControlGitHub

GitHub Repository Structure
fintech-marketing-campaign-analysis/
│
├── data/
│   └── bank_marketing_raw.csv
│
├── sql/
│   ├── 01_overall_conversion_rate.sql
│   ├── 02_conversion_by_age_segment.sql
│   ├── 03_conversion_by_job_type.sql
│   ├── 04_contact_frequency_analysis.sql
│   ├── 05_channel_effectiveness.sql
│   ├── 06_conversion_by_month_day.sql
│   ├── 07_balance_tier_analysis.sql
│   ├── 08_call_duration_analysis.sql
│   └── 09_previous_campaign_analysis.sql
│
├── Query_results/
│   └── relative query results
│
├── notebooks/
│   └── supporting_python_analysis.ipynb
│
├── dashboard/
│   └── fintech_campaign_dashboard.pbix
│
├── visuals/
│   └── (exported dashboard screenshots for README)
│
└── README.md

What This Project Demonstrates to Recruiters

SQL proficiency through real, documented, business-question-driven queries
Cloud awareness through AWS S3 and Athena integration
Dashboard design and business storytelling through Power BI
Marketing analytics domain knowledge relevant to fintech hiring
Professional GitHub documentation and project organization
Ability to translate data findings into specific business decisions

