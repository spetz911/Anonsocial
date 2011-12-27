SELECT ab_msg.id, ab_msg.message FROM ab_post
JOIN ab_msg ON ab_post.msg_ptr_id = ab_msg.id
JOIN ab_thread ON ab_thread.msg_ptr_id = ab_post.thread_id
WHERE ab_thread.msg_ptr_id =
	(SELECT ab_thread.msg_ptr_id FROM ab_thread JOIN ab_msg
	 ON ab_msg.id = ab_thread.msg_ptr_id
	 WHERE ab_msg.subject = 'does mean')





--	ab_post.msg_ptr_id = ab_thread.msg_ptr_id
--	WHERE ab_msg.subject = 'does mean'
--	ORDER BY time;

