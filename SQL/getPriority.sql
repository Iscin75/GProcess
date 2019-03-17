CREATE OR REPLACE FUNCTION getPriority(user_id VARCHAR, dest_id VARCHAR, priority_type VARCHAR) 
RETURNS INT AS $$

DECLARE 
	
 sg_groups VARCHAR[10];
 cur_sg VARCHAR;
 cur_members VARCHAR[10];
 cur_member VARCHAR;
 cur_priority INT;
 priorities INT[10];
 
 
BEGIN
	
	SELECT security_groups INTO sg_groups FROM RealmObject WHERE ro_id = dest_id;
	
	FOREACH cur_sg in ARRAY sg_groups
	LOOP
		SELECT members INTO cur_members FROM SecurityGroup WHERE sg_id = cur_sg;
		FOREACH cur_member in ARRAY cur_members
		LOOP
			IF cur_member = user_id THEN
					SELECT priority INTO cur_priority FROM Permissions WHERE p_id = 
					(SELECT priority_type FROM SecurityGroup WHERE sg_id = cur_sg);
					SELECT array_append(priorities, cur_priority);
				END IF;	
		END LOOP;
		
	END LOOP;
	
	cur_priority = array_lower(priorities);
    
    RETURN cur_priority;

    END; $$

LANGUAGE 'plpgsql';