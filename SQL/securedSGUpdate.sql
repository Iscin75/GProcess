CREATE OR REPLACE FUNCTION securedSGCRUDUpdate(user_id VARCHAR, psg_id VARCHAR, colname VARCHAR, autorization INT) 
RETURNS BOOLEAN AS $$

DECLARE 

	cur_priority INT;


BEGIN
	
	cur_priority  = getUpdatePriority(user_id, psg_id);
	
	CASE cur_priority
		WHEN 1 THEN
			EXECUTE format('UPDATE securityGroup SET %1$I=%2$s WHERE sg_id=%3$L',colname, autorization,psg_id );
			
			 /*UPDATE securityGroup SET colname = autorization WHERE sg_id = psg_id;*/
		WHEN 2 THEN
			RAISE EXCEPTION 'Forbidden';
		WHEN  3 THEN
				EXECUTE format('UPDATE securityGroup SET %1$I=%2$s WHERE sg_id=%3$L',colname, autorization,psg_id );
			
		WHEN 4 THEN
			RAISE EXCEPTION 'None';
		WHEN 5 THEN
			RAISE EXCEPTION 'Undefined';
		WHEN 6 THEN
			RAISE EXCEPTION 'Unrelated';
	
	END CASE;
	
	RETURN TRUE;
END; $$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION securedSGMembersUpdate(user_id VARCHAR, psg_id VARCHAR,  members_id VARCHAR[]) 
RETURNS VOID AS $$

DECLARE 

	cur_members VARCHAR[20];
    cur_priority INT;

BEGIN
	
	
	IF check_update_priority(user_id , psg_id) = TRUE THEN 
			SELECT members INTO cur_members FROM securityGroup WHERE sg_id = psg_id;
			 UPDATE securityGroup SET members = array_cat(cur_members, members_id ) WHERE sg_id = psg_id;
	END IF;
	
	
	
END; $$
LANGUAGE 'plpgsql';
