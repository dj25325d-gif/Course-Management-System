🚀 Course Management System (MySQL)
<p align="center"> <b>A production-style relational database system demonstrating advanced SQL, data modeling, and analytical querying.</b> </p> <p align="center"> <img src="https://img.shields.io/badge/SQL-Advanced-blue?style=for-the-badge&logo=mysql"> <img src="https://img.shields.io/badge/Database-MySQL-orange?style=for-the-badge&logo=mysql"> <img src="https://img.shields.io/badge/Focus-Data%20Modeling-green?style=for-the-badge"> <img src="https://img.shields.io/badge/Level-Portfolio%20Project-black?style=for-the-badge"> </p>
📌 Table of Contents
✨ Why This Project Stands Out
📖 Overview
🏗️ Architecture
📸 Screenshots
💡 SQL Capabilities
⚙️ Setup
👤 Author
✨ Why This Project Stands Out

✔ Real-world relational design
✔ Advanced SQL (joins, subqueries, window functions)
✔ Clean schema with proper relationships
✔ Designed like a production system

📖 Overview

A Course Management System where:

Students enroll in courses
Courses belong to departments
Instructors manage departments
Enrollments track relationships
🏗️ Architecture
Students ─────┐
              │
              ▼
         Enrollments ─────► Courses ─────► Departments
              ▲
              │
         Instructors
📸 Screenshots

📁 Make sure your folder structure is:

project-root/
│
├── Course_Management.sql
├── README.md
└── screenshots/
    ├── q1.1.png
    ├── q1.2.png
    ├── q2-3.png
    ├── q4-5.png
    ├── q6-9.png
    ├── q10.png
    ├── q11.png
    ├── q12-13.png
    ├── q14-15.png
    └── q16(1).png
🗄️ Database Tables
<p align="center"> <img src="screenshots/q1.1.png" width="45%"> <img src="screenshots/q1.2.png" width="45%"> </p> <p align="center"><i>Students, Courses, and Instructors Data Overview</i></p>
🔍 Filtering & Subqueries
<p align="center"> <img src="screenshots/q2-3.png" width="45%"> <img src="screenshots/q4-5.png" width="45%"> </p> <p align="center"><i>Filtering students and aggregation queries</i></p>
📊 Advanced Queries
<p align="center"> <img src="screenshots/q6-9.png" width="45%"> <img src="screenshots/q10.png" width="45%"> </p> <p align="center"><i>Multi-condition queries and INNER JOIN</i></p>
🔗 JOIN Operations
<p align="center"> <img src="screenshots/q11.png" width="45%"> <img src="screenshots/q12-13.png" width="45%"> </p> <p align="center"><i>LEFT JOIN and Subquery results</i></p>
📈 Window Functions & CASE
<p align="center"> <img src="screenshots/q14-15.png" width="45%"> <img src="screenshots/q16(1).png" width="45%"> </p> <p align="center"><i>Window functions and conditional classification</i></p>
💡 SQL Capabilities
🔗 INNER & LEFT JOIN
🧠 Nested Subqueries
📊 GROUP BY + HAVING
📈 Window Functions (OVER)
🧾 CASE Statements
📅 Date Functions
🔤 String Functions
⚙️ Setup
git clone https://github.com/yourusername/course-management-system.git
cd course-management-system

Run in MySQL:

SOURCE Course_Management.sql;
👤 Author

Dushyant V
💡 SQL | Data | Backend Systems
