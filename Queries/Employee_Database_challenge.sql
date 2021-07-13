-- Deliverable 1
-- retirees title
SELECT emp.emp_no,
	emp.first_name,
	emp.last_name,
	tit.title,
	tit.from_date,
	tit.to_date
INTO retirement_titles
FROM employees as emp
	LEFT JOIN titles as tit ON (emp.emp_no = tit.emp_no)
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY emp.emp_no;

-- retirees unique titles
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
	INTO unique_titles
	FROM retirement_titles
	ORDER BY emp_no, to_date DESC;

-- number of each title
SELECT COUNT(emp_NO), title INTO retiring_titles 
FROM unique_titles 
	GROUP BY title 
	ORDER BY COUNT(emp_NO) DESC;


-- Deliverable 2
SELECT DISTINCT ON (e.emp_no)
e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, tit.title
INTO mentorship_eligibilty
FROM employees as e
	LEFT JOIN dept_emp as de ON (e.emp_no = de.emp_no)
	LEFT JOIN titles as tit ON (e.emp_no = tit.emp_no)
	WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;