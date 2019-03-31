CREATE OR REPLACE FUNCTION securedSGRead(user_id VARCHAR, psg_id VARCHAR) 
RETURNS TABLE(
    r_sg_id VARCHAR,
    r_members TEXT[],
	r_create_p INT,
	r_read_p INT,
	r_update_p INT,
	r_delete_p INT,
	r_superficial_read_p INT
	

) AS $$


DECLARE 

	cur_priority INT;

BEGIN
	
	
	IF check_read_priority(user_id, psg_id) = TRUE THEN 
		RETURN QUERY SELECT *
			FROM
			SecurityGroup
			WHERE
			sg_id = psg_id;
	END IF;

	
	
END; $$
LANGUAGE 'plpgsql';
