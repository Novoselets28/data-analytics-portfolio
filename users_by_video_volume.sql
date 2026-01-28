-- =====================================================
-- File: users_by_video_volume.sql
-- Purpose: Calculate user distribution by number of watched videos
-- Source table: junior_da_personal.watching_data
-- =====================================================


-- 1. Users grouped by amount of unique watched video objects
SELECT
    video_amount,
    COUNT(user_id) AS users_cnt,
    COUNT(user_id) / (
        SELECT COUNT(DISTINCT user_id)
        FROM rd-jda-course-477018.junior_da_personal.watching_data
    ) * 100 AS users_percent
FROM (
    SELECT
        user_id,
        COUNT(DISTINCT object_id) AS video_amount
    FROM rd-jda-course-477018.junior_da_personal.watching_data
    GROUP BY user_id
)
GROUP BY video_amount
ORDER BY video_amount;
