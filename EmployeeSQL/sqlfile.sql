DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
  id SERIAL PRIMARY KEY,
  dept_no character varying(45) NOT NULL,
  dept_name character varying(45) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no character varying(45) NOT NULL
);

CREATE TABLE dept_manager (
  dept_no character varying(45) NOT NULL,
  emp_no integer NOT NULL
);

CREATE TABLE employees (
  emp_no integer NOT NULL,
  emp_title_id character varying(45) NOT NULL,
  birth_date date NOT NULL,
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  sex character varying(45) NOT NULL,
  hire_date date NOT NULL
);

CREATE TABLE salaries (
  id SERIAL PRIMARY KEY
  emp_no integer NOT NULL,
  salary integer NOT NULL
);

CREATE TABLE titles (
  title_id character varying(45) NOT NULL,
  title character varying(45) NOT NULL
);

SELECT * FROM employees; 
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;

ALTER TABLE employees ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE salaries ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE dept_manager ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE salaries ADD FOREIGN KEY (id) REFERENCES employees;
ALTER TABLE dept_manager ADD FOREIGN KEY (id) REFERENCES employees;

-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.id = salaries.id

-- 2. List first name, last name, and hire date for employees 
-- who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-01-31';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.
SELECT dept_manager.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN employees
ON employees.emp_no = dept_manager.emp_no;


-- 4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;


-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
-- SELECT dept_no
-- FROM departments
-- WHERE dept_name = 'Sales';

-- SELECT employees.emp_no, employees.last_name, employees.first_name
-- FROM employees
-- WHERE emp_no IN
-- (
-- 	SELECT emp_no
-- 	FROM dept_emp
-- 	WHERE dept_no IN
-- 	(
-- 		SELECT dept_no
-- 		FROM departments
-- 		WHERE dept_name = 'Sales'
-- 	)
-- );

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Times Repeated"
FROM employees
GROUP BY last_name
ORDER BY "Times Repeated" DESC;


