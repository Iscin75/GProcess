CREATE OR REPLACE FUNCTION securedReadROInfos(user_id VARCHAR, curr_id VARCHAR) 
RETURNS TABLE(
    r_ro_id CHAR(100),
    r_designation CHAR(100),
    r_description CHAR(100),
    r_data_core jsonb,
    r_security_groups TEXT[],
    r_type CHAR(100),
    r_my_realm CHAR(100)
) AS $$

DECLARE 

	cur_priority INT;

BEGIN
	
	cur_priority = getReadPriority(user_id , curr_id ) ;
	
	CASE cur_priority
		WHEN 1 OR 3 THEN
	
			RETURN QUERY SELECT *
			FROM
			RealmObject
			WHERE
			ro_id = curr_id;
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
   