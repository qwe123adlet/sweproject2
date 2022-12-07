DROP TABLE IF EXISTS specializationtype CASCADE;

CREATE TABLE specializationtype (
		id SERIAL UNIQUE,
		specializationid VARCHAR(100) UNIQUE,
		specialization VARCHAR(100),
		PRIMARY KEY(id, specializationid)
);	
INSERT INTO specializationtype VALUES(DEFAULT, 1, 'eyes');
INSERT INTO specializationtype VALUES(DEFAULT, 2, 'dermatology');
INSERT INTO specializationtype VALUES(DEFAULT, 3, 'hirurg');
INSERT INTO specializationtype VALUES(DEFAULT, 4, 'dentist');
INSERT INTO specializationtype VALUES(DEFAULT, 5, 'allergy');
INSERT INTO specializationtype VALUES(DEFAULT, 6, 'anesthesiology');
INSERT INTO specializationtype VALUES(DEFAULT, 7, 'diagnostic radiology');
INSERT INTO specializationtype VALUES(DEFAULT, 8, 'emergency medicine');
INSERT INTO specializationtype VALUES(DEFAULT, 9, 'neurology');
INSERT INTO specializationtype VALUES(DEFAULT, 10, 'gynecology');

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
INSERT INTO employee VALUES(DEFAULT, 'adlet', '2002-12-21', '021221550621', '100', 'depid', '1', 'category', '500', 'photo', '09:00:00', '18:00:00', '200', 'bachelor', '10', 'address');
INSERT INTO employee VALUES(DEFAULT, 'aibek', '2001-10-31', '654321123456', '200', 'depid1', '1', 'category2', '5002', 'photo2', '09:00:00', '18:00:00', '300', 'master', '10', 'address2');
INSERT INTO employee VALUES(DEFAULT, 'arslan', '2000-10-10', '123123123123', '300', 'depid2', '2', 'category', '500', 'photo3', '09:00:00', '18:00:00', '400', 'phd', '10', 'address3');
INSERT INTO employee VALUES(DEFAULT, 'zhibek', '2002-10-10', '321321321321', '400', 'depid3', '2', 'category2', '5002', 'photo4', '09:00:00', '18:00:00', '700', 'bachelor', '10', 'address4');
INSERT INTO employee VALUES(DEFAULT, 'zhiger', '2000-12-12', '666666666666', '500', 'depid1', '3', 'category', '500', 'photo5', '09:00:00', '18:00:00', '500', 'master', '10', 'address5');
INSERT INTO employee VALUES(DEFAULT, 'saul', '1999-06-08', '777777777777', '600', 'depid2', '3', 'category2', '5002', 'photo6', '09:00:00', '18:00:00', '300', 'phd', '10', 'address6');
INSERT INTO employee VALUES(DEFAULT, 'pasha', '1996-10-03', '531412315555', '700', 'depid3', '3', 'category', '5002', 'photo7', '09:00:00', '18:00:00', '200', 'bachelor', '10', 'address7');
INSERT INTO employee VALUES(DEFAULT, 'mikhail', '1970-03-10', '754754754754', '800', 'depid1', '4', 'category2', '5002', 'photo8', '09:00:00', '18:00:00', '200', 'master', '10', 'address8');
INSERT INTO employee VALUES(DEFAULT, 'askar', '1960-10-10', '123232532525', '900', 'depid2', '5', 'category', '5002', 'photo9', '09:00:00', '18:00:00', '100', 'phd', '10', 'address9');
INSERT INTO employee VALUES(DEFAULT, 'ben', '1950-01-01', '345345456123', '1000', 'depid3', '6', 'category2', '5002', 'photo10', '09:00:00', '18:00:00', '100', 'phd', '10', 'address10');

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
INSERT INTO patient VALUES(DEFAULT, '1997-02-25', '712321959959', 'sergei', 'A', '7-666-555-33-22', 'contact1', 'address1', 'married', '2022-07-13');
INSERT INTO patient VALUES(DEFAULT, '1987-02-25', '712321959959', 'erjan', 'B', '7-636-523-33-22', 'contact2', 'address2', 'not married', '2022-07-22');
INSERT INTO patient VALUES(DEFAULT, '1977-02-25', '712321959959', 'kasym', 'C', '7-445-515-33-22', 'contact3', 'address3', 'married', '2022-07-15');
INSERT INTO patient VALUES(DEFAULT, '1977-02-25', '712321959959', 'aibek', 'D', '7-321-525-33-22', 'contact4', 'address4', 'not married', '2022-07-11');
INSERT INTO patient VALUES(DEFAULT, '2007-02-25', '712321959959', 'baknur', 'A', '7-123-575-33-22', 'contact5', 'address5', 'married', '2021-02-23');
	
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
		timedate VARCHAR(15),
		starttime VARCHAR(12),
		endtime varchar(12),
		PRIMARY KEY(id)
);	

INSERT INTO timeslots VALUES(DEFAULT, '2022-12-12', '10:00:00', '12:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-13', '09:00:00', '11:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-14', '14:00:00', '16:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-10-15', '15:00:00', '17:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-16', '14:30:00', '16:30:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-17', '14:45:00', '16:45:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-18', '16:00:00', '18:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-19', '13:00:00', '15:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-20', '10:00:00', '12:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-21', '10:00:00', '12:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-22', '09:00:00', '11:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-23', '14:00:00', '16:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-10-24', '15:00:00', '17:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-25', '14:30:00', '16:30:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-26', '14:45:00', '16:45:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-27', '16:00:00', '18:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-28', '13:00:00', '15:00:00');
INSERT INTO timeslots VALUES(DEFAULT, '2022-12-29', '10:00:00', '12:00:00');