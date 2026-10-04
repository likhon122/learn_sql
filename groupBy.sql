

SELECT country FROM student
    GROUP BY country

-- Group by country and find count for every country student
SELECT country, count(*) as totalStudent FROM student
    GROUP BY country

-- Group by country and find average age for every country student and show just over 20 year average age students
SELECT country, avg(age) as average_age FROM student
    GROUP BY country
        HAVING avg(age) > 21


-- Filter Groups Using Having to show only countries with average age above 22
SELECT country, avg(age) as average_age FROM student
    GROUP BY country
        HAVING avg(age) > 22

-- Count Students Born in Each Year
SELECT EXTRACT(YEAR FROM dob) as born_year, count(*)
     FROM student
     GROUP BY born_year
