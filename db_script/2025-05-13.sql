-- 주석 (한 칸 띄워줘야함)

-- 현재 스키마(db)는 shopdb로 설정되어있음.

show tables;  -- 테이블 목록 조회

desc membertbl;	-- 테이블 설정 자세히 describe(설명하다)

select * from membertbl;	-- membertbl 테이블로 부터 모든 필드를 선택해서 조회

-- dml중 하나 crud중에 read에 속하는 select문 실행
-- dml은 crud작업을 하게 되는데 실무에서 가장 많이 사용하는 것은 select