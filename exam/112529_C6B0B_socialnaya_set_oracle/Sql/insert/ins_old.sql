 select TNAME from tab; 
 
/*
-- TNAME
------------------------------
CONCURS
PERSONCOMMENT
+ PERSONPAGE
PERSONPAGE_PERSONMESSAGE_OUT
+ PERSONPHOTO
+ PHOTO
+ SREET_USER
USERCOMMENT
*/

-- ������ ������ ������
 


    delete from  ARTICLE
    delete from  CONCURS
    delete from  PERSONCOMMENT
    delete from  PERSONMESSAGE
    delete from  PERSONPAGE
    delete from  PERSONPAGE_CONCURS
    delete from  PERSONPHOTO
    delete from  STREET_USER
    delete from  SREET_USER
    delete from  USERCOMMENT
    delete from  PERSONPAGE_PERSONMESSAGE_OUT


-- ���� :
-- =======================================================
    insert into SREET_USER(USER_NUMBER, NAME, NICKNAME, Surname) 
           values(0, '����', '��������', '�����');
-- =======================================================  	
    insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME, Surname, ISMODERATOR, ISGUST)
           values(0, 'w495', '�����', '�������', 1, 0);

    insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME, Surname, ISMODERATOR, ISGUST)
           values(1, 'unleo', '���', '�������', 0, 0);

    insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME, Surname, ISMODERATOR, ISGUST)
           values(2, 'kiss', '�������', '�������', 0, 1);
-- =======================================================



   insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
          values(1, '/home/site_media/img/person/swiborg1.png', 1);

   insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
          values(2, '/home/site_media/img/person/swiborg1.png', 2);


	/*
-- -- ������
insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
	values(1, '/home/site_media/img/person/swiborg1.png', 1);
insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
	values(2, '/home/site_media/img/person/swiborg2.png', 1);
insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
	values(3, '/home/site_media/img/person/swiborg3.png', 1);
insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
	values(4, '/home/site_media/img/person/swiborg4.png', 1);
	*/

/*
insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
       values(10, '/home/site_media/img/person/swiborg1.png', 2); 
insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
       values(20, '/home/site_media/img/person/swiborg2.png', 2);
insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
       values(30, '/home/site_media/img/person/swiborg3.png', 2);
insert into PERSONPHOTO(PHOTO_ID, FILENAME, Person_Number) 
       values(40, '/home/site_media/img/person/swiborg4.png', 2);


-- ������ :
-- -- � ����� :
insert into SREET_USER(USER_NUMBER, NAME, NICKNAME, Surname) 
       values(0, '����', '��������', '�����');

-- -- � ���������� :
insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME, Surname, ISMODERATOR, ISGUST)
       values(0, 'w495', '�����', '�������', 1, 0);

insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME, Surname, ISMODERATOR, ISGUST)
       values(0, 'unleo', '���', '�������', 0, 0);
	   
insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME, Surname, ISMODERATOR, ISGUST)
       values(1, 'kiss', '�������', '�������', 0, 1);
       
insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME, Surname, ISMODERATOR, ISGUST)
       values(1, 'kiss', '������', '��������', 0, 1);


*/
