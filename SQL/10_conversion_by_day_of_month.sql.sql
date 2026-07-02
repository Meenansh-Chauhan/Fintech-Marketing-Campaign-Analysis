/*
==========================================================
File:
10_conversion_by_day_of_month.sql

Business Question:
How does campaign conversion performance vary across
different days of the month?

Objective:
Analyze conversion rates by day of the month to identify
whether customer response changes throughout the monthly
campaign cycle.
==========================================================
*/

WITH day_summary AS (

    SELECT

        day,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers

    FROM bank_marketing_clean

    GROUP BY day

)

SELECT

    day,

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

FROM day_summary

ORDER BY day;


/*
==========================================================
Business Insight:

• Customer conversion rates varied considerably across the
  month, ranging from 6.94% to 27.95%, indicating that
  campaign timing may influence customer response.

• The highest conversion rate was recorded on the 1st day
  of the month (27.95%). However, this result was based on
  a relatively small customer sample (322 customers) and
  should be interpreted with caution.

• Several other days, including the 3rd, 4th, 10th, 12th,
  13th, 22nd and 30th, also recorded conversion rates well
  above the overall campaign baseline of 11.70%.

• While the analysis suggests that campaign performance
  varies throughout the month, no consistent upward or
  downward trend is observed. Therefore, day-of-month
  should be considered alongside other campaign factors
  rather than as an independent driver of customer
  conversion.

==========================================================
*/