create database TASKROUND;
USE TASKROUND;
show databases;
/* 2. Create MySQL Database of your choice which include 4-5 tables*/ 
 
create table customer(id int not null,name varchar(50),email varchar(50),payment varchar(30),primary key(id));
describe customer;
insert into customer value(1,'shashi','syadav00006@gmail.com',1000);
insert into customer value(2,'poojan','poojan001@gmail.com',200);
insert into customer value(3,'deepak','deepak00@gmail.com',5000);
insert into customer value(4,'dhaval','dhaval980@gmail.com',10000);
insert into customer value(5,'devang','devang67806@gmail.com',500);
insert into customer value(6,'gaurav','gaurav234@gmail.com',300);

create table cuOrder(id int not null,orderDescription varchar(50),orderDate varchar(50),price int,primary key (id));
select * from customer;
insert into cuorder value(1,'earphone','23/01/2021',1000);
insert into cuorder value(2,'backcover','30/12/2021',200);
insert into cuorder value(3,'shoes','31/06/2019',5000);
insert into cuorder value(4,'phone','24/09/2022',10000);
insert into cuorder value(5,'book','07/07/2020',500);
insert into cuorder value(6,'keyboard','08/09/2020',300);


create table school(rollno int not null,mobile_no int not null,students varchar(30)not null,percentage int not null,grade char(2) not null);
insert into school value(1,7041073685,'shashi',90,'A');
insert into school value(2,7041073688,'poojan',85,'A');
insert into school value(3,7041073687,'deepak',80,'B');
insert into school value(4,7041073686,'zuber',70,'C');
select * from school;

create table travel(sr_no int not null ,date varchar(10), place varchar(20) not null, person varchar(20) unique);
insert into  travel value(1,'2021-09-15','manali','deepak');
insert into  travel value(2,'2021-09-16','manali','nihal');
insert into  travel value(3,'2021-09-17','manali','gopal');
insert into  travel value(4,'2021-09-18','manali','piyush');
insert into  travel value(5,'2021-09-19','manali','shashi');
select * from travel;

create table DOB (ID int not null unique,Name varchar(20),Birth_Date date);
 insert into DOB value (1,'S_ha%shi','1998-09-15');
 insert into DOB value (2,'%babl##u','2000-08-16');
 insert into DOB value (3,'mun$na','2001-05-23');
 insert into DOB value (4,'yash123','1996-12-15');
 
 create table department(ep_no int primary key,department_name varchar(30),manager_name varchar(30)); 
insert into department value(1,'mechanical','shashi');
insert into department value(2,'IT','payal');
insert into department value(3,'chemical','shreni');
insert into department value(4,'electrical','hemaxi');
insert into department value(5,'computer science','unnati');

/* 3. Add primary key and foreign key constrains. */



alter table cuorder
add constraint fk_customer 
foreign key(id) references customer(id);


select * from cuorder;


-- 4. Add composite primary key to any one of your table

alter table customer
drop primary key;

describe school;
alter table school
add primary key (rollno, mobile_no);
alter table school
modify column mobile_no bigint;



-- 5. Write a query to change the column name ,data types. 

alter table school
rename column students to students_name;

alter table school
modify column grade varchar(2);


-- 6. Write a query to add a default value to specific column

alter table school
modify column grade varchar (2) default 'F';


-- 7. Add indexes. Also add index on a  column  having datatype as varchar  

create index mmobile
on school (mobile_no);

create index oorder
on cuorder(id,orderDescription);

select * from school;

-- 8. Insert some data to the tables created via query

insert into school value( 5,7041073859,'gaurav',85,'B');


-- 9. Add unique constrains on single as well as multiple columns

alter table school
add constraint sunique unique(students_name,percentage);




-- 10. Try to insert multiple records at a time along with the duplicate values for the columns having unique constrains without any error prompt
use taskround;

alter table school
drop index sunique;
insert into school value(6,70410,'shashi',90,'f');
insert into school value(7,704107,'shashi',90,'f');

select * from school;



-- Task 2

-- 2.2 -- Write  queries which demonstarte inner join which uses more than two tables.

alter table travel
modify date date;

select travel.person,school.mobile_no,department.department_name
from((travel 
inner join school on travel.sr_no=school.rollno)
inner join department on travel.sr_no=department.ep_no);


-- 2.3-- Write  queries which demonstarte left join which uses more than two tables.

select travel.person,school.mobile_no,department_name
from((travel
left join school on travel.sr_no=school.rollno)
left join department on travel.sr_no= department.ep_no);


-- 2.4-- Write  queries which demonstarte Right join which uses more than two tables.
 
 select travel.person,school.mobile_no,department.department_name
 from ((travel
 right join school on travel.sr_no=school.rollno)
 right join department on travel.sr_no=department.ep_no);

-- 2.5 -- Write  queries which demonstrate sub queries

select students_name from school
where percentage=(select max(percentage) from school);


-- task 3

-- 3.1--  Write a query which uses join and let us know the internal processing of the query

select school.students_name, languages.planguages
from school
left  join languages on school.rollno=languages.id;


-- 3.2 Write a query to calculate the age based on the date of birth value given in the column.

use taskround;
SELECT name,Birth_Date,TIMESTAMPDIFF(YEAR,Birth_Date , CURDATE()) AS age FROM DOB;

-- 3.3 --Write a query which demonstrates date related functions.[Minimum 15]
 
 select adddate("2022-02-11", interval 10 day);   -- 1 
 select addtime(" 2022-02-11 09:34:21.000001", "5.000003");  -- 2
 select curdate();  -- 3
 select datediff("2021-06-15", "2020-06-15");  -- 4
 select date_add("2021-09-15", interval 10 day); -- 5
select date_format("2017-06-15", "%Y"); -- 6
select date_sub("2017-06-15", interval 10 day); -- 7
select day("2017-06-15"); -- 8
select dayofmonth("2017-06-15"); -- 9
select extract(month from "2022-09-15"); -- 10 
select from_days(685467);   -- 11
select hour("2017-06-20 09:34:00"); -- 12  
select last_day("2017-06-20"); -- 13 
select localtimestamp(); -- 14 
select str_to_date("August 10 2017", "%M %d %Y"); -- 15 
select sec_to_time(1); -- 16 

-- 3.4-- Write a query to check the current running processe

show processlist;


-- 3.5 /* Write a query to insert values in a specific table of your choice in which one of the column has unique constrains and if one tries to insert data which is duplicate based on the column having unique constrain then the value gets updated*/

use taskround;
create table languages(id int auto_increment unique, planguages varchar(20));
insert into languages(planguages) value ('html');
insert into languages(planguages) value ('css');
insert into languages(planguages) value ('java');
insert into languages(planguages) value ('sql');
insert into languages(id,planguages) value(4,'sql') on duplicate key update planguages ='mysql';
select * from languages;



-- 3.6 -- Write Queries which include inner joins along with subqueries  

select travel.person,school.mobile_no
from travel
inner join school on travel.sr_no= school.rollno
where sr_no=2;

-- 3.8--  Check out for the commands which can help us to trigger dead lock

-- task 4

-- 4.2 -- Write a query to demonstrate the use of group by 
use taskround;
select count(id),name
from customer
group by name;

-- 4.3--Find the second highest marks scored by each student along with the student and subject name [Tables: student,subject,marks]  
 
create table exams(student varchar(20),subjects varchar(20),marks int);
insert into exams value('shashi','maths',90);
insert into exams value('poojan','science',85);
insert into exams value('deepak','biology',70);
insert into exams value('sonu','english',80);
insert into exams value('sonu','english',80);
insert into exams value('poojan','science',85);
insert into exams value('deepak','biology',70);
select student,subjects,max(marks) 
from exams 
where marks!=(select max(marks) from exams);

-- 4.4-- Write a query to demonstrate the use of  having clause along with aggregate functions.
select count(id),name
from customer
group by name
having count(id)<=1;

-- 4.5--  Write two queries  which help us to compare and understand the concept of distinct and group by
select distinct student,subjects,marks from exams;

select student,subjects,marks, count(*) as totalQty 
from exams
group by  student,subjects,marks;

-- 4.6-- Write Query which includes union keyword

 select name from dob
 union
 select name from customer;
 
 -- 4.7-- Write a single query which includes group by, having,where ,from ,select,union  and order by.

select name from customer
group by name
having min(payment)>1000
union
select name
from dob
where id<=6
group by name
order by name;

-- 4.8-- Write a query which captures duplicate records by the of union

 select id from customer
 union all
 select id from cuorder;

/* Task 5 */

-- 5.2-- Write a store procedure to calculate the total marks of each student
create table students(StudentName varchar(20),StudentMarks int);
insert into students value('shashi',90);
insert into students value('rishab',80);
insert into students value('dipan',85); 
insert into students value('poojan',70);
insert into students value('gopal',65);
select * from students;
delimiter $$
create procedure sp_totalMarks()
begin
select StudentName,SUM(StudentMarks) as TotalMarks from students
    group by StudentName;
 end $$
delimiter ;
call sp_totalMarks;

-- 5.3--  Write a query  which displays the list of students in ascending order based on there name along with the highest to lowest  marks scored in different subject by each student

SELECT studentName,Studentmarks FROM Students WHERE studentMarks order by studentname asc,studentmarks desc;


-- 5.4 -- Add constrains in such a way that if a primary  key realted record is deleted then the correponding record containing the foreign key should be deleted

alter table cuorder
add constraint fk_customer 
foreign key(id) references customer(id) on delete cascade ;

-- 5.5-- Add constrains in such away that if a primary  key realted record is delected then the correponding record containing the foreign key should be updated

alter table cuorder
add constraint fk_customers
foreign key(id) references customer(id) on update cascade ;

/*Task 6*/
-- 6.2-- Write a query to search the topic name having $ and _ in it

select *
FROM dob
WHERE name like '%\$%';

SELECT *
FROM dob
WHERE name like '%\_%';



