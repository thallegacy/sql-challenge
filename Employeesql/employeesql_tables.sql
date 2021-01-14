-- drop tables if necessary
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS department_employees;
DROP TABLE IF EXISTS department_managers;
DROP TABLE IF EXISTS salaries;


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
CREATE TABLE Employees (
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
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- create department_managers table
CREATE TABLE department_managers (
    dept_no VARCHAR  NOT NULL,
    emp_no int  NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- create salaries table
CREATE TABLE salaries (
    emp_no int  NOT NULL,
	salary INTEGER NOT NULL,  
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);