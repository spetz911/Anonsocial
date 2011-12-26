CREATE OR REPLACE VIEW board_view (p_id, b_id) AS
SELECT ab_msg.person_id, ab_board.id FROM ab_msg
JOIN ab_post ON ab_msg.id = ab_post.msg_ptr_id
JOIN ab_thread ON ab_post.thread_id = ab_thread.msg_ptr_id
JOIN ab_board ON ab_thread.board_id = ab_board.id;

CREATE OR REPLACE VIEW stat_view (count, p_id, b_id) AS
SELECT count(*) max_user, p_id, b_id FROM board_view AS v
	GROUP BY v.b_id, v.p_id;

CREATE OR REPLACE VIEW bid_view (id, max) AS
SELECT b_id, max(count) FROM stat_view
	GROUP BY b_id;

CREATE OR REPLACE VIEW res_view (b_id, p_id) AS
SELECT v.b_id, v.p_id from bid_view AS b JOIN stat_view AS v
	ON v.count = b.max
	AND b.id = v.b_id;

EXPLAIN SELECT b.title AS board_name, p.name AS max_poster FROM ab_board AS b
JOIN res_view AS v ON b.id = v.b_id
JOIN ab_person AS p ON p.id = v.p_id;

