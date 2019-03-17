CREATE OR REPLACE FUNCTION securedSGCRUDUpdate(user_id VARCHAR, psg_id VARCHAR, colname VARCHAR, autorization INT) 
RETURNS VOID AS $$

DECLARE 

	cur_priority INT;


BEGIN
	
	cur_priority = cur_priority = getPriority(user_id, psg_id, 'update_p');
	
	CASE cur_priority
		WHEN 1 OR 3 THEN
	
			 UPDATE securityGroup SET colname = autorization WHERE sg_id = psg_id;
		WHEN 2 THEN
			RAISE EXCEPTION 'Forbidden';
		WHEN 4 THEN
			RAISE EXCEPTION 'None';
		WHEN 5 THEN
			RAISE EXCEPTION 'Undefined';
		WHEN 6 THEN
			RAISE EXCEPTION 'Unrelated';
	
	END CASE;
	
	
END; $$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION securedSGMembersUpdate(user_id VARCHAR, psg_id VARCHAR,  members_id VARCHAR[]) 
RETURNS VOID AS $$

DECLARE 

	cur_members VARCHAR[20];
    cur_priority INT;

BEGIN
	
	cur_priority = cur_priority = getPriority(user_id, psg_id, 'update_p');
	
	CASE cur_priority
		WHEN 1 OR 3 THEN
             SELECT members INTO cur_members FROM securityGroup WHERE sg_id = psg_id;
			 UPDATE securityGroup SET members = array_cat(cur_members, members_id ) WHERE sg_id = psg_id;
		WHEN 2 THEN
			RAISE EXCEPTION 'Forbidden';
		WHEN 4 THEN
			RAISE EXCEPTION 'None';
		WHEN 5 THEN
			RAISE EXCEPTION 'Undefined';
		WHEN 6 THEN
			RAISE EXCEPTION 'Unrelated';
	
	END CASE;
	
	
END; $$
LANGUAGE 'plpgsql';