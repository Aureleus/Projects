create table STUDENT
(
StudentId int IDENTITY(1,1) PRIMARY KEY,
StudentName varchar(50) not null,
FathersName varchar(50) not null,
MothersName varchar(50) not null,
Address varchar(50) not null,
Email varchar(50) not null,
BirthDate date not null,
ContactNo int not null,
Password char(30) not null,
BloodGrp varchar(20) not null,

)

INSERT INTO STUDENT(StudentName, FathersName, MothersName, Address, Email, BirthDate, ContactNo, Password, BloodGrp)
VALUES('Rahim','Karim','Samina','Dhaka','Rahim@aust.com','2016-01-03',01718976654,'1234','O+'),
      ('Jahim','Rahman','Dolon','Dhaka','Jahim@aust.com','2017-07-23',01719975554,'1334','B+'),
	  ('Fatima','Sakib','Afsana','Dhaka','Fatima@aust.com','2016-10-15',01714446759,'9952','O-')

Select * from STUDENT

ALTER TABLE STUDENT 
ADD AdmissionFees int null default 10000;

ALTER TABLE STUDENT 
ADD RecieptNo int null;


CREATE TABLE CLASS
(
ClassId int IDENTITY(1,1) PRIMARY KEY,
ClassYear int not null,
ClassSection varchar(10) not null,
MaxStudents int null default 30,
)

INSERT INTO CLASS(ClassYear,ClassSection,MaxStudents)
VALUES(1,'A',30),
      (1,'B',30),
	  (1,'C',40),
	  (2,'A',30),
	  (2,'B',33),
	  (2,'C',37)

SELECT * FROM CLASS

CREATE TABLE FEES
(
RecieptNo int IDENTITY(1000,100) PRIMARY KEY,
StudentName varchar(50) not null,
StartDate date not null,
Lastdate date not null,
Amount int null default 15000,
Status varchar(50) null default 'unpaid',
StudentSection varchar(50) not null,
StudentClass int not null,
StudentSemester varchar(50) not null,
)

select * from FEES

INSERT INTO FEES(StudentName,StartDate,Lastdate,StudentSection,StudentClass,StudentSemester)
VALUES('Rahim','2020-04-21','2020-05-22','A',1,'Summer'),
      ('Jahim','2020-04-21','2020-05-22','B',2,'Winter'),
      ('Karim','2020-04-21','2020-05-22','C',1,'Summer')

CREATE TABLE TEACHER
(
TeacherId int IDENTITY(10,1) PRIMARY KEY,
TeacherName varchar(50) not null,
TeacherEmail varchar(50) not null,
TeacherPassword char(50) not null,
TeacherPhone int not null,
TeacherBloodGrp varchar(50) not null,
TeacherAddress varchar(50) null default 'Dhaka',
)

SELECT * FROM TEACHER

INSERT INTO TEACHER(TeacherName,TeacherEmail,TeacherPassword,TeacherPhone,TeacherBloodGrp)
VALUES('Anika','anika@aust.com',123,01843459980,'O+'),
      ('Kalib','kalib@aust.com',223,01876689989,'B+'),
	  ('Anika','anika@aust.com',123,01844355499,'A+')

CREATE TABLE EXAMS
(
ExamId int IDENTITY(1,1) PRIMARY KEY,
ExamSemester varchar(50) not null,
ExamDate date not null,
ExamStartTime time not null,
ExamEndTime time not null,
ExamSubjectName varchar(50) not null,
ExamClass int not null,
ExamClassroom int not null,
)

INSERT INTO EXAMS(ExamSemester,ExamDate,ExamStartTime,ExamEndTime,ExamSubjectName,Examclass,ExamClassroom)
VALUES('Spring','2020-03-05','8:30:00','10:30:00','Bangla','1',2),
      ('Spring','2020-03-05','8:30:00','10:30:00','Bangla','2',5),
	  ('Spring','2020-03-08','8:30:00','10:30:00','English','1',2),
	  ('Spring','2020-03-08','8:30:00','10:30:00','English','2',5),
	  ('Spring','2020-03-11','8:30:00','10:30:00','Math','1',2),
	  ('Spring','2020-03-11','8:30:00','10:30:00','Math','2',5)

SELECT * FROM EXAMS

CREATE TABLE SALARIES
(
SalariesId int IDENTITY(11111,15) PRIMARY KEY,
TeacherName varchar(50) not null,
Amount int not null,
Bonus int null,
Semester varchar(50) not null,
)

INSERT INTO SALARIES(TeacherName,Amount,Bonus,Semester)
VALUES('Anika',25000,0,'Spring'),
      ('Kalib',25000,2000,'Spring'),
	  ('Tariq',25000,1000,'Spring')

SELECT * FROM SALARIES

