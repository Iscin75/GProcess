CREATE OR REPLACE FUNCTION securedModelDuplicationByName(user_id VARCHAR, model_name VARCHAR) 
RETURNS BOOLEAN AS $$

DECLARE 

	targ_id VARCHAR;
	model_design VARCHAR;
    model_desc VARCHAR;
    model_sg TEXT[];
    model_type VARCHAR;

BEGIN
	SELECT target_id INTO targ_id FROM Model WHERE m_name = model_name ;

    IF check_read_priority(user_id, model_id) = TRUE THEN 
		SELECT designation INTO model_design FROM RealmObject WHERE ro_id = targ_id ;
        SELECT description INTO model_desc FROM RealmObject WHERE ro_id = targ_id ;
        SELECT security_groups INTO model_sg FROM RealmObject WHERE ro_id = targ_id ;
        SELECT type INTO model_type FROM RealmObject WHERE ro_id = targ_id ;

        INSERT INTO RealmObject(ro_id, designation, description, security_groups, type) VALUES
        (uuid_generate_v4 (), model_design,model_desc,model_sg,model_type);
	END IF;
	
	return TRUE;
	
END; $$
LANGUAGE 'plpgsql';
