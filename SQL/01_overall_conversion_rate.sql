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

• The campaign reached a total of 45,211 customers.

• Out of these, 5,289 customers subscribed to the term
  deposit, while 39,922 customers did not convert.

• The overall campaign conversion rate was 11.70%,
  establishing the baseline performance benchmark for
  evaluating customer segments and campaign strategies.

==========================================================
*/