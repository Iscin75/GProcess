CREATE OR REPLACE FUNCTION securedSGRead(user_id VARCHAR, psg_id VARCHAR) 
RETURNS TABLE(
    r_sg_id CHAR(100),
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
	
	cur_priority  = getReadPriority(user_id, psg_id);
	
	CASE cur_priority
		WHEN 1 OR 3 THEN
	
			RETURN QUERY SELECT *
			FROM
			SecurityGroup
			WHERE
			sg_id = psg_id;
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
