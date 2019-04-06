CREATE OR REPLACE FUNCTION securedModelDuplicationByName(user_id VARCHAR, model_name VARCHAR, duplicated_model_name VARCHAR default '') 
RETURNS BOOLEAN AS $$

DECLARE 

    targ_id VARCHAR;
    mod_id VARCHAR;
    model_design VARCHAR;
    model_desc VARCHAR;
    model_sg TEXT[];
    model_type VARCHAR;
    duplicate_ro_id VARCHAR;
    duplicate_model_id VARCHAR;
    datac jsonb;


BEGIN
    SELECT target_id INTO targ_id FROM Model WHERE m_name = model_name ;
    SELECT m_id INTO mod_id FROM Model WHERE m_name = model_name ;
    duplicate_ro_id = uuid_generate_v4 ();
    
    IF check_read_priority(user_id, targ_id) = TRUE THEN 
        SELECT designation INTO model_design FROM RealmObject WHERE ro_id = targ_id ;
        SELECT description INTO model_desc FROM RealmObject WHERE ro_id = targ_id ;
        SELECT security_groups INTO model_sg FROM RealmObject WHERE ro_id = targ_id ;
        SELECT data_core INTO datac FROM RealmObject WHERE ro_id = targ_id ;
        SELECT type INTO model_type FROM RealmObject WHERE ro_id = targ_id ;

        INSERT INTO RealmObject(ro_id, designation, description, data_core,  security_groups, type) VALUES
        (duplicate_ro_id, model_design,model_desc, datac, model_sg,model_type);
    END IF;

    CASE model_type
		WHEN '7' THEN



			INSERT INTO SecurityGroup(sg_id, members, create_p, read_p, update_p, delete_p, superficial_read_p) VALUES
                (duplicate_ro_id, 
                (SELECT members FROM SecurityGroup WHERE sg_id = targ_id),
                (SELECT create_p FROM SecurityGroup WHERE sg_id = targ_id), 
                (SELECT read_p FROM SecurityGroup WHERE sg_id = targ_id), 
                (SELECT update_p FROM SecurityGroup WHERE sg_id = targ_id), 
                (SELECT delete_p FROM SecurityGroup WHERE sg_id = targ_id), 
                (SELECT superficial_read_p FROM SecurityGroup WHERE sg_id = targ_id)
             );
			return TRUE;

		WHEN '8' THEN

			INSERT INTO Data(data_id, datas, security_groups) VALUES
                (duplicate_ro_id, 
                (SELECT datas FROM Data WHERE data_id = targ_id),
                (SELECT security_groups FROM Data WHERE data_id = targ_id)
             );
			return TRUE;

        WHEN '9' THEN
            IF duplicated_model_name != '' THEN
                duplicate_model_id = uuid_generate_v4 ();

                INSERT INTO RealmObject(ro_id, designation, description, security_groups, type) VALUES
                    (duplicate_model_id, 
                    (SELECT designation FROM RealmObject WHERE ro_id = mod_id), 
                    (SELECT description FROM RealmObject WHERE ro_id = mod_id), 
                    (SELECT security_groups FROM RealmObject WHERE ro_id = mod_id), 
                    (SELECT type  FROM RealmObject WHERE ro_id = mod_id)
                    );

                INSERT INTO Model(m_id, m_name, target_id) VALUES
                    (duplicate_model_id, 
                    duplicated_model_name,
                    duplicate_ro_id

                );
                return TRUE;
            END IF;
        ELSE
            RETURN FALSE;
	
	
	END CASE;
    
    return FALSE;
    
END; $$
LANGUAGE 'plpgsql';
