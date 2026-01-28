-- =====================================================
-- File: user_behavioural_groups_view.sql
-- Purpose: Create view with user behavioural segmentation
-- =====================================================


CREATE VIEW rd-jda-course-477018.junior_da_personal.user_behavioural_groups AS
WITH filtered AS (
    SELECT *
    FROM rd-jda-course-477018.junior_da_personal.watching_data
    WHERE w_duration >= 30
),
metrics AS (
    SELECT
        user_id,
        COUNT(IF(type = 'TV', object_id, NULL)) AS tv_object_cnt,
        COUNT(IF(type != 'TV', object_id, NULL)) AS video_object_cnt,
        ROUND(SUM(w_duration) / 3600) AS w_duration_h,
        COUNT(DISTINCT event_date) AS usage_days
    FROM filtered
    GROUP BY user_id
)

SELECT
    user_id,
    CASE
        WHEN tv_object_cnt = 0 AND video_object_cnt > 0 THEN 'VIDEO'
        WHEN tv_object_cnt > 0 AND video_object_cnt = 0 THEN 'TV'
        ELSE 'TV+VIDEO'
    END AS content_type_group,
    CASE
        WHEN w_duration_h <= 1 THEN '0-1 hour'
        WHEN w_duration_h <= 10 THEN '1-10 hours'
        WHEN w_duration_h <= 50 THEN '10-50 hours'
        WHEN w_duration_h <= 100 THEN '50-100 hours'
        WHEN w_duration_h <= 500 THEN '100-500 hours'
        ELSE '500+ hours'
    END AS w_hours_group,
    CASE
        WHEN usage_days = 1 THEN '1 day'
        WHEN usage_days <= 7 THEN '1-7 days'
        WHEN usage_days <= 14 THEN '7-14 days'
        WHEN usage_days <= 30 THEN '14-30 days'
        WHEN usage_days <= 60 THEN '30-60 days'
        ELSE '60+ days'
    END AS days_group
FROM metrics;
