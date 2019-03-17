CREATE OR REPLACE FUNCTION securedDataArrayUpdateByKey(user_id VARCHAR, realm_id VARCHAR, p_value VARCHAR,  filter_key VARCHAR) 
RETURNS VOID as $$

DECLARE 

 used_datacore jsonb;
 data_id VARCHAR;
 cur_priority INT;
 to_modify VARCHAR[20];

 
BEGIN

    
    SELECT data_core INTO used_datacore FROM RealmObject WHERE ro_id = realm_id ;
       
    SELECT	used_datacore -> filter_key INTO data_id  FROM used_datacore;
        
    SELECT securedDataArrayUpdateByUID(user_id, data_id, p_value);
    
END; $$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION securedDataJsonUpdateByKey(user_id VARCHAR, realm_id VARCHAR, p_value VARCHAR[], p_path VARCHAR[],  filter_key VARCHAR) 
RETURNS VOID as $$

DECLARE 

 used_datacore jsonb;
 data_id VARCHAR;
 cur_priority INT;
 dataset jsonb;
 current_node VARCHAR;

 
BEGIN

    SELECT data_core INTO used_datacore FROM RealmObject WHERE ro_id = realm_id ;
        
    SELECT	used_datacore -> filter_key INTO data_id  FROM used_datacore;

    SELECT securedDataJsonUpdateByUID(user_id, data_id, p_value, p_path);
	
END; $$

LANGUAGE 'plpgsql';