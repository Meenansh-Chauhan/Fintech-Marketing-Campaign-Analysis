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

(To be completed after reviewing the query output.)

==========================================================
*/