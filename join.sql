CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL
)


CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    username INTEGER REFERENCES "user"(id) NOT NULL
)

ALTER TABLE post
    ALTER COLUMN username SET NOT NULL;

INSERT INTO "user" (username) VALUES
('akash'), ('batash'), ('nodi'), ('sagor')

SELECT * FROM "user"

INSERT INTO post (title, username) VALUES
('Enjoying the sunny day', 1),
('Learning SQL is fun!', 2),
('Database relationships are important', 3),
('Foreign keys help maintain data integrity', 4)


SELECT * FROM post


SELECT post.id, title, "user".username FROM post
    JOIN "user" ON post.id = "user".id