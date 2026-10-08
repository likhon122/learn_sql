

SELECT department_name, round(avg(salary)) as avg_salary FROM employees
    GROUP BY department_name
    ORDER BY avg_salary ASC;


-- I want to make that query any time use multiple time so I can create a view of this query

CREATE View department_avg_salary
AS
SELECT department_name, round(avg(salary)) as avg_salary FROM employees
    GROUP BY department_name
    ORDER BY avg_salary ASC;


SELECT * FROM department_avg_salary;

-- Simplifying complex query
-- Improve Security
-- Enhance Data abstraction