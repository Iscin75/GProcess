CREATE TABLE Permissions(
	p_id INT PRIMARY KEY,
	name VARCHAR,
	priority INT
 );

CREATE TABLE RealmObjectType(
    rot_id VARCHAR PRIMARY KEY,
    type_name VARCHAR NOT NULL
);

CREATE TABLE RealmObject(
    ro_id VARCHAR PRIMARY KEY,
	designation VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
	data_core jsonb,
	security_groups TEXT[], 
	type VARCHAR references RealmObjectType(rot_id)
);

CREATE TABLE Users(
    u_id VARCHAR PRIMARY KEY references RealmObject(ro_id),
    login VARCHAR NOT NULL UNIQUE,
    password VARCHAR NOT NULL,
	logged boolean NOT NULL DEFAULT FALSE
);

CREATE TABLE Realm(
	r_id VARCHAR PRIMARY KEY references RealmObject(ro_id),
	ip_port VARCHAR NOT NULL,
	global_rules jsonb,
	root_process VARCHAR references RealmObjectType(rot_id),
	root_user VARCHAR references Users(u_id),
	unique_name VARCHAR UNIQUE
);

ALTER TABLE RealmObject
	ADD COLUMN my_realm VARCHAR references Realm(r_id),
	ADD COLUMN current_realm VARCHAR references Realm(r_id);

CREATE TABLE Data(
	data_id  VARCHAR PRIMARY KEY references RealmObject(ro_id),
	datas jsonb NOT NULL,
	security_groups TEXT[] 
);

CREATE TABLE SecurityGroup(
	sg_id  VARCHAR PRIMARY KEY references RealmObject(ro_id),
	members TEXT[],
	create_p INT NOT NULL references Permissions(p_id),
	read_p INT NOT NULL references Permissions(p_id),
	update_p INT NOT NULL references Permissions(p_id),
	delete_p INT NOT NULL references Permissions(p_id),
	superficial_read_p INT NOT NULL references Permissions(p_id)
);

CREATE TABLE Model(
	m_id VARCHAR PRIMARY KEY references RealmObject(ro_id),
	m_name VARCHAR UNIQUE
);

INSERT INTO Permissions (p_id, name, priority) VALUES
	(1,'Unrelated',6),
	(2,'Undefined',5),
	(3,'Forbidden',2),
	(4,'None',4),
	(5,'Authorized',3),
	(6,'SuperAuthorized',1);
	
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
	
INSERT INTO RealmObject(ro_id, designation, description, security_groups, type) VALUES
	('b7052c4f-4c6a-4464-a170-df67dfa337b7','protoRealm', 'Cest un Realm', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880'],'2'),
	('11312519-7704-4f6c-a039-d6cdcb7fa880','rootSecurityGroup', 'Cest un securityGroup', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880'],'7'), 
	('6f422ee4-9aa1-49a2-94b8-d1d0fc679900','rootUser', 'Cest un User', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880'],'3'),
	('d34fab0e-f5fc-4545-8eeb-cac3cd5cbe2a','basicRO', 'basicRO', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880'],'10'),
	('fff73e34-91af-4ed8-a79a-437bbcbed447','modelBasicRO', 'modelBasicRO', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880'],'9'),
	('03bbade3-ff5d-49bb-91b2-522e82b9b93d','rootData', 'Cest une data', ARRAY['11312519-7704-4f6c-a039-d6cdcb7fa880'],'8'); 

INSERT INTO Model(m_id, m_name) VALUES
	('fff73e34-91af-4ed8-a79a-437bbcbed447','basicRO');

INSERT INTO Users(u_id, login, password, logged) VALUES
	('6f422ee4-9aa1-49a2-94b8-d1d0fc679900','rootUser','monPass',FALSE),
	('d34fab0e-f5fc-4545-8eeb-cac3cd5cbe2a','monUser','monPass',FALSE);
	
INSERT INTO SecurityGroup (sg_id, members, create_p, read_p, update_p, delete_p,superficial_read_p) VALUES
	('11312519-7704-4f6c-a039-d6cdcb7fa880', ARRAY['6f422ee4-9aa1-49a2-94b8-d1d0fc679900','d34fab0e-f5fc-4545-8eeb-cac3cd5cbe2a'],6,6,6,6,6);
	
INSERT INTO Realm (r_id, ip_port) VALUES
	('b7052c4f-4c6a-4464-a170-df67dfa337b7','176.179.71.10:80');
	
INSERT INTO data(data_id, datas, security_groups) VALUES
	('03bbade3-ff5d-49bb-91b2-522e82b9b93d', '{}', ARRAY['6f422ee4-9aa1-49a2-94b8-d1d0fc679900']);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";