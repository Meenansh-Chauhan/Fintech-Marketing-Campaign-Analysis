/*
==========================================================
File:
05_conversion_by_education.sql

Business Question:
How does customer education level influence campaign
conversion performance?

Objective:
Compare conversion rates across education levels to
identify customer groups with stronger campaign response.
==========================================================
*/

WITH education_summary AS (

    SELECT

        education,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers

    FROM bank_marketing_clean

    GROUP BY education

)

SELECT

    education,

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

FROM education_summary

ORDER BY
    conversion_rate_percentage DESC,
    converted_customers DESC;


/*
==========================================================
Business Insight:

• Customers with tertiary education achieved the highest
  conversion rate (15.01%), making them the most responsive
  education segment while also contributing the highest
  number of successful conversions (1,996).

• Customers with unknown education information recorded a
  conversion rate of 13.57%, exceeding the overall campaign
  baseline. However, this segment represents a relatively
  small customer population (1,857 customers).

• Secondary education customers formed the largest customer
  segment (23,202 customers) and generated 2,450 successful
  conversions, but their conversion rate (10.56%) remained
  below the campaign baseline.

• Primary education customers recorded the lowest
  conversion rate (8.63%), indicating comparatively lower
  campaign effectiveness within this segment.

==========================================================
*/