# SQL Assignments & Database Engineering

[![GitHub Profile](https://img.shields.io/badge/GitHub-filteredparth--ship--it-181717?logo=github&logoColor=white)](https://github.com/filteredparth-ship-it)
[![SQL Dialect](https://img.shields.io/badge/RDBMS-Microsoft%20SQL%20Server%20%7C%20T--SQL-CC292B?logo=microsoftsqlserver&logoColor=white)](#-technologies--environment)
[![Author](https://img.shields.io/badge/Author-Parth%20Badiger-blue)](#-author--contact)
[![Program](https://img.shields.io/badge/Curriculum-CoachX%20Data%20Analytics-green)](#-assignments-overview)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Welcome to the **SQL Assignments & Database Engineering** repository by [Parth Badiger](https://github.com/filteredparth-ship-it). This repository contains structured database scripts, relational schema designs, Data Definition Language (DDL) transformations, integrity constraints, and Data Manipulation Language (DML) workflows developed during the CoachX Data Analytics curriculum.

---

## 📂 Repository Contents

```text
├── Assignment PARTH BADIGER.sql    # Assignment 1: DDL & DML Schema Operations
├── Assignment.sql                  # Assignment 2: Database Constraints & Referential Integrity
├── README.md                       # Comprehensive documentation & execution walkthrough
└── .gitignore                      # Database backup and temporary lockfile filters
```

---

## 📑 Assignment Modules

| # | Script File | Core Topics & SQL Concepts | Database & Entities |
| :-: | :--- | :--- | :--- |
| **01** | [`Assignment PARTH BADIGER.sql`](./Assignment%20PARTH%20BADIGER.sql) | `CREATE DATABASE`, `CREATE TABLE`, `ALTER TABLE ADD`, `ALTER TABLE ALTER COLUMN`, `sp_rename`, `ALTER TABLE DROP COLUMN`, `INSERT INTO`, `SELECT` | `Assignment_1`<br>• `StudentDetails` |
| **02** | [`Assignment.sql`](./Assignment.sql) | Table Constraints (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`), Constraint Violation Testing, Transaction Rollbacks, Conceptual Q&A | `Constraints_Assignment`<br>• `Doctor_info`<br>• `Appointment_Details` |

---

## 🔍 Module 1: DDL, Schema Evolution & Batch DML

### 🎯 Objective
Design a student management schema from scratch, dynamically evolve its structure through successive schema modification commands (modifying datatypes, renaming attributes, dropping obsolete columns, and adding constraints), and execute multi-row transactional inserts.

### 🛠️ Execution Pipeline & Query Flow

1. **Database Creation & Context Selection:**
   ```sql
   CREATE DATABASE Assignment_1;
   USE Assignment_1;
   ```

2. **Initial Schema Definition:**
   Creates the baseline `StudentDetails` entity table:
   ```sql
   CREATE TABLE StudentDetails(
      StudentID INT,
      StudentName VARCHAR(50),
      CourseName VARCHAR(50),
      Age INT,
      Fees FLOAT
   );
   ```

3. **Schema Evolution (DDL Operations):**
   - **Adding New Attributes:**
     ```sql
     ALTER TABLE StudentDetails ADD Email VARCHAR(100);
     ALTER TABLE StudentDetails ADD JoinDate DATE;
     ALTER TABLE StudentDetails ADD PhoneNumber VARCHAR(15);
     ```
   - **Modifying Column Width:**
     ```sql
     ALTER TABLE StudentDetails ALTER COLUMN StudentName VARCHAR(80);
     ```
   - **Renaming Column via System Stored Procedure:**
     ```sql
     EXEC sp_rename 'StudentDetails.CourseName', 'Course', 'COLUMN';
     ```
   - **Dropping Redundant Column:**
     ```sql
     ALTER TABLE StudentDetails DROP COLUMN Age;
     ```

4. **Batch Data Insertion (DML):**
   Ingests 5 real-world student records:
   ```sql
   INSERT INTO StudentDetails
   VALUES (101, 'Steven', 'Data Analytics', 52000.75, 'Steven.07@gmail.com', '2026-07-20', '7564879480'),
          (102, 'Phil', 'Business analytics', 65000.25, 'Phil.08@yahoo.com', '2026-07-22', '3215648474'),
          (103, 'Bill', 'Data Science', 78000.00, 'Bill2.0@rediffmail.com', '2026-07-23', '9876543210'),
          (104, 'Karen', 'Agentic AI and GEN AI', 60000.50, 'Karen35@gmail.com', '2026-07-20', '1234567890'),
          (105, 'David', 'Data Engineering', 100000.45, 'David10@gmail.com', '2026-07-22', '4561237890');
   ```

---

## 🔍 Module 2: Relational Integrity & Database Constraints

### 🎯 Objective
Construct an interconnected healthcare appointment system demonstrating the full suite of ANSI SQL constraints (`PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, `DEFAULT`, `NOT NULL`), test constraint boundary violations and automatic rollbacks, and provide conceptual frameworks for data integrity.

### 🏛️ Relational Data Model

```text
+-----------------------+               +----------------------------+
|      Doctor_info      |               |    Appointment_Details     |
+-----------------------+               +----------------------------+
| PK Doctor_Id          |<---+          | PK Appointment_ID          |
|    Doctor_name (NN)   |    |          |    patient_name (NN)       |
|    Email (UNIQUE)     |    |          |    Contact_number (UNIQUE) |
|    Experience (>= 0)  |    +---------[| FK Doctor_ID               |
|    City (DEF 'Mumbai')|               |    Age (CHECK 1..120)      |
+-----------------------+               |    Appointment_fee (DEF 500|
                                        +----------------------------+
```

### 🛡️ Schema Definition with Constraints

```sql
CREATE DATABASE Constraints_Assignment;
USE Constraints_Assignment;

-- Doctor Info (Parent Entity)
CREATE TABLE Doctor_info (
    Doctor_Id INT PRIMARY KEY,
    Doctor_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Experience INT CHECK(Experience >= 0),
    City VARCHAR(50) DEFAULT 'Mumbai'
);

-- Appointment Details (Child Entity with Foreign Key)
CREATE TABLE Appointment_Details (
    Appointment_ID INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    Contact_number VARCHAR(15) UNIQUE,
    Age INT CHECK (Age >= 1 AND Age <= 120),
    Appointment_fee DECIMAL(10,2) DEFAULT 500,
    Doctor_ID INT FOREIGN KEY REFERENCES Doctor_info(Doctor_Id)
);
```

### 🧪 Constraint Violation Test Suite & Edge Cases

| Test Case | Attempted SQL Query | Target Column & Constraint | Expected Engine Behavior & Result |
| :---: | :--- | :--- | :--- |
| **01** | `UPDATE Doctor_info SET Doctor_name = NULL WHERE Doctor_Id = 201;` | `Doctor_name` (`NOT NULL`) | ❌ **Rejected:** Cannot insert NULL into column requiring values. |
| **02** | `UPDATE Doctor_info SET Email = 'John02@gmail.com' WHERE Doctor_Id = 201;` | `Email` (`UNIQUE`) | ℹ️ **Processed / Validated:** Value belongs to record 201; updates targeting non-unique values are rejected. |
| **03** | `UPDATE Doctor_info SET Experience = -10 WHERE Doctor_Id = 201;` | `Experience` (`CHECK >= 0`) | ❌ **Rejected:** Negative values violate `CHECK(Experience >= 0)` constraint. |
| **04** | `INSERT INTO Doctor_info VALUES (206, 'Richard', 'rich07@gmail.com', 41, DEFAULT);` | `City` (`DEFAULT`) | ✅ **Success:** Inserts record with City defaulted to `'Mumbai'`. |
| **05** | `UPDATE Appointment_Details SET Appointment_ID = 101 WHERE patient_name = 'Sujata';` | `Appointment_ID` (`PRIMARY KEY`) | ❌ **Rejected:** Violates uniqueness of Primary Key (ID 101 already exists). |
| **06** | `UPDATE Appointment_Details SET Contact_number = 9876541230 WHERE patient_name = 'Sujata';` | `Contact_number` (`UNIQUE`) | ℹ️ **Processed:** Unique constraint verification. |
| **07** | `UPDATE Appointment_Details SET Age = 150 WHERE patient_name = 'Sujata';` | `Age` (`CHECK 1..120`) | ❌ **Rejected:** Age 150 exceeds boundary of `CHECK (Age >= 1 AND Age <= 120)`. |
| **08** | `INSERT INTO Appointment_Details VALUES (108, 'Rakesh', 9567548320, 33, DEFAULT, 202);` | `Appointment_fee` (`DEFAULT`) | ✅ **Success:** Auto-assigns default fee of `500.00` with valid Foreign Key `202`. |
| **09** | `INSERT INTO Appointment_Details VALUES (109, 'Sheela', 4578657980, 28, DEFAULT, 210);` | `Doctor_ID` (`FOREIGN KEY`) | ❌ **Rejected:** Referential Integrity failure: Doctor ID `210` does not exist in `Doctor_info`. |
| **10** | `INSERT INTO Appointment_Details VALUES (109, NULL, 6487654651, 54, 800, 204);` | `patient_name` (`NOT NULL`) | ❌ **Rejected:** Violates `NOT NULL` constraint on required patient name attribute. |

---

## 🧠 Database Architecture Concepts & Principles

1. **What are Constraints?**
   Constraints are schema-level rules enforced by the RDBMS engine. They restrict the types of data that can be inserted, updated, or stored, ensuring domain, entity, and referential integrity across the database lifecycle.
2. **PRIMARY KEY vs. UNIQUE:**
   - `PRIMARY KEY`: Uniquely identifies each record in a table. It strictly disallows `NULL` values and is limited to **exactly one** per table.
   - `UNIQUE`: Prevents duplicate entries in the specified attribute while permitting `NULL` values. Multiple unique constraints can exist on a single table.
3. **FOREIGN KEY & Referential Integrity:**
   A Foreign Key establishes a logical relationship between child and parent tables by pointing to the parent's `PRIMARY KEY` or `UNIQUE` key. Unlike Primary Keys, Foreign Keys **can accept multiple duplicate and NULL values**.
4. **NOT NULL vs. DEFAULT:**
   - `NOT NULL` mandates that an attribute must have an explicit value supplied upon insertion.
   - `DEFAULT` specifies a fallback value whenever an insert statement omits data for that column.
5. **CHECK Constraint Violations:**
   When a transactional command violates a `CHECK` constraint, the RDBMS terminates query execution, generates a descriptive constraint violation error, and automatically rolls back the transaction.

---

## 💻 Technologies & Environment

- **RDBMS Engine:** Microsoft SQL Server (T-SQL)
- **Supported IDEs / Clients:**
  - SQL Server Management Studio (SSMS)
  - Azure Data Studio
  - Visual Studio Code (with `MSSQL` Extension)
  - DBeaver / DataGrip

### How to Run Locally

1. Open your SQL client (e.g., SSMS or Azure Data Studio) and connect to your SQL Server instance.
2. To run Assignment 1 (DDL/DML): Execute [`Assignment PARTH BADIGER.sql`](./Assignment%20PARTH%20BADIGER.sql).
3. To run Assignment 2 (Constraints): Execute [`Assignment.sql`](./Assignment.sql).
4. Inspect the resulting databases and verify constraint behaviors:
   ```sql
   USE Constraints_Assignment;
   SELECT * FROM Doctor_info;
   SELECT * FROM Appointment_Details;
   ```

---

## 👤 Author & Contact

**Parth Badiger**
- **GitHub:** [@filteredparth-ship-it](https://github.com/filteredparth-ship-it)
- **Email:** Parthbadiger24@gmail.com
