CREATE OR REPLACE FUNCTION securedUserRead(user_id VARCHAR, dest_user_id VARCHAR) 
RETURNS TABLE(
    r_u_id CHAR(100),
    r_login CHAR(150),
	r_password CHAR(50),
	r_logged bool
	

) AS $$


DECLARE 

	cur_priority INT;

BEGIN

	IF check_priority(user_id , dest_user_id) = TRUE THEN 
					RETURN QUERY SELECT *
			FROM
			Users
			WHERE
			u_id = dest_user_id;
	END IF;

	
	
END; $$
LANGUAGE 'plpgsql';

