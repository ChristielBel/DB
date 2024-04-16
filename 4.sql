--Вывести фамилии, названия отделов, город и местоположение отделов, для всех служащих, зарабатывающих комиссионные--

select e.last_name, d.department_name, l.city, c.country_name, r.region_name
from employees e 
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
join countries c on l.country_id = c.country_id
join regions r on c.region_id=r.region_id
where e.commission_pct is not null;

--Выведите список всех должностей в отделе 80 (должности в списке не должны повторяться) и местоположение.--

select distinct j.job_title, l.city, c.country_name, r.region_name
from jobs j
join employees e on j.job_id = e.job_id
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
join countries c on l.country_id = c.country_id
join regions r on c.region_id = r.region_id
where d.department_id = 80;

--Вывести фамилии служащих, содержащие буквы «а» (в строчном регистре), с названиями отделов.--

select e.last_name, d.department_name
from employees e
join departments d on e.department_id = d.department_id
where lower(e.last_name) like '%a%';

--Напишите запрос для вывода фамилии, должности, номера отдела и названия отдела всех служащих, работающих в городе Toronto.--

select e.last_name, j.job_title, e.department_id, d.department_name
from employees e
join jobs j on e.job_id = j.job_id
join departments d on e.department_id  = d.department_id
join locations l on d.location_id = l.location_id
where l.city = 'Toronto';

--Вывести фамилии и номера служащих вместе с фамилиями и номерами их менеджеров. Назовите столбцы Employee, Emp#, Manager, MGR#.--

select e1.last_name as Employee, e1.employee_id as Emp#, e2.last_name as Manager, e2.employee_id as MGR#
from employees e1
join employees e2 on e1.manager_id = e2.employee_id;

--Измените запрос 5 так, чтобы получить фамилии всех служащих, включая Кинга, который не имеет менеджера. Упорядочьте результат по возрастанию номера служащего.--

--1--
select e1.last_name as Employee, e1.employee_id as Emp#, e2.last_name as Manager, e2.employee_id as MGR#
from employees e1
left join employees e2 on e1.manager_id = e2.employee_id;

--2--
select e1.last_name AS Employee, e1.employee_id AS Emp#, coalesce(e2.last_name, 'No Manager') AS Manager, coalesce(e2.employee_id, 0) AS MGR#
from employees e1
left join employees e2 on e1.manager_id = e2.employee_id
order by Emp#;

--Создайте запрос для вывода номера отдела, фамилии служащего и фамилий всех служащих, работающих в одном отделе с данным служащим. Дайте столбцам соответствующие имена.--

select e1.department_id AS Department, e1.last_name as Employee, e2.last_name as Colleague
from employees e1
join employees e2 on e1.department_id = e2.department_id and e1.employee_id != e2.employee_id;

--Создайте запрос для вывода фамилии, должности, названия отдела, оклада  всех служащих.--

--1--

select e.last_name, j.job_title, d.department_name, j.min_salary, j.max_salary
from employees e
join jobs j on e.job_id = j.job_id
join departments d on e.department_id = d.department_id;

--2--

select e.last_name, j.job_title, d.department_name, concat(concat(j.min_salary, ' - '), j.max_salary) as salary_range
from employees e
join jobs j on e.job_id = j.job_id
join departments d on e.department_id = d.department_id;

--Создайте запрос для вывода фамилий и дат найма всех служащих, нанятых после Davies. (запрос выполнить используя декартово произведение, с использованием данной фамилии).--
select e.last_name, e.hire_date
from employees e
where e.hire_date > (select hire_date from employees where last_name = 'Davies');

--По всем служащим, нанятым раньше своих менеджеров, выведите фамилии и даты найма самих служащих, а также фамилии и даты найма их менеджеров.--
select emp.last_name as Employee, emp.hire_date as Employee_Hire_Date, mgr.last_name as Manager, mgr.hire_date as Manager_Hire_Date
from employees emp
join employees mgr on emp.manager_id = mgr.employee_id
where emp.hire_date < mgr.hire_date;
