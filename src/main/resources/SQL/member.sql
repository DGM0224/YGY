﻿## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS springbootpj;
use springbootpj;

-- Table : 회원 

# 회원 테이블 생성
-- 회원 ID, 이름, 회원 비밀번호, 이메일, 핸드폰, 우편번호, 집 상세주소1, 집 상세주소2, 이메일 수신여부, 회원 가입일, 전화
-- member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone
DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member(
	member_id VARCHAR(20) PRIMARY KEY,
	member_name VARCHAR(10) NOT NULL,
	member_pass VARCHAR(100) NOT NULL,
	email VARCHAR(30) NOT NULL,
	mobile VARCHAR(30) NOT NULL, 
	zipcode VARCHAR(5) NOT NULL,
	address1 VARCHAR(80) NOT NULL,
	address2 VARCHAR(60) NOT NULL,
	email_get VARCHAR(1) NOT NULL,
	member_date TIMESTAMP NOT NULL,
	phone VARCHAR(13)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# 회원 정보 추가
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date) VALUES ('Thomas', '도건민', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'ehrjsals@naver.com', '01012345678', '18273', '경기도 군포시', '103호', '1', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone ) VALUES ('Kyle', '김태민', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'rlaxoals@daum.net', '01012345679', '02342', '서울특별시 신림', '104호', '0', SYSDATE(), '0312158847'); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date) VALUES ('Kale', '김건우', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'rlarjsdn@gmail.com', '01012345670', '18239', '서울특별시 서대문구', '105호', '1', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone ) VALUES ('bokbok', '이헌복', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'dlgjsqhr@gmail.com', '01012345671', '18039', '서울특별시 서울대입구', '106호', '1', SYSDATE(), '0312159947'); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date) VALUES ('Hyuni', '위진현', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'dnlwlsgus@gmail.com', '01012345672', '11239', '경기도 산본시', '107호', '0', SYSDATE());	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone ) VALUES ('Julia', '이나연', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'dlskdus@gmail.com', '01012345673', '08239', '경기도 수원시', '108호', '1', SYSDATE(), '0311150047'); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date) VALUES ('BeerLover', '하민철', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'gkalscjf@gmail.com', '01010101010', '12238', '서울특별시 서울대입구역', '209호', '0', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone ) VALUES ('NightOwl', '백장미', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'qorwkdal@daum.net', '01022325869', '08389', '전라남도 해남', '308호', '1', SYSDATE(), '0413361111'); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone ) VALUES ('자전거여행자', '정수빈', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'wjdtnqls@gmail.com', '01012343546', '29174', '서울시 어딘가', '401호', '0', SYSDATE(), '0631124637'); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone ) VALUES ('유레일러', '오성중', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'dhtjdwnd@naver.com', '01012340101', '00274', '경기도 시흥시', '411호', '1', SYSDATE(), '021134859');
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date) VALUES ('해덕여행러버호', '이정민', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'dlwjdals@gmail.com', '01012347382', '12364', '서울특별시 강남구', '515호', '0', SYSDATE()); 		
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone ) VALUES ('여행러버', '전봉근', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'wjsqhdrms@naver.com', '0101234522', '12345', '서울특별시 용산구', '310호', '1', SYSDATE(), '3024738888'); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('여행러버95', '박철용', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'qkrcjfdyd@gmail.com', '01012345633', '17579', '경기도 가평시', '208호', '1', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone ) VALUES ('history', '안유정', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'dbwjd@gmail.com', '01011112222', '01234', '전라남도 전주시', '1108호', '1', SYSDATE(), '0612220938'); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('outsider', '이명훈', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'audgns@daum.net', '01022223333', '11234', '경상북도 대구시', '1908호', '0', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('ruins', '윤지영', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'wldud@gmail.com', '01033334444', '34556', '경상남도 부산시', '1208호', '0', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('animallove', '이현서', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'gustj@naver.com', '01044445555', '17357', '강원도 강릉시', '2208호', '1', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date, phone ) VALUES ('citynfood', '이상준', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'tkdwns@gmail.com', '01055556666', '12341', '충청북도 보은군', '3208호', '1', SYSDATE(), '0423148888'); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('shoeter', '이신지', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'tlswl@gmail.com', '01066667777', '04759', '충청남도 아산시', '3205호', '0', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('nature', '오인명', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'dlsaud@naver.com', '01077778888', '53648', '충청북도 청주시', '1011호', '0', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('lovesouth', '김지우', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'wldn@daum.net', '01088889999', '47485', '충청북도 청주시', '1013호', '1', SYSDATE()); 	
INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('adventure', '정가현', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'rkgus@naver.com', '01000009999', '27395', '충청북도 청주시', '1009호', '0', SYSDATE()); 	

INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('midas', '홍길동', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'midastop@naver.com', '010-1234-5678', '14409', '경기 부천시 오정구 수주로 18 (고강동, 동문미도아파트)', '미도아파트 101동 111호', '1', SYSDATE()); 	

INSERT INTO member (member_id, member_name, member_pass, email, mobile, zipcode, address1, address2, email_get, member_date ) VALUES ('danny', '스껄맨', '$2a$10$aWYm2BGI/0iMuemBeF4Y8.7WZeVKAoudv/VzgQx697lYlZgQxr/pe', 'danny0224@naver.com', '010-1212-5656', '14409', '경기 부천시 오정구 수주로 18 (고강동, 동문미도아파트)', '미도아파트 111호', '1', SYSDATE()); 	





commit;


SELECT * 
FROM member;
