/*
==========================================================
File:
13_call_duration_analysis.sql

Business Question:
How does call duration influence customer conversion
performance?

Objective:
Compare conversion rates across different call duration
categories to evaluate the relationship between customer
engagement time and campaign success.
==========================================================
*/

WITH duration_summary AS (

    SELECT

        duration_category,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers,

        ROUND(AVG(duration), 2) AS average_call_duration_seconds

    FROM bank_marketing_clean

    GROUP BY duration_category

)

SELECT

    duration_category,

    total_customers,

    converted_customers,

    average_call_duration_seconds,

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

FROM duration_summary

ORDER BY
    average_call_duration_seconds;
    

/*
==========================================================
Business Insight:

• Long Call interactions achieved the highest conversion
  rate (28.17%), substantially outperforming the overall
  campaign baseline of 11.70%.

• Medium Call interactions recorded a conversion rate of
  8.55%, remaining below the campaign baseline despite
  representing the largest customer segment.

• Short Call interactions produced the lowest conversion
  rate (1.47%), suggesting that brief customer
  conversations rarely resulted in successful term deposit
  subscriptions.

• While longer conversations were strongly associated with
  higher conversion rates, call duration should be
  interpreted as a post-call performance indicator rather
  than a variable available before campaign execution.

==========================================================
*/