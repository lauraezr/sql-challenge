DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
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
  emp_no integer NOT NULL,
  salary integer NOT NULL
);

CREATE TABLE titles (
  title_id character varying(45) NOT NULL,
  title character varying(45) NOT NULL
);

SELECT * FROM employees; 

-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT emp_no, last_name, first_name, sex
FROM employees
IN 

SELECT salary
FROM salary
