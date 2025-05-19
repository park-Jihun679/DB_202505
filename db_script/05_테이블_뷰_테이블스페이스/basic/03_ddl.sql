use tabledb;

drop table if exists usertbl;

create table usertbl
(
    userID    char(8)     not null,
    name      varchar(10) not null,
    brithyear int         not null,

    -- constaraint : 제약조건을 명시적으로 이름붙여 정의
    -- primary key [기본키제약조건이름](기본키로 지정할 컬럼)
    constraint primary key PK_userTBL_userID(userID)
);
drop database if exists prodTbl;
create table prodTbl (
    prodCode char(3) not null,
    prodID char(4) not null,
    prodDate datetime not null,
    proCur char(10),

    constraint primary key PK_prodTbl_prodCode_prodID(prodCode, prodID)
);