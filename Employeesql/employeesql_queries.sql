-- List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s ON
e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM department_managers dm
LEFT JOIN departments d ON
dm.dept_no = d.dept_no
LEFT JOIN employees e ON
dm.emp_no = e.emp_no;

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employees de
LEFT JOIN departments d ON
de.dept_no = d.dept_no
LEFT JOIN employees e ON
de.emp_no = e.emp_no;


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employees de
LEFT JOIN departments d ON
de.dept_no = d.dept_no
LEFT JOIN employees e ON
de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM department_employees de
LEFT JOIN departments d ON
de.dept_no = d.dept_no
LEFT JOIN employees e ON
de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;