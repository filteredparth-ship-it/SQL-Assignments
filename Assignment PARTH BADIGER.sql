-- 30-10-2026
-- PARTH BADIGER
-- ASSIGNMENT 1 CREATE, INSERT, ALTER TABLE, DROP, sp_rename and SELECT
CREATE DATABASE Assignment_1;
USE Assignment_1;

CREATE TABLE StudentDetails(
   StudentID INT,
   StudentName VARCHAR(50),
   CourseName VARCHAR(50),
   Age INT,
   Fees FLOAT
);

ALTER TABLE StudentDetails
ADD Email VARCHAR(100);

ALTER TABLE StudentDetails
ADD JoinDate DATE

ALTER TABLE StudentDetails
ALTER COLUMN StudentName VARCHAR(80);

EXEC sp_rename 'StudentDetails.CourseName', 'Course', 'COLUMN';
 
ALTER TABLE StudentDetails
ADD PhoneNumber VARCHAR(15);

ALTER TABLE StudentDetails
DROP COLUMN Age;

SELECT * FROM StudentDetails;

INSERT INTO StudentDetails
VALUES (101, 'Steven' , 'Data Analytics', 52000.75, 'Steven.07@gmail.com', '2026-07-20', '7564879480'),
       (102, 'Phil' , 'Business analytics', 65000.25, 'Phil.08@yahoo.com', '2026-07-22', '3215648474'),
       (103, 'Bill' , 'Data Science' , 78000.00, 'Bill2.0@rediffmail.com', '2026-07-23', '9876543210'),
       (104, 'Karen', 'Agentic AI and GEN AI',60000.50,'Karen35@gmail.com','2026-07-20', '1234567890'),
       (105, 'David', 'Data Engineering', 100000.45, 'David10@gmail.com', '2026-07-22' , '4561237890');

SELECT * FROM StudentDetails;
