--계정생성
create user DBCINQ identified by a1234;
--접속 권한 조작 권한 부여
grant connect,resource,DBA to DBCINQ;

--접속 테스트
conn DBCINQ/a1234;

--유저 삭제
drop user DBCINQ;


---- DBCINQ 접속 후 테이블 생성

--memeber table 생성

create table member(
Name varchar2(20),
Id varchar2(20) primary key,
Pw varchar2(20),
Pid varchar2(30) unique,
Tel number(11),
Gender varchar2(2),
Nickname varchar2(30) unique
);

desc member;
select * from member;

--관리자 계정생성
insert into member values('admin','admin','admin1','nan','000','nn','admin');


-- loc table
create table loc(
loc_code number(2) primary key,
loc_name varchar2(20)
);

desc loc;
select * from loc;

--join table 
create table join(
title varchar2(100),
content varchar2(300),
image varchar2(50),
loc_name varchar2(20),
gender varchar2(2),
age number(3),
max_count number(3),
cur_count number(3)
);



desc join;
select * from join;

--place 테이블

create table place (
title varchar2(100),
content varchar2(300),
image varchar2(50),
loc_name varchar2(20),
addr varchar2(100),
max_count number(3)
);



desc place;
select * from place;


--location 테이블
create table location (
title varchar2(100),
content varchar2(300),
image varchar2(50),
loc_name varchar2(20),
addr varchar2(100),
max_count number(3)
);

desc location;
select * from location;


--reservation 테이블 
create table reservation (
title varchar2(100),
content varchar2(300),
image varchar2(50),
max_count number(3),
show_date date,
pay_date date default sysdate,
price number(7),
show_num number(7) primary key
);


desc reservation;
select * from reservation;


--review 테이블
create table review (
title varchar2(100),
content varchar2(300),
image varchar2(50),
show_date date,
show_num number(7)
);

desc review;
select * from review;

--history_viewer 테이블
create table history_viewer (
title varchar2(100),
show_date date,
price number(7),
show_num number(7)
);

desc history_viewer;
select * from history_viewer;

--history_artist 테이블
create table history_artist (
title varchar2(100),
content varchar2(300),
image varchar2(50),
show_start_date date,
show_date date,
show_num number(7)
);

desc history_artist;
select * from history_artist;

-- 주인이 DBCINQ 인 테이블의 제약조건 확인. U = unique , P = primary key , R = Foreign key
SELECT * FROM    ALL_CONSTRAINTS where owner = 'DBCINQ';


select * from tab;
