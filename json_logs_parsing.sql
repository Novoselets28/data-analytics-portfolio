-- =====================================================
-- File: json_logs_parsing.sql
-- Purpose: Parse JSON log data into structured columns
-- Source table: dala-rdcc.logs_data.logs
-- =====================================================


-- 1. Extract date and details from JSON log field
SELECT
    info_json,
    JSON_VALUE(info_json, '$.date') AS log_date,
    JSON_QUERY_ARRAY(info_json, '$.details') AS details_array,
    JSON_QUERY(info_json, '$.details[0]') AS detail_a,
    JSON_QUERY(info_json, '$.details[1]') AS detail_b
FROM dala-rdcc.logs_data.logs;
