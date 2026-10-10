


CREATE TABLE my_users(
    id SERIAL NOT NULL,
    user_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO my_users VALUES('1','Likhon', 'md.likhonislam2x@gmail.com'),('2','Rimon', 'rimon122evy@gmail.com');

CREATE TABLE deleted_user_logs(
    deleted_user_name VARCHAR(50),
    deleted_at TIMESTAMP
)

SELECT * FROM my_users;
SELECT * FROM deleted_user_logs;



CREATE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN
    INSERT INTO deleted_user_logs VALUES(OLD.user_name, now());
    RAISE NOTICE 'Deleted user log saved successfully!';
    RETURN OLD;
    END
$$





CREATE TRIGGER save_deleted_user_trigger
BEFORE DELETE
ON my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();


DELETE FROM my_users WHERE id = 1;


