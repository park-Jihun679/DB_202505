-- 다음과 같이 실습 데이터베이스 및 사용자를 생성하고, 해당 데이터베이스에 대해 모든 권한을 부여하세요.
/*
○ 데이터베이스 명 : scoula_db
○ 사용자 명: scoula
○ 비밀번호: 1234
○ 접속 호스트: 제한 없음
*/

create database scoula_db;
create user 'scoula'@'localhost' identified by '1234';
grant all privileges on *.* to 'scoula'@'localhost';