create table tbl1
(
    a int primary key,
    b int,
    c int
);
show index from tbl1;

create table tbl2
(
    a int primary key, -- a 기본 키 -> 자동으로 클러스터형(PK) 인덱스 생성, (중복 x, null x)
    b int unique,    -- b 유니크 키 -> unique 인덱스 생성 (중복불가, null 허용)
    c int unique    -- c 유니크 키 -> unique 인덱스 생성 (중복불가, null 허용)
);
show index from tbl2;

create table tbl3
(
    a int unique,
    b int unique,
    c int unique,
    d int
);
show index from tbl3;

create table tbl3
(
    a int unique,
    b int unique,
    c int unique,
    d int
);
show index from tbl3;

create table tbl4
(
    a int unique not null,
    b int unique,
    c int unique,
    d int
);
show index from tbl4;

create table tbl5
(
    a int unique not null,
    b int unique,
    c int unique,
    d int primary key
);
show index from tbl5;