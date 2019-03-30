CREATE OR REPLACE FUNCTION securedDataReadByKey(user_id VARCHAR, realm_id VARCHAR, filter_key VARCHAR) 
RETURNS jsonb AS $$

DECLARE 

	used_datacore jsonb;
	data_id VARCHAR;
	to_return jsonb;

BEGIN
	SELECT data_core INTO used_datacore FROM RealmObject WHERE ro_id = realm_id ;
	/*
	JSON data_core A FORMATER AINSI :
	{
	 {filter_key:"data_id"};
	}
	*/
	data_id = used_datacore->>filter_key;
	
	to_return = securedDataReadByUID(user_id, data_id );
	
	return to_return;
	
END; $$
LANGUAGE 'plpgsql';
