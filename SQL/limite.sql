--limite de retorno

select * from EMPLOYEES a
Where rownum<=5
order by a.SALARY desc;

--exemplo

select a.EMPLOYEE_ID,
       a.FIRST_NAME,
       a.salary
    from EMPLOYEES a
Where rownum<=10
order by a.salary desc;


--exemplo

select a.EMPLOYEE_ID,FIRST_NAME,a.salary from EMPLOYEES a
Where DEPARTMENT_ID='60'
and rownum<=10
order by a.salary desc;

--exemplo
select a.EMPLOYEE_ID,FIRST_NAME,a.salary ,B.DEPARTMENT_NAME
from EMPLOYEES a
inner join DEPARTMENTS b
on a.DEPARTMENT_ID=b.DEPARTMENT_ID
Where a.DEPARTMENT_ID='60'
and rownum<=10
order by a.salary desc;

