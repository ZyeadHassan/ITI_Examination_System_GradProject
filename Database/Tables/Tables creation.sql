USE [ITI_Project]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[ba_ID] [int] NOT NULL,
	[ba_Name] [varchar](50) NULL,
	[in_Name] [int] NULL,
	[tr_ID] [int] NULL,
	[br_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ba_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchExam]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchExam](
	[BatchExamDate] [date] NULL,
	[ex_ID] [int] NOT NULL,
	[ba_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ex_ID] ASC,
	[ba_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[br_ID] [int] NOT NULL,
	[br_Name] [varchar](25) NULL,
	[br_Location] [varchar](50) NULL,
	[br_Capacity] [int] NULL,
	[mgr_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[br_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[cer_ID] [int] NOT NULL,
	[cer_Name] [varchar](250) NULL,
	[cer_Duration] [int] NULL,
	[cer_Platform] [varchar](50) NULL,
	[st_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[com_ID] [int] NOT NULL,
	[com_Name] [varchar](100) NULL,
	[com_Size] [varchar](25) NULL,
	[com_Location] [varchar](50) NULL,
	[com_Domain] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[com_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[cou_ID] [int] NOT NULL,
	[cou_Name] [nvarchar](250) NULL,
	[cou_Description] [varchar](250) NULL,
	[cou_IsActive] [bit] NULL,
	[cou_Rating] [int] NULL,
	[cou_DurationHours] [int] NULL,
	[cou_MaxDegree] [int] NULL,
	[cou_MinDegree] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cou_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ex_ID] [int] NOT NULL,
	[ex_Date] [date] NULL,
	[ex_Type] [varchar](25) NULL,
	[ex_DurationMin] [int] NULL,
	[ex_TotalMarks] [int] NULL,
	[ex_PassGrade] [int] NULL,
	[cou_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ex_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamQuestion]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamQuestion](
	[q_ID] [int] NOT NULL,
	[ex_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[q_ID] ASC,
	[ex_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamResults]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamResults](
	[Result_ID] [int] IDENTITY(1,1) NOT NULL,
	[st_ID] [int] NOT NULL,
	[cou_ID] [int] NOT NULL,
	[Score] [decimal](5, 2) NULL,
	[DateTaken] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Result_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[fa_ID] [int] NOT NULL,
	[fa_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fa_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Freelancing]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Freelancing](
	[fr_ID] [int] NOT NULL,
	[fr_JobFilled] [varchar](100) NULL,
	[fr_Tools] [varchar](50) NULL,
	[fr_PaymentMethod] [varchar](50) NULL,
	[fr_Platform] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[fr_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GraduationProject]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GraduationProject](
	[gp_ID] [int] NOT NULL,
	[gp_Name] [varchar](100) NULL,
	[gp_Score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[gp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[ins_ID] [int] NOT NULL,
	[ins_FirstName] [varchar](25) NULL,
	[ins_LastName] [varchar](25) NULL,
	[ins_Phone] [varchar](25) NULL,
	[ins_ExperienceYear] [int] NULL,
	[ins_IsInternal] [bit] NULL,
	[ins_PreferOffline] [bit] NULL,
	[ins_Email] [varchar](50) NULL,
	[ins_WorkingStatus] [varchar](25) NULL,
	[ins_Salary] [int] NULL,
	[ins_Age] [int] NULL,
	[ins_Gender] [nvarchar](10) NULL,
	[ins_Degree] [varchar](50) NULL,
	[ins_HireDate] [date] NULL,
	[ins_Specialization] [varchar](50) NULL,
	[cou_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ins_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Intake]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intake](
	[in_Name] [int] NOT NULL,
	[in_StartDate] [date] NULL,
	[in_EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[in_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionChoices]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionChoices](
	[Choices] [varchar](100) NOT NULL,
	[q_ID] [int] NOT NULL,
	[Is_Correct] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Choices] ASC,
	[q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[q_ID] [int] NOT NULL,
	[q_Difficulty] [varchar](25) NULL,
	[q_Text] [varchar](max) NULL,
	[q_Type] [varchar](50) NULL,
	[q_Marks] [int] NULL,
	[q_CorrectAnswer] [varchar](100) NULL,
	[cou_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[st_ID] [int] NOT NULL,
	[st_FirstName] [varchar](25) NULL,
	[st_LastName] [varchar](25) NULL,
	[st_Gender] [nvarchar](10) NULL,
	[st_Address] [varchar](100) NULL,
	[st_Email] [varchar](50) NULL,
	[st_Password] [varchar](25) NULL,
	[st_Salary] [int] NULL,
	[st_Graduationstatus] [varchar](50) NULL,
	[st_BirthDate] [date] NULL,
	[st_AttendanceRate] [int] NULL,
	[br_ID] [int] NULL,
	[ba_ID] [int] NULL,
	[in_Name] [int] NULL,
	[u_ID] [int] NULL,
	[fa_ID] [int] NULL,
	[gp_ID] [int] NULL,
	[tr_ID] [int] NULL,
	[co_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[st_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[st_ID] [int] NOT NULL,
	[cou_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_ID] ASC,
	[cou_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentExamQuestion]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExamQuestion](
	[Score] [int] NULL,
	[Student_Answer] [varchar](100) NULL,
	[st_ID] [int] NOT NULL,
	[ex_ID] [int] NOT NULL,
	[q_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_ID] ASC,
	[ex_ID] ASC,
	[q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentFreelancing]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFreelancing](
	[st_ID] [int] NOT NULL,
	[fr_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_ID] ASC,
	[fr_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentPhone]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPhone](
	[St_Phone] [varchar](20) NOT NULL,
	[st_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[St_Phone] ASC,
	[st_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[tr_ID] [int] NOT NULL,
	[tr_Name] [nvarchar](255) NULL,
	[tr_IsActive] [bit] NULL,
	[tr_Description] [varchar](500) NULL,
	[tr_DurationMonths] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tr_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrackCourses]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrackCourses](
	[cou_ID] [int] NOT NULL,
	[tr_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cou_ID] ASC,
	[tr_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 11/26/2025 8:27:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[u_ID] [int] NOT NULL,
	[u_Name] [nvarchar](100) NULL,
	[u_Location] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[u_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExamResults] ADD  DEFAULT (getdate()) FOR [DateTaken]
GO
ALTER TABLE [dbo].[Batch]  WITH NOCHECK ADD  CONSTRAINT [FK_Batch_Branch] FOREIGN KEY([br_ID])
REFERENCES [dbo].[Branch] ([br_ID])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_Batch_Branch]
GO
ALTER TABLE [dbo].[Batch]  WITH NOCHECK ADD  CONSTRAINT [FK_Batch_Intake] FOREIGN KEY([in_Name])
REFERENCES [dbo].[Intake] ([in_Name])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_Batch_Intake]
GO
ALTER TABLE [dbo].[Batch]  WITH NOCHECK ADD  CONSTRAINT [FK_Batch_Track] FOREIGN KEY([tr_ID])
REFERENCES [dbo].[Track] ([tr_ID])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_Batch_Track]
GO
ALTER TABLE [dbo].[BatchExam]  WITH CHECK ADD  CONSTRAINT [FK_BatchExam_Batch] FOREIGN KEY([ba_ID])
REFERENCES [dbo].[Batch] ([ba_ID])
GO
ALTER TABLE [dbo].[BatchExam] CHECK CONSTRAINT [FK_BatchExam_Batch]
GO
ALTER TABLE [dbo].[BatchExam]  WITH CHECK ADD  CONSTRAINT [FK_BatchExam_Exam] FOREIGN KEY([ex_ID])
REFERENCES [dbo].[Exam] ([ex_ID])
GO
ALTER TABLE [dbo].[BatchExam] CHECK CONSTRAINT [FK_BatchExam_Exam]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Instructor] FOREIGN KEY([mgr_ID])
REFERENCES [dbo].[Instructor] ([ins_ID])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Instructor]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Student] FOREIGN KEY([st_ID])
REFERENCES [dbo].[Student] ([st_ID])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_Student]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course] FOREIGN KEY([cou_ID])
REFERENCES [dbo].[Course] ([cou_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course]
GO
ALTER TABLE [dbo].[ExamQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ExamQuestion_Exam] FOREIGN KEY([ex_ID])
REFERENCES [dbo].[Exam] ([ex_ID])
GO
ALTER TABLE [dbo].[ExamQuestion] CHECK CONSTRAINT [FK_ExamQuestion_Exam]
GO
ALTER TABLE [dbo].[ExamQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ExamQuestion_Questions] FOREIGN KEY([q_ID])
REFERENCES [dbo].[Questions] ([q_ID])
GO
ALTER TABLE [dbo].[ExamQuestion] CHECK CONSTRAINT [FK_ExamQuestion_Questions]
GO
ALTER TABLE [dbo].[ExamResults]  WITH CHECK ADD FOREIGN KEY([cou_ID])
REFERENCES [dbo].[Course] ([cou_ID])
GO
ALTER TABLE [dbo].[ExamResults]  WITH CHECK ADD FOREIGN KEY([st_ID])
REFERENCES [dbo].[Student] ([st_ID])
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Course] FOREIGN KEY([cou_ID])
REFERENCES [dbo].[Course] ([cou_ID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Course]
GO
ALTER TABLE [dbo].[QuestionChoices]  WITH CHECK ADD  CONSTRAINT [FK_QuestionChoices_Questions] FOREIGN KEY([q_ID])
REFERENCES [dbo].[Questions] ([q_ID])
GO
ALTER TABLE [dbo].[QuestionChoices] CHECK CONSTRAINT [FK_QuestionChoices_Questions]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Course] FOREIGN KEY([cou_ID])
REFERENCES [dbo].[Course] ([cou_ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Course]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Batch] FOREIGN KEY([ba_ID])
REFERENCES [dbo].[Batch] ([ba_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Batch]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Branch] FOREIGN KEY([br_ID])
REFERENCES [dbo].[Branch] ([br_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Branch]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Company] FOREIGN KEY([co_ID])
REFERENCES [dbo].[Company] ([com_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Company]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Faculty] FOREIGN KEY([fa_ID])
REFERENCES [dbo].[Faculty] ([fa_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Faculty]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_GraduationProject] FOREIGN KEY([gp_ID])
REFERENCES [dbo].[GraduationProject] ([gp_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_GraduationProject]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Intake] FOREIGN KEY([in_Name])
REFERENCES [dbo].[Intake] ([in_Name])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Intake]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Track] FOREIGN KEY([tr_ID])
REFERENCES [dbo].[Track] ([tr_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Track]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_University] FOREIGN KEY([u_ID])
REFERENCES [dbo].[University] ([u_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_University]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Course] FOREIGN KEY([cou_ID])
REFERENCES [dbo].[Course] ([cou_ID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Course]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Student] FOREIGN KEY([st_ID])
REFERENCES [dbo].[Student] ([st_ID])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Student]
GO
ALTER TABLE [dbo].[StudentExamQuestion]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamQuestion_Exam] FOREIGN KEY([ex_ID])
REFERENCES [dbo].[Exam] ([ex_ID])
GO
ALTER TABLE [dbo].[StudentExamQuestion] CHECK CONSTRAINT [FK_StudentExamQuestion_Exam]
GO
ALTER TABLE [dbo].[StudentExamQuestion]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamQuestion_Questions] FOREIGN KEY([q_ID])
REFERENCES [dbo].[Questions] ([q_ID])
GO
ALTER TABLE [dbo].[StudentExamQuestion] CHECK CONSTRAINT [FK_StudentExamQuestion_Questions]
GO
ALTER TABLE [dbo].[StudentExamQuestion]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamQuestion_Student] FOREIGN KEY([st_ID])
REFERENCES [dbo].[Student] ([st_ID])
GO
ALTER TABLE [dbo].[StudentExamQuestion] CHECK CONSTRAINT [FK_StudentExamQuestion_Student]
GO
ALTER TABLE [dbo].[StudentFreelancing]  WITH CHECK ADD  CONSTRAINT [FK_StudentFreelancing_Freelancing] FOREIGN KEY([fr_ID])
REFERENCES [dbo].[Freelancing] ([fr_ID])
GO
ALTER TABLE [dbo].[StudentFreelancing] CHECK CONSTRAINT [FK_StudentFreelancing_Freelancing]
GO
ALTER TABLE [dbo].[StudentFreelancing]  WITH CHECK ADD  CONSTRAINT [FK_StudentFreelancing_Student] FOREIGN KEY([st_ID])
REFERENCES [dbo].[Student] ([st_ID])
GO
ALTER TABLE [dbo].[StudentFreelancing] CHECK CONSTRAINT [FK_StudentFreelancing_Student]
GO
ALTER TABLE [dbo].[StudentPhone]  WITH CHECK ADD  CONSTRAINT [FK_StudentPhone_Student] FOREIGN KEY([st_ID])
REFERENCES [dbo].[Student] ([st_ID])
GO
ALTER TABLE [dbo].[StudentPhone] CHECK CONSTRAINT [FK_StudentPhone_Student]
GO
ALTER TABLE [dbo].[TrackCourses]  WITH CHECK ADD  CONSTRAINT [FK_TrackCourses_Course] FOREIGN KEY([cou_ID])
REFERENCES [dbo].[Course] ([cou_ID])
GO
ALTER TABLE [dbo].[TrackCourses] CHECK CONSTRAINT [FK_TrackCourses_Course]
GO
ALTER TABLE [dbo].[TrackCourses]  WITH CHECK ADD  CONSTRAINT [FK_TrackCourses_Track] FOREIGN KEY([tr_ID])
REFERENCES [dbo].[Track] ([tr_ID])
GO
ALTER TABLE [dbo].[TrackCourses] CHECK CONSTRAINT [FK_TrackCourses_Track]
GO
