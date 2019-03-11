CREATE TABLE Permissions(
	p_id INT PRIMARY KEY,
	name CHAR(100)
 );

CREATE TABLE RealmObjectType(
    rot_id CHAR(100) PRIMARY KEY,
    type_name CHAR(50) NOT NULL
);

CREATE TABLE RealmObject(
    ro_id CHAR(100) PRIMARY KEY,
	designation CHAR(100) NOT NULL,
    description CHAR(100) NOT NULL,
	data_core jsonb,
	security_groups TEXT[], 
	type CHAR(100) references RealmObjectType(rot_id)
);

CREATE TABLE Users(
    u_id CHAR(100) PRIMARY KEY references RealmObject(ro_id),
    login CHAR(50) NOT NULL UNIQUE,
    password CHAR(50) NOT NULL,
	logged boolean NOT NULL DEFAULT FALSE
);

CREATE TABLE Realm(
	r_id CHAR(100) PRIMARY KEY references RealmObject(ro_id),
	ip_port CHAR(100) NOT NULL,
	global_rules jsonb,
	root_process CHAR(100) references RealmObjectType(rot_id),
	root_user CHAR(100) references Users(u_id),
	unique_name CHAR(100) UNIQUE
);

ALTER TABLE RealmObject
	ADD COLUMN my_realm CHAR(100) references Realm(r_id),
	ADD COLUMN current_realm CHAR(100) references Realm(r_id);

CREATE TABLE Data(
	data_id  CHAR(100) PRIMARY KEY references RealmObject(ro_id),
	datas jsonb NOT NULL,
	security_groups TEXT[] 
);

CREATE TABLE SecurityGroup(
	sg_id  CHAR(100) PRIMARY KEY references RealmObject(ro_id),
	members TEXT[],
	create_p INT NOT NULL references Permissions(p_id),
	read_p INT NOT NULL references Permissions(p_id),
	update_p INT NOT NULL references Permissions(p_id),
	delete_p INT NOT NULL references Permissions(p_id),
	superficial_read_p INT NOT NULL references Permissions(p_id)
);

CREATE TABLE Model(
	m_id CHAR(100) PRIMARY KEY references RealmObject(ro_id),
	m_name CHAR(100) UNIQUE
);

INSERT INTO Permissions (p_id, name) VALUES
	(1,'Unrelated'),
	(2,'Undefined'),
	(3,'Forbidden'),
	(4,'None'),
	(5,'Authorized'),
	(6,'SuperAuthorized');
	
INSERT INTO RealmObjectType (rot_id, type_name)  VALUES
	('1','None'),
	('2','Realm'),
	('3','User'),
	('4','Process'),
	('5','Ressource'),
	('6','Problem'),
	('7','SecurityGroup'),
	('8','Data'),
	('9','Model'),
	('10','RealmObject');
	
INSERT INTO RealmObject(ro_id, designation, description, security_groups) VALUES
	('b7052c4f-4c6a-4464-a170-df67dfa337b7','protoRealm', 'Cest un Realm', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880']),
	('11312519-7704-4f6c-a039-d6cdcb7fa880','rootSecurityGroup', 'Cest un securityGroup', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880']), 
	('6f422ee4-9aa1-49a2-94b8-d1d0fc679900','rootUser', 'Cest un User', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880']),
	('03bbade3-ff5d-49bb-91b2-522e82b9b93d','rootData', 'Cest une data', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880']); 

INSERT INTO Users(u_id, login, password, logged) VALUES
	('6f422ee4-9aa1-49a2-94b8-d1d0fc679900','monUser','monPass',FALSE);
	
INSERT INTO SecurityGroup (sg_id, members, create_p, read_p, update_p, delete_p,superficial_read_p) VALUES
	('11312519-7704-4f6c-a039-d6cdcb7fa880', ARRAY['6f422ee4-9aa1-49a2-94b8-d1d0fc679900'],6,6,6,6,6);
	
INSERT INTO Realm (r_id, ip_port) VALUES
	('b7052c4f-4c6a-4464-a170-df67dfa337b7','176.179.71.10:80');
	
INSERT INTO data(data_id, datas, security_groups) VALUES
	('03bbade3-ff5d-49bb-91b2-522e82b9b93d', '{}', ARRAY['6f422ee4-9aa1-49a2-94b8-d1d0fc679900']);