CREATE FUNCTION emp_stamp() RETURNS trigger AS $emp_stamp$
DECLARE
i integer;
BEGIN
IF NOT EXISTS (SELECT id FROM ab_msg WHERE id = NEW.msg_ptr_id) THEN
	INSERT INTO ab_msg (id) VALUES (NEW.msg_ptr_id);
END IF;

IF (TG_OP = 'UPDATE') OR (TG_OP = 'DELETE') THEN
	UPDATE ab_post SET parent_id = thread_id WHERE parent_id = NEW.msg_ptr_id;
END IF;

IF NEW.thread_id IS NULL THEN -- implicit always true
	RAISE EXCEPTION 'thread_id cannot be null';
END IF;

IF NEW.parent_id IS NULL THEN
	NEW.parent_id := NEW.thread_id;
END IF;

IF NOT NEW.parent_id = NEW.thread_id THEN
IF NOT NEW.thread_id = (SELECT thread_id FROM ab_post WHERE NEW.parent_id = msg_ptr_id) THEN
	NEW.parent_id := NEW.thread_id;
END IF;
END IF;

RETURN NEW;
END;
$emp_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER emp_stamp BEFORE INSERT OR UPDATE OR DELETE ON ab_post
    FOR EACH ROW EXECUTE PROCEDURE emp_stamp();

