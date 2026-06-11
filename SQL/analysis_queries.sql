SELECT title, imdb_score
FROM netflix_titles
WHERE type='MOVIE'
ORDER BY imdb_score DESC
LIMIT 10;

SELECT release_year,
       COUNT(*) AS total_content
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year;

SELECT type,
       ROUND(AVG(imdb_score):: NUMERIC,2) AS avg_rating
FROM netflix_titles
GROUP BY type;

SELECT
    type,
    COUNT(*) AS total_titles,
    ROUND(COUNT(*) * 100.0 /
          SUM(COUNT(*)) OVER(),2) AS percentage
FROM netflix_titles
GROUP BY type;

SELECT
    CASE
        WHEN imdb_score >= 8 THEN 'Excellent (8-10)'
        WHEN imdb_score >= 7 THEN 'Good (7-8)'
        WHEN imdb_score >= 6 THEN 'Average (6-7)'
        ELSE 'Poor (<6)'
    END AS rating_band,
    COUNT(*) AS titles
FROM netflix_titles
GROUP BY rating_band
ORDER BY titles DESC;

SELECT
    title,
    imdb_score,
    imdb_votes
FROM netflix_titles
ORDER BY imdb_votes DESC
LIMIT 10;

SELECT
    title,
    imdb_score
FROM netflix_titles
WHERE type='SHOW'
ORDER BY imdb_score DESC
LIMIT 10;

SELECT
    type,
    ROUND(AVG(runtime),2) AS avg_runtime
FROM netflix_titles
GROUP BY type;

SELECT
    CASE
        WHEN runtime < 60 THEN 'Short'
        WHEN runtime BETWEEN 60 AND 120 THEN 'Medium'
        ELSE 'Long'
    END AS runtime_category,
    COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY runtime_category;

SELECT
    CONCAT(FLOOR(release_year/10)*10,'s') AS decade,
    ROUND(AVG(imdb_score):: NUMERIC,2) AS avg_rating
FROM netflix_titles
GROUP BY decade
ORDER BY decade;

SELECT
    release_year,
    COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year;

SELECT
    runtime,
    imdb_score
FROM netflix_titles
WHERE runtime IS NOT NULL
AND imdb_score IS NOT NULL;

SELECT
    COUNT(*) AS total_titles,
    ROUND(AVG(imdb_score):: NUMERIC,2) AS avg_rating,
    MAX(imdb_score) AS highest_rating,
    ROUND(AVG(runtime),2) AS avg_runtime
FROM netflix_titles;

SELECT
    age_certification,
    COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY age_certification
ORDER BY total_titles DESC;

SELECT
    release_year,
    ROUND(AVG(imdb_score):: NUMERIC,2) AS avg_rating,
    COUNT(*) AS titles
FROM netflix_titles
GROUP BY release_year
HAVING COUNT(*) > 20
ORDER BY avg_rating DESC
LIMIT 10;