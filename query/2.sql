CREATE OR REPLACE FUNCTION
tole(parent_id int, lvl int)
	RETURNS TABLE(id int, shift int, msg VARCHAR(20)) AS $$
DECLARE
	mviews RECORD;
	i int;
BEGIN
	FOR mviews IN SELECT books.id, lvl, books.name FROM books LOOP
		RETURN QUERY SELECT mviews.id, mviews.lvl, mviews.name;
		RETURN QUERY SELECT * FROM tole(mviews.id, lvl+1);
		
	END LOOP;


*/
	END IF;
END;
$$ LANGUAGE plpgsql;


--EXECUTE 'SELECT count(*) FROM mytable WHERE inserted_by = $1 AND inserted <= $2'
--   INTO c
--   USING checked_user, checked_date;

