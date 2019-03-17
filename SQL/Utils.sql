CREATE OR REPLACE FUNCTION getReadPriority(user_id VARCHAR, dest_id VARCHAR) 
RETURNS INT AS $$

DECLARE 
	
 sg_groups VARCHAR[10];
 cur_sg VARCHAR;
 cur_members VARCHAR[10];
 cur_member VARCHAR;
 cur_priority INT;
 priorities INT[10];
 cur_used_cruds INT;
 
 
BEGIN
	
	SELECT security_groups INTO sg_groups FROM RealmObject WHERE ro_id = dest_id;
	
	FOREACH cur_sg in ARRAY sg_groups
	LOOP
		SELECT members INTO cur_members FROM SecurityGroup WHERE sg_id = cur_sg;
		FOREACH cur_member in ARRAY cur_members
		LOOP
			IF cur_member = user_id THEN
			SELECT priority INTO cur_priority FROM Permissions WHERE p_id = 
					(SELECT read_p FROM SecurityGroup WHERE sg_id = cur_sg);
					SELECT array_append(priorities, cur_priority);
					
					SELECT array_append(priorities, cur_priority);
				END IF;	
		END LOOP;
		
	END LOOP;
	
	cur_priority = array_lower(priorities);
    
    RETURN cur_priority;

    END; $$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION getUpdatePriority(user_id VARCHAR, dest_id VARCHAR) 
RETURNS INT AS $$

DECLARE 
	
 sg_groups VARCHAR[10];
 cur_sg VARCHAR;
 cur_members VARCHAR[10];
 cur_member VARCHAR;
 cur_priority INT;
 priorities INT[10];
 cur_used_cruds INT;
 
 
BEGIN
	
	SELECT security_groups INTO sg_groups FROM RealmObject WHERE ro_id = dest_id;
	
	FOREACH cur_sg in ARRAY sg_groups
	LOOP
		SELECT members INTO cur_members FROM SecurityGroup WHERE sg_id = cur_sg;
		FOREACH cur_member in ARRAY cur_members
		LOOP
			IF cur_member = user_id THEN
			SELECT priority INTO cur_priority FROM Permissions WHERE p_id = 
					(SELECT update_p FROM SecurityGroup WHERE sg_id = cur_sg);
					SELECT array_append(priorities, cur_priority);
					
					SELECT array_append(priorities, cur_priority);
				END IF;	
		END LOOP;
		
	END LOOP;
	
	cur_priority = array_lower(priorities);
    
    RETURN cur_priority;

    END; $$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION getSuperficialPriority(user_id VARCHAR, dest_id VARCHAR) 
RETURNS INT AS $$

DECLARE 
	
 sg_groups VARCHAR[10];
 cur_sg VARCHAR;
 cur_members VARCHAR[10];
 cur_member VARCHAR;
 cur_priority INT;
 priorities INT[10];
 cur_used_cruds INT;
 
 
BEGIN
	
	SELECT security_groups INTO sg_groups FROM RealmObject WHERE ro_id = dest_id;
	
	FOREACH cur_sg in ARRAY sg_groups
	LOOP
		SELECT members INTO cur_members FROM SecurityGroup WHERE sg_id = cur_sg;
		FOREACH cur_member in ARRAY cur_members
		LOOP
			IF cur_member = user_id THEN
			SELECT priority INTO cur_priority FROM Permissions WHERE p_id = 
					(SELECT superficial_read_p FROM SecurityGroup WHERE sg_id = cur_sg);
					SELECT array_append(priorities, cur_priority);
					
					SELECT array_append(priorities, cur_priority);
				END IF;	
		END LOOP;
		
	END LOOP;
	
	cur_priority = array_lower(priorities);
    
    RETURN cur_priority;

    END; $$
LANGUAGE 'plpgsql';

CREATE  OR REPLACE FUNCTION key_exists(some_json json, outer_key text)
RETURNS boolean AS $$
BEGIN
    RETURN (some_json->outer_key) IS NOT NULL;
END; $$ 

LANGUAGE 'plpgsql';