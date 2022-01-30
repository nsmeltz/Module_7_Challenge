SELECT	* FROM employees
SELECT	* FROM titles
SELECT * FROM retirement_titles LIMIT (10)
SELECT * FROM unique_titles LIMIT (10)

-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
-- 3. Create a new table using the INTO clause.
-- 4. Join both tables on the primary key.
-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
SELECT emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	tit.title,
	tit.from_date, 
	tit.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as tit
ON (emp.emp_no = tit.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no


-- 9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- 10. Use Dictinct with Orderby to remove duplicate rows
-- 11. Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
-- 12. Create a Unique Titles table using the INTO clause.
-- 13. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	tit.title
INTO unique_titles
FROM employees as emp
INNER JOIN titles as tit
ON (emp.emp_no = tit.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	and (tit.to_date = '9999-01-01')
ORDER BY emp_no ASC


-- Retrieve the number of employees by their most recent job title who are about to retire.
-- 17. First, retrieve the number of titles from the Unique Titles table.
-- 18. Then, create a Retiring Titles table to hold the required information.
-- 19. Group the table by title, then sort the count column in descending order.
SELECT title, COUNT(title)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "count" DESC



