USE [master]
GO
/****** Object:  Database [Manager]    Script Date: 2021/12/20 下午 06:11:34 ******/
CREATE DATABASE [Manager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Manager', FILENAME = N'/var/opt/mssql/data/d1e974dd-028a-4c15-b0a6-87112ff7d55d_Manager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Manager_log', FILENAME = N'/var/opt/mssql/data/d1e974dd-028a-4c15-b0a6-87112ff7d55d_Manager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Manager] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Manager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Manager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Manager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Manager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Manager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Manager] SET ARITHABORT OFF 
GO
ALTER DATABASE [Manager] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Manager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Manager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Manager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Manager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Manager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Manager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Manager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Manager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Manager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Manager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Manager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Manager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Manager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Manager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Manager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Manager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Manager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Manager] SET  MULTI_USER 
GO
ALTER DATABASE [Manager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Manager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Manager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Manager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Manager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Manager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Manager] SET QUERY_STORE = OFF
GO
USE [Manager]
GO
/****** Object:  Table [dbo].[arrange]    Script Date: 2021/12/20 下午 06:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arrange](
	[serial_number] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [char](10) NOT NULL,
	[number] [int] NULL,
	[doctor_name] [nvarchar](10) NOT NULL,
	[day] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[state] [int] NOT NULL,
	[type] [nvarchar](10) NOT NULL,
	[clinic_id] [int] NOT NULL,
	[reserve_state] [int] NOT NULL,
 CONSTRAINT [PK_arrange] PRIMARY KEY CLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clinic]    Script Date: 2021/12/20 下午 06:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clinic](
	[clinic_id] [int] NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[isopen] [int] NOT NULL,
	[division] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
	[services] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[introduction] [nvarchar](50) NOT NULL,
	[password] [char](20) NULL,
	[account] [char](20) NULL,
	[city] [nchar](10) NULL,
 CONSTRAINT [PK_clinic] PRIMARY KEY CLUSTERED 
(
	[clinic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctor]    Script Date: 2021/12/20 下午 06:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](10) NOT NULL,
	[position] [nvarchar](10) NOT NULL,
	[expertise] [nvarchar](10) NOT NULL,
	[education] [nvarchar](10) NOT NULL,
	[experience] [nvarchar](20) NOT NULL,
	[clinic_id] [int] NOT NULL,
 CONSTRAINT [PK_doctor_detail] PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doctorwork]    Script Date: 2021/12/20 下午 06:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctorwork](
	[serial_number] [int] IDENTITY(18,1) NOT NULL,
	[day] [date] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[week] [nvarchar](10) NOT NULL,
	[clinicid] [int] NOT NULL,
 CONSTRAINT [PK_doctorwork_1] PRIMARY KEY CLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emergencycontact]    Script Date: 2021/12/20 下午 06:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emergencycontact](
	[patient_id] [char](10) NOT NULL,
	[name] [nvarchar](10) NOT NULL,
	[phone] [char](10) NOT NULL,
 CONSTRAINT [PK_emergencycontact] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 2021/12/20 下午 06:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[patient_serial] [int] IDENTITY(6,1) NOT NULL,
	[id_number] [char](10) NOT NULL,
	[name] [nvarchar](10) NOT NULL,
	[gender] [nchar](2) NOT NULL,
	[birth] [date] NOT NULL,
	[profession] [nvarchar](10) NOT NULL,
	[address] [nvarchar](20) NOT NULL,
	[phone] [char](10) NOT NULL,
	[physical_condition] [nvarchar](20) NOT NULL,
	[black_time] [int] NOT NULL,
	[password] [varchar](20) NULL,
	[medical_history] [nvarchar](50) NULL,
	[counties] [nchar](10) NOT NULL,
	[mail] [nvarchar](50) NULL,
	[drug_allergy] [nvarchar](50) NULL,
	[clinic_id] [int] NOT NULL,
	[emergencycontact_name] [nvarchar](10) NULL,
	[emergencycontact_phone] [char](10) NULL,
 CONSTRAINT [PK_patient_1] PRIMARY KEY CLUSTERED 
(
	[patient_serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registered]    Script Date: 2021/12/20 下午 06:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registered](
	[doctor_name] [nvarchar](10) NOT NULL,
	[day] [date] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[clinicid] [int] NOT NULL,
	[serial_number] [int] IDENTITY(1,1) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[doctorwork_id] [int] NULL,
	[doctor_id] [int] NOT NULL,
 CONSTRAINT [PK_registered] PRIMARY KEY CLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seedoctor]    Script Date: 2021/12/20 下午 06:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seedoctor](
	[serial_number_seedoctor] [int] IDENTITY(1,1) NOT NULL,
	[day] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[patient_id] [char](10) NOT NULL,
	[doctor_id] [int] NOT NULL,
	[gotoclinictime] [time](7) NOT NULL,
	[state] [int] NOT NULL,
	[type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_seedoctor] PRIMARY KEY CLUSTERED 
(
	[serial_number_seedoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[arrange] ON 

INSERT [dbo].[arrange] ([serial_number], [patient_id], [number], [doctor_name], [day], [time], [state], [type], [clinic_id], [reserve_state]) VALUES (87, N'C113067558', 11, N'周淑萍', CAST(N'2021-12-01' AS Date), CAST(N'15:00:00' AS Time), 0, N'線上預約', 1, 0)
INSERT [dbo].[arrange] ([serial_number], [patient_id], [number], [doctor_name], [day], [time], [state], [type], [clinic_id], [reserve_state]) VALUES (91, N'A123456789', 17, N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'18:20:00' AS Time), 0, N'線上預約', 1, 0)
INSERT [dbo].[arrange] ([serial_number], [patient_id], [number], [doctor_name], [day], [time], [state], [type], [clinic_id], [reserve_state]) VALUES (116, N'A123456789', 12, N'謝家豪', CAST(N'2021-12-20' AS Date), CAST(N'15:30:00' AS Time), 0, N'線上預約', 1, 0)
INSERT [dbo].[arrange] ([serial_number], [patient_id], [number], [doctor_name], [day], [time], [state], [type], [clinic_id], [reserve_state]) VALUES (117, N'A123456789', 9, N'謝家豪', CAST(N'2021-12-20' AS Date), CAST(N'14:00:00' AS Time), 0, N'線上預約', 1, 0)
INSERT [dbo].[arrange] ([serial_number], [patient_id], [number], [doctor_name], [day], [time], [state], [type], [clinic_id], [reserve_state]) VALUES (118, N'A123456789', 10, N'謝家豪', CAST(N'2021-12-20' AS Date), CAST(N'14:30:00' AS Time), 0, N'線上預約', 1, 0)
INSERT [dbo].[arrange] ([serial_number], [patient_id], [number], [doctor_name], [day], [time], [state], [type], [clinic_id], [reserve_state]) VALUES (119, N'A123456789', 9, N'謝家豪', CAST(N'2021-12-20' AS Date), CAST(N'14:00:00' AS Time), 0, N'線上預約', 1, 0)
SET IDENTITY_INSERT [dbo].[arrange] OFF
GO
INSERT [dbo].[clinic] ([clinic_id], [name], [isopen], [division], [phone], [services], [address], [introduction], [password], [account], [city]) VALUES (0, N'管理員', 0, N'管理員', N'0000000000', N'管理員', N'管理員', N'管理員', N'1234                ', N'ADM0000             ', N'屏東縣       ')
INSERT [dbo].[clinic] ([clinic_id], [name], [isopen], [division], [phone], [services], [address], [introduction], [password], [account], [city]) VALUES (1, N'博醫診所', 0, N'牙科', N'0912345678', N'牙齒矯正', N'屏東縣屏東市民生東路51號', N'介紹', N'0000                ', N'QWE8888             ', N'屏東縣       ')
INSERT [dbo].[clinic] ([clinic_id], [name], [isopen], [division], [phone], [services], [address], [introduction], [password], [account], [city]) VALUES (2, N'伯伯診所', 1, N'婦產科', N'0911111111', N'婦女疾病', N'高雄市左營區興新二路4-1號', N'介紹', N'0000                ', N'WER8888             ', N'高雄市       ')
INSERT [dbo].[clinic] ([clinic_id], [name], [isopen], [division], [phone], [services], [address], [introduction], [password], [account], [city]) VALUES (3, N'黑光診所', 0, N'眼科', N'0985238451', N'近視雷射', N'高雄市楠梓區68號', N'高醫體系', N'7777                ', N'EYE8888             ', N'高雄市       ')
INSERT [dbo].[clinic] ([clinic_id], [name], [isopen], [division], [phone], [services], [address], [introduction], [password], [account], [city]) VALUES (4, N'永明診所', 0, N'眼科', N'0985238451', N'近視雷射', N'台中市大雅區80號', N'高醫體系', N'7733                ', N'EYE8855             ', N'台中市       ')
GO
SET IDENTITY_INSERT [dbo].[doctor] ON 

INSERT [dbo].[doctor] ([doctor_id], [name], [position], [expertise], [education], [experience], [clinic_id]) VALUES (1, N'周淑萍', N'醫生', N'家醫科', N'台大醫科', N'國立臺灣大學醫學院', 1)
INSERT [dbo].[doctor] ([doctor_id], [name], [position], [expertise], [education], [experience], [clinic_id]) VALUES (2, N'林妙穎', N'主任', N'普通外科', N'台大醫科', N'三軍總醫院', 1)
INSERT [dbo].[doctor] ([doctor_id], [name], [position], [expertise], [education], [experience], [clinic_id]) VALUES (3, N'謝家豪', N'醫生', N'心臟科', N'台大醫科', N'臺北榮民總醫院', 1)
INSERT [dbo].[doctor] ([doctor_id], [name], [position], [expertise], [education], [experience], [clinic_id]) VALUES (4, N'何瑞瑩', N'醫生', N'心胸外科', N'台大醫科', N'國泰綜合醫院', 1)
INSERT [dbo].[doctor] ([doctor_id], [name], [position], [expertise], [education], [experience], [clinic_id]) VALUES (5, N'張方州', N'醫生', N'婦產科', N'台大醫科', N'高雄長庚紀念醫院', 1)
SET IDENTITY_INSERT [dbo].[doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[doctorwork] ON 

INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (68, CAST(N'2021-11-26' AS Date), 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期五', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (69, CAST(N'2021-11-26' AS Date), 1, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), N'星期五', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (70, CAST(N'2021-11-26' AS Date), 1, CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'星期五', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (71, CAST(N'2021-11-26' AS Date), 1, CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'星期五', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (72, CAST(N'2021-11-27' AS Date), 1, CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'星期六', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (74, CAST(N'2021-11-27' AS Date), 2, CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time), N'星期六', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (75, CAST(N'2021-11-26' AS Date), 2, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期五', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (80, CAST(N'2021-11-27' AS Date), 4, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期六', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (81, CAST(N'2021-11-27' AS Date), 5, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期六', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (82, CAST(N'2021-11-29' AS Date), 5, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期一', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (83, CAST(N'2021-11-27' AS Date), 5, CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time), N'星期六', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (84, CAST(N'2021-11-26' AS Date), 3, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), N'星期五', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (85, CAST(N'2021-11-26' AS Date), 2, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), N'星期五', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (86, CAST(N'2021-11-28' AS Date), 2, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期日', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (87, CAST(N'2021-11-30' AS Date), 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期二', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (88, CAST(N'2021-11-29' AS Date), 4, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), N'星期一', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (89, CAST(N'2021-11-29' AS Date), 1, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), N'星期一', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (90, CAST(N'2021-11-29' AS Date), 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期一', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (91, CAST(N'2021-11-30' AS Date), 3, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期二', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (92, CAST(N'2021-11-30' AS Date), 4, CAST(N'11:50:00' AS Time), CAST(N'18:00:00' AS Time), N'星期二', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (94, CAST(N'2021-12-19' AS Date), 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'星期日', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (95, CAST(N'2021-12-21' AS Date), 2, CAST(N'10:00:00' AS Time), CAST(N'15:00:00' AS Time), N'星期二', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (96, CAST(N'2021-12-22' AS Date), 2, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), N'星期三', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (97, CAST(N'2021-12-23' AS Date), 2, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), N'星期四', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (98, CAST(N'2021-12-24' AS Date), 2, CAST(N'09:00:00' AS Time), CAST(N'15:00:00' AS Time), N'星期五', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (99, CAST(N'2021-12-25' AS Date), 3, CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time), N'星期六', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (100, CAST(N'2021-12-20' AS Date), 4, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), N'星期一', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (101, CAST(N'2021-12-20' AS Date), 3, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), N'星期一', 1)
INSERT [dbo].[doctorwork] ([serial_number], [day], [doctor_id], [start_time], [end_time], [week], [clinicid]) VALUES (102, CAST(N'2021-12-21' AS Date), 1, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), N'星期二', 1)
SET IDENTITY_INSERT [dbo].[doctorwork] OFF
GO
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'A123456789', N'王偉林', N'0956679270')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'A123555333', N'陳家玉', N'0922333444')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'A223456789', N'吳嗆', N'0934222222')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'C113067558', N'黃詩康', N'0949810312')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E115112345', N'楊賢中', N'0923896234')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E122444555', N'黃啟裕', N'0977883322')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E123555444', N'楊家', N'0934221222')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E126845678', N'陳大發', N'0905042203')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E128456333', N'王永眼', N'0903052233')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E128456377', N'陳大發', N'0905042203')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E128456777', N'', N'          ')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E128456888', N'五條悟', N'0905042203')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E152345678', N'黃浴池', N'0931243562')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E221123456', N'吳世民', N'0977223456')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E223123456', N'蔡家明', N'0934125345')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E225112345', N'楊賢中', N'0943896234')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'E234121623', N'王大明', N'0912345678')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'F211068141', N'李珍歡', N'0945480550')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'M211471787', N'蔡宜彬', N'0900407444')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'R208216347', N'王亭君', N'0999055125')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'S129648512', N'王啟祥', N'0955065470')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'S888777222', N'陳昱仁', N'0977666222')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'W226484236', N'王永漢', N'0905078860')
INSERT [dbo].[emergencycontact] ([patient_id], [name], [phone]) VALUES (N'Z123456789', N'未填', N'未填      ')
GO
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (1, N'A123456789', N'陳昇嗨', N'男 ', CAST(N'1999-03-12' AS Date), N'學生', N'台中市中區台灣大道一段17巷13號', N'0987654321', N'良好', 0, N'0000', N'糖尿病', N'台中市       ', N'1111@gmail.com', N'嗎啡', 1, N'王偉林', N'0956679270')
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (2, N'C113067558', N'張文豪', N'女 ', CAST(N'1929-06-27' AS Date), N'品管人員', N'基隆市安樂區基金三路142號', N'0904702428', N'良好', 0, N'2222', N'無', N'基隆市       ', N'3333@gmail.com', N'高根', 1, N'王偉林', N'0956679270')
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (3, N'F211068141', N'謝佩皓', N'女 ', CAST(N'1993-03-28' AS Date), N'鐵塔架設人員', N'新北市板橋區297號', N'0995728882', N'良好', 0, N'4444', N'無', N'新北市       ', N'5555@gmail.com', N'古柯鹼', 1, N'王偉林', N'0956679270')
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (4, N'M211471787', N'張惠淑', N'男 ', CAST(N'1992-08-24' AS Date), N'資源回收站分類人員', N'南投縣南投市彰南路二段66巷29號4樓', N'0901017489', N'良好', 0, N'3333', N'無', N'南投縣       ', N'4444@gmail.com', N'大麻', 1, N'王偉林', N'0956679270')
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (5, N'R208216347', N'周惠美', N'男 ', CAST(N'1981-04-25' AS Date), N'鑽油井工人', N'台南市北區大興街41號', N'0900676844', N'良好', 0, N'1111', N'無', N'臺南縣       ', N'2222@gmail.com', N'海洛因', 1, N'王偉林', N'0956679270')
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (14, N'W226484236', N'陳偉英', N'女 ', CAST(N'1989-08-05' AS Date), N'運動員', N'高雄市楠梓區25號', N'0905048805', N'良好', 0, NULL, N'未填', N'高雄市       ', N'trfyg95@gmail.com', N'普拿藤', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (15, N'E128456333', N'路名為', N'男 ', CAST(N'1997-05-06' AS Date), N'運動員', N'高雄市楠梓區88號', N'0903042222', N'良好', 0, NULL, N'無', N'高雄市       ', N'trfdg55@gmail.com', N'普拿藤', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (16, N'E128456777', N'路大為', N'男 ', CAST(N'1997-05-06' AS Date), N'運動員', N'高雄市楠梓區88號', N'0903042222', N'良好', 0, NULL, N'', N'高雄市       ', N'trfdg55@gmail.com', N'', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (18, N'S888777222', N'陳裕璋', N'女 ', CAST(N'1998-12-27' AS Date), N'畫家', N'屏東市美荷香內埔鎮188號之6', N'0933123456', N'良好', 0, NULL, N'無', N'屏東市       ', N's25363333@gmai.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (24, N'E234121623', N'王小明', N'女 ', CAST(N'1986-12-12' AS Date), N'老師', N'屏東縣屏東市民生三路123巷1之9號', N'0987654321', N'良好', 0, N'ss0000', N'無', N'屏東縣       ', N'asd1234@gmail.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (25, N'E223123456', N'蔡玉珍', N'女 ', CAST(N'1986-12-12' AS Date), N'歌手', N'屏東縣屏東市民生三路222巷5號之5', N'0944312456', N'良好', 0, N'ss0000', N'無', N'屏東縣       ', N'aqww1234@gmail.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (26, N'E152345678', N'黃嘉明', N'男 ', CAST(N'1986-12-12' AS Date), N'歌手', N'高雄市三民區文強二路1之1號', N'0953162777', N'良好', 0, N'ss0000', N'無', N'高雄市       ', N'aassd1234@gmail.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (27, N'A123555333', N'陳一名', N'男 ', CAST(N'1986-11-12' AS Date), N'舞蹈家', N'屏東縣屏東市民生三路255巷5號之5', N'0911223456', N'良好', 0, N'ss0000', N'無', N'屏東縣       ', N'aq11ww1234@gmail.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (28, N'E122444555', N'黃大正', N'男 ', CAST(N'1976-12-12' AS Date), N'保險人員', N'屏東縣屏東市民生二路222巷5號之5', N'0943425169', N'良好', 0, N'ss0000', N'無', N'屏東縣       ', N'aq11ww1234@gmail.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (35, N'E225112345', N'楊與明', N'女 ', CAST(N'1998-12-27' AS Date), N'分析師', N'屏東市屏東市安心四橫巷188號之6', N'0933123456', N'良好', 0, N'1111', N'無', N'屏東市       ', N's123890@gmai.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (36, N'E115112345', N'楊與明', N'男 ', CAST(N'1998-12-27' AS Date), N'分析師', N'屏東市屏東市安心四橫巷188號之6', N'0944123456', N'良好', 0, NULL, N'無', N'屏東市       ', N's123890@gmai.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (40, N'E128456888', N'蔡明輝', N'男 ', CAST(N'1998-05-23' AS Date), N'學生', N'台中市太平區5號', N'0903052202', N'良好', 0, N'3333', N'', N'台中市       ', N'thd@gmail.com', N'', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (41, N'E126845678', N'王田壘', N'男 ', CAST(N'1998-05-23' AS Date), N'學生', N'台中市沙鹿區50號', N'0903052204', N'良好', 0, N'8888', N'', N'台中市       ', N'thd@gmail.com', N'', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (42, N'E221123456', N'吳世降', N'女 ', CAST(N'1976-12-12' AS Date), N'印刷廠', N'屏東縣屏東市民生五路11巷1之5號', N'0911223344', N'良好', 0, N'ss0000', N'無', N'屏東縣       ', N'aabb1234@gmail.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (43, N'A223456789', N'吳嗨嗨', N'女 ', CAST(N'1976-11-12' AS Date), N'歌手', N'屏東縣屏東市安東尼222巷5號之5', N'0954312456', N'良好', 0, N's000', N'無', N'屏東縣       ', N'a777@gmail.com', N'無', 1, NULL, NULL)
INSERT [dbo].[patient] ([patient_serial], [id_number], [name], [gender], [birth], [profession], [address], [phone], [physical_condition], [black_time], [password], [medical_history], [counties], [mail], [drug_allergy], [clinic_id], [emergencycontact_name], [emergencycontact_phone]) VALUES (44, N'E123555444', N'楊育豪', N'男 ', CAST(N'1996-12-12' AS Date), N'舞蹈家', N'屏東縣內埔鬱鬱愈123巷1之5號', N'0999654321', N'良好', 0, N'aa00002', N'無', N'屏東縣       ', N'ac234@gmail.com', N'無', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[patient] OFF
GO
SET IDENTITY_INSERT [dbo].[registered] ON 

INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-29' AS Date), CAST(N'10:00:00' AS Time), 1, 1, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-29' AS Date), CAST(N'11:00:00' AS Time), 1, 2, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-29' AS Date), CAST(N'10:30:00' AS Time), 1, 3, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-29' AS Date), CAST(N'11:30:00' AS Time), 1, 4, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'謝家豪', CAST(N'2021-11-30' AS Date), CAST(N'10:00:00' AS Time), 1, 5, CAST(N'20:00:00' AS Time), NULL, 3)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'謝家豪', CAST(N'2021-11-30' AS Date), CAST(N'11:00:00' AS Time), 1, 6, CAST(N'20:00:00' AS Time), NULL, 3)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'謝家豪', CAST(N'2021-11-30' AS Date), CAST(N'10:30:00' AS Time), 1, 7, CAST(N'20:00:00' AS Time), NULL, 3)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'謝家豪', CAST(N'2021-11-30' AS Date), CAST(N'11:30:00' AS Time), 1, 8, CAST(N'20:00:00' AS Time), NULL, 3)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'12:00:00' AS Time), 1, 9, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'13:00:00' AS Time), 1, 10, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'14:00:00' AS Time), 1, 11, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'15:00:00' AS Time), 1, 12, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'16:00:00' AS Time), 1, 13, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'17:00:00' AS Time), 1, 14, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'12:30:00' AS Time), 1, 15, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'13:30:00' AS Time), 1, 16, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'14:30:00' AS Time), 1, 17, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'15:30:00' AS Time), 1, 18, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'16:30:00' AS Time), 1, 19, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'何瑞瑩', CAST(N'2021-11-30' AS Date), CAST(N'17:30:00' AS Time), 1, 20, CAST(N'20:00:00' AS Time), NULL, 4)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'10:00:00' AS Time), 1, 21, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'11:00:00' AS Time), 1, 22, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'12:00:00' AS Time), 1, 23, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'13:00:00' AS Time), 1, 24, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'14:00:00' AS Time), 1, 25, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'15:00:00' AS Time), 1, 26, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'16:00:00' AS Time), 1, 27, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'10:30:00' AS Time), 1, 28, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'11:30:00' AS Time), 1, 29, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'12:30:00' AS Time), 1, 30, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'13:30:00' AS Time), 1, 31, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'14:30:00' AS Time), 1, 32, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'15:30:00' AS Time), 1, 33, CAST(N'20:00:00' AS Time), NULL, 1)
INSERT [dbo].[registered] ([doctor_name], [day], [start_time], [clinicid], [serial_number], [end_time], [doctorwork_id], [doctor_id]) VALUES (N'周淑萍', CAST(N'2021-11-26' AS Date), CAST(N'16:30:00' AS Time), 1, 34, CAST(N'20:00:00' AS Time), NULL, 1)
SET IDENTITY_INSERT [dbo].[registered] OFF
GO
SET IDENTITY_INSERT [dbo].[seedoctor] ON 

INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (2, CAST(N'2021-08-28' AS Date), CAST(N'10:00:00' AS Time), N'R208216347', 2, CAST(N'10:00:00' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (3, CAST(N'2021-12-29' AS Date), CAST(N'13:00:00' AS Time), N'C113067558', 3, CAST(N'13:00:00' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (4, CAST(N'2021-11-02' AS Date), CAST(N'13:00:00' AS Time), N'C113067558', 2, CAST(N'13:00:00' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (5, CAST(N'2021-09-11' AS Date), CAST(N'18:00:00' AS Time), N'F211068141', 4, CAST(N'18:00:00' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (10, CAST(N'2021-11-04' AS Date), CAST(N'12:00:00' AS Time), N'C113067558', 1, CAST(N'14:26:28' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (12, CAST(N'2021-11-07' AS Date), CAST(N'15:00:00' AS Time), N'A123456789', 1, CAST(N'14:44:40' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (13, CAST(N'2021-11-07' AS Date), CAST(N'15:00:00' AS Time), N'A123456789', 1, CAST(N'22:04:43' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (20, CAST(N'2021-11-07' AS Date), CAST(N'10:30:00' AS Time), N'F211068141', 1, CAST(N'23:43:08' AS Time), 2, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (21, CAST(N'2021-11-07' AS Date), CAST(N'12:00:00' AS Time), N'C113067558', 1, CAST(N'23:43:11' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (22, CAST(N'2021-11-07' AS Date), CAST(N'23:28:52' AS Time), N'R208216347', 1, CAST(N'23:43:13' AS Time), 1, N'現場掛號')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (23, CAST(N'2021-11-08' AS Date), CAST(N'23:35:23' AS Time), N'M211471787', 1, CAST(N'01:15:04' AS Time), 1, N'現場掛號')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (24, CAST(N'2021-11-08' AS Date), CAST(N'23:28:52' AS Time), N'R208216347', 1, CAST(N'01:15:20' AS Time), 1, N'現場掛號')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (25, CAST(N'2021-11-08' AS Date), CAST(N'10:30:00' AS Time), N'F211068141', 1, CAST(N'20:35:48' AS Time), 2, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (28, CAST(N'2021-11-14' AS Date), CAST(N'12:00:00' AS Time), N'C113067558', 1, CAST(N'23:08:53' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (30, CAST(N'2021-12-19' AS Date), CAST(N'12:00:00' AS Time), N'A123456789', 1, CAST(N'12:12:43' AS Time), 1, N'線上預約')
INSERT [dbo].[seedoctor] ([serial_number_seedoctor], [day], [time], [patient_id], [doctor_id], [gotoclinictime], [state], [type]) VALUES (35, CAST(N'2021-12-20' AS Date), CAST(N'10:21:21' AS Time), N'C113067558', 1, CAST(N'12:27:31' AS Time), 1, N'現場掛號')
SET IDENTITY_INSERT [dbo].[seedoctor] OFF
GO
ALTER TABLE [dbo].[doctor]  WITH CHECK ADD  CONSTRAINT [FK_doctor_clinic] FOREIGN KEY([clinic_id])
REFERENCES [dbo].[clinic] ([clinic_id])
GO
ALTER TABLE [dbo].[doctor] CHECK CONSTRAINT [FK_doctor_clinic]
GO
ALTER TABLE [dbo].[doctorwork]  WITH CHECK ADD  CONSTRAINT [FK_doctorwork_doctor] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[doctorwork] CHECK CONSTRAINT [FK_doctorwork_doctor]
GO
ALTER TABLE [dbo].[seedoctor]  WITH CHECK ADD  CONSTRAINT [FK_seedoctor_doctor] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[seedoctor] CHECK CONSTRAINT [FK_seedoctor_doctor]
GO
USE [master]
GO
ALTER DATABASE [Manager] SET  READ_WRITE 
GO
