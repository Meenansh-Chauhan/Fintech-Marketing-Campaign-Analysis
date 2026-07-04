/*
==========================================================
File:
09_conversion_by_month.sql

Business Question:
Which months achieved the highest campaign conversion
rates?

Objective:
Analyze campaign performance across different months
to identify seasonal conversion patterns and optimal
campaign timing.
==========================================================
*/

WITH month_summary AS (

    SELECT

        month,
        month_order,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers

    FROM bank_marketing_clean

    GROUP BY
        month,
        month_order

)

SELECT

    month,

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

FROM month_summary

ORDER BY month_order;


/*
==========================================================
Business Insight:

• March recorded the highest campaign conversion rate
  (51.99%), followed by December (46.73%), September
  (46.46%) and October (43.77%). However, these months
  involved relatively small customer volumes, indicating
  that the exceptionally high conversion rates should be
  interpreted with caution.

• April achieved a strong conversion rate (19.68%) while
  contacting a substantially larger customer base (2,932
  customers), making it one of the most effective campaign
  periods.

• May represented the largest campaign month (13,766
  customers) but recorded the lowest conversion rate
  (6.72%), significantly below the overall campaign
  baseline of 11.70%.

• Overall, campaign timing appears to influence customer
  response, with smaller campaign periods generally
  achieving higher conversion rates than high-volume
  outreach months.

==========================================================
*/