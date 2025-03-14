-- 1. Вывести список сотрудников, получающих заработную плату большую чем у непосредственного руководителя
SELECT * 
FROM Employee AS employees, Employee AS chieves
WHERE chieves.id = employees.chief_id AND employees.salary > chieves.salary;

-- 2. Вывести список сотрудников, получающих максимальную заработную плату в своем отделе
SELECT * 
FROM Employee AS employees
WHERE employees.salary = (SELECT MAX(salary) FROM Employee AS max WHERE max.department_id = employees.department_id);

-- 3. Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек
SELECT department_id 
FROM Employee
GROUP BY department_id
HAVING COUNT(*) <= 3;

--4. Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том-же отделе
SELECT * 
FROM Employee AS employees
LEFT JOIN Employee AS chieves ON (employees.chief_id = chieves.Id AND employees.department_id = chieves.department_id)
WHERE chieves.id IS NULL;

--5. Найти список ID отделов с максимальной суммарной зарплатой сотрудников
WITH dep_salary AS 
	(SELECT department_id, sum(salary) AS salary
	FROM employee 
	GROUP BY department_id)
SELECT department_id
FROM dep_salary
WHERE dep_salary.salary = (SELECT max(salary) FROM dep_salary);