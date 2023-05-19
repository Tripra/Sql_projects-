use employees
-- Retrieve a list with all female employees whose first name is Kellie 
select * from employees 
where gender='F'  and first_name='Kellie'

-- Retrive a list of employess whose first name is "Denis" or "Elvis"
select * from employees 
where first_name in ("Denis","Elvis")

-- Taking all information from salary table regarding contracts from 66000 to 70000 dollars per year
select * from salaries 
where salary between 66000 and 70000

-- obtain a list of all different 'hire dates' from the'employees' table
select distinct(hire_date) 
from employees

-- Retrive all data from "employees' table ordering it by 'hire date' in descending order
select * from employees 
order by hire_date  desc

-- select all employees whose avg salary is higher than $120000 per annum
select emp_no,avg(salary) as avg_salary
from salaries 
group by emp_no 
having  avg_salary>120000

-- How many departments are there in "employees" database
select count(distinct dept_no) as total_dep
from departments 

-- Total amount of money spent on salaries for all contracts after 1st of January
select sum(salary) from salaries 
where from_date>'1997-01-01'

-- what is the avg salary paid to employees who started after the 1st of January 1997
select emp_no,avg(salary)
from salaries 
where from_date> '1997-01-01'
group by emp_no 

-- Extract a list of all managers,employee number, first and last name ,dept no and hire date 
select d.emp_no, e.first_name,e.last_name,e.last_name,d.dept_no,e.hire_date
from dept_manager as d join employees e on d.emp_no=e.emp_no

/* Join the 'employees' and dept_manager' table to returns a subset of all employess 
 whose last name is Markovitch */
select    e.emp_no, d.dept_no, e.first_name, e.last_name,d.from_date
from dept_manager d right join employees e
on d.emp_no=e.emp_no 
where e.last_name='Markovitch'
order by e.emp_no 

/* select first and last name, hire date,job title of employees whose first name is 'Margareta'
 have last name "Markovitch" */
select e.first_name,e.last_name,e.hire_date,t.title 
from employees e join titles t 
on e.emp_no=t.emp_no 
where first_name='Margareta' and last_name='Markovitch'

-- select all managers first and last name,hire date, job title, start date, and departments name
select e.first_name,e.last_name,e.hire_date,t.title,d.from_date,dp.dept_name
from  departments dp join dept_manager d on dp.dept_no=d.dept_no join employees e 
on d.emp_no=e.emp_no join titles t on e.emp_no=t.emp_no
where t.title ='Manager'















