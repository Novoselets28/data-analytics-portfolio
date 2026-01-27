-- =====================================================
-- File: ddl_setup.sql
-- Purpose: Create personal working schema and tables
-- Source: dala-rdcc.mgg_data
-- Platform: Google BigQuery
-- =====================================================

-- Create table: like_favourites
CREATE TABLE junior_da_personal.like_favourites AS
SELECT *
FROM dala-rdcc.mgg_data.like_favourites;

-- Create table: watching_data
CREATE TABLE junior_da_personal.watching_data AS
SELECT *
FROM dala-rdcc.mgg_data.watching_data;

-- Create table: user_groups
CREATE TABLE junior_da_personal.user_groups AS
SELECT *
FROM dala-rdcc.mgg_data.user_groups;

-- Create table: video_genre
CREATE TABLE junior_da_personal.video_genre AS
SELECT *
FROM dala-rdcc.mgg_data.video_genre;

-- Create table: video_info
CREATE TABLE junior_da_personal.video_info AS
SELECT *
FROM dala-rdcc.mgg_data.video_info;
