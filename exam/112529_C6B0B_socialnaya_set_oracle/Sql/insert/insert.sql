-- 14:26 17.11.2009 

/*
# * Copyright (c) w495, 2009 
# *
# * All rights reserved.
# *
# * Redistribution and use in source and binary forms, with or without
# * modification, are permitted provided that the following conditions are met:
# *     * Redistributions of source code must retain the above copyright
# *       notice, this list of conditions and the following disclaimer.
# *     * Redistributions in binary form must reproduce the above copyright
# *       notice, this list of conditions and the following disclaimer in the
# *       documentation and/or other materials provided with the distribution.
# *     * Neither the name of the w495 nor the
# *       names of its contributors may be used to endorse or promote products
# *       derived from this software without specific prior written permission.
# *
# * THIS SOFTWARE IS PROVIDED BY w495 ''AS IS'' AND ANY
# * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# * DISCLAIMED. IN NO EVENT SHALL w495 BE LIABLE FOR ANY
# * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

-- УДАЛИМ СТАРЫЕ ЗАПИСИ

    delete from  USERCOMMENT;
    delete from  STREET_USER;
    
    delete from  PERSONPHOTO_1;
    delete from  PERSONMESSAGE;
    
    delete from  PERSONCOMMENT;
    delete from  ARTICLE;
    
    delete from  PERSONPAGE_CONCURS;
    delete from  PERSONPAGE;
    delete from  CONCURS;


call User_Package.add_user('vasp', 'Василий', 'Пупкин');


  
-- =====================================================  	
	-- PERSONPAGE:

  	insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME_, Surname, ISMODERATOR, ISGUST)
			   values(0, 'w495', 'Илюха', 'Никитин', 1, 0);

		insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME_, Surname, ISMODERATOR, ISGUST)
			   values(1, 'unleo', 'Аня', 'Леонова', 0, 0);

		insert into PERSONPAGE(PERSON_NUMBER, NICKNAME, NAME_, Surname, ISMODERATOR, ISGUST)
			   values(2, 'kiss', 'Алексей', 'Киселев', 0, 1);


-- =======================================================
   -- Картиники:
       insert into PERSONPHOTO_1( PHOTO_ID, PERSON_NUMBER, Filename) 
              values(0, 2, '/home/site_media/img/person/swiborg10.png');
       insert into PERSONPHOTO_1( PHOTO_ID, PERSON_NUMBER, Filename) 
              values(1, 1, '/home/site_media/img/person/swiborg11.png');
       insert into PERSONPHOTO_1( PHOTO_ID, PERSON_NUMBER, Filename) 
              values(2, 0, '/home/site_media/img/person/swiborg12.png');

-- Статьи
-- =======================================================
	insert into ARTICLE( NUMBER_OF_ARTICLE, DATE_, PERSON_NUMBER, TEXT, SECURE)
    			   values(-1, to_date('0001/01/01:01:01:01AM', 'yyyy/mm/dd:hh:mi:ssam'), 1, 'это текст статьи -1', 0 );             

		insert into ARTICLE( NAME_ ,NUMBER_OF_ARTICLE, DATE_, PERSON_NUMBER, TEXT, SECURE)
    			   values('Статья 0',0, to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'), 1, 'это текст статьи 1', 0 );             


		insert into ARTICLE(NAME_ , NUMBER_OF_ARTICLE, DATE_, PERSON_NUMBER, TEXT, SECURE)
    			   values('Статья 2',  2, to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'), 0, 'для самокоммента', 0 );             


		insert into ARTICLE(NAME_ , NUMBER_OF_ARTICLE, DATE_, PERSON_NUMBER, TEXT, SECURE)
    			   values('Статья 1',1, to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'), 1, 'это текст статьи 2', 1 );             


-- Личный сообщения
-- =======================================================
		insert into PERSONMESSAGE(NUMBER_OF_MESS, PERSON_NUMBER, TEXT, FROMTO, DATE_)
    			   values(0, 0, 'у нас есть Алексей', 1,  to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam') );             

		insert into PERSONMESSAGE(NUMBER_OF_MESS, PERSON_NUMBER, TEXT, FROMTO, DATE_)
    			   values(1, 1, 'Алексей!', 1,  to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam') );             

-- Конкурс
-- =======================================================
   insert into CONCURS( CONCURS_NUMBER, TEXT, NAME_, SUBJ)
          values(-1, 'Empty', 'Empty', 'Empty');

   insert into CONCURS(CONCURS_NUMBER, TEXT, NAME_, SUBJ)
          values(1, 'это текст конкурса', 'это имя конкурса', 'это тема конкурса');

   insert into CONCURS(CONCURS_NUMBER, TEXT, NAME_, SUBJ) values(2, 'аааааааааа!!!!', 'Допиши сайт', 'кто допишет наконец этот долбанный сайт');


-- =======================================================
-- Участие:

   insert into PERSONPAGE_CONCURS( PERSON_NUMBER, CONCURS_NUMBER) values(0, 2);
   insert into PERSONPAGE_CONCURS( PERSON_NUMBER, CONCURS_NUMBER) values(0, -1);
   insert into PERSONPAGE_CONCURS( PERSON_NUMBER, CONCURS_NUMBER) values(1, 1);

-- Комментарии
-- =======================================================

   insert into PERSONCOMMENT( NUMBER_OF_COMMENT, PERSON_NUMBER, NUMBER_OF_ARTICLE, CONCURS_NUMBER, TEXT)
      values(10, 0, 1, -1, 'текст самокоммента для статьи');

   insert into PERSONCOMMENT( NUMBER_OF_COMMENT, PERSON_NUMBER, NUMBER_OF_ARTICLE, CONCURS_NUMBER, TEXT)
      values(0, 0, 1, -1, 'текст комментария для статьи -- самокоммента');
      
   insert into PERSONCOMMENT( NUMBER_OF_COMMENT, PERSON_NUMBER, NUMBER_OF_ARTICLE, CONCURS_NUMBER, TEXT)
      values(1, 0, -1, 1, 'текст комментария для конкурса');
      

-- ЛЮДИ :
-- =======================================================
	-- STREET_USER:
		insert into STREET_USER(USER_NUMBER, NAME_, NICKNAME, Surname) 
			   values(0, 'Иван', 'Странник', 'Факов');
-- =======================================================
	-- USERCOMMENT:
		insert into USERCOMMENT( USER_COMMENT_NUMBER, USER_NUMBER, NUMBER_OF_ARTICLE, CONCURS_NUMBER, TEXT)
    			   values(0, 0, 1, -1, 'комментарий юзера к статье');
    
		insert into USERCOMMENT( USER_COMMENT_NUMBER, USER_NUMBER, NUMBER_OF_ARTICLE, CONCURS_NUMBER, TEXT)
    			   values(1, 0, -1, 1, 'комментарий юзера к конкурсу');
            

commit;
