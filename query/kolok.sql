CREATE OR REPLACE FUNCTION
sale (num IN INT) RETURNS void AS $$
DECLARE

BEGIN
	UPDATE books
		SET cost = cost - num;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION
multiple_years (start_y int, end_y int) RETURNS int AS $$
DECLARE
a int := start_y;
z int := 1;
BEGIN
	<<my_label>>
	WHILE a < end_y LOOP
    z := z * a;
    a := a + 1;
	END LOOP my_label;
	RETURN z;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION
tole(letter character(1), numrow integer) RETURNS SETOF character(1) AS $$
DECLARE
	st integer;
	ed integer;
	cur integer;
BEGIN
	IF numrow > 0 THEN
		st := ascii(letter);
		ed := st + numrow - 1;
	ELSE
		ed := ascii(letter);
		st := ed + numrow + 1;
	END IF;
	
	FOR cur IN st..ed LOOP
		RETURN NEXT chr(cur);
	END LOOP;
END;
$$ LANGUAGE plpgsql;




