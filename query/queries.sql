CREATE VIEW Usr AS SELECT users.id FROM users WHERE (users.name = 'Pupkin');

-- 1) Сколько дисков было списано с указанного времени до сейчас.
SELECT COUNT(Debits.id_cd) FROM Debits WHERE debits.date between CTOD('05/10/11') AND DATE()

-- 2) Выдать диски, которые чаще всего берет указанный пользователь
SELECT d.title FROM usages AS u JOIN discs AS d
	ON (d.id = u.discs_id_pkey)
	WHERE u.users_id_pkey = Usr
	GROUP BY d.id
	ORDER BY COUNT(d.id)
	LIMIT 1;

-- JOIN is same ','
--XXX maybe other order

/*
SELECT d.title FROM discs AS d JOIN users AS u
	ON (b.author_id = a.discs_id_pkey)
	AND (a.name = 'Mark Lutz');
*/



-- 3) Сколько дисков было выдано всего для указанного пользователя
SELECT COUNT(DISTINCT discs_id_pkey) FROM usages
	WHERE users_id_pkey = 
		(SELECT users.id FROM users WHERE (users.name = 'Durov'))
--XXX without DISTINCT will count same discs


-- 4) Сколько дисков пришлось списать, которые использовал данный пользователь
SELECT COUNT(u.discs_id_pkey) FROM discs AS d JOIN usages AS u
	ON (d.id = u.discs_id_pkey)
	WHERE u.users_id_pkey = (SELECT users.id FROM users WHERE (users.name = 'Pupkin'));
--TODO change discs to debits



-- 5) Какие диски никогда не использовал данный пользователь.
SELECT DISTINCT d.title FROM discs AS d JOIN usages AS u
	ON (d.id = u.discs_id_pkey)
	WHERE u.users_id_pkey != (SELECT users.id FROM users WHERE (users.name = 'Pupkin'));

