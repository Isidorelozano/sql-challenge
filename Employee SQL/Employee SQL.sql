--Data Engineering 
create table departments(
	dept_no varchar(30) primary key,
	dept_name varchar(30)
);
 
create table employees(
	emp_no int primary key,
	emp_title varchar(30),
	birth_date date,
	first_name varchar(30),
	last_name varchar(30),
	sex varchar (10),
	hire_date date
);

Create table dept_managers(
	dept_no varchar (30),
	emp_no int
);

create table dept_emp(
	emp_no int,
	dept_no varchar (30)
);

create table salaries(
	emp_no int,
	salary int
);

drop table salaries
create table titles(
	title_id varchar (30) primary key,
	title varchar (30)
);
--Data Analysis
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
JOIN salaries as sal
  ON emp.emp_no = sal.emp_no;

SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees as emp
Where emp.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT man.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from dept_managers as man
Join employees as emp
	on man.emp_no = emp.emp_no
Join departments as dept
	on man.dept_no = dept.dept_no;
	
SELECT emp.first_name, emp.last_name,  emp.sex
FROM employees as emp
Where emp.first_name = 'Hercules'
and emp.last_name Like'B%';

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from departments as dept
Join dept_emp 
	on dept.dept_no = dept_emp.dept_no
Join employees as emp
	on dept_emp.emp_no = emp.emp_no
Where dept.dept_name = 'Sales'
OR dept.dept_name = 'Development';

SELECT emp.last_name
	,count(*)
from employees as emp
group by emp.last_name
Order by emp.last_name DESC;



	
