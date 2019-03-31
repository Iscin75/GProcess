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
	
	
	
	IF check_read_priority(user_id , curr_id) = TRUE THEN 
			RETURN QUERY SELECT *
			FROM
			RealmObject
			WHERE
			ro_id = curr_id;
	END IF;
		

END; $$

LANGUAGE 'plpgsql';
   