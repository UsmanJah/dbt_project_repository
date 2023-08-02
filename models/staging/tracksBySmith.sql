-- ma_table.sql

{{ config(materialized="table") }}

WITH data_source AS (
    SELECT TrackId, Name, AlbumId, MediaTypeId, Composer
    FROM {{ ref("tracks") }}
),
filtered_data AS (
    SELECT * FROM data_source
    WHERE Composer LIKE '%Smith%'
    AND MediaTypeId BETWEEN 1 AND 10
)

SELECT * FROM filtered_data
