CREATE OR REPLACE FUNCTION securedDataReadByUID(user_id VARCHAR, curr_data_id VARCHAR) 
RETURNS jsonb AS $$

DECLARE 
	s_g VARCHAR[10];
	s_g_users VARCHAR[10];
	cur_user VARCHAR;
	cur_sg VARCHAR;
	is_ok BOOLEAN = FALSE;
	to_return jsonb;

BEGIN
	
	SELECT security_groups INTO s_g FROM data WHERE data_id = curr_data_id ;
	FOREACH cur_sg in ARRAY s_g
	LOOP
		SELECT members INTO s_g_users FROM SecurityGroup WHERE sg_id = cur_sg;
		FOREACH cur_user in ARRAY s_g_users
		LOOP
			IF user_id = cur_user THEN
				is_ok = TRUE;
				EXIT;
			END IF;
		END LOOP;
		IF is_ok = TRUE THEN
			EXIT;
		END IF;	
	END LOOP;
	
	IF is_ok THEN
		SELECT
		datas INTO to_return FROM data WHERE data_id = curr_data_id ;
		return to_return;
	END IF;
	
END; $$

LANGUAGE 'plpgsql';
   