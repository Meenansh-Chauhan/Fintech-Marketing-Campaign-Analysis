/*
==========================================================
File:
04_conversion_by_marital_status.sql

Business Question:
How does campaign conversion performance vary across
different marital status groups?

Objective:
Compare customer conversion rates by marital status to
identify demographic segments with stronger campaign
response.
==========================================================
*/

WITH marital_summary AS (

    SELECT

        marital,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers

    FROM bank_marketing_clean

    GROUP BY marital

)

SELECT

    marital,

    total_customers,

    converted_customers,

    ROUND(
        100.0 * converted_customers / total_customers,
        2
    ) AS conversion_rate_percentage,

    CASE
        WHEN ROUND(
            100.0 * converted_customers / total_customers,
            2
        ) >= 11.70
        THEN 'Above Baseline'
        ELSE 'Below Baseline'
    END AS performance_vs_baseline

FROM marital_summary

ORDER BY conversion_rate_percentage DESC;


/*
==========================================================
Business Insight:

• Single customers recorded the highest conversion rate
  (14.95%), outperforming the overall campaign baseline
  of 11.70%, making them the most responsive marital
  segment.

• Divorced customers also performed slightly above the
  campaign average with a conversion rate of 11.95%.

• Married customers represented the largest customer
  segment (27,214 customers) and generated the highest
  number of conversions (2,755). However, their conversion
  rate (10.12%) remained below the overall campaign
  baseline, indicating lower campaign efficiency despite
  high customer volume.

==========================================================
*/