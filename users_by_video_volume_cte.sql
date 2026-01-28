-- =====================================================
-- File: users_by_video_volume_cte.sql
-- Purpose: Same logic as subquery version using CTEs
-- Source table: junior_da_personal.watching_data
-- =====================================================


WITH users_video_counts AS (
    SELECT
        user_id,
        COUNT(DISTINCT object_id) AS video_amount
    FROM rd-jda-course-477018.junior_da_personal.watching_data
    GROUP BY user_id
),
total_users AS (
    SELECT
        COUNT(DISTINCT user_id) AS total_users
    FROM rd-jda-course-477018.junior_da_personal.watching_data
)

SELECT
    u.video_amount,
    COUNT(*) AS users_cnt,
    COUNT(*) / t.total_users * 100 AS users_percent
FROM users_video_counts u
CROSS JOIN total_users t
GROUP BY
    u.video_amount,
    t.total_users
ORDER BY u.video_amount;
