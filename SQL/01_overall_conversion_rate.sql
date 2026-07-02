/*
==========================================================
File:
01_overall_conversion_rate.sql

Business Question:
What is the overall conversion performance of the marketing campaign?

Objective:
Calculate the total customers contacted, successful conversions,
unsuccessful conversions, and overall campaign conversion rate.
==========================================================
*/

SELECT

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN y = 'yes' THEN 1
            ELSE 0
        END
    ) AS converted_customers,

    SUM(
        CASE
            WHEN y = 'no' THEN 1
            ELSE 0
        END
    ) AS non_converted_customers,

    ROUND(
        100.0 *
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS conversion_rate_percentage

FROM bank_marketing_clean;


/*
==========================================================
Business Insight:

(To be completed after reviewing the query output.)
==========================================================
*/