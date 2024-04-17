--1. Получить данные по департаментам: для каждого департамента определить минимальную и максимульную запрлату,--
--определить дату устройства на работу первого и последнего сотрудника, а также общее количество сотрудников в департаменте--
--Сортировать по кол-ву сотрудников(по убыванию)--

select d.department_name as department, min(e.salary) as min_salary, max(e.salary) as max_salary,
min(e.hire_date) as first_hire_date, max(e.hire_date) as max_hire_date, count(e.employee_id) as total_employees
from departments d
join employees e on d.department_id = e.department_id
group by d.department_name
order by total_employees desc;

--2. Для каждого года вывести кол-во сотрудников нанятых в этом году--
--Сортировать по кол-ву сотрудников--

select extract(year from hire_date) as hire_year, count(employee_id) as total_employees_hired
from employees 
group by extract(year from hire_date)
order by total_employees_hired desc;

--3. Найти управляющих (а именно их manager_id), у которых кол-во подчиненных больше 5 и сумма зарплат подиченных больше 50000--

select manager_id 
from employees 
where manager_id is not null
group by manager_id
having count(employee_id) > 5 and sum(salary) > 50000;

--4.Получить макс запрлату среди всех средних зарплат по департаменту--

select max(avg_salary) as max_avg_salary
from(select d.department_id, avg(e.salary) as avg_salary 
from employees e
join departments d on e.department_id = d.department_id
group by d.department_id);
