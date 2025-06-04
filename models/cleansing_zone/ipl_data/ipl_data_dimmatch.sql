{{ config(
    materialized='table'
) }}

SELECT
  MATCH_ID,
  DATES_1 AS MATCH_DATE,
  CITY,
  VENUE,
  EVENT_STAGE,
  SEASON
FROM {{ source('raw', 'ALL_IPL_MATCH_DATA') }}
WHERE MATCH_ID IS NOT NULL

