# SQL Assignments & Database Engineering

[![GitHub Profile](https://img.shields.io/badge/GitHub-filteredparth--ship--it-181717?logo=github&logoColor=white)](https://github.com/filteredparth-ship-it)
[![SQL Dialect](https://img.shields.io/badge/RDBMS-Microsoft%20SQL%20Server%20%7C%20T--SQL-CC292B?logo=microsoftsqlserver&logoColor=white)](#-technologies--environment)
[![Author](https://img.shields.io/badge/Author-Parth%20Badiger-blue)](#-author--contact)
[![Program](https://img.shields.io/badge/Curriculum-CoachX%20Data%20Analytics-green)](#-assignments-overview)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Welcome to the **SQL Assignments & Database Engineering** repository by [Parth Badiger](https://github.com/filteredparth-ship-it). This repository contains structured database scripts, relational schema designs, Data Definition Language (DDL) transformations, and Data Manipulation Language (DML) workflows developed during the CoachX Data Analytics curriculum.

---

## 📂 Repository Contents

```text
├── Assignment PARTH BADIGER.sql    # Assignment 1: DDL & DML Schema Operations
├── README.md                       # Comprehensive documentation & execution walkthrough
└── .gitignore                      # Database backup and temporary lockfile filters
```

---

## 📑 Assignment Modules

| # | Script File | Core Topics & SQL Commands | Database & Tables |
| :-: | :--- | :--- | :--- |
| **01** | [`Assignment PARTH BADIGER.sql`](./Assignment%20PARTH%20BADIGER.sql) | `CREATE DATABASE`, `CREATE TABLE`, `ALTER TABLE ADD`, `ALTER TABLE ALTER COLUMN`, `sp_rename`, `ALTER TABLE DROP COLUMN`, `INSERT INTO`, `SELECT` | `Assignment_1` (`StudentDetails`) |

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
   Ingesting 5 real-world records covering modern data specializations:
   ```sql
   INSERT INTO StudentDetails
   VALUES (101, 'Steven', 'Data Analytics', 52000.75, 'Steven.07@gmail.com', '2026-07-20', '7564879480'),
          (102, 'Phil', 'Business analytics', 65000.25, 'Phil.08@yahoo.com', '2026-07-22', '3215648474'),
          (103, 'Bill', 'Data Science', 78000.00, 'Bill2.0@rediffmail.com', '2026-07-23', '9876543210'),
          (104, 'Karen', 'Agentic AI and GEN AI', 60000.50, 'Karen35@gmail.com', '2026-07-20', '1234567890'),
          (105, 'David', 'Data Engineering', 100000.45, 'David10@gmail.com', '2026-07-22', '4561237890');
   ```

---

## 📊 Final Schema & Query Results

### Table Schema: `StudentDetails`

| Column Name | Data Type | Nullable | Description |
| :--- | :--- | :---: | :--- |
| `StudentID` | `INT` | Yes | Unique student identifier |
| `StudentName` | `VARCHAR(80)` | Yes | Full student name (expanded from 50 to 80 chars) |
| `Course` | `VARCHAR(50)` | Yes | Enrolled specialization (renamed from `CourseName`) |
| `Fees` | `FLOAT` | Yes | Course tuition fee amount |
| `Email` | `VARCHAR(100)` | Yes | Primary email contact address |
| `JoinDate` | `DATE` | Yes | Enrollment date (`YYYY-MM-DD`) |
| `PhoneNumber` | `VARCHAR(15)` | Yes | Contact phone number |

*Note: The `Age` column was intentionally dropped as part of the schema refactoring exercise.*

### Query Result (`SELECT * FROM StudentDetails;`)

| StudentID | StudentName | Course | Fees | Email | JoinDate | PhoneNumber |
| :---: | :--- | :--- | :---: | :--- | :---: | :---: |
| **101** | Steven | Data Analytics | 52,000.75 | `Steven.07@gmail.com` | 2026-07-20 | 7564879480 |
| **102** | Phil | Business analytics | 65,000.25 | `Phil.08@yahoo.com` | 2026-07-22 | 3215648474 |
| **103** | Bill | Data Science | 78,000.00 | `Bill2.0@rediffmail.com` | 2026-07-23 | 9876543210 |
| **104** | Karen | Agentic AI and GEN AI | 60,000.50 | `Karen35@gmail.com` | 2026-07-20 | 1234567890 |
| **105** | David | Data Engineering | 100,000.45 | `David10@gmail.com` | 2026-07-22 | 4561237890 |

---

## 💻 Technologies & Environment

- **RDBMS Engine:** Microsoft SQL Server (T-SQL)
- **Supported IDEs / Clients:**
  - SQL Server Management Studio (SSMS)
  - Azure Data Studio
  - Visual Studio Code (with `MSSQL` Extension)
  - DBeaver / DataGrip

### How to Run Locally

1. Open your SQL client (e.g., SSMS or Azure Data Studio) and connect to your local or remote SQL Server instance.
2. Open [`Assignment PARTH BADIGER.sql`](./Assignment%20PARTH%20BADIGER.sql).
3. Execute the script (`F5` or `Ctrl + Shift + E`).
4. Query the final table:
   ```sql
   USE Assignment_1;
   SELECT * FROM StudentDetails;
   ```

---

## 👤 Author & Contact

**Parth Badiger**
- **GitHub:** [@filteredparth-ship-it](https://github.com/filteredparth-ship-it)
- **Email:** Parthbadiger24@gmail.com
