

SELECT * FROM employees;


CREATE FUNCTION employee_count()
RETURNS INT
LANGUAGE SQL
AS
$$
    SELECT count(*) FROM employees;
$$;

SELECT employee_count();

CREATE FUNCTION delete_employee()
RETURNS VOID
LANGUAGE SQL
AS
$$
    DELETE FROM employees WHERE employee_id = 30;
$$;

SELECT delete_employee();


CREATE FUNCTION delete_employee_with_id(p_employee_id INT)
RETURNS VOID
LANGUAGE SQL
AS
$$
    DELETE FROM employees WHERE employee_id = p_employee_id;
$$

SELECT delete_employee_with_id(29)


CREATE FUNCTION select_single_employee(p_employee_id INT)
RETURNS SETOF employees
LANGUAGE SQL
AS
$$
    SELECT * FROM employees WHERE employee_id = p_employee_id;
$$;

-- DELETE A FUNCTION
DROP FUNCTION select_single_employee(INT)

SELECT select_single_employee(1)