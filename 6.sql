--1) По каждому департаменту, расположенному в том же городе, что и департамент, руководителем которого является King, вывести следующую информацию в столбцах с соответствующими именами:
--- название департамента  department_name--
--- имя руководителя   first_name, last_name. --

SELECT d.department_name, e.first_name, e.last_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
join locations l on d.location_id = l.location_id
WHERE l.city IN (
    SELECT l.city
    FROM locations l
    join departments d on l.location_id = d.location_id
    join employees e on d.department_id = e.department_id
    where e.last_name = 'King'
);

--2) Вывести названия департаментов, которые располагаются в США.--

SELECT department_name
FROM departments
WHERE location_id IN (
    SELECT location_id
    FROM locations
    WHERE country_id = 'US'
);

--3) Вывести названия департаментов, располагающихся в США, и фамилии их руководителей, --
--в которых работает хотя бы один программист (job_title = programmer).--

SELECT d.department_name, e.last_name
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id
WHERE d.location_id IN (
   SELECT location_id
    FROM locations
    WHERE country_id = 'US'
) AND EXISTS (
    SELECT 1
    FROM employees e
    join jobs j on e.job_id = j.job_id
    where j.job_title = 'Programmer'
);

--7) По каждому городу вывести:--
--- название города--
--- количество департаментов--
--- суммарный затраты на оплату зарплаты--
--- количество сотрудников--
SELECT l.city, 
    (SELECT COUNT(d.department_id) 
     FROM departments d 
     WHERE d.location_id = l.location_id) AS department_count,
    (SELECT SUM(e.salary) 
     FROM employees e 
     JOIN departments d ON e.department_id = d.department_id 
     WHERE d.location_id = l.location_id) AS total_salary_costs,
    (SELECT COUNT(e.employee_id) 
     FROM employees e 
     JOIN departments d ON e.department_id = d.department_id 
     WHERE d.location_id = l.location_id) AS employee_count
FROM locations l;
