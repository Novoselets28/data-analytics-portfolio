-- =====================================================
-- File: monthly_likes_analysis.sql
-- Purpose: Analyze monthly likes by video category and time of day
-- Source tables:
--   - junior_da_personal.like_favourites
--   - junior_da_personal.watching_data
-- =====================================================


-- 1. Monthly unique users who liked content by category and daypart
SELECT
    wd.type AS video_category,
    DATE_TRUNC(DATE(lf.event_date), MONTH) AS event_month,
    CASE
        WHEN TIME(lf.event_time) <= '06:00:00' THEN 'Night'
        WHEN TIME(lf.event_time) <= '12:00:00' THEN 'Morning'
        WHEN TIME(lf.event_time) <= '18:00:00' THEN 'Day'
        ELSE 'Evening'
    END AS daypart,
    COUNT(DISTINCT lf.user_id) AS users_cnt
FROM rd-jda-course-477018.junior_da_personal.like_favourites lf
JOIN rd-jda-course-477018.junior_da_personal.watching_data wd
    ON lf.object_id = wd.object_id
WHERE lf.event_type = 'like_add'
GROUP BY
    video_category,
    event_month,
    daypart
ORDER BY
    video_category,
    event_month;
