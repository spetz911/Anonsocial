CREATE OR REPLACE FUNCTION
thread_listing(msg_id int, lvl int)
	RETURNS TABLE(id int, shift int, msg text) AS $$
DECLARE
--	mviews RECORD;
	i int;
BEGIN
	FOR i IN SELECT ab_post.msg_ptr_id FROM ab_post WHERE ab_post.parent_id = msg_id LOOP
		RETURN QUERY SELECT i, lvl, ab_msg.message FROM ab_msg WHERE ab_msg.id = i;
		RETURN QUERY SELECT * FROM tole(i, lvl+1);
	END LOOP;

END;
$$ LANGUAGE plpgsql;


--EXECUTE 'SELECT count(*) FROM mytable WHERE inserted_by = $1 AND inserted <= $2'
--   INTO c
--   USING checked_user, checked_date;

