

 CREATE TABLE Course
(
  cou_ID INT PRIMARY KEY,
  cou_Name VARCHAR(25) NOT NULL,
  cou_Description VARCHAR(250),
  cou_IsActive BIT,
  cou_Rating INT,
  cou_DurationHours INT,
  cou_MaxDegree INT,
  cou_MinDegree INT
);

CREATE TABLE Instructor
(
  ins_ID INT PRIMARY KEY,
  ins_FirstName VARCHAR(25),
  ins_LastName VARCHAR(25),
  ins_Phone VARCHAR(25),
  ins_ExperienceYear INT,
  ins_IsInternal BIT,
  ins_PreferOffline BIT,
  ins_Email VARCHAR(50),
  ins_WorkingStatus VARCHAR(25),
  ins_Salary INT,
  ins_Age INT,
  ins_Gender BIT,
  ins_Degree VARCHAR(50),
  ins_HireDate DATE,
  ins_Specialization VARCHAR(50),
  cou_ID INT
);

CREATE TABLE Branch
(
  br_ID INT PRIMARY KEY,
  br_Name VARCHAR(25),
  br_Location VARCHAR(50),
  br_Capacity INT,
  mgr_ID INT
);

CREATE TABLE Intake
(
  in_Name INT PRIMARY KEY,
  in_StartDate DATE,
  in_EndDate DATE
);

CREATE TABLE Track
(
  tr_ID INT PRIMARY KEY,
  tr_Name VARCHAR(25),
  tr_IsActive BIT,
  tr_Description VARCHAR(500),
  tr_DurationMonths INT
);

CREATE TABLE Batch
(
  ba_ID INT PRIMARY KEY,
  ba_Name VARCHAR(50),
  in_Name INT,
  tr_ID INT,
  br_ID INT
);

CREATE TABLE University
(
  u_ID INT PRIMARY KEY,
  u_Name VARCHAR(50),
  u_Location VARCHAR(50)
);

CREATE TABLE Faculty
(
  fa_ID INT PRIMARY KEY,
  fa_Name VARCHAR(50),
  fa_Location VARCHAR(50)
);

CREATE TABLE GraduationProject
(
  gp_ID INT PRIMARY KEY,
  gp_Name VARCHAR(100),
  gp_Score INT
);

CREATE TABLE Company
(
  com_ID INT PRIMARY KEY,
  com_Name VARCHAR(100),
  com_Size VARCHAR(25),
  com_Location VARCHAR(50),
  com_Domain VARCHAR(50)
);

CREATE TABLE Student
(
  st_ID INT PRIMARY KEY,
  st_FirstName VARCHAR(25),
  st_LastName VARCHAR(25),
  st_Gender BIT,
  st_Address VARCHAR(100),
  st_Email VARCHAR(50),
  st_Password VARCHAR(25),
  st_Salary INT,
  st_Graduationstatus VARCHAR(50),
  st_BirthDate DATE,
  st_AttendanceRate INT,
  br_ID INT,
  ba_ID INT,
  in_Name INT,
  u_ID INT,
  fa_ID INT,
  gp_ID INT,
  tr_ID INT,
  co_ID INT
);

CREATE TABLE StudentPhone
(
  St_Phone VARCHAR(20),
  st_ID INT,
  PRIMARY KEY (St_Phone, st_ID)
);

CREATE TABLE Exam
(
  ex_ID INT PRIMARY KEY,
  ex_Date DATE,
  ex_Type VARCHAR(25),
  ex_DurationMin INT,
  ex_TotalMarks INT,
  ex_PassGrade INT,
  cou_ID INT
);

CREATE TABLE Questions
(
  q_ID INT PRIMARY KEY,
  q_Difficulty VARCHAR(25),
  q_Text VARCHAR(MAX),
  q_Type VARCHAR(50),
  q_Marks INT,
  q_CorrectAnswer VARCHAR(100),
  cou_ID INT
);

CREATE TABLE QuestionChoices
(
  Choices VARCHAR(100),
  q_ID INT,
  PRIMARY KEY (Choices, q_ID)
);

CREATE TABLE Certificate
(
  cer_ID INT PRIMARY KEY,
  cer_Name VARCHAR(25),
  cer_Duration INT,
  cer_Platform VARCHAR(50),
  st_ID INT
);

CREATE TABLE Freelancing
(
  fr_ID INT PRIMARY KEY,
  fr_JobFilled VARCHAR(100),
  fr_Tools VARCHAR(50),
  fr_PaymentMethod VARCHAR(50),
  fr_Platform VARCHAR(100)
);

CREATE TABLE StudentCourse
(
  st_ID INT,
  cou_ID INT,
  PRIMARY KEY (st_ID, cou_ID)
);

CREATE TABLE StudentFreelancing
(
  st_ID INT,
  fr_ID INT,
  PRIMARY KEY (st_ID, fr_ID)
);

CREATE TABLE BatchExam
(
  BatchExamDate DATE,
  ex_ID INT,
  ba_ID INT,
  PRIMARY KEY (ex_ID, ba_ID)
);

CREATE TABLE TrackCourses
(
  cou_ID INT,
  tr_ID INT,
  PRIMARY KEY (cou_ID, tr_ID)
);

CREATE TABLE ExamQuestion
(
  q_ID INT,
  ex_ID INT,
  PRIMARY KEY (q_ID, ex_ID)
);

CREATE TABLE StudentExamQuestion
(
  Score INT,
  StudentAnswer VARCHAR(100),
  st_ID INT,
  ex_ID INT,
  q_ID INT,
  PRIMARY KEY (st_ID, ex_ID, q_ID)
);     


ALTER TABLE Instructor
ADD CONSTRAINT FK_Instructor_Course FOREIGN KEY (cou_ID) REFERENCES Course(cou_ID);

ALTER TABLE Branch
ADD CONSTRAINT FK_Branch_Instructor FOREIGN KEY (mgr_ID) REFERENCES Instructor(ins_ID);

ALTER TABLE Batch
ADD CONSTRAINT FK_Batch_Intake FOREIGN KEY (in_Name) REFERENCES Intake(in_Name),
    CONSTRAINT FK_Batch_Track FOREIGN KEY (tr_ID) REFERENCES Track(tr_ID),
    CONSTRAINT FK_Batch_Branch FOREIGN KEY (br_ID) REFERENCES Branch(br_ID);

ALTER TABLE Student
ADD CONSTRAINT FK_Student_Branch FOREIGN KEY (br_ID) REFERENCES Branch(br_ID),
    CONSTRAINT FK_Student_Batch FOREIGN KEY (ba_ID) REFERENCES Batch(ba_ID),
    CONSTRAINT FK_Student_Intake FOREIGN KEY (in_Name) REFERENCES Intake(in_Name),
    CONSTRAINT FK_Student_University FOREIGN KEY (u_ID) REFERENCES University(u_ID),
    CONSTRAINT FK_Student_Faculty FOREIGN KEY (fa_ID) REFERENCES Faculty(fa_ID),
    CONSTRAINT FK_Student_GraduationProject FOREIGN KEY (gp_ID) REFERENCES GraduationProject(gp_ID),
    CONSTRAINT FK_Student_Track FOREIGN KEY (tr_ID) REFERENCES Track(tr_ID),
    CONSTRAINT FK_Student_Company FOREIGN KEY (co_ID) REFERENCES Company(com_ID);

ALTER TABLE StudentPhone
ADD CONSTRAINT FK_StudentPhone_Student FOREIGN KEY (st_ID) REFERENCES Student(st_ID);

ALTER TABLE Exam
ADD CONSTRAINT FK_Exam_Course FOREIGN KEY (cou_ID) REFERENCES Course(cou_ID);

ALTER TABLE Questions
ADD CONSTRAINT FK_Questions_Course FOREIGN KEY (cou_ID) REFERENCES Course(cou_ID);

ALTER TABLE QuestionChoices
ADD CONSTRAINT FK_QuestionChoices_Questions FOREIGN KEY (q_ID) REFERENCES Questions(q_ID);

ALTER TABLE Certificate
ADD CONSTRAINT FK_Certificate_Student FOREIGN KEY (st_ID) REFERENCES Student(st_ID);

ALTER TABLE StudentCourse
ADD CONSTRAINT FK_StudentCourse_Student FOREIGN KEY (st_ID) REFERENCES Student(st_ID),
    CONSTRAINT FK_StudentCourse_Course FOREIGN KEY (cou_ID) REFERENCES Course(cou_ID);

ALTER TABLE StudentFreelancing
ADD CONSTRAINT FK_StudentFreelancing_Student FOREIGN KEY (st_ID) REFERENCES Student(st_ID),
    CONSTRAINT FK_StudentFreelancing_Freelancing FOREIGN KEY (fr_ID) REFERENCES Freelancing(fr_ID);

ALTER TABLE BatchExam
ADD CONSTRAINT FK_BatchExam_Exam FOREIGN KEY (ex_ID) REFERENCES Exam(ex_ID),
    CONSTRAINT FK_BatchExam_Batch FOREIGN KEY (ba_ID) REFERENCES Batch(ba_ID);

ALTER TABLE TrackCourses
ADD CONSTRAINT FK_TrackCourses_Course FOREIGN KEY (cou_ID) REFERENCES Course(cou_ID),
    CONSTRAINT FK_TrackCourses_Track FOREIGN KEY (tr_ID) REFERENCES Track(tr_ID);

ALTER TABLE ExamQuestion
ADD CONSTRAINT FK_ExamQuestion_Questions FOREIGN KEY (q_ID) REFERENCES Questions(q_ID),
    CONSTRAINT FK_ExamQuestion_Exam FOREIGN KEY (ex_ID) REFERENCES Exam(ex_ID);

ALTER TABLE StudentExamQuestion
ADD CONSTRAINT FK_StudentExamQuestion_Student FOREIGN KEY (st_ID) REFERENCES Student(st_ID),
    CONSTRAINT FK_StudentExamQuestion_Exam FOREIGN KEY (ex_ID) REFERENCES Exam(ex_ID),
    CONSTRAINT FK_StudentExamQuestion_Questions FOREIGN KEY (q_ID) REFERENCES Questions(q_ID);


