/*
==========================================================
File:
08_channel_effectiveness.sql

Business Question:
Which communication channel delivers higher campaign
conversion rates?

Objective:
Compare campaign conversion performance across
communication channels to identify the most effective
customer contact method.
==========================================================
*/

WITH channel_summary AS (

    SELECT

        contact,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers

    FROM bank_marketing_clean

    GROUP BY contact

)

SELECT

    contact AS communication_channel,

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

FROM channel_summary

ORDER BY
    conversion_rate_percentage DESC,
    converted_customers DESC;

/*
==========================================================
Business Insight:

• Cellular communication achieved the highest conversion
  rate (14.92%), outperforming the overall campaign
  baseline of 11.70% while generating the highest number
  of successful conversions (4,369).

• Telephone communication also performed above the
  campaign baseline with a conversion rate of 13.42%,
  although it represented a much smaller customer segment
  (2,906 customers).

• Customers with an Unknown communication channel recorded
  the lowest conversion rate (4.07%), suggesting that
  incomplete or unidentified contact information is
  associated with significantly lower campaign
  effectiveness.

==========================================================
*/