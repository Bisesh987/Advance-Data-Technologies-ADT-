drop table employee;
drop table departments;
drop table it;
drop table salary;
drop table deduction;
drop table tax;
drop table absences;

create table absences(
absences_id number,
reason varchar2(100) not null,
absences_date TIMESTAMP(2)NOT NULL,
 CONSTRAINT absences_pk PRIMARY KEY (absences_id)
);

select * from absences;





--cube
SELECT
    reason,
    absences_id
FROM
    absences
GROUP BY
    CUBE(reason,absences_id)
ORDER BY
    reason NULLS LAST,
    absences_id NULLS LAST;
    





create table tax(
tax_id number,
type varchar2(100) not null,
CONSTRAINT tax_pk PRIMARY KEY (tax_id)
);


create table deduction(
    deduction_id number,
    description varchar2(100)not null,
    amount number(20) not null,
    detail varchar2(50),
    constraint deduction_pk primary key(deduction_id)
);

CREATE TABLE employee(
 employee_id NUMBER,
 employee_name VARCHAR2(30) NOT NULL,
 employee_contact_number VARCHAR2(30) NOT NULL,
 employee_department VARCHAR2(30) NOT NULL,
 employee_email VARCHAR2(30) NOT NULL,
 employee_website CHAR(20) NOT NULL,
 deduction_id NUMBER(10) REFERENCES deduction(deduction_id),
 CONSTRAINT employee_pk PRIMARY KEY (employee_id)
);
--nested
CREATE TABLE departments (  
  dept_id      NUMBER(10)NOT NULL,
  dep_name     varchar(100),
  address      varchar2(50),  
  constraint departments_pk primary key (dept_id) 
);
Nested TABLE dep_name STORE AS d_new;

CREATE TYPE name_more IS TABLE OF new_name;

CREATE table it(
it_name VARCHAR2(100),
contact NUMBER(14),
department VARCHAR2(200),
email VARCHAR2(80)
);


create table salary(
    salary_id number,
    labour_hour number(2) not null,
    over_time number(2) not null,
    total number(10)not null,
    detail varchar2(50),
    constraint salary_pk primary key (salary_id)
);








INSERT INTO employee(employee_id, employee_name, employee_contact_number, employee_department, employee_email, employee_website) VALUES ('1', 'Bisesh Shrestha', '1234567890', 'Bhaktapur-kamalbinayak', 'bisesh@gmail.com', 'bisesh.np.com');

INSERT INTO employee(employee_id, employee_name, employee_contact_number, employee_department, employee_email, employee_website) VALUES ('2', 'Saugat Nepal', '2345678910', 'kathmandu-gaushala', 'saugat@gmail.com', 'saugat.np.com');

INSERT INTO employee(employee_id, employee_name, employee_contact_number, employee_department, employee_email, employee_website) VALUES ('3', 'Sabin Dahal', '0123456789', 'kathamndu-chabail', 'sabin@gmail.com', 'sabin.np.com');

INSERT INTO employee(employee_id, employee_name, employee_contact_number, employee_department, employee_email, employee_website) VALUES ('4', 'Biraj bramasakha', '3456789120', 'kathmandu-kalanki', 'biraj@gmail.com', 'biraj.np.com');

INSERT INTO employee(employee_id, employee_name, employee_contact_number, employee_department, employee_email, employee_website) VALUES ('5', 'Sriza Tamang', '4567893210', 'Bhaktapur-thimi', 'sriza@gmail.com', 'sriza.np.com');





insert into departments (dept_id, dep_name, address) values('1', 'it','bhaktapur');
insert into departments (dept_id, dep_name, address) values ('2', 'hr','kathmandu');



insert into salary(salary_id, labour_hour, over_time, total, detail) values('1','8','2','10','holi fest');
insert into salary(salary_id, labour_hour, over_time, total, detail) values('2','8','2','10','tihar fest');
insert into salary(salary_id, labour_hour, over_time, total, detail) values('3','8','2','10','deshain fest');
insert into salary(salary_id, labour_hour, over_time, total, detail) values('4','8','2','10','losar fest');
insert into salary(salary_id, labour_hour, over_time, total, detail) values('5','8','2','10','jatra fest');

INSERT INTO deduction(deduction_id, description, amount, detail) VALUES ('1', 'deu to absent', '500', 'absemt in holi');
INSERT INTO deduction(deduction_id, description, amount, detail) VALUES ('2', 'deu to absent', '500', 'absemt in tihar');
INSERT INTO deduction(deduction_id, description, amount, detail) VALUES ('3', 'deu to absent', '500', 'absemt in losar');
INSERT INTO deduction(deduction_id, description, amount, detail) VALUES ('4', 'deu to absent', '500', 'absemt in dashain');
INSERT INTO deduction(deduction_id, description, amount, detail) VALUES ('5', 'deu to absent', '500', 'absemt in jatra');

INSERT INTO absences(absences_id, reason, absences_date) VALUES ('1', 'sick', localtimestamp(2));
INSERT INTO absences(absences_id, reason, absences_date) VALUES ('2', 'LEAVE', localtimestamp(2));
INSERT INTO absences(absences_id, reason, absences_date) VALUES ('3', 'ABSENT', localtimestamp(2));


INSERT INTO tax(tax_id, type) VALUES ('1', 'pf');
INSERT INTO tax(tax_id, type) VALUES ('2', 'pf');

INSERT INTO it(it_name, contact, department, email) VALUES ('hari', '1234567890', 'it', 'h@gmail.com');
INSERT INTO it(it_name, contact, department, email) VALUES ('shyam', '1234567890', 'it', 's@gmail.com');
INSERT INTO it(it_name, contact, department, email) VALUES ('ram', '1234567890', 'it', 'r@gmail.com');
 select * from salary;
select * from employee;
select * from departments;

--join
SELECT
*
FROM employee,
    departments,
    salary
    
WHERE employee_id = dept_id
AND dept_id = salary_id;



