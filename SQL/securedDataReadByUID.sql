CREATE OR REPLACE FUNCTION securedDataReadByUID(user_id VARCHAR, curr_data_id VARCHAR) 
RETURNS jsonb AS $$

DECLARE 

 cur_priority INT;
 to_return jsonb;
 
BEGIN
	
	IF check_read_priority(user_id, curr_data_id) = TRUE THEN 
		SELECT datas INTO to_return FROM data WHERE data_id = curr_data_id ;
		return to_return;
	END IF;


	RETURN(cur_priority);
END; $$

LANGUAGE 'plpgsql';
