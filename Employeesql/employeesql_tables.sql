-- drop tables if necessary
DROP TABLE IF EXISTS titles cascade;
DROP TABLE IF EXISTS departments cascade;
DROP TABLE IF EXISTS employees cascade;
DROP TABLE IF EXISTS department_employees cascade;
DROP TABLE IF EXISTS department_managers cascade;
DROP TABLE IF EXISTS salaries cascade;


-- create titles table
CREATE TABLE titles (
	title_id VARCHAR (20) PRIMARY KEY NOT NULL,
    title VARCHAR (50) NOT NULL
);

-- create departments table
CREATE TABLE departments (
    dept_no VARCHAR (20) PRIMARY KEY NOT NULL,
    dept_name VARCHAR (50)  NOT NULL
);

-- create employees table
CREATE TABLE employees (
    emp_no INT  PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR (20) NOT NULL,
	birth_date DATE  NOT NULL,
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (30) NOT NULL,
    sex VARCHAR (5) NOT NULL,
    hire_date DATE  NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- create department_employees table
CREATE TABLE department_employees (
    emp_no INT NOT NULL,
	dept_no VARCHAR (20) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no )
);

-- create department_managers table
CREATE TABLE department_managers (
    dept_no VARCHAR  NOT NULL,
    emp_no INT  NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- create salaries table
CREATE TABLE salaries (
    emp_no INT  NOT NULL,
	salary INT NOT NULL,  
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);

-- Check imported data
SELECT * FROM titles ;
SELECT * FROM departments ;
SELECT * FROM employees ;
SELECT * FROM department_employees ;
SELECT * FROM department_managers ;
SELECT * FROM salaries ;
