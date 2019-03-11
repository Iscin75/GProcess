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
	security_infos VARCHAR[10];
	security_members_infos VARCHAR[10];
	current_sg_id VARCHAR;
	current_user_id VARCHAR;
	is_ok BOOLEAN = FALSE;
	read_level INT = 0;
	
BEGIN
	SELECT security_groups INTO security_infos FROM RealmObject WHERE ro_id = curr_id;

	FOREACH current_sg_id IN ARRAY security_infos
		LOOP
			is_ok = false;
			SELECT SecurityGroup.read_p INTO read_level FROM SecurityGroup WHERE sg_id = current_sg_id;
			IF read_level = 5 OR read_level = 6 THEN
				SELECT members INTO security_members_infos FROM SecurityGroup WHERE sg_id = current_sg_id;
				FOREACH current_user_id IN ARRAY security_members_infos
					LOOP
						IF user_id = current_user_id THEN
							is_ok = TRUE;
							EXIT;
						END IF;
					END LOOP;
				IF is_ok = TRUE THEN
					EXIT;
				END IF;		
			END IF;
		END LOOP;
		
		IF is_ok THEN
			RETURN QUERY SELECT
			ro_id,
			designation,
			description,
			data_core,
			security_groups,
			type,
			current_realm
			FROM
			RealmObject
			WHERE
			ro_id = curr_id;
		END IF;

END; $$

LANGUAGE 'plpgsql';
   