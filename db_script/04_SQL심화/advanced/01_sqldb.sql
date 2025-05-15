-- 앞에서 정의한 3개의 테이블을 이용해서 다음을 처리하세요.
-- ○ 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/
-- 동아리방을 출력하세요.
/*
 - 세 개 이상 테이블 조인
 - 각 테이블은 관계가 있어야 함, 조인 조건을 명확히 설정해야 함.
 1. 첫 번째 테이블과 두 번째 테이블 먼저 조인
 2. 1번의 결과 테이블과 세 번째 테이블이 조인
 - 각 조인마다 on으로 조건을 지정해야함
 */
select s.stdName, s.addr, c.clubName, c.roomNo
from stdtbl s
         join stdclubtbl sc on s.stdName = sc.stdName
         join clubtbl c on sc.clubName = c.clubName;


-- ○ 동아리를 기준으로 가입한 학생의 목록을 출력하세요.
--  출력정보: clubName, roomNo, stdName, addr
select c.clubName, c.roomNo, s.stdName, s.addr
from clubtbl c
         join stdclubtbl sc on c.clubName = sc.clubName
         join stdtbl s on sc.stdName = s.stdName;


-- 앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요.
-- ○ 출력할 정보  부하직원, 직속상관, 직속상관연락처
select e1.emp as 부하직원, e1.manager as 직속상관, e2.empTel as 직속상관연락처
from emptbl e1
         inner join emptbl e2 on e1.manager = e2.emp
where e1.emp = '우대리';