/*
==========================================================
File:
02_conversion_by_age_segment.sql

Business Question:
Which age groups achieved the highest conversion rates?

Objective:
Compare customer conversion performance across age
segments to identify high-value target groups.
==========================================================
*/

SELECT

    age_band,

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

GROUP BY age_band

ORDER BY conversion_rate_percentage DESC;


/*
==========================================================
Business Insight:

• Retired Age customers achieved the highest conversion
  rate (42.61%), indicating exceptional campaign response,
  although this segment represents a relatively small
  customer population (751 customers).

• Young Adults also performed significantly above the
  campaign average with a conversion rate of 23.95%.

• Early Career customers contributed the highest number of
  conversions (1,869) due to their large customer base,
  while maintaining a conversion rate slightly above the
  overall campaign average (12.00%).

• Mid Career and Experienced customers recorded conversion
  rates below the campaign baseline (11.70%), suggesting
  lower marketing efficiency within these segments.

==========================================================
*/