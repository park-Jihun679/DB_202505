-- SELECT
-- 특정 테이블에서 원하는 데이터를 조회할 수 있다.

select -- 조회
       * -- 모든 컬럼
from buytbl; -- buytbl 에서

select userID,
       groupName
from buytbl;

select now();

select concat('bear', '안녕', 'kb') as '인 사';

-- usertbl의 name, mobile1, mobile2 를 출력
-- mobile1, mobile은 붙여서 전화번호 라는 컬럼으로 출력되어야함

select name,
       concat(mobile1, mobile2) as '전화번호'
from usertbl;
