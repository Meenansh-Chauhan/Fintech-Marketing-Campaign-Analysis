/*
==========================================================
File:
03_conversion_by_job_type.sql

Business Question:
Which occupational groups achieved the highest
conversion rates?

Objective:
Compare campaign performance across customer
occupations to identify high-performing target
segments for future marketing campaigns.
==========================================================
*/

SELECT

    job,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN y = 'yes' THEN 1
            ELSE 0
        END
    ) AS converted_customers,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS conversion_rate_percentage

FROM bank_marketing_clean

GROUP BY job

ORDER BY conversion_rate_percentage DESC;


/*
==========================================================
Business Insight:

• Students recorded the highest conversion rate (28.68%),
  making them the most responsive customer segment despite
  representing only 938 contacted customers.

• Retired customers achieved the second-highest conversion
  rate (22.79%), confirming the strong campaign response
  observed in the age-based analysis.

• Management professionals generated the highest number of
  successful conversions (1,301) while maintaining a
  conversion rate (13.76%) above the overall campaign
  baseline of 11.70%.

• Blue-collar customers represented the largest customer
  segment (9,732) but recorded the lowest conversion rate
  (7.27%), indicating relatively low campaign efficiency
  within this occupation.

==========================================================
*/