/*
==========================================================
File:
07_balance_tier_analysis.sql

Business Question:
How does customer account balance influence campaign
conversion performance?

Objective:
Compare conversion rates across customer balance tiers
to determine whether financially stronger customers are
more likely to subscribe to the term deposit.
==========================================================
*/

WITH balance_summary AS (

    SELECT

        balance_tier,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers

    FROM bank_marketing_clean

    GROUP BY balance_tier

)

SELECT

    balance_tier,

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

FROM balance_summary

ORDER BY
    conversion_rate_percentage DESC,
    converted_customers DESC;


/*
==========================================================
Business Insight:

• Customers with High Balance accounts achieved the highest
  conversion rate (15.49%), outperforming the overall
  campaign baseline of 11.70%.

• Medium Balance customers recorded a similar conversion
  rate (15.36%) while contributing the highest number of
  successful conversions (1,812) among the above-baseline
  balance segments.

• Low Balance customers represented the largest customer
  segment (26,803 customers) and generated the highest
  number of total conversions (2,826). However, their
  conversion rate (10.54%) remained below the campaign
  baseline.

• Customers with Negative Balance accounts recorded the
  lowest conversion rate (5.58%), indicating substantially
  lower campaign effectiveness and suggesting that repeated
  marketing efforts toward this segment may generate
  limited returns.

==========================================================
*/