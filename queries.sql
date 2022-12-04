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
		category VARCHAR(100),
        experience INT,
        photo VARCHAR(100),
        schedulestart TIME,
        scheduleend TIME,
        price INT,
        education VARCHAR(100),
        rating INT,
        address VARCHAR(100),
        FOREIGN KEY(specializationid) REFERENCES specializationtype(specializationid) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO employee VALUES(DEFAULT, 'name', '2000-10-10', 'iin', '100', 'depid', '1', 'category', '500', 'photo', '09:00:00', '18:00:00', '22', 'education', '10', 'address');
INSERT INTO employee VALUES(DEFAULT, 'name2', '2001-10-10', 'iin2', '200', 'depid2', '1', 'category2', '5002', 'photo2', '09:00:00', '18:00:00', '222', 'education2', '102', 'address2');
INSERT INTO employee VALUES(DEFAULT, 'nameeee', '2000-10-10', 'iin', '100', 'depid', '2', 'category', '500', 'photo', '09:00:00', '18:00:00', '22', 'education', '10', 'address');
INSERT INTO employee VALUES(DEFAULT, 'adlet', '2001-10-10', 'iin2', '200', 'depid2', '2', 'category2', '5002', 'photo2', '09:00:00', '18:00:00', '222', 'education2', '102', 'address2');
INSERT INTO employee VALUES(DEFAULT, 'aibek', '2000-10-10', 'iin', '100', 'depid', '3', 'category', '500', 'photo', '09:00:00', '18:00:00', '22', 'education', '10', 'address');
INSERT INTO employee VALUES(DEFAULT, 'arslan', '2001-10-10', 'iin2', '200', 'depid2', '3', 'category2', '5002', 'photo2', '09:00:00', '18:00:00', '222', 'education2', '102', 'address2');

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
  id SERIAL primary key,
  fullname varchar(100),
  app_date date,
  specializationid varchar(100),
  empname varchar(100),
  contact varchar(100),
  app_start time,
  app_end time
);

DROP TABLE IF EXISTS timeslots CASCADE;

CREATE TABLE timeslots (
		id SERIAL UNIQUE,
		starttime VARCHAR(12),
		endtime varchar(12),
		PRIMARY KEY(id)
);	

INSERT INTO timeslots VALUES(DEFAULT, '09:00:00', '10:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '10:00:00', '11:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '11:00:00', '12:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '12:00:00', '13:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '14:00:00', '15:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '15:00:00', '16:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '16:00:00', '17:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '17:00:00', '18:00:00');