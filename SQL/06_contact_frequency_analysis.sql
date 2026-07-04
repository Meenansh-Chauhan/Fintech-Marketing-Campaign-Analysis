/*
==========================================================
File:
06_contact_frequency_analysis.sql

Business Question:
How does the number of customer contacts influence
campaign conversion performance?

Objective:
Evaluate whether increasing the number of campaign
contacts improves or reduces customer conversion rates.
==========================================================
*/

WITH campaign_summary AS (

    SELECT

        campaign AS contact_attempts,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers

    FROM bank_marketing_clean

    GROUP BY campaign

    HAVING COUNT(*) >= 30

)

SELECT

    contact_attempts,

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

FROM campaign_summary

ORDER BY contact_attempts;


/*
==========================================================
Business Insight:

• The first customer contact achieved the highest
  conversion rate (14.60%), outperforming the overall
  campaign baseline of 11.70%.

• Conversion rates declined immediately after the first
  contact, dropping to 11.20% on the second contact and
  continuing a downward trend with each additional
  follow-up attempt.

• Customers contacted five or more times consistently
  recorded conversion rates below 8%, indicating
  diminishing marketing returns despite increased contact
  effort.

• Customers contacted 18 and 19 times recorded zero
  successful conversions, suggesting that repeated contact
  beyond a certain point is highly ineffective and may
  unnecessarily increase campaign costs.

==========================================================
*/