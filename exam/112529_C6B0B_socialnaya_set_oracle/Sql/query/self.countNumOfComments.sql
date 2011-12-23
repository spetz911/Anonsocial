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

/*
  Опишем количество комментариев, оставленных журналистами (!)
  для каждой статьи

*/


select 
	article_.NAME_ as "Название статьи", 
	cc as "Комменты от пользователей" from ARTICLE article_, 
	( ------------------------------ 
    select 
		article_.number_of_article na, 
		count(comment_.number_of_comment) cc
		from
			PERSONCOMMENT comment_,		ARTICLE article_
		where 
			(comment_.CONCURS_NUMBER = -1 ) and 
      -- Заметим: что CONCURS_NUMBER = -1  -- исключение и его использование не желательно
			(article_.NUMBER_OF_ARTICLE != -1 ) and 
			(article_.number_of_article = comment_.number_of_article )
			
		Group by comment_.number_of_article, article_.number_of_article 
    ------------------------------
    )
	where na = article_.number_of_article

Название статьи
--------------------------------------------------------------------------------
Комменты от пользователей
-------------------------
Статья 1
                        2
