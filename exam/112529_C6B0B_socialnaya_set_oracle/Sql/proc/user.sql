create or replace package
/**
       ����� ���������������� ��������
**/ 
User_Package is
        /* ================================================
               �������: 
        */
   --     CURSOR c1 RETURN PERSONPAGE_CONCURS%ROWTYPE;
               -- ������
        /* ================================================
               ���������:
        */               
        procedure print   (a_string varchar2 );
        procedure add_user (a_string_NICK varchar2, a_string_NAME varchar2, a_string_Surname varchar2 );
        procedure internal_add_user (a_string_NICK varchar2, a_string_NAME varchar2, a_string_Surname varchar2 );
end User_Package;


create or replace package body User_Package
is
cnt integer;
NICKNAME_fail exception;
NAME_fail exception;
SURNAME_fail exception;

/* ================================================
	   �������: 
*/

--         CURSOR c1 RETURN PERSONPAGE_CONCURS%ROWTYPE IS SELECT * FROM PERSONPAGE_CONCURS;
/* ================================================
	   ���������:
*/ 
procedure print   (a_string varchar2 ) as
  -- ������������ �������� ���������, ������� ������ ������� ���������� ����
  begin
			dbms_output.put_line(a_string);
			
			
			dbms_output.put_line(a_string);
  end;

procedure add_user (a_string_NICK varchar2, a_string_NAME varchar2, a_string_Surname varchar2 ) as
/* 
		  ��������� ������������-�����������. 
*/
  begin
		  internal_add_user (a_string_NICK, a_string_NAME, a_string_Surname );
	exception
	   when NICKNAME_fail then dbms_output.put_line('��������� ���');
	   when NAME_fail then dbms_output.put_line('��������� ���');
	   when SURNAME_fail  then dbms_output.put_line('��������� ������');
	   when OTHERS then dbms_output.put_line('������ -- �!'); rollback;
  end;
		   

procedure internal_add_user (a_string_NICK varchar2, a_string_NAME varchar2, a_string_Surname varchar2 ) as
/* 
		  ��������� ������������-�����������. �������������.
*/
  user_id integer;
  begin
		  cnt:= cnt + 1;
		  if (a_string_NICK is null) then
			 raise NICKNAME_fail;
		  end if;
		  if (a_string_NAME is null) then
			 raise NAME_fail;
		  end if;
		  if (a_string_Surname  is null) then
			 raise SURNAME_fail;
		  end if;
		  insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME_,Surname, ISMODERATOR, ISGUST)
				 values(cnt, a_string_NICK , a_string_NAME, a_string_Surname, 0, 0);
		  commit;                 
  end;
  
begin
  cnt:= 100;
  
end User_Package;


create or replace trigger CONCURS_T
after insert on CONCURS
for each row
begin
    dbms_output.put_line('������ ����� ������� ' || :new.CONCURS_NUMBER);
--     select max(con_.CONCURS_NUMBER) from CONCURS con_;
    
end;





/**
       ������ ������ ����� �������� �� ������� �������� � ������������� �������� �������.
**/
create or replace trigger PERSONPAGE_T
before insert on PERSONPAGE
for each row
/*
    ����������� ������� ��� ����� ���������� �������������
*/
declare
   NICKNAME_fail exception;
   NAME_fail exception;
   SURNAME_fail exception;
begin
  if (:new.NICKNAME is null) then
     dbms_output.put_line('������ ���');
     raise NICKNAME_fail;
  end if;
  
  if (:new.NAME_ is null) then
     dbms_output.put_line('������ ���');
     raise NAME_fail;
  end if;
  if (:new.SURNAME is null) then
     dbms_output.put_line('������ �������');
     raise SURNAME_fail;
  end if;
end;

/*

SQL> insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME_,Surname, ISMODERATOR, ISGUST) values(100001, '' , 'ivan', 'Pupkin', 0, 0);
������ ���
insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME_,Surname, ISMODERATOR, ISGUST) values(100001, '' , 'ivan', 'Pupkin', 0, 0)
            *
������ � ������ 1:
ORA-06510: PL/SQL: �������������� ����������, ������������ �������������
ORA-06512: ��  "W495.PERSONPAGE_T", line 8
ORA-04088: ������ �� ����� ���������� �������� 'W495.PERSONPAGE_T'


*/
