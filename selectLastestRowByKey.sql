
-- 1) 샘플 테이블 생성
CREATE TABLE `PEOPLE_MATHSCORE` 
(
  `SEQ`     bigint(20) UNSIGNED 
            NOT NULL
            AUTO_INCREMENT
            COMMENT '순번',
  `NAME`    varchar(20) 
            NOT NULL 
            COMMENT '이름',
  `MATH_SCORE`   double
            NOT NULL
            COMMENT '점수',
  `DATE`    datetime 
            NOT NULL 
            DEFAULT CURRENT_TIMESTAMP
            COMMENT '날짜',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='사람별 수학점수';


-- 2) 샘플 데이터 Insert
INSERT INTO PEOPLE_MATHSCORE (NAME, MATH_SCORE, DATE) 
VALUES 
  ("A", 30, '2020-03-01 00:00:00'),
  ("B", 70, '2020-03-01 00:00:00'),
  ("C", 90, '2020-03-02 00:00:00'),
  ("D", 10, '2020-03-02 00:00:00'),
  ("A", 60, '2020-03-02 00:00:00'),
  ("A", 50, '2020-03-03 00:00:00'),
  ("B", 65, '2020-03-03 00:00:00'),
  ("D", 80, '2020-03-03 00:00:00'),
  ("D", 90, '2020-03-04 00:00:00'),
  ("C", 100, '2020-03-04 00:00:00')
;


-- 3) GroupBy 없이, NAME별로 최신 데이터 가져오는 쿼리
SELECT A.*
FROM PEOPLE_MATHSCORE AS A 
WHERE A.NAME IN ( 
  'A',
  'B'
)
AND NOT EXISTS (
  SELECT B.SEQ FROM PEOPLE_MATHSCORE AS B 
  WHERE A.NAME = B.NAME 
  AND A.DATE < B.DATE 
)
;

