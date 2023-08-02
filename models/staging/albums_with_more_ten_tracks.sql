-- albums_with_more_ten_tracks.sql

{{ config(materialized="view") }}

WITH track_counts AS (
    SELECT AlbumId, COUNT(TrackId) AS track_count
    FROM tracks
    GROUP BY AlbumId
)

SELECT AlbumId, track_count
FROM track_counts
WHERE track_count > 10