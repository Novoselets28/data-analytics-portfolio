-- =====================================================
-- File: content_filtering.sql
-- Purpose: Filter video content by type, rating and age
-- Source table: junior_da_personal.video_info
-- =====================================================


-- 1. Select all video objects excluding TV, Shows and Show-Films
SELECT
  *
FROM rd-jda-course-477018.junior_da_personal.video_info
WHERE type NOT IN ('TV', 'SHOW', 'SHOWFILM');


-- 2. Top 5 highest-rated films by IMDB rating
SELECT
  title,
  type,
  rating_imdb
FROM rd-jda-course-477018.junior_da_personal.video_info
WHERE type = 'FILM'
ORDER BY SAFE_CAST(rating_imdb AS FLOAT64) DESC
LIMIT 5;


-- 3. Unique cartoons (multfilms) for children with high rating or recent release
SELECT DISTINCT
  title,
  type,
  rating_imdb,
  age_limit,
  premiere
FROM rd-jda-course-477018.junior_da_personal.video_info
WHERE type = 'MULTFILM'
  AND age_limit < 12
  AND (
    SAFE_CAST(rating_imdb AS FLOAT64) >= 8
    OR premiere LIKE '%2022'
  );
