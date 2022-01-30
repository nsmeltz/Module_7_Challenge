SELECT	* FROM employees
SELECT	* FROM titles
SELECT * FROM retirement_titles LIMIT (10)

-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	tit.title,
	tit.from_date, 
	tit.to_date
-- 3. Create a new table using the INTO clause.
INTO retirement_titles
FROM employees as emp
-- 4. Join both tables on the primary key.
INNER JOIN titles as tit
ON (emp.emp_no = tit.emp_no)
-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no
-- 6. Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.


-- 8. Copy the query from the Employee_Challenge_starter_code.sql 
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	tit.title,
	tit.from_date, 
	tit.to_date
INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;





