CREATE OR REPLACE FUNCTION securedDataReadByUID(user_id VARCHAR, curr_data_id VARCHAR) 
RETURNS jsonb AS $$

DECLARE 

 cur_priority INT;
 to_return jsonb;
 
BEGIN
	
	cur_priority = getPriority(user_id, curr_data_id, 'read_p');
	
	CASE cur_priority
		WHEN 1 OR 3 THEN
			SELECT datas INTO to_return FROM data WHERE data_id = curr_data_id ;
			return to_return;
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
   