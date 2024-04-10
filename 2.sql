create table auto_sal
(id_s number(5) primary key,
city varchar(25),
street varchar2(25));
alter table auto_sal add constraint chk_id_s check (id_s>=10000 and id_s<=99999);
alter table auto_sal modify (city not null, street not null);

create table automob
(id_a number(10) primary key,
id_s number(5) references auto_sal(id_s),
mark_a varchar2(25),
country_a varchar2(25),
colour varchar2(25));
alter table automob add constraint aut_pk primary key (id_a, id_s) enable;
alter table auto_sal modify (street varchar2(50));
alter table automob modify (colour not null, mark_a not null, country_a not null);

alter table auto_sal add constraint chk_c check(REGEXP_LIKE(city, '^[А-Я]') and substr(city,1,1)=upper(substr(city,1,1))and substr(city,2)=lower(substr(city,2)));

insert into auto_sal values(10000, 'Краснодар', 'ул.Ставропольская');
insert into auto_sal values(10001, 'Краснодар','ул.Школьная');
insert into auto_sal values(10002, 'Краснодар','ул.Северная');
insert into auto_sal values(10003, 'Краснодар','ул.Красная');
insert into auto_sal values(10004, 'Краснодар','ул.Уральская');

insert into automob values(1,10000,'BMW', 'Германия', 'Синий');
insert into automob values(2,10004, 'FORD', 'Америка', 'Голубой');
insert into automob values(3,10002, 'AUDI', 'Германия', 'Зеленый');
insert into automob values(4,10003, 'CHERY', 'Китай', 'Голубой');
insert into automob values(5,10001, 'LOTUS', 'Англия', 'Серебристый');

create table arendator
(id_arend number(10) primary key,
name_arend varchar(25) not null,
surname_a varchar(25) not null,
birthday_a date,
addres_a varchar2(25),
telephone_a varchar2(25) not null
);
alter table arendator add constraint phone check(substr(telephone_a,1,1)='+' and REGEXP_LIKE(telephone_a, '^\+[0-9]{12,15}$'));

insert into arendator values(100,'Олег','Иванов',TO_DATE('1989-09-15', 'YYYY-MM-DD'),'ул.Красная','+791234567899');
insert into arendator values(101,'Петя','Петров',TO_DATE('2000-06-17', 'YYYY-MM-DD'),'ул.Уральская','+7912345657899');
insert into arendator values(102,'Стас','Петров',TO_DATE('2002-12-15', 'YYYY-MM-DD'),'ул.Красная','+7913456987899');
insert into arendator values(103,'Людмила','Иванова',TO_DATE('1990-10-09', 'YYYY-MM-DD'),'ул.Школьная','+765234567899');
insert into arendator values(104,'Дмитрий','Иванов',TO_DATE('1987-09-19', 'YYYY-MM-DD'),'ул.Северная','+791234097899');

create table rental_avto
(id_va number(10) primary key,
id_arend number(10) references arendator(id_arend),
id_s number(5) references auto_sal(id_s),
id_a number(10) references automob(id_a),
date_v date not null,
return_date date not null,
returned_date date,
fine_a number(10));

insert into rental_avto values(1007, 100,10000, 1,TO_DATE('2024-01-12', 'YYYY-MM-DD'),TO_DATE('2024-03-12', 'YYYY-MM-DD'),TO_DATE('2024-03-01', 'YYYY-MM-DD'),0);
insert into rental_avto values(1018,104,10001, 5,TO_DATE('2024-02-19', 'YYYY-MM-DD'),TO_DATE('2024-05-19', 'YYYY-MM-DD'),TO_DATE('2024-05-20', 'YYYY-MM-DD'), 2000);
insert into rental_avto values(1025,103,10003,3,TO_DATE('2024-01-12', 'YYYY-MM-DD'),TO_DATE('2024-03-12', 'YYYY-MM-DD'),TO_DATE('2024-03-01', 'YYYY-MM-DD'),0);
insert into rental_avto values(1038,102,10004,2,TO_DATE('2024-02-12', 'YYYY-MM-DD'),TO_DATE('2024-03-12', 'YYYY-MM-DD'),TO_DATE('2024-03-01', 'YYYY-MM-DD'),0);
insert into rental_avto values(1045,101,10001,4,TO_DATE('2024-01-12', 'YYYY-MM-DD'),TO_DATE('2024-03-12', 'YYYY-MM-DD'),TO_DATE('2024-04-01', 'YYYY-MM-DD'), 5000);

drop table auto_sal;
drop table automob;
drop table arendator;
drop table resntal_avto;
