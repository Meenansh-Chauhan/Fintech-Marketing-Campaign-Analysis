/*
==========================================================
File:
05_conversion_by_education.sql

Business Question:
How does customer education level influence campaign
conversion performance?

Objective:
Compare conversion rates across education levels to
identify customer groups with stronger campaign response.
==========================================================
*/

WITH education_summary AS (

    SELECT

        education,

        COUNT(*) AS total_customers,

        SUM(
            CASE
                WHEN y = 'yes' THEN 1
                ELSE 0
            END
        ) AS converted_customers

    FROM bank_marketing_clean

    GROUP BY education

)

SELECT

    education,

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

FROM education_summary

ORDER BY
    conversion_rate_percentage DESC,
    converted_customers DESC;


/*
==========================================================
Business Insight:

(To be completed after reviewing the query output.)

==========================================================
*/