
-- 해파리 게임의 댓글
CREATE TABLE tisgame_jellyfish_memo(
  idx number(4) primary key,
  name varchar2(20) not null,
  msg varchar2(100),
  wdate date default sysdate
  );

create sequence tisgame_jellyfish_memo_seq nocache;

-- 자유게시판

create table tisgame_board(
	idx number(8) constraint tisgame_board_pk primary key,--글번호
	name varchar2(30) not null,--작성자
	pwd varchar2(20) not null,--비번
	subject varchar2(200),--제목
	content varchar2(2000),--내용
	wdate timestamp default systimestamp,--작성일
	readnum number(8) default 0, --조회수
	filename varchar2(200),--첨부파일명[년월일시분초_a.jpg]
	filesize number(8) --첨부파일 크기
);

create sequence tisgame_board_seq nocache;

-- 자유게시판의 댓글

create table tisgame_reply(
	num number(8) primary key,
	userid varchar2(255) not null,
	content varchar2(500),
	wdate date default sysdate,
	idx_fk number(3) not null,
	constraint tisgame_reply_userid_fk foreign key (userid) references tisgame_MEMBER(MEMBER_ID),
	constraint tisgame_reply_idx_fk foreign key (idx_fk) references tisgame_board(idx)
);

create sequence tisgame_reply_seq nocache;

-- 공지사항

create table tisgame_notice(
	idx number(8) constraint tisgame_notice_pk primary key,--글번호
	name varchar2(30) not null,--작성자
	pwd varchar2(20) not null,--비번
	subject varchar2(200),--제목
	content varchar2(2000),--내용
	wdate timestamp default systimestamp,--작성일
	readnum number(8) default 0 --조회수
);

create sequence tisgame_notice_seq nocache;

-- 회원

CREATE TABLE tisgame_MEMBER(
	MEMBER_ID VARCHAR2(20) NOT NULL,
	MEMBER_PWD VARCHAR2(20) NOT NULL,
	MEMBER_NAME VARCHAR2(255) NOT NULL,
  MEMBER_GAME1_SCORE VARCHAR2(255) DEFAULT 0,
  MEMBER_GAME2_SCORE VARCHAR2(255) DEFAULT 0,
  MEMBER_GAME3_SCORE VARCHAR2(255) DEFAULT 0,
	CONSTRAINT MEMBER_ID_PK PRIMARY KEY (MEMBER_ID)
);

-- Flap Jellyfish 랭킹
CREATE TABLE tisgame_GAME2_RANK(
  GAME2_RANK_SCORE NUMBER(36),
  MEMBER_ID VARCHAR2(20),
	CONSTRAINT GAME2_RANK_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID)
    REFERENCES tisgame_MEMBER(MEMBER_ID) ON DELETE CASCADE
);

-- HC Jam 랭킹
CREATE TABLE tisgame_GAME3_RANK(
  GAME3_RANK_SCORE VARCHAR(255),
  MEMBER_ID VARCHAR2(20),
	CONSTRAINT GAME3_RANK_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID)
    REFERENCES tisgame_MEMBER(MEMBER_ID) ON DELETE CASCADE
);

-- 1 to 50 랭킹
CREATE TABLE tisgame_GAME1_RANK(
  GAME1_RANK_SCORE VARCHAR(255),
  MEMBER_ID VARCHAR2(20),
	CONSTRAINT GAME1_RANK_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID)
    REFERENCES tisgame_MEMBER(MEMBER_ID) ON DELETE CASCADE
);

------------

