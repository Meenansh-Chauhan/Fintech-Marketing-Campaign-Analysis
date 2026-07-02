/*
==========================================================
File:
11_previous_campaign_analysis.sql

Business Question:
How does the outcome of a customer's previous campaign
influence current campaign conversion performance?

Objective:
Compare conversion performance across previous campaign
outcomes and measure each segment's contribution to the
overall campaign success.
==========================================================
*/

WITH campaign_outcome_summary AS (

    SELECT

        poutcome,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers

    FROM bank_marketing_clean

    GROUP BY poutcome

),

total_conversions AS (

    SELECT

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS total_converted

    FROM bank_marketing_clean

)

SELECT

    cos.poutcome,

    cos.total_customers,

    cos.converted_customers,

    ROUND(
        100.0 * cos.converted_customers / cos.total_customers,
        2
    ) AS conversion_rate_percentage,

    ROUND(
        100.0 * cos.converted_customers / tc.total_converted,
        2
    ) AS share_of_total_conversions,

    CASE
        WHEN ROUND(
            100.0 * cos.converted_customers / cos.total_customers,
            2
        ) >= 11.70
        THEN 'Above Baseline'
        ELSE 'Below Baseline'
    END AS performance_vs_baseline

FROM campaign_outcome_summary cos

CROSS JOIN total_conversions tc

ORDER BY
    conversion_rate_percentage DESC,
    converted_customers DESC;


/*
==========================================================
Business Insight:

• Customers who had a successful outcome in a previous
  campaign recorded the highest conversion rate (64.73%),
  making them the most responsive customer segment for
  future marketing efforts.

• Although customers with an Unknown previous campaign
  outcome represented the largest customer segment
  (36,959 customers) and contributed 64.02% of all
  successful conversions, their conversion rate (9.16%)
  remained below the overall campaign baseline.

• Customers with previous campaign outcomes of "Other"
  (16.68%) and "Failure" (12.61%) both performed above
  the campaign baseline, indicating that prior campaign
  engagement can still positively influence future
  marketing response.

• Previous campaign outcome is a strong predictor of
  future customer conversion and should be considered
  when prioritizing marketing campaigns.

==========================================================
*/