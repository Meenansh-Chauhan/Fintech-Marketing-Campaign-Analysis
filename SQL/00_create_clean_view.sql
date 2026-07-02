/*
==========================================================
File: 00_create_clean_view.sql

Project: Fintech Marketing Campaign Analysis

Objective:
Create a reusable analytical view by adding business-friendly
derived columns for customer segmentation and campaign analysis.

Source Table:
bank_marketing

Output View:
bank_marketing_clean
==========================================================
*/

CREATE OR REPLACE VIEW bank_marketing_clean AS

SELECT

    /*----------------------------------------------------
      Original Columns
    ----------------------------------------------------*/

    age,
    job,
    marital,
    education,
    default_status,
    balance,
    housing,
    loan,
    contact,
    day,
    month,
    duration,
    campaign,
    pdays,
    previous,
    poutcome,
    y,

    /*----------------------------------------------------
      Age Band
    ----------------------------------------------------*/

    CASE
        WHEN age BETWEEN 18 AND 25 THEN 'Young Adult'
        WHEN age BETWEEN 26 AND 35 THEN 'Early Career'
        WHEN age BETWEEN 36 AND 45 THEN 'Mid Career'
        WHEN age BETWEEN 46 AND 55 THEN 'Experienced'
        WHEN age BETWEEN 56 AND 65 THEN 'Senior'
        ELSE 'Retired Age'
    END AS age_band,

    /*----------------------------------------------------
      Balance Tier
    ----------------------------------------------------*/

    CASE
        WHEN balance < 0 THEN 'Negative Balance'
        WHEN balance BETWEEN 0 AND 999 THEN 'Low Balance'
        WHEN balance BETWEEN 1000 AND 4999 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS balance_tier,

    /*----------------------------------------------------
      Month Order
    ----------------------------------------------------*/

    CASE month
        WHEN 'jan' THEN 1
        WHEN 'feb' THEN 2
        WHEN 'mar' THEN 3
        WHEN 'apr' THEN 4
        WHEN 'may' THEN 5
        WHEN 'jun' THEN 6
        WHEN 'jul' THEN 7
        WHEN 'aug' THEN 8
        WHEN 'sep' THEN 9
        WHEN 'oct' THEN 10
        WHEN 'nov' THEN 11
        WHEN 'dec' THEN 12
    END AS month_order,

    /*----------------------------------------------------
      Campaign Contact Group
    ----------------------------------------------------*/

    CASE
        WHEN campaign = 1 THEN 'First Contact'
        WHEN campaign BETWEEN 2 AND 3 THEN 'Moderate Follow-up'
        WHEN campaign BETWEEN 4 AND 5 THEN 'High Follow-up'
        ELSE 'Excessive Follow-up'
    END AS campaign_group,

    /*----------------------------------------------------
      Previous Contact Status
    ----------------------------------------------------*/

    CASE
        WHEN pdays = -1 THEN 'Never Contacted'
        ELSE 'Previously Contacted'
    END AS previous_contact

FROM bank_marketing;