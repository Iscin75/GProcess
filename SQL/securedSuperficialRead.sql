CREATE OR REPLACE FUNCTION securedSuperficialRead(user_id VARCHAR, realm_id VARCHAR) 
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
 to_return jsonb;
 
BEGIN
	
	
	
	IF check_superficial_read_priority(user_id , realm_id) = TRUE THEN 
			RETURN QUERY SELECT *
			FROM
			RealmObject
			WHERE
			ro_id = realm_id;
	END IF;
			
	
	
END; $$

LANGUAGE 'plpgsql';