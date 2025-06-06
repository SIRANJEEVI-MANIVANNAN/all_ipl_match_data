{{ config(
    materialized='table'
) }}

SELECT
    m.MATCH_ID,
    m.MATCH_DATE,
    m.CITY,
    m.VENUE,
    m.EVENT_STAGE,
    m.SEASON,
    f.TEAM_1,
    f.TEAM_2,
    f.TOSS_WINNER,
    f.TOSS_DECISION,
    f.WINNER,
    f.MATCH_RESULT,
    f.BY_INNINGS,
    f.BY_WICKETS,
    f.BY_RUNS,
    p.PLAYER_NAME AS PLAYER_OF_MATCH,
    tp.BATTER AS TOP_PERFORMER,
    tp.TOTAL_RUNS
FROM {{ ref('ipl_data_fact_matches') }} f
LEFT JOIN {{ ref('ipl_data_dimmatch') }} m
    ON f.MATCH_ID = m.MATCH_ID
LEFT JOIN {{ ref('ipl_data_dimplayers') }} p
    ON f.PLAYER_OF_MATCH_ID = p.PLAYER_ID
LEFT JOIN {{ ref('ipl_data_fact_top_performers') }} tp
    ON f.SEASON = tp.SEASON

