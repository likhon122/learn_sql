-- Active: 1790780941583@@127.0.0.1@5432@ph


SELECT * FROM user_info;

ALTER Table user_info
    ADD COLUMN email VARCHAR(25)  DEFAULT 'default@gmail.com' NOT NULL;

ALTER TABLE user_info
    ALTER COLUMN email TYPE VARCHAR(100);


ALTER TABLE user_info
    RENAME COLUMN user_age TO age;

ALTER TABLE user_info
    ALTER COLUMN age SET NOT NULL;
INSERT INTO user_info values(2, 'Rimon Hossain', 19, true, 'rimonhossain@gmail.com');


