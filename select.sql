CREATE TABLE student(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    age SMALLINT NOT NULL,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(50) NOT NULL UNIQUE,
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
)


INSERT INTO student (first_name, last_name, age, grade, course, email, dob, blood_group, country) 
VALUES
    ('John', 'Doe', 20, 'A', 'Computer Science', 'john.doe@example.com', '2006-05-15', 'O+', 'USA'),
    ('Jane', 'Smith', 22, 'B+', 'Physics', 'jane.smith@example.com', '2004-08-22', 'A-', 'Canada'),
    ('Ahmed', 'Khan', 21, 'A-', 'Mathematics', 'ahmed.khan@example.com', '2005-03-10', 'B+', 'Bangladesh'),
    ('Maria', 'Garcia', 23, 'A', 'Literature', 'maria.garcia@example.com', '2003-11-05', 'O-', 'Spain'),
    ('Wei', 'Chen', 19, 'B', 'Biology', 'wei.chen@example.com', '2007-02-18', 'AB+', 'China'),
    ('Emma', 'Wilson', 20, 'A+', 'Chemistry', 'emma.wilson@example.com', '2006-07-25', 'A+', 'UK'),
    ('Liam', 'Brown', 24, 'C+', 'History', 'liam.brown@example.com', '2002-09-12', 'O+', 'Australia'),
    ('Fatima', 'Ali', 21, 'A', 'Software Engineering', 'fatima.ali@example.com', '2005-01-30', 'B-', 'UAE'),
    ('Yuki', 'Tanaka', 22, 'B+', 'Economics', 'yuki.tanaka@example.com', '2004-12-04', 'A-', 'Japan'),
    ('Lucas', 'Silva', 20, 'B', 'Business Admin', 'lucas.silva@example.com', '2006-04-14', 'O+', 'Brazil'),
    ('Sophia', 'Martinez', 19, 'A-', 'Psychology', 'sophia.m@example.com', '2007-08-20', 'AB-', 'Mexico'),
    ('Oliver', 'Taylor', 23, 'A', 'Philosophy', 'oliver.t@example.com', '2003-05-29', 'B+', 'New Zealand'),
    ('Isabella', 'Thomas', 21, 'C', 'Sociology', 'isabella.th@example.com', '2005-10-17', 'O-', 'USA'),
    ('Rahul', 'Sharma', 22, 'A+', 'Computer Science', 'rahul.s@example.com', '2004-06-08', 'A+', 'India'),
    ('Chloe', 'Martin', 20, 'B', 'Nursing', 'chloe.m@example.com', '2006-09-02', 'B-', 'France'),
    ('Benjamin', 'Lee', 21, 'A', 'Architecture', 'benjamin.lee@example.com', '2005-11-22', 'O+', 'South Korea'),
    ('Amira', 'Hassan', 22, 'B+', 'Political Science', 'amira.h@example.com', '2004-01-15', 'A+', 'Egypt'),
    ('Daniel', 'Kim', 19, 'A-', 'Data Science', 'daniel.kim@example.com', '2007-03-28', 'AB+', 'Canada'),
    ('Mia', 'Nguyen', 20, 'B', 'Graphic Design', 'mia.n@example.com', '2006-12-11', 'O+', 'Vietnam'),
    ('Noah', 'Müller', 23, 'A', 'Mechanical Eng', 'noah.muller@example.com', '2003-07-19', 'B+', 'Germany');


SELECT * FROM student ORDER BY dob DESC;

SELECT DISTINCT country FROM student;

-- Select students form the Bangladesh
SELECT * FROM student
    WHERE country = 'Bangladesh';

-- Select students where grade A and course Philosophy
SELECT * FROM student
    WHERE grade = 'A' AND course = 'Philosophy';

-- Select students from the Bangladesh or USA
SELECT * FROM student
    WHERE country = 'Bangladesh' OR country = 'USA';

-- Select students from the USA or from Australia and the age is 20
SELECT * FROM student
    WHERE (country = 'USA' OR country = 'Australia') AND age = 20;

-- Select students from over 20 age
SELECT * FROM student
    WHERE age > 20;


SELECT upper(first_name) as first_name_upper_case, * FROM student;

SELECT concat(first_name, ' ', last_name) as full_name, * FROM student;

-- Select average of all students age
SELECT avg(age) FROM student;

SELECT min(age) FROM student;

SELECT max(age) FROM student;

SELECT sum(age) FROM student;

SELECT count(*) FROM student;

SELECT max(length(first_name)) FROM student;


SELECT * FROM student
    WHERE country IN('Bangladesh', 'India');

SELECT * FROM student
    WHERE dob BETWEEN '2000-01-01' AND '2005-01-01';

SELECT * from student
    WHERE first_name ILIKE 'B%'

DELETE FROM student
    WHERE first_name ILIKE 'B%'


UPDATE student
    set first_name = 'Likhon', last_name = 'Islam', email = 'md.likhonislam2x@gmail.com', age = 21, dob = '2005-11-25'
    WHERE student_id = 14

SELECT * FROM student
    WHERE student_id = 14