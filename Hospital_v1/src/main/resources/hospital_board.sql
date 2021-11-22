-- 2021년 9월 
-- 
DROP TABLE h_reply;
DROP TABLE h_board;
DROP TABLE reservation;
DROP SEQUENCE h_reply_seq;
DROP SEQUENCE h_board_seq;
DROP SEQUENCE reservation_seq;
-- 게시판 (Board)
CREATE TABLE h_board
(
	boardnum number         primary key,	-- 게시글 번호
	userid   varchar2(50)   not null,	-- 작성자 아이디
	title    varchar2(200)  not null,	-- 글제목
	text     varchar2(4000) not null,	-- 글내용
	hitcount number default 0,		-- 조회수
	regdate  date default sysdate,		-- 등록일
	originalfile varchar2(300),		-- 첨부 파일명(원래이름)
	savedfile    varchar2(300),		-- 첨부 파일명(실제 파일에 저장된 이름)
	replycount number default 0             -- 댓글 수
);

CREATE SEQUENCE h_board_seq;

-- 댓글(Reply)
CREATE TABLE h_reply
(
	replynum  number primary key,		-- 댓글 번호
	boardnum  number not null references board(boardnum), -- 참조하는 본문글번호
	userid    varchar2(50)   not null,	-- 댓글 작성자 아이디
	replytext varchar2(1000) not null,	-- 댓글 내용
	regdate   date default sysdate,	-- 댓글 작성일
	referencenum number default 0,            -- 그냥 댓글은 0, 대댓글은 대댓글을 이 달려있는 댓글의 replynum
	isdeleted number default 0 		-- 대댓글이 달린 댓글의 흔적을 남기기 위한
);

CREATE SEQUENCE h_reply_seq;

--예약
CREATE TABLE reservation
(
	reservation_num number primary key,	-- 예약번호
	username   varchar2(50) not null,	-- 아이디
	reservation_date date not null,	-- 예약날짜
	treatment_kind varchar(20) default '검진'	,	-- 진료종류
	reservation_time varchar(50), -- 예약시간
	userid varchar2(50) not null references members(userid)
);

CREATE SEQUENCE reservation_seq;