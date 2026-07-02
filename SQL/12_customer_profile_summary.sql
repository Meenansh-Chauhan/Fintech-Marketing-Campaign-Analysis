/*
==========================================================
File:
12_customer_profile_summary.sql

Business Question:
What are the characteristics of the highest-performing
customer segments identified throughout the campaign
analysis?

Objective:
Summarize the best-performing customer segments across
key demographic and campaign dimensions to build an
ideal customer profile.
==========================================================
*/

SELECT
    'Age Band' AS customer_attribute,
    'Retired Age' AS best_performing_segment,
    42.61 AS conversion_rate_percentage

UNION ALL

SELECT
    'Job Type',
    'Student',
    28.68

UNION ALL

SELECT
    'Marital Status',
    'Single',
    14.95

UNION ALL

SELECT
    'Education',
    'Tertiary',
    15.01

UNION ALL

SELECT
    'Balance Tier',
    'High Balance',
    15.49

UNION ALL

SELECT
    'Communication Channel',
    'Cellular',
    14.92

ORDER BY conversion_rate_percentage DESC;


/*
==========================================================
Business Insight:

• The ideal customer profile was constructed by combining
  the highest-performing segment from each completed
  analysis, providing a consolidated view of customers
  most likely to respond to future marketing campaigns.

• Retired Age customers and Students demonstrated the
  strongest conversion performance across demographic
  analyses, while High Balance customers consistently
  outperformed lower balance segments.

• Cellular communication emerged as the most effective
  contact channel, reinforcing its suitability for future
  campaign outreach.

• This executive summary serves as a practical reference
  for marketing teams when prioritizing customer segments
  and optimizing campaign strategy.

==========================================================
*/