-- drop tables if necessary
drop table titles;
drop table departments;
drop table employees;
drop table department_employees;
drop table department_managers;
drop table salaries;


-- create titles table
CREATE TABLE titles (
	title_id VARCHAR(20) PRIMARY KEY NOT NULL,
    title VARCHAR (50)
);

-- create departments table
CREATE TABLE departments (
    dept_no VARCHAR (20) PRIMARY KEY NOT NULL,
    dept_name VARCHAR (50)  NOT NULL
);
