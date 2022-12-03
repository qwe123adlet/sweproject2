DROP TABLE IF EXISTS specializationtype CASCADE;

CREATE TABLE specializationtype (
		id SERIAL UNIQUE,
		specializationid VARCHAR(100) UNIQUE,
		specialization VARCHAR(100),
		PRIMARY KEY(id, specializationid)
);	
INSERT INTO specializationtype VALUES(DEFAULT, 1, 'type1');
INSERT INTO specializationtype VALUES(DEFAULT, 2, 'type2');
INSERT INTO specializationtype VALUES(DEFAULT, 3, 'type3');
INSERT INTO specializationtype VALUES(DEFAULT, 4, 'type4');
INSERT INTO specializationtype VALUES(DEFAULT, 5, 'type5');
INSERT INTO specializationtype VALUES(DEFAULT, 6, 'type6');
INSERT INTO specializationtype VALUES(DEFAULT, 7, 'type7');
INSERT INTO specializationtype VALUES(DEFAULT, 8, 'type8');
INSERT INTO specializationtype VALUES(DEFAULT, 9, 'type9');
INSERT INTO specializationtype VALUES(DEFAULT, 10, 'type10');

DROP TABLE IF EXISTS employee CASCADE;

CREATE TABLE employee (
		id SERIAL PRIMARY KEY,
		empname VARCHAR(100),
        dateofbirth DATE,
        iin VARCHAR(12),
		contact INT,
        departmentid VARCHAR(100),
        specializationid VARCHAR(100),
		experience INT,
		photo VARCHAR(100),
		category VARCHAR(100),
		price INT,
		schedule VARCHAR(100),
		education VARCHAR(100),
		rating INT,
		address VARCHAR(100),
		FOREIGN KEY(specializationid) REFERENCES specializationtype(specializationid) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO specializationtype VALUES(DEFAULT, 'type1');

DROP TABLE IF EXISTS patient CASCADE;

CREATE TABLE patient (
		id SERIAL PRIMARY KEY,
		dateofbirth DATE,
		iin VARCHAR(100),
		fullname VARCHAR(100),
		bloodgroup VARCHAR(100),
		emergency_number VARCHAR(100),
		contact VARCHAR(100),
		address VARCHAR(100),
		marital VARCHAR(100),
		registration DATE
);	

DROP TABLE IF EXISTS appointment CASCADE;
CREATE TABLE appointment(
  id SERIAL PRIMARY KEY,
  fullname varchar(100),
  app_date date,
  specializationid varchar(100),
  empname varchar(100),
  contact varchar(100)
);