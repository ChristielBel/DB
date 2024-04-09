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

create table arendator
(id_arend number(10) primary key,
name_arend varchar(25) not null,
surname_a varchar(25) not null,
birthday_a date,
addres_a varchar2(25),
telephone_a varchar2(25) not null
);
alter table arendator add constraint phone check(substr(telephone_a,1,1)='+' and REGEXP_LIKE(telephone_a, '^\+[0-9]{12,15}$'));
insert into arendator values(10001,'Олег','Иванов',TO_DATE('2022-09-15', 'YYYY-MM-DD'),'ул.Красная','+791234567899');

create table rental_avto
(id_va number(10) primary key,
id_arend number(10) references arendator(id_arend),
id_s number(5) references auto_sal(id_s),
id_a number(10) references automob(id_a),
date_v date not null,
return_date date not null,
returned_date date,
fine_a number(10));

drop table auto_sal;
drop table automob;
drop table arendator;
drop table resntal_avto;
