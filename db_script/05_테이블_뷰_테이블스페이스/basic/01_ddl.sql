-- 존재하면 삭제
drop database if exists tabledb;

-- 생성
create database tabledb;
use tabledb;

create table usertbl
(
    -- 컬럼 타입 제약조건
    userID    char(8)     not null primary key,
    name      varchar(10) not null,
    birthyear int         not null,
    addr      char(2)     not null,
    mobile1   char(3),
    mobile2   char(8),
    height    smallint,
    mDate     date
);

drop table if exists buytbl;
create table buytbl
(
    num       int auto_increment not null primary key,
    userID    char(8)            not null,
    prodName  char(6)            not null,
    groupName char(4),
    price     int                not null,
    amount    smallint           not null,
    -- foreign key (현재 테이블 컬럼명)
    -- references [참조할 테이블명] (참조할컬럼)

    foreign key (userID) references usertbl (userID)
);
insert into usertbl
values ('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8'),
       ('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4'),
       ('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

INSERT INTO buytbl (userID, prodName, groupName, price, amount)
    VALUES ('KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl (userID, prodName, groupName, price, amount)
VALUES ('KBS', '노트북', '전자', 1000, 1);

-- 참조값 id가 없음
INSERT INTO buytbl (userID, prodName, groupName, price, amount)
VALUES ('JYP', '모니터', '전자', 200, 1);

delete
from buytbl
where prodName = '노트북';