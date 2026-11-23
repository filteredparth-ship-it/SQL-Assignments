CREATE DATABASE Constraints_Assignment;

USE Constraints_Assignment;

-- SECTION - 1

CREATE TABLE Doctor_info
(
Doctor_Id INT PRIMARY KEY,
Doctor_name VARCHAR(50) NOT NULL,
Email VARCHAR(100) UNIQUE,
Experience INT CHECK(Experience >= 0),
City VARCHAR(50) DEFAULT 'Mumbai',
);


-- SECTION - 2

CREATE TABLE Appointment_Details
(
Appointment_ID INT PRIMARY KEY,
patient_name VARCHAR(100) NOT NULL,
Contact_number VARCHAR(15) UNIQUE,
Age INT CHECK (Age>=1 AND Age <=120),
Appointment_fee DECIMAL(10,2) DEFAULT 500,
Doctor_ID INT FOREIGN KEY REFERENCES Doctor_info(Doctor_Id)
);

SELECT * FROM Doctor_info;

-- SECTION - 2 INSERT RECORDS 
-- 1) 3) --
INSERT INTO Doctor_info
VALUES (201, 'John', 'John02@gmail.com', 15, 'Bangalore'),
(202, 'Gabriel', 'Gabriel25@yahoo.com', 10, 'Delhi'),
(203, 'Jim', 'Jim@rediffmail.com', 23, DEFAULT),
(204, 'Dave', 'Dave09@gmail.com' , 35, 'Kolkata'),
(205, 'Phil', 'Phil67@yahoo.com', 8, DEFAULT);

EXEC sp_help Doctor_info;

SELECT * FROM Appointment_Details;

-- 2) 4) --
INSERT INTO Appointment_Details
VALUES (100, 'Sujata', 9876541230, 32, DEFAULT, 202),
(101, 'Abhijeet', 9132458649, 33, 1500, 201),
(102, 'Maryam', 9546123576, 40, DEFAULT, 205),
(103, 'Kabir', 9865742320, 22, 2000, 203),
(104, 'Vishal', 8754651220 , 30, 1000, 201),
(105, 'Arun', 4565752120 , 46, DEFAULT,204),
(106, 'Padma', 6756468421, 25,700 ,201),
(107, 'Sandeep', 7521871233 , 33,2000, 205);

EXEC sp_help Doctor_info;

EXEC sp_help appointment_details;

-- SECTION 3: Practical Questions 
-- 1)
UPDATE Doctor_info
SET Doctor_name = NULL
WHERE Doctor_Id = 201;

-- 2)
UPDATE Doctor_info
SET Email = 'John02@gmail.com'
WHERE Doctor_Id = 201;

-- 3)
UPDATE Doctor_info
SET Experience = -10
WHERE Doctor_Id = 201;

-- 4)
INSERT INTO Doctor_info
VALUES (206,'Richard','rich07@gmail.com', 41, DEFAULT);

-- 5)
UPDATE Appointment_Details
SET Appointment_ID = 101
WHERE patient_name = 'Sujata';

-- 6)
UPDATE Appointment_Details
SET Contact_number = 9876541230
WHERE patient_name = 'Sujata';

-- 7)
UPDATE Appointment_Details
SET Age = 150
WHERE patient_name = 'Sujata';

-- 8)
INSERT INTO Appointment_Details
VALUES (108, 'Rakesh', 9567548320, 33, DEFAULT, 202);

-- 9)
INSERT INTO Appointment_Details
VALUES(109, 'Sheela', 4578657980, 28, DEFAULT, 210);

-- 10)
INSERT INTO Appointment_Details
VALUES(109, NULL, 6487654651, 54, 800, 204);


-- SECTION 4: Conceptual Questions

-- 1) Constraints are rules defined at data column-level or table-level data, they limit the type of data 
--    can go into a table, which ultimately restricts what can be stored in a row.

-- 2) PRIMARY KEY uniquely identifies each row in a table, it cannot store null values
-- UNIQUE is used to restrict Duplicate values in the specified column. while allowing null values.

-- 3) Unlike a PRIMARY KEY (which is limited to just one per table), you can add as many UNIQUE constraints as you need

-- 4) PRIMARY KEY is restricted to be assigned to only one per table.

-- 5) FOREIGN KEY is used to join between tables and help reference from another table with either PRIMARY KEY or UNIQUE

-- 6) NOT NULL is used when you need to restrict null values in a particular table or column
--    DEFAULT is used to pre-assign a value to a table, which saves your time from inputting the data specifically for a column.

-- 7) When a CHECK condition is violated it will be revoked or rolled-back during the process and return an error

-- 8) Unlike PRIMARY KEY, a FOREIGN KEY can have multiple NULL values and DUPLICATE values