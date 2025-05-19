drop table if exists userTBL;
drop table if exists buyTBL;

create table userTBL
(
    userID    char(8)     not null primary key,
    name      varchar(10) not null,
    birthyear int         not null
);

create table buyTBL
(
    num      int auto_increment not null primary key,
    userID   char(10)           not null,
    prodName char(6)            not null,
    foreign key (userID) REFERENCES userTBL (userID)
);

drop table if exists buyTBL;
drop table if exists userTBL;

create table userTBL
(
    userID    char(8)     not null primary key,
    name      varchar(10) not null,
    birthyear int         not null,
    email     char(30) unique
);

drop table if exists userTBL;

create table userTBL
(
    userID    char(8) not null primary key,
    name      varchar(10),
    birthyear int,
    mobile    char(3) not null,

    check ( birthyear between 1900 and 2023)
);


drop table if exists userTBL;
create table userTBL
(
    userID    char(8) not null primary key,
    name      varchar(10),
    birthyear int     not null default -1,
    addr      char(2) not null default '서울',
    mobile1   char(3),
    mobile2   char(8),
    height    smallint         default 170,
    mDate     date
);
insert into userTBL
values ('user0001', 'name', default, default, '010', '12341234', default, now());

select * from userTBL;

alter table userTBL
drop column mobile1;

alter table userTBL
rename column name to uName;

alter table userTBL
drop primary key;

show columns from userTBL;