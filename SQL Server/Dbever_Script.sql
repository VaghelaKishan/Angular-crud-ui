USE KishanDB;


----------------------------Table Create------------------------------
create table public.person(
id int,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(7),
date_of_birth DATE);

select * from person

insert into person(id,first_name,last_name,gender,date_of_birth)values('1','kishan','vaghela','male',DATE '06-11-2001');
insert into person(id,first_name,last_name,gender,date_of_birth)values('2','kirtan','doshi','male',DATE '24-04-2002');
insert into person(id,first_name,last_name,gender,date_of_birth)values('3','nishit','kamani','male',DATE '21-05-2002');
insert into person(id,first_name,last_name,gender,date_of_birth)values('4','raj','boda','male',DATE '24-01-2002');

drop table person;


create table person1(
id bigserial not null primary key,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null,
gender VARCHAR(7)not null,
date_of_birth DATE not null,
email varchar(150));

select * from person1;
drop table person1;

insert INTO person1(first_name,last_name,gender,date_of_birth,email)values('kishan','vaghela','male',DATE '06-11-2001','vaghelakishan59@gmail.com');
insert INTO person1(first_name,last_name,gender,date_of_birth,email)values('kirtan','doshi','male',DATE '24-04-2002','');
insert INTO person1(first_name,last_name,gender,date_of_birth,email)values('nishit','kamani','male',DATE '21-05-2002','');
insert INTO person1(first_name,last_name,gender,date_of_birth,email)values('raj','boda','male',DATE '24-01-2002','');


----------------------------Table Create------------------------------
create table person2 (
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	Country_of_birth VARCHAR(50)
);
drop table person2;
select * from person2;
select from  person2


----------------------------Insert Value in Table------------------------------
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Wandie', 'Escalante', null, 'Genderqueer', '26.05.2022', 'Poland');
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Neel', 'Pyle', 'npyle1@printfriendly.com', 'Male', '01.01.2023', 'Armenia');
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Orelia', 'Nockells', 'onockells2@last.fm', 'Female', '02.01.2023', 'Argentina');
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Barnabas', 'Wolverson', 'bwolverson3@nymag.com', 'Male', '25.06.2022', 'Russia');
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Worthy', 'Coddrington', 'wcoddrington4@tiny.cc', 'Male', '02.07.2022', 'Thailand');
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Fairfax', 'Waker', null, 'Male', '17.04.2022', 'Czech Republic');
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Palm', 'Lindenboim', null, 'Male', '05.01.2023', 'Argentina');
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Isidor', 'Dickens', 'idickens7@adobe.com', 'Male', '29.09.2022', 'Ecuador');
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Terrel', 'Fost', 'tfost8@mlb.com', 'Male', '16.09.2022', 'China');
insert into person2 (first_name, last_name, email, gender, date_of_birth, Country_of_birth) values ('Cathrin', 'Cleevely', null, 'Female', '24.06.2022', 'Mexico');

----------------------------ORDER BY------------------------------
select * from person2;
select from  person2
select * from person2 order by Country_of_birth DESC;
select * from person2 order by Country_of_birth ASC;
select * from person2 order by Country_of_birth;

 
---------------------------- DISTINCT ------------------------------
SELECT Country_of_birth FROM person2
SELECT Country_of_birth FROM person2 ORDER BY Country_of_birth;
SELECT DISTINCT Country_of_birth FROM person2 ORDER BY Country_of_birth;
SELECT DISTINCT Country_of_birth FROM person2 ORDER BY Country_of_birth desc;

---------------------------- WHERE AND CLAUSE ------------------------------
select  * from person2 where gender = 'Female';
select  * from person2 where gender = 'Male';
select  * from person2 where gender = 'Male' and Country_of_birth = 'Ecuador';
select  * from person2 where gender = 'Male' and (Country_of_birth = 'Ecuador' or Country_of_birth='Armenia');


----------------------------Comparison Operators ------------------------------
select 1=1  --true 
select 1=2 --false 
select 1<2
select 1<=2
select 1>2

---------------------------- Offset ------------------------------
SELECT * FROM person2 LIMIT 5;
SELECT * FROM person2 offset 5 LIMIT 5;   --after 5 start & next 5 row show
SELECT * FROM person2 offset 3;     --after 3 start
SELECT * FROM person2 offset 5 fetch first 1 row only; 


---------------------------- IN ------------------------------
select * from person2 where Country_of_birth='Maxico'
or Country_of_birth = 'China' or Country_of_birth='Ecuador';
select * from person2 where Country_of_birth IN('Maxico','China','Russia');
select * from person2 where Country_of_birth in ('Maxico','China','Russia','Poland') order by Country_of_birth;


---------------------------- BETWEEN ------------------------------
select * from person2 where date_of_birth between date '01-11-2022' and '01-05-2023';


---------------------------- LIKE & iLIKE------------------------------
select * from person2 where email like '%.com';  --only show .com emails
select * from person2 where email like '%@adobe.com';
select * from person2 where Country_of_birth like 'P%';
select * from person2 where Country_of_birth ilike 'p%';  --- ilike simply ignore a case-sensitive

---------------------------- GROUP BY ------------------------------
select distinct Country_of_birth from person2;
select Country_of_birth from person2 group by Country_of_birth;
select Country_of_birth ,count(*) from person2 group by Country_of_birth;
select Country_of_birth, count(*) from person2 group by Country_of_birth order by Country_of_birth;


---------------------------- GROUP BY HAVING ------------------------------
select Country_of_birth, count(*) from person2 group by Country_of_birth having count(*) > 1 order by Country_of_birth;


---------------------------- Expression ------------------------------
SELECT (15 + 6) AS ADDITION ;
SELECT (15 * 6) AS MULTIFICATION ;
SELECT CURRENT_TIMESTAMP;

---------------------------- ADDING NEW TABLE AND DATA USING MOCKAROO  ------------------------------
create table car (
	id BIGSERIAL NOT NULL,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100)NOT NULL ,
	price NUMERIC(19,2) NOT NULL 
);
insert into car (id, make, model, price) values (1, 'Scion', 'xA', '51801.23');
insert into car (id, make, model, price) values (2, 'Volvo', 'S40', '17691.46');
insert into car (id, make, model, price) values (3, 'BMW', 'X3', '10838.95');
insert into car (id, make, model, price) values (4, 'GMC', 'Acadia', '65125.92');
insert into car (id, make, model, price) values (5, 'Lincoln', 'Continental Mark VII', '78974.41');
insert into car (id, make, model, price) values (6, 'Mercury', 'Mountaineer', '22883.20');
insert into car (id, make, model, price) values (7, 'Nissan', 'Quest', '54669.65');
insert into car (id, make, model, price) values (8, 'Mercury', 'Sable', '92220.11');
insert into car (id, make, model, price) values (9, 'Toyota', 'FJ Cruiser', '84501.68');
insert into car (id, make, model, price) values (10, 'Chevrolet', 'Aveo', '99156.96');

SELECT * from car;
drop table car;



---------------------------- Calculating MIN & MAX & Average ------------------------------
select max(price) from car; 
select min(price) from car; 
select avg(price) from car;
select round(avg(price)) from car; 

select make,model, min(price) from car group by make,model;
select make,model, max(price) from car group by make,model;

select make, min(price) from car group by make;
select make, max(price) from car group by make;
select make, avg(price) from car group by make;

select sum(price) from car;


---------------------------- Alias ------------------------------
select id,make,model,price as original_price, round(price * .10 ,2) as ten_percent_value, round (price - (price * .10),2) as discount_after_ten_percent from car; 


---------------------------- Coalesce ------------------------------  function returns the first non-null value in a list.
select * from person2;
select email from person2 ;
select coalesce(email) from person2;
select coalesce(email,'email not provided') from person2;

----------------------------  NULL IF ------------------------------  two expressions are equal, otherwise it returns the first expression
select 10/0;
select coalesce (10 / nullif(0,0),0);

---------------------------- TIMESTAMPS AND DATES------------------------------
select NOW();
select NOW()::date;
select NOW()::TIME;

---------------------------- Adding and Subtracting With Dates ------------------------------
select NOW() - interval '10 YEARS';
select NOW() - interval '10 MONTH';
select NOW() - interval '10 DAYS';


---------------------------- Age Function ------------------------------
select first_name, last_name, gender ,Country_of_birth, date_of_birth, AGE(NOW(),date_of_birth) as age from person2;


----------------------------  Primary Key ------------------------------
ALTER TABLE  person DROP CONSTRAINT person1_pkey;
insert INTO person1(id,first_name,last_name,gender,date_of_birth,email)values('2','kishan','vaghela','male',DATE '06-11-2001','vaghelakishan59@gmail.com');
SELECT * FROM person1 WHERE id=2;

---------------------------- Unique Constraints ------------------------------
select email,count(*) from person2 group by email
select email,count(*) from person2 group by email having count(*)>1;
select * from person2 where email  = 'npyle1@printfriendly.com'
alter table person2 add constraint unique_email_address unique (email);
select * from person2 
ALTER TABLE person2 DROP CONSTRAINT unique_email_address;
ALTER TABLE person2 ADD UNIQUE (email);

---------------------------- check Constraints ------------------------------
select distinct gender from person2;
ALTER TABLE person2 ADD CONSTRAINT gender_contraint CHECK (gender ='Female' OR gender ='Male');


---------------------------- DELETE RECORDS ------------------------------
select * from person2;
delete form person2 where id = 1;
delete form person2 where gender= 'Male'; 
delete form person2 where gender= 'Male' and gender='Female';

---------------------------- Update RECORDS ------------------------------
select * from person2;
select * from person where id = 4;
update person2 set email = 'ishankisan@gmail.com' where id= 4;
select * from person where id =4;
update person2 set first_name='kd', last_name='vaghela',email='k.d.vaghela@gmail.com' where id=4;

---------------------------- On Conflict Do Nothing--------------------------
select * from person2 where id = 20;
insert into person2 (id,first_name,last_name,gender,email,date_of_birth,Country_of_birth)values(20,'doshi','kirtan','Male','doshi@gmail.com',date '06-05-2020','Uk')on conflict(id)do update set email = excluded.email;
select * from person2 where id=20;
insert into person2 (id,first_name,last_name,gender,email,date_of_birth,Country_of_birth)values(20,'doshi','kirtan','Male','doshi@gmail.com',date '06-05-2020','Uk')on conflict(id)do update set email = excluded.email;
insert into person2 (id,first_name,last_name,gender,email,date_of_birth,Country_of_birth)values(20,'dohi','kirta','Male','doshi@gmail.com',date '06-05-2020','Uk')on conflict(id)do update set email = excluded.email;
select * from person2 where id=20;


---------------------------- Adding Relation Between Tables--------------------------
create table car1(
id BIGSERIAL not null primary key ,
make varchar(100)not null,
model varchar(100)not null,
price numeric(19,2)not null
)

insert into car1(make,model,price)values('rangr rover','stering','876666');
insert into car1(make,model,price)values('koniseg agera','R','7994664');

select * from car1;

create table person3(
id BIGSERIAL not null primary key ,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null,
gender VARCHAR(7) not null,
email VARCHAR(100),
date_of_birth DATE not null,
country_of_birth VARCHAR(50) not null,
car1_id BIGINT references car1(id),
UNIQUE(car1_id)
);

insert into person3(first_name,last_name,gender,email,date_of_birth,country_of_birth)values('kishan','vaghela','male','vaghelakishan59@gmail.com',DATE '06-11-2001','india');
insert into person3(first_name,last_name,gender,email,date_of_birth,country_of_birth)values('kevin','vaghela','male','vaghelakevin59@gmail.com',DATE '06-11-2001','pakistan');
insert into person3(first_name,last_name,gender,email,date_of_birth,country_of_birth)values('raj','kaka','male','rajkaka55@gmail.com',DATE '06-11-2001','dubai');

select * from person3;


update person3 set car1_id =2 where id=1;
update person3 set car1_id =1 where id=2;


---------------------------- Inner Joins ---------------------------\x -Expanded display is on. ---
SELECT * FROM person3;
SELECT * FROM car1;
SELECT * FROM person3
JOIN car1 ON person3.car1_id = car1_id;


select  person3.first_name,car1.make,car1.model,car1.price from person3 join car1 on person3.car1_id=car1_id;

---------------------------- left Joins -----------------------------
SELECT * FROM person3 LEFT JOIN car1 ON car1.id=person3.car1_id WHERE car1.*IS NULL;
SELECT * FROM person3 LEFT JOIN car1 ON car1.id=person3.car1_id;
SELECT * FROM person3 LEFT JOIN car1 ON person3.car1_id = car1.id;
SELECT * FROM person3 LEFT JOIN car1 ON person3.car1_id = car1.id;


---------------------------- Deleting Records with Foreign Keys -----------------------------
update person12 set car12_id=13 where id=4
delete from car12 where id=13
select * from person12_id_seq;

---------------------------- CSV file -----------------------------
 \copy (SELECT * FROM person3 LEFT JOIN car1 ON car1.id = person3.car_id) To 'D:\SQL Server' DELIMITER ',' CSV HEADER;

---------------------------- Serial & Sequences -----------------------------
 SELECT nextval('person3_id_seq'::regclass);

---------------------------- extensions -----------------------------
SELECT * FROM pg_available_extensions;
 CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
SELECT * FROM pg_available_extensions;  --\df--

SELECT uuid_generate_v4();  ---vary hard take a access for hecker








