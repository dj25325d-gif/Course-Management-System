CREATE DATABASE UniversityDB;
USE UniversityDB;


-- Tables

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- Data

INSERT INTO Departments VALUES 
(1,'Computer Science'),
(2,'Mathematics'),
(3,'Physics'),
(4,'Commerce'),
(5,'Biology');

INSERT INTO Students (FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES 
('Parth','Kumar','parth.kumar@univ.com','2000-01-15','2022-08-01'),
('Raj','Raj','raj.raj@univ.com','1999-05-25','2021-08-01'),
('Amit','Shah','amit.shah@univ.com','2001-02-10','2023-01-01'),
('Priya','Patel','priya.patel@univ.com','2000-07-20','2022-06-15'),
('Rahul','Verma','rahul.verma@univ.com','1998-11-11','2021-07-10'),
('Sneha','Kapoor','sneha.kapoor@univ.com','2002-03-03','2023-02-01'),
('Arjun','Reddy','arjun.reddy@univ.com','2001-09-09','2022-09-01'),
('Neha','Mehta','neha.mehta@univ.com','1999-04-18','2021-08-15'),
('Vikram','Singh','vikram.singh@univ.com','2000-12-12','2022-07-07'),
('Pooja','Nair','pooja.nair@univ.com','2001-06-06','2023-03-01'),
('Rohan','Das','rohan.das@univ.com','1999-08-08','2021-09-01'),
('Kiran','Joshi','kiran.joshi@univ.com','2000-10-10','2022-10-10'),
('Anjali','Iyer','anjali.iyer@univ.com','2001-01-01','2023-01-15'),
('Deepak','Yadav','deepak.yadav@univ.com','1998-02-02','2021-05-05'),
('Meena','Chopra','meena.chopra@univ.com','2002-12-12','2023-04-01');

INSERT INTO Courses VALUES 
(101,'Introduction to SQL',1,3),
(102,'Data Structures',2,4),
(103,'Algorithms',1,4),
(104,'Linear Algebra',2,3),
(105,'Gen AI',3,3),
(106,'Python Programming',4,3),
(107,'Excel for Business',5,3);

INSERT INTO Instructors (FirstName, LastName, Email, DepartmentID, Salary) VALUES 
('Milan','Mishra','milan.mishra@univ.com',1,70000),
('Girish','Kumar','girish.kumar@univ.com',2,65000),
('Divesh','Venumahasagaram','divesh.venumahasagaram@univ.com',1,82000),
('David','Brown','david.brown@univ.com',3,60000),
('Susmita','Sain','susmita.sain@univ.com',2,72000);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES 
(1,101,'2022-08-01'),
(1,102,'2022-08-02'),
(2,102,'2021-08-01'),
(2,101,'2021-08-05'),
(3,101,'2023-01-02'),
(3,103,'2023-01-10'),
(4,103,'2022-06-20'),
(4,104,'2022-06-25'),
(5,104,'2021-07-15'),
(6,101,'2023-02-05'),
(6,102,'2023-02-07'),
(7,102,'2022-09-05'),
(8,101,'2021-08-20'),
(8,103,'2021-08-22'),
(9,103,'2022-07-10'),
(10,105,'2023-03-10'),
(11,101,'2021-09-10'),
(11,102,'2021-09-12'),
(12,104,'2022-10-12'),
(13,101,'2023-01-20'),
(13,102,'2023-01-22'),
(14,102,'2021-05-10'),
(15,106,'2023-04-05');


-- 1. Perform CRUD Operations on all tables.
SELECT * FROM Students; 
SELECT * FROM Courses; 
SELECT * FROM Instructors; 
SELECT * FROM Enrollments; 
SELECT * FROM Departments;

INSERT INTO Students (FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES ('OM','Mishra','om.mishra@univ.com','2000-01-01','2023-01-01');
UPDATE Students SET Email = 'updated@email.com' WHERE StudentID = 1;
DELETE FROM Enrollments WHERE EnrollmentID = 999;


-- 2. Retrieve students who enrolled after 2022.
SELECT * FROM Students WHERE EnrollmentDate > '2022-12-31';


-- 3. Retrieve courses offered by the Mathematics department with a limit of 5 courses.
SELECT * FROM Courses WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Mathematics') LIMIT 5;


-- 4. Get the number of students enrolled in each course, filtering for courses with more than 5 students.
SELECT CourseID, COUNT(StudentID) AS TotalStudents FROM Enrollments GROUP BY CourseID HAVING COUNT(StudentID) > 5;


INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES 
(5,101,'2023-07-01'),
(7,101,'2023-07-02'),
(9,101,'2023-07-03');

SELECT CourseID, COUNT(StudentID) AS TotalStudents FROM Enrollments GROUP BY CourseID HAVING COUNT(StudentID) > 5;


-- 5. Find students who are enrolled in both Introduction to SQL and Data Structures.
SELECT s.* FROM Students s 
INNER JOIN Enrollments e1 ON s.StudentID = e1.StudentID 
INNER JOIN Enrollments e2 ON s.StudentID = e2.StudentID 
WHERE e1.CourseID = 101 AND e2.CourseID = 102;


-- 6. Find students who are either enrolled in Introduction to SQL or Data Structures.
SELECT DISTINCT s.* FROM Students s INNER JOIN Enrollments e ON s.StudentID = e.StudentID WHERE e.CourseID IN (101,102);


-- 7. Calculate the average number of credits for all courses.
SELECT AVG(Credits) AS AvgCredits FROM Courses;


-- 8. Find the maximum salary of instructors in the Computer Science department.
SELECT MAX(Salary) AS MaxSalary FROM Instructors WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Computer Science');


-- 9. Count the number of students enrolled in each department.
SELECT d.DepartmentName, COUNT(e.StudentID) AS TotalStudents FROM Departments d 
INNER JOIN Courses c ON d.DepartmentID = c.DepartmentID 
INNER JOIN Enrollments e ON c.CourseID = e.CourseID 
GROUP BY d.DepartmentName;


-- 10. INNER JOIN: Retrieve students and their corresponding courses.
SELECT s.FirstName, c.CourseName FROM Students s 
INNER JOIN Enrollments e ON s.StudentID = e.StudentID 
INNER JOIN Courses c ON e.CourseID = c.CourseID;


-- 11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.
SELECT s.FirstName, c.CourseName FROM Students s 
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID 
LEFT JOIN Courses c ON e.CourseID = c.CourseID;


-- 12. Subquery: Find students enrolled in courses that have more than 10 students.
SELECT * FROM Students WHERE StudentID IN (SELECT StudentID FROM Enrollments WHERE CourseID IN (SELECT CourseID FROM Enrollments GROUP BY CourseID HAVING COUNT(StudentID) > 10));

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES 
(2,101,'2023-07-04'),
(3,101,'2023-07-05'),
(4,101,'2023-07-06'),
(6,101,'2023-07-07'),
(8,101,'2023-07-08'),
(10,101,'2023-07-09');

SELECT * FROM Students WHERE StudentID IN (SELECT StudentID FROM Enrollments WHERE CourseID IN (SELECT CourseID FROM Enrollments GROUP BY CourseID HAVING COUNT(StudentID) > 10));


-- 13. Extract the year from the EnrollmentDate of students.
SELECT StudentID, YEAR(EnrollmentDate) AS Year FROM Students;


-- 14. Concatenate the instructor's first and last name.
SELECT CONCAT(FirstName,' ',LastName) AS FullName FROM Instructors;


-- 15. Calculate the running total of students enrolled in courses.
SELECT CourseID, COUNT(StudentID) OVER (ORDER BY CourseID) AS RunningTotal FROM Enrollments;


-- 16. Label students as 'Senior' or 'Junior' based on their year of enrollment.
SELECT StudentID,
CASE 
    WHEN TIMESTAMPDIFF(YEAR, EnrollmentDate, CURDATE()) > 4 THEN 'Senior'
    ELSE 'Junior'
END AS Status
FROM Students;