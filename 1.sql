create table qq(c1 number(3) primary key, c2 char(5));
create table bb(c1 number(3), c2 char(5), constraint myPK primary key (c1));
alter table qq add constraint range check(c1 between 10 and 50);
drop table qq;
drop table bb;
alter table qq add c3 number(5);
alter table qq rename column c1 to c5;
alter table qq modify c2 char(5);
