create table gBoard(
gNo NUMBER NOT NULL,
gTitle VARCHAR2(50) NOT NULL,
gDate DATE default sysdate,
gViews NUMBER DEFAULT 0,
gWriter varchar2(50) NOT NULL,
gContents VARCHAR2(1000) NOT NULL,
fno number, 
PRIMARY KEY(gNo));

create sequence gBoard_SEQ
START WITH 1
INCREMENT BY 1;

select * from gBoard;

insert into gBoard(gNo, gTitle, gContents, gWriter)
    values (gBoard_seq.nextval, '�꼼������', '�꼼������ ���� ������ ����ұ��???', 'gitte'); 

create table Members(
mId VARCHAR2(50) NOT NULL,
pw VARCHAR2(20) NOT NULL,
mName VARCHAR2(20),
birth VARCHAR2(50),
phone VARCHAR2(50),
addr VARCHAR2(200),
mail VARCHAR2(100),
p_Name VARCHAR2(20),
p_Kind VARCHAR2(20),
p_Age VARCHAR2(20),
PRIMARY KEY(mId)
);

commit;

select * from Members;

select gNo,
       gTitle,
       gContents,
       gWriter,
       gDate,
       gViews
from (
        select gNo,
                gTitle,
                gContents,
                gwriter,
                gDate,
                gViews,
                row_number() over(order by gNo desc) as RNum
            from gBoard
            )
where rNum between 1 and 10
order by gNo desc;

create table Gcomment(
gNo NUMBER not null,
gcNo NUMBER not null,
gcContents varchar2(1000) not null,
gcWriter varchar2(50) not null,
gcDate date default sysdate,
primary key(gNo, gcNo)
);


alter table gComment add constraint gComment_gNo foreign key(gNo)
references gBoard(gNo);

create sequence gComment_seq start with 1 MINVALUE 0;

commit;

insert into gComment(gNo, gcNo, gcContents, gcWriter)
    values(2, gComment_seq.nextval, '�Ƹ� 3��?', '�׽�Ƽ');
    
select * from members;

create table fileUp(
    fNo NUMBER,
    gNo NUMBER NOT NULL,
    orgName varchar2(260) NOT NULL,
    strName varchar2(100) NOT NULL,
    fSize NUMBER,
    fDate DATE default sysdate NOT NULL,
    fDel varchar2(1) default 'N' NOT NULL,
    PRIMARY KEY(fNo)
    );
commit;

create sequence seq_fileUp_NO START WITH 1
INCREMENT BY 1
NOMAXVALUE NOCACHE;

commit;

create table gBoard2(
gNo NUMBER NOT NULL,
gTitle VARCHAR2(50) NOT NULL,
gDate DATE default sysdate,
gViews NUMBER DEFAULT 0,
gWriter varchar2(50) NOT NULL,
gContents VARCHAR2(1000) NOT NULL,
fno number, 
PRIMARY KEY(gNo));

create sequence gBoard2_SEQ
START WITH 1
INCREMENT BY 1;

insert into gboard2(gno, gtitle, gdate, gviews, gwriter, gcontents)
values(gboard2_seq.nextval, '안녕하세요', sysdate, 1, 'js', 'ㅎㅇㅎㅇ');

commit;

create table Gcomment2(
gNo NUMBER not null,
gcNo NUMBER not null,
gcContents varchar2(1000) not null,
gcWriter varchar2(50) not null,
gcDate date default sysdate,
primary key(gNo, gcNo)
);

create sequence gComment2_seq start with 1 MINVALUE 0;

insert into gComment(gNo, gcNo, gcContents, gcWriter)
    values(1, gComment2_seq.nextval, '댓글테스트1', 'js');
    
commit;

