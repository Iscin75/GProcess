CREATE OR REPLACE FUNCTION securedDataArrayUpdateByUID(user_id VARCHAR, curr_data_id VARCHAR, p_value VARCHAR) 
RETURNS VOID as $$

DECLARE 

 cur_priority INT;
 to_modify VARCHAR[20];

 
BEGIN

	IF check_update_priority(user_id , curr_data_id) = TRUE THEN 
			SELECT security_groups INTO to_modify FROM data WHERE data_id = curr_data_id ;
            UPDATE data SET security_groups = array_append(to_modify, p_value) WHERE data_id = curr_data_id;
	END IF;
	
END; $$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION securedDataJsonUpdateByUID(user_id VARCHAR, curr_data_id VARCHAR, p_value VARCHAR[], p_path VARCHAR) 
RETURNS VOID as $$

DECLARE 

 cur_priority INT;
 dataset jsonb;

BEGIN


IF check_update_priority(user_id , curr_data_id) = TRUE THEN 
			UPDATE data SET datas = jsonb_set(datas, '{' + p_path + '}', p_value::jsonb);
	END IF;
END; $$

LANGUAGE 'plpgsql';