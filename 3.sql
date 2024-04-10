
select emp.first_name "Имя", emp.last_name "Фамилия"
from HR.employees emp

select * from HR.employees emp 
where emp.salary=2500

select * from HR.employees emp 
where emp.salary!=2500 and emp.salary>2000

select * from HR.employees emp 
where emp.salary between 2000 and 3000

select * from HR.employees emp 
where emp.manager_id is null

select * from HR.employees emp 
where emp.department_id in (20,40,50)

select emp.department_id, count(emp.employee_id)
from HR.employees emp 
group by emp.department_id

select emp.first_name, count(emp.employee_id)
from HR.employees emp 
group by emp.first_name

select * from HR.employees emp 
where emp.department_id is null

select emp.department_id, count(emp.employee_id)
from HR.employees emp 
group by emp.department_id
having count(emp.employee_id)>5
order by emp.department_id asc

select * from HR.employees emp
order by emp.department_id desc

select * from HR.employees emp
order by emp.last_name, emp.first_name asc

select emp.last_name, emp.department_id, dept.department_name
from HR.employees emp,
HR.departments dept
where dept.department_id = emp.department_id;

select emp.last_name, emp.department_id, dept.department_name
from HR.employees emp
join departments dept on emp.department_id = dept.department_id;
