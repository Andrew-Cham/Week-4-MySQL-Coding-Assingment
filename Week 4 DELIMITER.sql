DELIMITER //
CREATE PROCEDURE male_employees()
BEGIN
SELECT * FROM employees
WHERE gender = 'M' AND hire_date > '2000-01-01'
AND last_name LIKE'C%' AND emp_no > 20000;
END //
DELIMITER ;
CALL male_employees();

DELIMITER //
CREATE PROCEDURE employees_hired_after_2000_04_03()
BEGIN
SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE hire_date > '2000-04-03' limit 10;
END //
DELIMITER ;
CALL employees_hired_after_2000_04_03();

DELIMITER // 
CREATE PROCEDURE getEmployeeInfo()
BEGIN
SELECT * FROM employees
WHERE emp_no = '496897';
END //
DELIMITER ;
CALL getEmployeeInfo();

DELIMITER //
CREATE PROCEDURE employeeWithTheirDepartments()
BEGIN
SELECT employees.emp_no,employees.birth_date, employees.first_name, employees.last_name, titles.title
FROM employees
INNER JOIN titles ON titles.emp_no = employees.emp_no
WHERE birth_date > '1965-01-01';
END //
DELIMITER ;
CALL employeeWithTheirDepartments();

DELIMITER //
CREATE PROCEDURE averageMoneySpendForMarketing()
BEGIN
SELECT d.dept_name AS "Department", AVG(s.salary) AS "Money Spent" FROM departments d
INNER JOIN dept_emp de ON de.dept_no = d.dept_no
INNER JOIN salaries s ON s.emp_no = de.emp_no
WHERE d.dept_name = "Marketing" AND year(s.from_date) > '1990' AND year(s.to_date) < '1992'
GROUP BY d.dept_name;
END //
DELIMITER ;
CALL averageMoneySpendForMarketing();


