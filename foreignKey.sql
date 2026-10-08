


CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL
)


CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    username INTEGER REFERENCES "user"(id) ON DELETE SET DEFAULT DEFAULT 2
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


DELETE FROM "user"
    WHERE id = 4

-- Deletion constraint on DELETE user
    -- Restrict Deletion -> ON DELETE RESTRICT / ON DELETE SET ACTION [DEFAULT BEHAVIOR]
    -- Cascading Deletion -> ON DELETE CASCADE [Delete all the post according to the foreign key]
    -- Setting Null -> ON DELETE SET NULL [When delete the user then automatically set NULL in the foreign key]
    -- Set Default value -> ON DELETE SET DEFAULT