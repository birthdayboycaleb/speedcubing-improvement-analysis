SELECT
    COUNT(*) AS number_of_competitors
FROM competitor_summary;
SELECT
    COUNT(*) AS number_of_competition_records
FROM competitor_progression;
-- Question 1:
-- How large is the analysis sample?

SELECT
    COUNT(*) AS number_of_competitors,
    MIN(total_competitions) AS minimum_competitions,
    ROUND(AVG(total_competitions), 1) AS average_competitions,
    MAX(total_competitions) AS maximum_competitions
FROM competitor_summary;
-- Question 2:
-- How much does the average competitor improve?

SELECT
    ROUND(AVG(first_average_seconds), 2)
        AS average_starting_time_seconds,
    ROUND(AVG(best_average_seconds), 2)
        AS average_best_time_seconds,
    ROUND(AVG(improvement_seconds), 2)
        AS average_improvement_seconds,
    ROUND(AVG(improvement_percent), 1)
        AS average_improvement_percent
FROM competitor_summary;
-- Question 3:
-- Which competitors improved the most in seconds?

SELECT
    person_name,
    country,
    total_competitions,
    first_average_seconds,
    best_average_seconds,
    ROUND(improvement_seconds, 2)
        AS improvement_seconds,
    improvement_percent
FROM competitor_summary
ORDER BY improvement_seconds DESC
LIMIT 10;
-- Question 4:
-- How does performance change during the first 10 competitions?

SELECT
    competition_number,
    COUNT(DISTINCT person_id) AS number_of_competitors,
    ROUND(AVG(average_seconds), 2)
        AS average_competition_time_seconds,
    ROUND(AVG(personal_best_to_date), 2)
        AS average_personal_best_to_date_seconds
FROM competitor_progression
WHERE
    total_competitions >= 10
    AND competition_number <= 10
GROUP BY competition_number
ORDER BY competition_number;
-- Question 5:
-- What percentage of competitors reached each milestone?

SELECT
    ROUND(
        COUNT(competitions_to_sub_30) * 100.0 / COUNT(*),
        1
    ) AS percent_reaching_sub_30,

    ROUND(
        COUNT(competitions_to_sub_20) * 100.0 / COUNT(*),
        1
    ) AS percent_reaching_sub_20,

    ROUND(
        COUNT(competitions_to_sub_15) * 100.0 / COUNT(*),
        1
    ) AS percent_reaching_sub_15,

    ROUND(
        COUNT(competitions_to_sub_10) * 100.0 / COUNT(*),
        1
    ) AS percent_reaching_sub_10
FROM competitor_summary;
-- Question 6:
-- Among achievers, how many competitions did each milestone take on average?

SELECT
    ROUND(AVG(competitions_to_sub_30), 1)
        AS average_competitions_to_sub_30,
    ROUND(AVG(competitions_to_sub_20), 1)
        AS average_competitions_to_sub_20,
    ROUND(AVG(competitions_to_sub_15), 1)
        AS average_competitions_to_sub_15,
    ROUND(AVG(competitions_to_sub_10), 1)
        AS average_competitions_to_sub_10
FROM competitor_summary;
-- Question 7:
-- Which countries have the most competitors in the sample?

SELECT
    country,
    COUNT(*) AS number_of_competitors
FROM competitor_summary
WHERE country IS NOT NULL
GROUP BY country
ORDER BY number_of_competitors DESC
LIMIT 15;
-- Question 8:
-- How does improvement differ by total competition experience?

SELECT
    total_competitions,
    COUNT(*) AS number_of_competitors,
    ROUND(AVG(improvement_seconds), 2)
        AS average_improvement_seconds,
    ROUND(AVG(improvement_percent), 1)
        AS average_improvement_percent
FROM competitor_summary
WHERE total_competitions BETWEEN 5 AND 30
GROUP BY total_competitions
HAVING COUNT(*) >= 100
ORDER BY total_competitions;