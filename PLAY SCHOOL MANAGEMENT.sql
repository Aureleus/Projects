CREATE TABLE STUDENT
(
StudentId int IDENTITY(1,1) PRIMARY KEY,
Name varchar(50) NOT NULL,
FatherName varchar(50) NOT NULL,
MotherName varchar(50) NOT NULL,
Adress varchar(50) NOT NULL,
Birth date NOT NULL,
BirthId int NOT NULL,
Email varchar(50) NOT NULL,
Password char(32) NOT NULL,
BloodGroup varchar (20) NOT NULL,
MobileNo int NOT NULL,
)

ALTER TABLE STUDENT ALTER COLUMN Password int
ALTER TABLE STUDENT ALTER COLUMN BloodGroup varchar(20)

INSERT INTO STUDENT(Name,FatherName,MotherName,Adress,Birth,BirthId,Email,Password,BloodGroup,MobileNo)
VALUES ('Karim','Rahim','Fatima','Dhaka','02-15-2016',12345,'Karim@aust.com',123,'B+',0123486),
       ('Abdul','Rahim','Fatima','Dhaka','04-18-2017',12439,'Abdul@aust.com',332,'B+',012346),
	   ('Jahin','Hero','Jhorna','Dhaka','06-10-2016',18845,'Jahin@aust.com',883,'A+',023495),
	   ('Akib','Rajik','Dolon','Dhaka','03-19-2018',15647,'Akib@aust.com',894,'O+',012386),
	   ('Sakib','Simanto','Noushin','Dhaka','11-26-2017',55840,'Sakib@aust.com',76,'O-',012394)

CREATE TABLE CLASSROOM
(
ClassroomId int IDENTITY(1,1) PRIMARY KEY,
Capacity int NOT NULL CHECK(Capacity>=25),
RoomType varchar(50) NULL DEFAULT 'CLASSROOM',

)

ALTER TABLE CLASSROOM
DROP COLUMN Facilities

INSERT INTO CLASSROOM(Capacity,RoomType)
VALUES(32,'Classroom'),
      (35,'Classroom'),
	  (50,'Canteen'),
	  (31,'Breakroom'),
	  (33,'Classroom'),
	  (36,'Classroom'),
	  (37,'Classroom'),
	  (40,'Classroom')
   

CREATE TABLE COURSE
(
CourseId int IDENTITY(1,1) PRIMARY KEY,
MaxStudentsAllowed int NULL DEFAULT '30',
TeacherId int NOT NULL,
StudentsAttending int NOT NULL,
)

INSERT INTO COURSE(MaxStudentsAllowed,StudentsAttending,TeacherId)
VALUES(40,25,1),
      (30,25,2),
	  (20,20,3),
	  (35,25,4),
	  (40,40,5)


CREATE TABLE TEACHER
(
TeacherId int IDENTITY(1,1) PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Title varchar(50) NULL DEFAULT 'REGULER',
SubjectId int NOT NULL FOREIGN KEY REFERENCES COURSE(CourseId),
)

INSERT INTO TEACHER(FirstName,LastName,Title,SubjectId)
VALUES('Robert','Johnson','homeroom',2),
      ('Jesmin','Aktar','nursery',3),
	  ('Samiya','Rahman','playschool',4),
	  ('Belal','Mahmud','nursery',5)


CREATE TABLE CLASS
(
ClassId int IDENTITY(1,1) PRIMARY KEY,
ClassroomId int NOT NULL FOREIGN KEY REFERENCES CLASSROOM(ClassroomId),
CourseId int NOT NULL FOREIGN KEY REFERENCES COURSE(CourseId),
TeacherId int NOT NULL FOREIGN KEY REFERENCES TEACHER(TeacherId),
Period int NOT NULL,
Time time NOT NULL,
)

INSERT INTO CLASS(ClassroomId,SubjectId,TeacherId,Period,Time)
VALUES(8,2,5,'1','08:00:00'),
      (9,3,6,'2','09:00:00'),
	  (10,4,7,'3','10:30:00'),
	  (11,5,8,'4','11:30:00')

CREATE TABLE EXAM1
(
ExamId int IDENTITY(1,1) PRIMARY KEY,
CourseId int NOT NULL FOREIGN KEY REFERENCES COURSE(CourseId),
ClassroomId int NOT NULL FOREIGN KEY REFERENCES CLASSROOM(ClassroomId),
StartTime time NOT NULL,
Endtime time NOT NULL,
)



INSERT INTO EXAM1(CourseId,ClassroomId,StartTime,Endtime)
VALUES(2,8,'10:30:00','11:30:00'),
      (3,9,'10:30:00','11:30:00'),
	  (4,10,'10:30:00','11:30:00'),
	  (5,11,'10:30:00','11:30:00'),
	  (6,12,'10:30:00','11:30:00')

CREATE TABLE FEES1
(
StudentId int FOREIGN KEY REFERENCES STUDENT(StudentId),
RecieptNo int NOT NULL,
AdmissionFees decimal(18,2) NOT NULL CHECK(AdmissionFees>10000.00),
MonthlyFees decimal(18,2) NOT NULL,
)

INSERT INTO FEES1(StudentId,RecieptNo,AdmissionFees,MonthlyFees)
VALUES(19,'567998',11000.00,3000.00),
      (20,'567998',18000.00,2000.00),
	  (21,'567998',18000.00,2000.00),
	  (22,'567998',19000.00,2500.00)

CREATE TABLE SALARY1
(
TeacherId int NOT NULL FOREIGN KEY REFERENCES TEACHER(TeacherId),
MonthlySalary decimal(18,2) NULL DEFAULT 29780.00,
RecieptNo int NOT NULL,
Bonus decimal(18,2) NULL,
)

DELETE FROM SALARY

INSERT INTO SALARY1(TeacherId,MonthlySalary,RecieptNo,Bonus)
VALUES(5,29780.00,'111',0.00),
      (6,29780.00,'112',4000),
	  (7,29780.00,'113',0.00),
	  (8,33789,'114',2000)
