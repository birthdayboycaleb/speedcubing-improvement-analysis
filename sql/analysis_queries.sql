-- Speedcubing Performance & Improvement Analysis

-- Check # of competitors + competition records.
SELECT COUNT(*) AS number_of_competitors,SUM(total_competitions) AS number_of_competition_records,MIN(total_competitions) AS minimum_competitions,ROUND(AVG(total_competitions), 1) AS average_competitions,MAX(total_competitions) AS maximum_competitions
FROM competitor_summary;

-- Avg improvement from first to best average.
SELECT ROUND(AVG(first_average_seconds), 2) AS average_starting_time_seconds,ROUND(AVG(best_average_seconds), 2) AS average_best_time_seconds,ROUND(AVG(improvement_seconds), 2) AS average_improvement_seconds,ROUND(AVG(improvement_percent), 1) AS average_improvement_percent
FROM competitor_summary;

-- List 10 competitors w/largest improvement in seconds.
SELECT person_name,country,total_competitions,first_average_seconds,best_average_seconds,ROUND(improvement_seconds, 2) AS improvement_seconds,improvement_percent
FROM competitor_summary
ORDER BY improvement_seconds DESC
LIMIT 10;

-- Show median performance during first 10 competitions.
SELECT competition_number,competitors AS number_of_competitors,median_average_seconds,median_personal_best_seconds
FROM path_summary
ORDER BY competition_number;

-- Show achievement rate for each milestone.
SELECT milestone,competitors_reached,percent_reached,median_competitions_to_reach
FROM milestone_summary
ORDER BY percent_reached DESC;

-- Avg competitions needed to reach each milestone.
SELECT ROUND(AVG(competitions_to_sub_30), 1) AS average_competitions_to_sub_30,ROUND(AVG(competitions_to_sub_20), 1) AS average_competitions_to_sub_20,ROUND(AVG(competitions_to_sub_15), 1) AS average_competitions_to_sub_15,ROUND(AVG(competitions_to_sub_10), 1) AS average_competitions_to_sub_10
FROM competitor_summary;

-- List 10 countries w/most competitors.
SELECT country,COUNT(*) AS number_of_competitors
FROM competitor_summary
WHERE country IS NOT NULL
GROUP BY country
ORDER BY number_of_competitors DESC
LIMIT 10;

-- Compare improvement by total competition experience.
SELECT total_competitions,COUNT(*) AS number_of_competitors,ROUND(AVG(improvement_seconds), 2) AS average_improvement_seconds,ROUND(AVG(improvement_percent), 1) AS average_improvement_percent
FROM competitor_summary
WHERE total_competitions BETWEEN 5 AND 30
GROUP BY total_competitions
HAVING COUNT(*) >= 100
ORDER BY total_competitions;
