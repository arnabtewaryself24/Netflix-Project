CREATE TABLE netflix_titles (
    index_id BIGINT,
    id VARCHAR(50),
    title TEXT,
    type VARCHAR(20),
    description TEXT,
    release_year BIGINT,
    age_certification VARCHAR(20),
    runtime BIGINT,
    imdb_id VARCHAR(20),
    imdb_score DOUBLE PRECISION,
    imdb_votes DOUBLE PRECISION
);

SELECT *
FROM netflix_titles
LIMIT 5;




