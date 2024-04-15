--Task 1
-- Create the database named "SISDB"
CREATE DATABASE SISDB;

-- Use the database 
USE SISDB;

-- Create Table Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    date_of_birth DATE,
    email VARCHAR(30),
    phone_number BIGINT
);

DROP TABLE IF EXISTS  Teacher;
-- Create Table Teacher
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(30)
);

-- Create Table Courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(30),
    credits INT,
    teacher_id INT,
    CONSTRAINT FK_Teacherid FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

-- Create Table Enrollments
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    CONSTRAINT FK_Studentid FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT FK_Courseid FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Enable CASCADE on the foreign key constraint
ALTER TABLE Enrollments
DROP CONSTRAINT FK_Studentid;

ALTER TABLE Enrollments
ADD CONSTRAINT FK_Studentid 
FOREIGN KEY (student_id) 
REFERENCES Students(student_id)
ON DELETE CASCADE;

-- Create Table Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount INT,
    payment_date DATE,
    CONSTRAINT FK_StudentPid FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Enable CASCADE on the foreign key constraint
ALTER TABLE Payments
DROP CONSTRAINT FK_StudentPid;

ALTER TABLE Payments
ADD CONSTRAINT FK_StudentPid 
FOREIGN KEY (student_id) 
REFERENCES Students(student_id)
ON DELETE CASCADE;

-- Insert Values into table Students
INSERT INTO Students VALUES
(1, 'Surya', 'Prakash', '1990-01-01', 'surya@gmail.com', 9876543210),
(2, 'Keith', 'Raja', '1995-05-15', 'keith@gmail.com', 8765432109),
(3, 'Arun', 'Pandi', '1988-08-25', 'arun@gmail.com', 7654321098),
(4, 'Ashwin', 'Kumar', '1992-11-10', 'ashwin@gmail.com', 6543210987),
(5, 'Rachin', 'Ravindra', '1998-03-20', 'rachin@gmail.com', 5432109876),
(6, 'Bala', 'Guru', '1997-07-05', 'bala@gmail.com', 4321098765),
(7, 'Nishok', 'Krishna', '1994-09-30', 'nishok@gmail.com', 3210987654),
(8, 'Raju', 'Singh', '1993-12-12', 'raju@gmail.com', 2109876543),
(9, 'Praveen', 'Kumar', '1991-04-18', 'praveen@gmail.com', 1098765432),
(10, 'Rahul', 'Singh', '1996-06-28', 'rahul@gmail.com', 9876543210);

INSERT INTO Students VALUES (12, 'Aarav', 'Patel', '2000-09-12', 'aarav@gmail.com', 8765432109);


-- Insert Values into table Teacher
INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
(101, 'Amit', 'Patel', 'amit@gmail.com'),
(102, 'Priya', 'Sharma', 'priya@gmail.com'),
(103, 'Rajesh', 'Kumar', 'rajesh@gmail.com'),
(104, 'Neha', 'Gupta', 'neha@gmail.com'),
(105, 'Sanjay', 'Singh', 'sanjay@gmail.com'),
(106, 'Pooja', 'Shah', 'pooja@gmail.com'),
(107, 'Manoj', 'Verma', 'manoj@gmail.com'),
(108, 'Deepika', 'Yadav', 'deepika@gmail.com'),
(109, 'Raj', 'Malhotra', 'raj@gmail.com'),
(110, 'Sunita', 'Chopra', 'sunita@gmail.com');

INSERT INTO Teacher VALUES(111,'Tushar','Pandey','tushar@gmail.com');

-- Insert Values into table Courses
INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES 
    (201, 'Database Management', 2, 101),
    (202, 'Web Development', 3, 102),
    (203, 'Machine Learning', 4, 103),
    (204, 'Network Security', 3, 104),
    (205, 'Software Engineering', 4, 105),
    (206, 'Mobile App Development', 2, 106),
    (207, 'Data Analysis with Python', 3, 107),
    (208, 'Cloud Computing Essentials', 4, 108),
    (209, 'Artificial Intelligence Basics', 2, 109),
    (210, 'Game Development', 3, 110);

INSERT INTO Courses VALUES (212,'Digital Marketing',3,111);
-- Insert Values into table Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
    (301, 1, 201, '2024-04-01'),
    (302, 2, 202, '2024-04-02'),
    (303, 3, 203, '2024-04-03'),
    (304, 4, 204, '2024-04-04'),
    (305, 5, 205, '2024-04-05'),
    (306, 6, 206, '2024-04-06'),
    (307, 7, 207, '2024-04-07'),
    (308, 8, 208, '2024-04-08'),
    (309, 9, 209, '2024-04-09'),
    (310, 10, 210, '2024-04-10');

-- Insert Values into table Payments

INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
    (401, 1, 500, '2024-04-01'),
    (402, 2, 600, '2024-04-02'),
    (403, 3, 700, '2024-04-03'),
    (404, 4, 800, '2024-04-04'),
    (405, 5, 900, '2024-04-05'),
    (406, 6, 1000, '2024-04-06'),
    (407, 7, 1100, '2024-04-07'),
    (408, 8, 1200, '2024-04-08'),
    (409, 9, 1300, '2024-04-09'),
    (410, 10, 1400, '2024-04-10');

-- SELECT all the rows
SELECT * FROM Students;

--TASK 2

--1. Write an SQL query to insert a new student into the "Students" table with the following details
INSERT INTO Students VALUES(11,'John','Doe','1995-08-15','john.doe@gmail.com','1234567890');

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course 
--and insert a record into the "Enrollments" table with the enrollment date.

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (311,11,210, '2024-04-10');

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.

UPDATE Teacher SET email='nehagupta@gmail.com' WHERE teacher_id=104;

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. 
---Select an enrollment record based on the student and course.

DELETE FROM Enrollments WHERE student_id=2 AND course_id=202;

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.

UPDATE Courses SET teacher_id = 103 WHERE course_id = 204;

--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. 
--Be sure to maintain referential integrity.

DELETE FROM Students WHERE student_id = 3;

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.

UPDATE Payments SET amount = amount*1.10 WHERE payment_id=402;

-- Task 3

--1. Write an SQL query to calculate the total payments made by a specific student. 
--You will need to join the "Payments" table with the "Students" table based on the student's ID.

SELECT s.student_id, CONCAT(s.first_name,' ',s.last_name) AS StudentName,s.email,s.phone_number, SUM(p.amount) AS Total_Payments FROM Payments P 
JOIN Students s ON p.student_id = s.student_id GROUP BY s.student_id ,s.first_name,s.last_name,s.email,s.phone_number;


--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. 
--Use a JOIN operation between the "Courses" table and the "Enrollments" table.

SELECT c.course_id, c.course_name , COUNT(e.student_id) AS "Students Enrolled" FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id GROUP BY c.course_id,c.course_name;


--3. Write an SQL query to find the names of students who have not enrolled in any course. 
---Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
SELECT s.student_id, CONCAT(s.first_name, ' ', s.last_name) AS StudentName FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id  
WHERE e.student_id IS NULL;

--4.  Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. 
-- Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.

SELECT s.first_name, s.last_name, c.course_name FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.

SELECT t.first_name, t.last_name , c.course_name  FROM Teacher t  
JOIN Courses c ON t.teacher_id = c.teacher_id;

--6. Retrieve a list of students and their enrollment dates for a specific course. 
--You'll need to join the "Students" table with the "Enrollments" and "Courses" tables

SELECT s.first_name, s.last_name, c.course_name, e.enrollment_date FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

--7. Find the names of students who have not made any payments. 
-- Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.

SELECT s.first_name, s.last_name, s.email,s.phone_number FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id WHERE p.student_id IS NULL;

--8. Write a query to identify courses that have no enrollments. 
-- You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.

SELECT c.course_id , course_name FROM Courses c 
LEFT JOIN Enrollments e ON c.course_id = e.course_id 
WHERE e.enrollment_id IS NULL;

--9. Identify students who are enrolled in more than one course.
 -- Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
SELECT e1.student_id, COUNT(e1.course_id) AS num_of_enrollments FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id WHERE e1.course_id <> e2.course_id
GROUP BY e1.student_id HAVING COUNT(e1.course_id) > 1;


--10. Find teachers who are not assigned to any courses. 
-- Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.

SELECT t.first_name , t.last_name FROM Teacher t 
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id 
WHERE c.teacher_id IS NULL;

-- Task 4. Subquery and its type

--1. Write an SQL query to calculate the average number of students enrolled in each course. Use
--aggregate functions and subqueries to achieve this.

SELECT AVG(StudentCount) AS AverageEnrollmentCount FROM (
SELECT COUNT(student_id) AS StudentCount  FROM Enrollments GROUP BY  student_id
)AS EnrollmentCount;


--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
--payment amount and then retrieve the student(s) associated with that amount.

SELECT CONCAT(first_name,' ',last_name) AS StudentName FROM  Students WHERE student_id IN(
SELECT student_id FROM Payments WHERE amount= (SELECT MAX(amount) FROM Payments));

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
--course(s) with the maximum enrollment count.

SELECT c.course_name, COUNT(e.enrollment_id) AS HighestEnrollmentCount
FROM Courses c JOIN  Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name HAVING COUNT(e.enrollment_id) = (SELECT MAX(enrollment_count) FROM (SELECT COUNT(enrollment_id) AS enrollment_count
FROM Enrollments GROUP BY course_id ) AS max_enrollments);


--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
--payments for each teacher's courses.

SELECT CONCAT(first_name,' ',last_name) AS TeacherName, (SELECT SUM(amount) FROM Payments p
JOIN Enrollments e ON p.student_id = e.student_id 
JOIN Courses c ON c.course_id = e.course_id
WHERE c.teacher_id = t.teacher_id) AS TotalPayments FROM Teacher t ;

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a
--student's enrollments with the total number of courses.

SELECT CONCAT(first_name,' ',last_name) AS StudentName  FROM Students WHERE (SELECT DISTINCT COUNT(course_id) FROM Enrollments) =
(SELECT DISTINCT COUNT(course_id) FROM Enrollments WHERE Students.student_id= Enrollments.student_id);

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
-- find teachers with no course assignments.
SELECT CONCAT(first_name,' ',last_name) AS TeacherName FROM Teacher WHERE teacher_id NOT IN(SELECT teacher_id FROM Courses);

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student
--based on their date of birth.
SELECT AVG(Age) AS AverageAge FROM (
    SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) AS Age FROM Students
) AS StudentAges;

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
--records.

SELECT c.course_id, c.course_name FROM Courses c WHERE NOT EXISTS(
SELECT 1  FROM Enrollments e WHERE e.course_id=c.course_id
) ;

-- 9. Calculate the total payments made by each student for each course they are enrolled in. Use
--subqueries and aggregate functions to sum payments.
SELECT CONCAT(first_name,' ',last_name) AS StudentName, c.course_id, c.course_name AS StudnetName, (SELECT SUM(amount) FROM Payments p
 WHERE p.student_id = s.student_id  AND e.course_id= c.course_id
)  AS TotalPayments FROM Students s JOIN Enrollments e ON s.student_id = e.student_id 
JOIN Courses c ON c.course_id = e.course_id  ;

--10. Identify students who have made more than one payment. Use subqueries and aggregate
--functions to count payments per student and filter for those with counts greater than one.

SELECT CONCAT(first_name,' ',last_name) AS StudentName FROM  Students WHERE student_id IN(
SELECT student_id  FROM Payments GROUP BY student_id HAVING COUNT(student_id)>1);

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
SELECT CONCAT(first_name,' ',last_name) AS StudentName,(
SELECT SUM(amount) FROM Payments p WHERE p.student_id = s.student_id) AS StudenetPayments FROM Students s;

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.

SELECT  c.course_name , (SELECT COUNT(enrollment_id)  FROM Enrollments WHERE course_id=c.course_id)
 AS StudentsEnrolled FROM Courses c;

-- 13. Calculate the average payment amount made by students. Use JOIN operations between the
-- "Students" table and the "Payments" table and GROUP BY to calculate the average.
 
SELECT CONCAT(s.first_name,' ',s.last_name) AS StudentName,
( SELECT AVG(amount)  FROM Payments p WHERE p.student_id=s.student_id ) AS AvergaeAmount FROM Students s;

