USE [master]
GO
/****** Object:  Database [3TierHospitalFinder]    Script Date: 27-03-2020 15:55:14 ******/
CREATE DATABASE [3TierHospitalFinder] ON  PRIMARY 
( NAME = N'3TierHospitalFinder', FILENAME = N'E:\DATABASE_HOSPITALFINDER\27_03_2020\3TierHospitalFinder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'3TierHospitalFinder_log', FILENAME = N'E:\DATABASE_HOSPITALFINDER\27_03_2020\3TierHospitalFinder_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [3TierHospitalFinder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [3TierHospitalFinder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ARITHABORT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [3TierHospitalFinder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [3TierHospitalFinder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [3TierHospitalFinder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [3TierHospitalFinder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [3TierHospitalFinder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [3TierHospitalFinder] SET  MULTI_USER 
GO
ALTER DATABASE [3TierHospitalFinder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [3TierHospitalFinder] SET DB_CHAINING OFF 
GO
USE [3TierHospitalFinder]
GO
/****** Object:  Table [dbo].[MST_Category]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_HospitalCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_CategoryType]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_CategoryType](
	[CategoryTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryType] [varchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_CategoryType] PRIMARY KEY CLUSTERED 
(
	[CategoryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_City]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[STDCode] [varchar](10) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_LOC_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_Hospital]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Hospital](
	[HospitalID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [varchar](150) NOT NULL,
	[CityID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CategoryTypeID] [int] NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[MobileNumber] [varchar](100) NULL,
	[TelePhoneNumber] [varchar](100) NULL,
	[Fax] [varchar](100) NULL,
	[Website] [varchar](100) NULL,
	[EmailID] [varchar](100) NULL,
	[AmbulancePhoneNumber] [varchar](100) NULL,
	[EmergencyNumber] [varchar](100) NULL,
	[HospitalImage] [varchar](500) NULL,
	[MapCode] [varchar](5000) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_State]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_MST_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEC_User]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEC_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SEC_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MST_Category] ON 

INSERT [dbo].[MST_Category] ([CategoryID], [CategoryName], [CreationDate], [ModificationDate], [UserID]) VALUES (1, N'Orthopedic', CAST(N'2020-03-08T18:04:55.610' AS DateTime), CAST(N'2020-03-08T18:04:55.610' AS DateTime), 1)
INSERT [dbo].[MST_Category] ([CategoryID], [CategoryName], [CreationDate], [ModificationDate], [UserID]) VALUES (2, N'Cancer', CAST(N'2020-03-08T18:05:01.743' AS DateTime), CAST(N'2020-03-08T18:05:01.743' AS DateTime), 1)
INSERT [dbo].[MST_Category] ([CategoryID], [CategoryName], [CreationDate], [ModificationDate], [UserID]) VALUES (4, N'Allopathic', CAST(N'2020-03-08T18:05:08.827' AS DateTime), CAST(N'2020-03-08T18:05:08.827' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MST_Category] OFF
SET IDENTITY_INSERT [dbo].[MST_CategoryType] ON 

INSERT [dbo].[MST_CategoryType] ([CategoryTypeID], [CategoryType], [CreationDate], [ModificationDate], [UserID]) VALUES (1, N'Government', CAST(N'2020-03-08T20:04:28.540' AS DateTime), CAST(N'2020-03-08T20:04:28.540' AS DateTime), 1)
INSERT [dbo].[MST_CategoryType] ([CategoryTypeID], [CategoryType], [CreationDate], [ModificationDate], [UserID]) VALUES (2, N'Private', CAST(N'2020-03-08T20:05:42.140' AS DateTime), CAST(N'2020-03-08T20:05:42.140' AS DateTime), 1)
INSERT [dbo].[MST_CategoryType] ([CategoryTypeID], [CategoryType], [CreationDate], [ModificationDate], [UserID]) VALUES (3, N'Private/Government', CAST(N'2020-03-08T20:05:50.527' AS DateTime), CAST(N'2020-03-08T20:05:50.527' AS DateTime), 1)
INSERT [dbo].[MST_CategoryType] ([CategoryTypeID], [CategoryType], [CreationDate], [ModificationDate], [UserID]) VALUES (4, N'Other', CAST(N'2020-03-08T20:05:53.847' AS DateTime), CAST(N'2020-03-08T20:05:53.847' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MST_CategoryType] OFF
SET IDENTITY_INSERT [dbo].[MST_City] ON 

INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (12, 29, N'Bidhgunj', N'031928', CAST(N'2020-03-08T16:51:54.820' AS DateTime), CAST(N'2020-03-08T16:51:54.820' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (13, 29, N'Campbollbay', N'031926', CAST(N'2020-03-08T16:52:27.077' AS DateTime), CAST(N'2020-03-08T16:52:27.077' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (14, 29, N'Car Nicobar', N'03193', CAST(N'2020-03-08T16:52:42.553' AS DateTime), CAST(N'2020-03-08T16:52:42.553' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (15, 29, N'Chouldari', N'03192', CAST(N'2020-03-08T16:52:57.353' AS DateTime), CAST(N'2020-03-08T16:52:57.353' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (16, 29, N'Diglipur', N'031927', CAST(N'2020-03-08T16:53:17.060' AS DateTime), CAST(N'2020-03-08T16:53:17.060' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (17, 29, N'Ferrangannj', N'031928', CAST(N'2020-03-08T16:53:27.117' AS DateTime), CAST(N'2020-03-08T16:53:27.117' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (18, 29, N'Garcachazma', N'031928', CAST(N'2020-03-08T16:53:41.497' AS DateTime), CAST(N'2020-03-08T16:53:41.497' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (19, 29, N'Guptapara', N'031928', CAST(N'2020-03-08T16:53:56.253' AS DateTime), CAST(N'2020-03-08T16:53:56.253' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (20, 29, N'Havclock', N'031928', CAST(N'2020-03-08T16:54:09.873' AS DateTime), CAST(N'2020-03-08T16:54:09.873' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (21, 29, N'Hutbay', N'031928', CAST(N'2020-03-08T16:54:22.203' AS DateTime), CAST(N'2020-03-08T16:54:22.203' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (22, 29, N'Kadamtala', N'031927', CAST(N'2020-03-08T16:54:33.310' AS DateTime), CAST(N'2020-03-08T16:54:33.310' AS DateTime), 3)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (23, 1, N'Rajkot', N'0281', CAST(N'2020-03-09T10:39:43.477' AS DateTime), CAST(N'2020-03-09T10:39:43.477' AS DateTime), 1)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (24, 1, N'Surat', N'261', CAST(N'2020-03-21T13:10:55.823' AS DateTime), CAST(N'2020-03-21T13:10:55.823' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (25, 2, N'Vijayawada', N'0866', CAST(N'2020-03-21T13:49:07.897' AS DateTime), CAST(N'2020-03-21T13:49:07.897' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (26, 14, N'Pune', N'020', CAST(N'2020-03-21T13:56:33.593' AS DateTime), CAST(N'2020-03-21T13:56:33.593' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (28, 28, N'Hooghly', N'033', CAST(N'2020-03-21T14:01:21.743' AS DateTime), CAST(N'2020-03-21T14:01:21.743' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (29, 23, N'Salem', N'0427', CAST(N'2020-03-21T14:05:20.527' AS DateTime), CAST(N'2020-03-21T14:05:20.527' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (30, 32, N'Delhi', N'011', CAST(N'2020-03-21T14:09:43.343' AS DateTime), CAST(N'2020-03-21T14:09:43.343' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (32, 3, N'Tawang', N'03794', CAST(N'2020-03-21T14:27:24.860' AS DateTime), CAST(N'2020-03-21T14:27:24.860' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (33, 29, N'South Andaman', N'03192', CAST(N'2020-03-21T14:37:09.373' AS DateTime), CAST(N'2020-03-21T14:37:09.373' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (34, 11, N'Bengaluru', N'080', CAST(N'2020-03-21T14:42:28.150' AS DateTime), CAST(N'2020-03-21T14:42:28.150' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (35, 1, N'Kutch', N'02834', CAST(N'2020-03-21T15:21:11.120' AS DateTime), CAST(N'2020-03-21T15:21:11.120' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (36, 1, N'Dwarka', N'2892', CAST(N'2020-03-21T15:21:37.243' AS DateTime), CAST(N'2020-03-21T15:21:37.243' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (37, 1, N'Porbandar', N'286', CAST(N'2020-03-21T15:21:56.020' AS DateTime), CAST(N'2020-03-21T15:21:56.020' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (38, 1, N'Jamnagar', N'288', CAST(N'2020-03-21T15:22:10.693' AS DateTime), CAST(N'2020-03-21T15:22:10.693' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (39, 1, N'Junagadh', N'285', CAST(N'2020-03-21T15:22:28.923' AS DateTime), CAST(N'2020-03-21T15:22:28.923' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (40, 1, N'Bhavnagar', N'278', CAST(N'2020-03-21T15:22:45.497' AS DateTime), CAST(N'2020-03-21T15:22:45.497' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (41, 1, N'Ahmedabad', N'79', CAST(N'2020-03-21T15:22:59.877' AS DateTime), CAST(N'2020-03-21T15:22:59.877' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (42, 1, N'Anand', N'2692', CAST(N'2020-03-21T15:23:15.487' AS DateTime), CAST(N'2020-03-21T15:23:15.487' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (43, 1, N'Gandhinagar', N'79', CAST(N'2020-03-21T15:23:33.347' AS DateTime), CAST(N'2020-03-21T15:23:33.347' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (44, 1, N'Bharuch', N'2642', CAST(N'2020-03-21T15:23:58.633' AS DateTime), CAST(N'2020-03-21T15:23:58.633' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (45, 1, N'Navsari', N'02637', CAST(N'2020-03-21T15:24:17.533' AS DateTime), CAST(N'2020-03-21T15:24:17.533' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (46, 1, N'Valsad', N'02632', CAST(N'2020-03-21T15:24:34.923' AS DateTime), CAST(N'2020-03-21T15:24:34.923' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (47, 1, N'Amreli', N'02792', CAST(N'2020-03-21T15:24:49.780' AS DateTime), CAST(N'2020-03-21T15:24:49.780' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (48, 1, N'Botad', N'02849', CAST(N'2020-03-21T15:25:04.730' AS DateTime), CAST(N'2020-03-21T15:25:04.730' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (49, 1, N'Surendranagar', N'2752', CAST(N'2020-03-21T15:25:19.070' AS DateTime), CAST(N'2020-03-21T15:25:19.070' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (50, 1, N'Patan', N'02766', CAST(N'2020-03-21T15:25:55.357' AS DateTime), CAST(N'2020-03-21T15:25:55.357' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (51, 1, N'Kheda', N'02694', CAST(N'2020-03-21T15:26:10.350' AS DateTime), CAST(N'2020-03-21T15:26:10.350' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (52, 1, N'Mehsana', N'02762', CAST(N'2020-03-21T15:26:24.607' AS DateTime), CAST(N'2020-03-21T15:26:24.607' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (54, 1, N'Mahisagar', N'02674', CAST(N'2020-03-21T15:26:51.490' AS DateTime), CAST(N'2020-03-21T15:26:51.490' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (55, 1, N'Panchmahal', N'02672', CAST(N'2020-03-21T15:27:05.077' AS DateTime), CAST(N'2020-03-21T15:27:05.077' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (56, 1, N'Dahod', N'02673', CAST(N'2020-03-21T15:27:25.723' AS DateTime), CAST(N'2020-03-21T15:27:25.723' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (57, 1, N'Vadodara', N'0265', CAST(N'2020-03-21T15:27:37.963' AS DateTime), CAST(N'2020-03-21T15:27:37.963' AS DateTime), 4)
INSERT [dbo].[MST_City] ([CityID], [StateID], [CityName], [STDCode], [CreationDate], [ModificationDate], [UserID]) VALUES (59, 1, N'Chhota Udaipur', N'02669', CAST(N'2020-03-21T15:28:09.223' AS DateTime), CAST(N'2020-03-21T15:28:09.223' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[MST_City] OFF
SET IDENTITY_INSERT [dbo].[MST_Hospital] ON 

INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (2, N'Dr Nivedyas Kerala Ayurveda Vaidyam', 25, 1, 2, N'39-7-11, Anjaneya Panthulu Street  Near Malabar Gold, Labbipet  M.G. Road, Vijayawada - 520010', N'91-8790-222448', NULL, NULL, N'https://drnivedyasayurveda.com/', N'drnivedyasayurveda@gmail.com', NULL, N'91-9291234000', N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', NULL, CAST(N'2020-03-21T13:52:49.420' AS DateTime), CAST(N'2020-03-21T13:52:49.420' AS DateTime), 4)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (3, N'Lifepoint Hospital', 26, 1, 2, N'145/1, Mumbai – Bangalore Highway, Near Hotel Sayaji, Bhumkar Chowk, Wakad, Pune - 411057, Maharashtra', N'91-7290047048', NULL, NULL, N'http://www.lifepointhospital.in/', N'enquiry@lifepointhospital.in', NULL, N'91-020-66434366', N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', N'https://g.page/lifepointhospital?share', CAST(N'2020-03-21T13:58:05.970' AS DateTime), CAST(N'2020-03-26T20:01:30.500' AS DateTime), 4)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (4, N'Bose Emlc Eye Hospital', 28, 4, 2, N'EMLC, Near Old Launch Ghat, Barabazar, Chinsurah, Hooghly - 712101, West Bengal', N'091-9874879507', NULL, NULL, N'https://www.boseemlc.com/', N'boseemlc@gmail.com', NULL, N'91-033-26805025', N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', NULL, CAST(N'2020-03-21T14:02:53.157' AS DateTime), CAST(N'2020-03-21T14:02:53.157' AS DateTime), 4)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (5, N'Androone Men''s Health Hospital', 29, 4, 2, N'No 1, Johnsonpet Road, Behind Rudramoorthy Hospital, Near Gandhi Road Bus Stop, Hasthampatti, Salem - 636007, Tamil Nadu', N'91-9655504041', NULL, NULL, N'www.androone.com', N'androarunkarthik@gmail.com', NULL, N'91-0427-4041440', N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', NULL, CAST(N'2020-03-21T14:07:27.107' AS DateTime), CAST(N'2020-03-26T18:12:03.367' AS DateTime), 4)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (6, N'Bansal Global Hospital', 30, 4, 2, N'C-10 Ramgarh, Near Jahangirpuri Metro Station, Delhi - 110033, Delhi', NULL, N'011-27636400', NULL, N'https://www.bansalglobalhospital.com', N'seo@bansalglobalhospital.com', NULL, NULL, N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', NULL, CAST(N'2020-03-21T14:11:32.603' AS DateTime), CAST(N'2020-03-21T14:11:32.603' AS DateTime), 4)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (7, N'Elite Hospital', 34, 4, 2, N'RG Arcade, Sarjapur Road, Anekal Taluk, Attibele, Bengaluru - 562107, Karnataka', N'8431922016', NULL, NULL, N'https://www.elitecarehospital.com/', N'elitehospital19@gmail.com', NULL, NULL, N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', NULL, CAST(N'2020-03-21T14:43:56.663' AS DateTime), CAST(N'2020-03-21T14:43:56.663' AS DateTime), 4)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (8, N'Apollo Hospitals,Ahemedabad', 41, 1, 3, N'Plot No.1A, Bhat GIDC Estate Dist. Airport Gandhinagar Road, Dist. Gandhinagar, Ahmedabad - 382428', N'07966701800', NULL, NULL, N'https://www.apollohospitals.com/locations/india/ahmedabad', N'info@apolloahd.com', NULL, N'7966701866', N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', NULL, CAST(N'2020-03-21T15:52:17.760' AS DateTime), CAST(N'2020-03-21T15:52:17.760' AS DateTime), 4)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (9, N'Sunflower Hospital', 41, 1, 2, N'132 Feet Ring Rd, Near Manav Mandir, Memnagar, Ahmedabad - 380052', NULL, N'91-044-9687607355', NULL, N'https://www.sunflowerhospital.in/', N'jk.kunjadiya66@gmail.com', NULL, NULL, N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', NULL, CAST(N'2020-03-21T18:32:48.783' AS DateTime), CAST(N'2020-03-21T18:32:48.783' AS DateTime), 4)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (10, N'Spring Meadows Hospital', 30, 4, 2, N'East Of Kailesh, Delhi - 110065', N'91-11-40411111', NULL, NULL, N'https://www.springmeadowshospital.com/', N'springmeadowshospital1@gmail.com', NULL, NULL, N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', NULL, CAST(N'2020-03-21T18:36:27.003' AS DateTime), CAST(N'2020-03-21T18:36:27.003' AS DateTime), 4)
INSERT [dbo].[MST_Hospital] ([HospitalID], [HospitalName], [CityID], [CategoryID], [CategoryTypeID], [Address], [MobileNumber], [TelePhoneNumber], [Fax], [Website], [EmailID], [AmbulancePhoneNumber], [EmergencyNumber], [HospitalImage], [MapCode], [CreationDate], [ModificationDate], [UserID]) VALUES (13, N'sdfds', 23, 2, 1, N'Rajaram - 1/2 na chede,, New Shakti society,Santkabir road', N'09537992084', NULL, N'09537992084', N'New Shakti society,Santkabir road', N'vdrt1999@gmail.com', NULL, NULL, N'~/HospitalImage/120319 CaroMont Regional Medical Center 712.jpg', N'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d118184.48819404791!2d70.70576729388637!3d22.230012357618186!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s22.156109%2C70.771007!3m2!1d22.156109!2d70.771007!4m5!1s0x3959c98ac71cdf0f%3A0x76dd15cfbe93ad3b!2sRajkot%2C%20Gujarat!3m2!1d22.3038945!2d70.80215989999999!5e0!3m2!1sen!2sin!4v1585290851704!5m2!1sen!2sin', CAST(N'2020-03-27T12:07:31.910' AS DateTime), CAST(N'2020-03-27T12:09:22.580' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[MST_Hospital] OFF
SET IDENTITY_INSERT [dbo].[MST_State] ON 

INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (1, N'Gujarat ', CAST(N'2020-03-08T09:30:26.743' AS DateTime), CAST(N'2020-03-08T09:30:26.743' AS DateTime), 1)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (2, N'Andhra Pradesh', CAST(N'2020-03-08T15:24:20.863' AS DateTime), CAST(N'2020-03-08T15:24:20.863' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (3, N'Arunachal Pradesh', CAST(N'2020-03-08T15:24:39.937' AS DateTime), CAST(N'2020-03-08T15:24:39.937' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (4, N'Assam', CAST(N'2020-03-08T15:25:00.767' AS DateTime), CAST(N'2020-03-08T15:25:00.767' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (5, N'Bihar', CAST(N'2020-03-08T15:25:07.537' AS DateTime), CAST(N'2020-03-08T15:25:07.537' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (6, N'Chhattisgarh', CAST(N'2020-03-08T15:25:14.173' AS DateTime), CAST(N'2020-03-08T15:25:14.173' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (7, N'Goa', CAST(N'2020-03-08T15:25:20.023' AS DateTime), CAST(N'2020-03-08T15:25:20.023' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (8, N'Haryana', CAST(N'2020-03-08T15:25:27.300' AS DateTime), CAST(N'2020-03-08T15:25:27.300' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (9, N'Himachal Pradesh', CAST(N'2020-03-08T15:25:34.013' AS DateTime), CAST(N'2020-03-08T15:25:34.013' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (10, N'Jharkhand', CAST(N'2020-03-08T15:25:39.977' AS DateTime), CAST(N'2020-03-08T15:25:39.977' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (11, N'Karnataka', CAST(N'2020-03-08T15:25:46.473' AS DateTime), CAST(N'2020-03-08T15:25:46.473' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (12, N'Kerala', CAST(N'2020-03-08T15:25:52.077' AS DateTime), CAST(N'2020-03-08T15:25:52.077' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (13, N'Madhya Pradesh', CAST(N'2020-03-08T15:25:58.743' AS DateTime), CAST(N'2020-03-08T15:25:58.743' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (14, N'Maharashtra', CAST(N'2020-03-08T15:26:05.343' AS DateTime), CAST(N'2020-03-08T15:26:05.343' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (15, N'Manipur', CAST(N'2020-03-08T15:26:13.480' AS DateTime), CAST(N'2020-03-08T15:26:13.480' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (16, N'Meghalaya', CAST(N'2020-03-08T15:26:19.350' AS DateTime), CAST(N'2020-03-08T15:26:19.350' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (17, N'Mizoram', CAST(N'2020-03-08T15:26:23.837' AS DateTime), CAST(N'2020-03-08T15:26:23.837' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (18, N'Nagaland', CAST(N'2020-03-08T15:26:29.357' AS DateTime), CAST(N'2020-03-08T15:26:29.357' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (19, N'Odisha', CAST(N'2020-03-08T15:26:34.287' AS DateTime), CAST(N'2020-03-08T15:26:34.287' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (20, N'Punjab', CAST(N'2020-03-08T15:26:41.597' AS DateTime), CAST(N'2020-03-08T15:26:41.597' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (21, N'Rajasthan', CAST(N'2020-03-08T15:26:47.500' AS DateTime), CAST(N'2020-03-08T15:26:47.500' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (22, N'Sikkim', CAST(N'2020-03-08T15:26:52.723' AS DateTime), CAST(N'2020-03-08T15:26:52.723' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (23, N'Tamil Nadu', CAST(N'2020-03-08T15:26:58.360' AS DateTime), CAST(N'2020-03-08T15:26:58.360' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (24, N'Telangana', CAST(N'2020-03-08T15:27:03.417' AS DateTime), CAST(N'2020-03-08T15:27:03.417' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (25, N'Tripura', CAST(N'2020-03-08T15:27:09.977' AS DateTime), CAST(N'2020-03-08T15:27:09.977' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (26, N'Uttar Pradesh', CAST(N'2020-03-08T15:27:16.750' AS DateTime), CAST(N'2020-03-08T15:27:16.753' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (27, N'Uttarakhand', CAST(N'2020-03-08T15:27:25.317' AS DateTime), CAST(N'2020-03-08T15:27:25.317' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (28, N'West Bengal', CAST(N'2020-03-08T15:27:32.647' AS DateTime), CAST(N'2020-03-08T15:27:32.647' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (29, N'Andaman & Nicobar Islands', CAST(N'2020-03-08T15:30:41.863' AS DateTime), CAST(N'2020-03-08T16:47:54.910' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (30, N'Chandigarh', CAST(N'2020-03-08T15:30:48.200' AS DateTime), CAST(N'2020-03-08T15:30:48.200' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (31, N'Dadra and Nagar Haveli and Daman and Diu', CAST(N'2020-03-08T15:31:15.367' AS DateTime), CAST(N'2020-03-08T15:31:15.367' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (32, N'Delhi', CAST(N'2020-03-08T15:31:22.050' AS DateTime), CAST(N'2020-03-08T15:31:22.050' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (33, N'Jammu and Kashmir', CAST(N'2020-03-08T15:31:33.433' AS DateTime), CAST(N'2020-03-08T15:31:33.433' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (34, N'Ladakh', CAST(N'2020-03-08T15:31:42.870' AS DateTime), CAST(N'2020-03-08T15:31:42.870' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (35, N'Lakshadweep', CAST(N'2020-03-08T15:31:49.197' AS DateTime), CAST(N'2020-03-08T15:31:49.197' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (36, N'Puducherry', CAST(N'2020-03-08T15:31:54.837' AS DateTime), CAST(N'2020-03-08T15:31:54.837' AS DateTime), 3)
INSERT [dbo].[MST_State] ([StateID], [StateName], [CreationDate], [ModificationDate], [UserID]) VALUES (39, N'sadas', CAST(N'2020-03-08T15:38:40.333' AS DateTime), CAST(N'2020-03-08T15:38:40.333' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[MST_State] OFF
SET IDENTITY_INSERT [dbo].[SEC_User] ON 

INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [Email], [CreationDate], [ModificationDate]) VALUES (1, N'yash', N'1', N'yashbhatasana1852@gmail.com ', CAST(N'2020-03-01T18:39:33.657' AS DateTime), CAST(N'2020-03-01T19:31:01.843' AS DateTime))
INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [Email], [CreationDate], [ModificationDate]) VALUES (2, N'rutvik', N'1', N'pesivadiyarutvik@gmail.com', CAST(N'2020-03-08T12:09:53.903' AS DateTime), CAST(N'2020-03-08T12:09:53.903' AS DateTime))
INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [Email], [CreationDate], [ModificationDate]) VALUES (3, N'raj', N'1', N'	rajakbari25@gmail.com', CAST(N'2020-03-08T12:10:26.070' AS DateTime), CAST(N'2020-03-08T12:10:26.070' AS DateTime))
INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [Email], [CreationDate], [ModificationDate]) VALUES (4, N'darshit', N'1', N'vdrt1999@gmail.com', CAST(N'2020-03-08T12:10:50.710' AS DateTime), CAST(N'2020-03-08T12:10:50.710' AS DateTime))
SET IDENTITY_INSERT [dbo].[SEC_User] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MST_Category]    Script Date: 27-03-2020 15:55:14 ******/
ALTER TABLE [dbo].[MST_Category] ADD  CONSTRAINT [IX_MST_Category] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MST_CategoryType]    Script Date: 27-03-2020 15:55:14 ******/
ALTER TABLE [dbo].[MST_CategoryType] ADD  CONSTRAINT [IX_MST_CategoryType] UNIQUE NONCLUSTERED 
(
	[CategoryType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MST_City]    Script Date: 27-03-2020 15:55:14 ******/
ALTER TABLE [dbo].[MST_City] ADD  CONSTRAINT [IX_MST_City] UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MST_State]    Script Date: 27-03-2020 15:55:14 ******/
ALTER TABLE [dbo].[MST_State] ADD  CONSTRAINT [IX_MST_State] UNIQUE NONCLUSTERED 
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_Category] ADD  CONSTRAINT [DF_HospitalCategory_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MST_Category] ADD  CONSTRAINT [DF_MST_Category_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[MST_CategoryType] ADD  CONSTRAINT [DF_CategoryType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MST_CategoryType] ADD  CONSTRAINT [DF_CategoryType_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[MST_City] ADD  CONSTRAINT [DF_MST_City_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MST_City] ADD  CONSTRAINT [DF_MST_City_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[MST_Hospital] ADD  CONSTRAINT [DF_Hospital_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MST_Hospital] ADD  CONSTRAINT [DF_Hospital_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[MST_State] ADD  CONSTRAINT [DF_MST_State_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MST_State] ADD  CONSTRAINT [DF_MST_State_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[SEC_User] ADD  CONSTRAINT [DF_SEC_User_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[SEC_User] ADD  CONSTRAINT [DF_SEC_User_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[MST_Category]  WITH CHECK ADD  CONSTRAINT [FK_MST_Category_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_Category] CHECK CONSTRAINT [FK_MST_Category_SEC_User]
GO
ALTER TABLE [dbo].[MST_CategoryType]  WITH CHECK ADD  CONSTRAINT [FK_MST_CategoryType_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_CategoryType] CHECK CONSTRAINT [FK_MST_CategoryType_SEC_User]
GO
ALTER TABLE [dbo].[MST_City]  WITH CHECK ADD  CONSTRAINT [FK_MST_City_MST_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[MST_State] ([StateID])
GO
ALTER TABLE [dbo].[MST_City] CHECK CONSTRAINT [FK_MST_City_MST_State]
GO
ALTER TABLE [dbo].[MST_City]  WITH CHECK ADD  CONSTRAINT [FK_MST_City_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_City] CHECK CONSTRAINT [FK_MST_City_SEC_User]
GO
ALTER TABLE [dbo].[MST_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_MST_Hospital_MST_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[MST_Category] ([CategoryID])
GO
ALTER TABLE [dbo].[MST_Hospital] CHECK CONSTRAINT [FK_MST_Hospital_MST_Category]
GO
ALTER TABLE [dbo].[MST_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_MST_Hospital_MST_CategoryType] FOREIGN KEY([CategoryTypeID])
REFERENCES [dbo].[MST_CategoryType] ([CategoryTypeID])
GO
ALTER TABLE [dbo].[MST_Hospital] CHECK CONSTRAINT [FK_MST_Hospital_MST_CategoryType]
GO
ALTER TABLE [dbo].[MST_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_MST_Hospital_MST_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[MST_City] ([CityID])
GO
ALTER TABLE [dbo].[MST_Hospital] CHECK CONSTRAINT [FK_MST_Hospital_MST_City]
GO
ALTER TABLE [dbo].[MST_Hospital]  WITH CHECK ADD  CONSTRAINT [FK_MST_Hospital_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_Hospital] CHECK CONSTRAINT [FK_MST_Hospital_SEC_User]
GO
ALTER TABLE [dbo].[MST_State]  WITH CHECK ADD  CONSTRAINT [FK_MST_State_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_State] CHECK CONSTRAINT [FK_MST_State_SEC_User]
GO
/****** Object:  StoredProcedure [dbo].[PR_Dashboard_CategoryCount]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Dashboard_CategoryCount]

AS

SELECT	Count(CategoryID) AS CategoryCount

FROM	[dbo].[MST_Category]


GO
/****** Object:  StoredProcedure [dbo].[PR_Dashboard_CategoryTypeCount]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Dashboard_CategoryTypeCount]

AS

SELECT	Count(CategoryTypeID) AS CategoryTypeCount

FROM	[dbo].[MST_CategoryType]


GO
/****** Object:  StoredProcedure [dbo].[PR_Dashboard_CityCount]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Dashboard_CityCount]

AS

SELECT	Count(CityID) AS CityCount

FROM	[dbo].[MST_City]


GO
/****** Object:  StoredProcedure [dbo].[PR_Dashboard_HospitalCount]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Dashboard_HospitalCount]

AS

SELECT	Count(HospitalID) AS HospitalCount

FROM	[dbo].[MST_Hospital]


GO
/****** Object:  StoredProcedure [dbo].[PR_Dashboard_StateCount]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Dashboard_StateCount]

AS

SELECT	Count(StateID) AS StateCount

FROM	[dbo].[MST_State]


GO
/****** Object:  StoredProcedure [dbo].[PR_Dashboard_UserCount]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Dashboard_UserCount]

AS

SELECT	Count(UserID) AS UserCount

FROM	[dbo].[SEC_User]


GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_DeleteByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_DeleteByPK]
	@CategoryID int

AS

DELETE FROM [dbo].[MST_Category]

WHERE [dbo].[MST_Category].[CategoryID] = @CategoryID






GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_Insert]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_Insert]

	@CategoryName		varchar(50),
	@CreationDate		datetime,
	@ModificationDate	datetime,
	@UserID				int

AS

INSERT INTO [dbo].[MST_Category]
           (
		   [CategoryName]
           ,[CreationDate]
		   ,[ModificationDate]
		   ,[UserID]
		   )
     VALUES
           (
				@CategoryName,
				@CreationDate,
				@ModificationDate,
				@UserID
			)





GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_SelectAll]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_SelectAll]

AS

SELECT
	[dbo].[MST_Category].[CategoryID],
	[dbo].[MST_Category].[CategoryName],
	[dbo].[MST_Category].[CreationDate],
	[dbo].[MST_Category].[ModificationDate],
	[dbo].[SEC_User].[UserName]

FROM	[dbo].[MST_Category]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_Category].[UserID]

ORDER BY [dbo].[MST_Category].[CategoryName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_SelectByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_SelectByPK]
	@CategoryID	int
AS

SELECT
	[dbo].[MST_Category].[CategoryID],
	[dbo].[MST_Category].[CategoryName]

FROM	[dbo].[MST_Category]

WHERE [dbo].[MST_Category].[CategoryID]	=	@CategoryID

ORDER BY [dbo].[MST_Category].[CategoryName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_SelectDropDownList]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_SelectDropDownList]

AS

SELECT
	[dbo].[MST_Category].[CategoryName],
	[dbo].[MST_Category].[CategoryID]

FROM	[dbo].[MST_Category]

ORDER BY [dbo].[MST_Category].[CategoryName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Category_UpdateByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Category_UpdateByPK]
	@CategoryID int,
	@CategoryName varchar(50),
	@ModificationDate datetime
	
AS

UPDATE	[dbo].[MST_Category]

SET		[dbo].[MST_Category].[CategoryName]		= @CategoryName,
		[dbo].[MST_Category].[ModificationDate] = @ModificationDate

WHERE	[dbo].[MST_Category].[CategoryID] = @CategoryID




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_DeleteByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_DeleteByPK]
	@CategoryTypeID int

AS

DELETE FROM [dbo].[MST_CategoryType]

WHERE [dbo].[MST_CategoryType].[CategoryTypeID] = @CategoryTypeID






GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_Insert]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_Insert]

	@CategoryType		varchar(50),
	@CreationDate		datetime,
	@ModificationDate	datetime,
	@UserID				int

AS

INSERT INTO [dbo].[MST_CategoryType]
           (
		   [CategoryType]
           ,[CreationDate]
		   ,[ModificationDate]
		   ,[UserID]
		   )
     VALUES
           (
				@CategoryType,
				@CreationDate,
				@ModificationDate,
				@UserID
			)





GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_SelectAll]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_SelectAll]

AS

SELECT
	[dbo].[MST_CategoryType].[CategoryTypeID],
	[dbo].[MST_CategoryType].[CategoryType],
	[dbo].[MST_CategoryType].[CreationDate],
	[dbo].[MST_CategoryType].[ModificationDate],
	[dbo].[SEC_User].[UserName]

FROM	[dbo].[MST_CategoryType]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_CategoryType].[UserID]

ORDER BY [dbo].[MST_CategoryType].[CategoryType]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_SelectByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_SelectByPK]
	@CategoryTypeID	int
AS

SELECT
	[dbo].[MST_CategoryType].[CategoryTypeID],
	[dbo].[MST_CategoryType].[CategoryType]

FROM	[dbo].[MST_CategoryType]

WHERE [dbo].[MST_CategoryType].[CategoryTypeID]	=	@CategoryTypeID

ORDER BY [dbo].[MST_CategoryType].[CategoryType]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_SelectDropDownList]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_SelectDropDownList]

AS

SELECT
	[dbo].[MST_CategoryType].[CategoryType],
	[dbo].[MST_CategoryType].[CategoryTypeID],
	[dbo].[MST_CategoryType].[UserID]

FROM	[dbo].[MST_CategoryType]

ORDER BY [dbo].[MST_CategoryType].[CategoryType]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CategoryType_UpdateByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CategoryType_UpdateByPK]
	@CategoryTypeID int,
	@CategoryType varchar(50),
	@ModificationDate datetime
	
AS

UPDATE	[dbo].[MST_CategoryType]

SET		[dbo].[MST_CategoryType].[CategoryType] = @CategoryType,
		[dbo].[MST_CategoryType].[ModificationDate] = @ModificationDate

WHERE	[dbo].[MST_CategoryType].[CategoryTypeID] = @CategoryTypeID




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_DeleteByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_DeleteByPK]
	@CityID int

AS

DELETE FROM [dbo].[MST_City]

WHERE [dbo].[MST_City].[CityID] = @CityID






GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_Insert]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_Insert]

					@StateID			int,
					@CityName			varchar(50),
					@STDCode			varchar(50),
					@CreationDate		datetime,
					@ModificationDate	datetime,
					@UserID				int

AS

INSERT INTO [dbo].[MST_City]
           (
					 [StateID]
					,[CityName]
					,[STDCode]
					,[CreationDate]
					,[ModificationDate]
					,[UserID]
		   )
     VALUES
           (
					@StateID 
				   ,@CityName
				   ,@STDCode 
				   ,@CreationDate
				   ,@ModificationDate
				   ,@UserID
		   )






GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_SelectAll]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_SelectAll]

AS

SELECT [dbo].[MST_City].[CityID]
	  ,[dbo].[MST_City].[CityName]
	  ,[dbo].[MST_State].[StateName]
      ,[dbo].[MST_City].[STDCode]
	  ,[dbo].[MST_City].[StateID]
	  ,[dbo].[MST_City].[CreationDate]
	  ,[dbo].[MST_City].[ModificationDate]
	  ,[dbo].[SEC_User].[UserName]

FROM	[dbo].[MST_City]

INNER JOIN	[dbo].[MST_State] 
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_City].[UserID]

ORDER BY [dbo].[MST_City].[CityName],[dbo].[MST_State].[StateName]




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_SelectByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_SelectByPK] 
	@CityID int

AS

SELECT [dbo].[MST_City].[CityID]
	  ,[dbo].[MST_City].[CityName]
	  ,[dbo].[MST_State].[StateName]
      ,[dbo].[MST_City].[STDCode]
	  ,[dbo].[MST_City].[StateID]

FROM [dbo].[MST_City]
  
INNER JOIN	[dbo].[MST_State] 
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

WHERE [dbo].[MST_City].[CityID]=@CityID

ORDER BY [dbo].[MST_City].[StateID],[dbo].[MST_City].[CityName]




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_SelectDropDownList]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_SelectDropDownList]

AS

SELECT
	[dbo].[MST_City].[CityName],
	[dbo].[MST_City].[CityID]

FROM	[dbo].[MST_City]

ORDER BY [dbo].[MST_City].[CityName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_SelectDropDownListByStateID]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_SelectDropDownListByStateID]
	@StateID int
AS

SELECT
	[dbo].[MST_City].[CityID],
	[dbo].[MST_City].[CityName],
	[dbo].[MST_City].[StateID]

FROM	[dbo].[MST_City]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID]	=	[dbo].[MST_City].[StateID]

WHERE [dbo].[MST_City].[StateID]	=	@StateID

ORDER BY [dbo].[MST_City].[CityName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_City_UpdateByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_City_UpdateByPK]

	@CityID				int,
	@StateID			int,
	@CityName			varchar(50),
	@STDCode			varchar(10),
	@ModificationDate	datetime

AS

UPDATE [dbo].[MST_City]
   SET [dbo].[MST_City].[StateID]			=		@StateID 
      ,[dbo].[MST_City].[CityName]			=		@CityName
      ,[dbo].[MST_City].[STDCode]			= 		@STDCode 
	  ,[dbo].[MST_City].[ModificationDate]	=		@ModificationDate

WHERE [dbo].[MST_City].[CityID] = @CityID







GO
/****** Object:  StoredProcedure [dbo].[PR_MST_CityWiseHospitalAndCount]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_CityWiseHospitalAndCount]

AS

Select ROW_NUMBER() over (order by [dbo].[MST_City].[CityName]) as SrNo
	  ,[dbo].[MST_City].[CityName]
	  ,Count(*) AS HospitalCount
	  ,[dbo].[MST_City].[CityID]

From [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON	[dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON	[dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

Group by [dbo].[MST_City].[CityName],[dbo].[MST_City].[CityID]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_CityWiseHospital]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Hospital_CityWiseHospital]
	@CityID	int
AS

SELECT   ROW_NUMBER() over (order by [dbo].[MST_Hospital].[HospitalName]) as SrNo
		,[dbo].[MST_Hospital].[HospitalID]
		,[dbo].[MST_City].[CityID]
		,[dbo].[MST_City].[CityName]
		,[dbo].[MST_Hospital].[HospitalName]		
		,[dbo].[MST_Hospital].[CityID]	
		,[dbo].[MST_Hospital].[CategoryID]
		,[dbo].[MST_Hospital].[CategoryTypeID]				
		,[dbo].[MST_Hospital].[Address]				
		,[dbo].[MST_Hospital].[MobileNumber]		
		,[dbo].[MST_Hospital].[TelephoneNumber]		
		,[dbo].[MST_Hospital].[Fax]					
		,[dbo].[MST_Hospital].[Website]				
		,[dbo].[MST_Hospital].[EmailID]				
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]	
		,[dbo].[MST_Hospital].[EmergencyNumber]
		,[dbo].[MST_Hospital].[HospitalImage]
		,[dbo].[MST_Hospital].[MapCode]

FROM [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON [dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

WHERE [dbo].[MST_City].[CityID]		=	@CityID	

ORDER BY [dbo].[MST_Hospital].[HospitalName]





GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_DeleteByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Hospital_DeleteByPK]
	@HospitalID int

AS

DELETE FROM [dbo].[MST_Hospital]

WHERE [dbo].[MST_Hospital].[HospitalID] = @HospitalID






GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_Insert]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Hospital_Insert]

	@HospitalName			varchar(150),
	@CityID					int,
	@CategoryID				int,
	@CategoryTypeID			int,
	@Address				varchar(250),
	@MobileNumber			varchar(100),
	@TelePhoneNumber		varchar(100),
	@Fax					varchar(100),
	@Website				varchar(100),
	@EmailID				varchar(100),
	@AmbulancePhoneNumber	varchar(100),
	@EmergencyNumber		varchar(100),
	@HospitalImage			varchar(500),
	@MapCode				varchar(5000),
	@CreationDate			datetime,
	@ModificationDate		datetime,
	@UserID					int


AS

INSERT INTO [dbo].[MST_Hospital]
           (
		   [HospitalName]
		   ,[CityID]
		   ,[CategoryID]
		   ,[CategoryTypeID]
		   ,[Address]
		   ,[MobileNumber]
		   ,[TelePhoneNumber]
		   ,[Fax]
		   ,[Website]
		   ,[EmailID]
		   ,[AmbulancePhoneNumber]
		   ,[EmergencyNumber]
		   ,[HospitalImage]
		   ,[MapCode]
           ,[CreationDate]
		   ,[ModificationDate]
		   ,[UserID]
		   )
     VALUES
           (
				@HospitalName,
				@CityID,
				@CategoryID,
				@CategoryTypeID,
				@Address,
				@MobileNumber,
				@TelePhoneNumber,
				@Fax,
				@Website,
				@EmailID,
				@AmbulancePhoneNumber,
				@EmergencyNumber,
				@HospitalImage,
				@MapCode,
				@CreationDate,
				@ModificationDate,
				@UserID
			)





GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_Search]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Hospital_Search]
	@StateID			int = NULL,
	@CityID				int = NULL,
	@CategoryID			int = NULL, 
	@CategoryTypeID		int = NULL,
	@HospitalName		varchar(150) = NULL

AS

SELECT ROW_NUMBER() over (order by [dbo].[MST_Hospital].[HospitalName]) as SrNo
	  ,[dbo].[MST_Hospital].[HospitalID]
	  ,[dbo].[MST_Hospital].[HospitalName]
	  ,[dbo].[MST_Hospital].[HospitalImage]
	  ,[dbo].[MST_State].[StateName]
	  ,[dbo].[MST_City].[CityName]
	  ,[dbo].[MST_Category].[CategoryName]
	  ,[dbo].[MST_CategoryType].[CategoryType]
	  ,[dbo].[MST_Hospital].[Address]
	  ,[dbo].[MST_Hospital].[EmergencyNumber]
	  ,[dbo].[MST_Hospital].[AmbulancePhoneNumber]
	  ,[dbo].[MST_Hospital].[Website]

  FROM [dbo].[MST_Hospital]

  Inner Join [dbo].[MST_Category]
  ON	[dbo].[MST_Hospital].[CategoryID]	=	[dbo].[MST_Category].[CategoryID]

  Inner Join [dbo].[MST_CategoryType]
  ON	[dbo].[MST_Hospital].[CategoryTypeID]	=	[dbo].[MST_CategoryType].[CategoryTypeID]

  INNER JOIN [dbo].[MST_City]
  ON	[dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

  INNER JOIN [dbo].[MST_State]
  ON	[dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

  WHERE
		(@HospitalName		IS NULL OR	[dbo].[MST_Hospital].[HospitalName] like '%' + @HospitalName + '%')
	AND	(@CategoryID		IS NULL OR	[dbo].[MST_Hospital].[CategoryID]		=	@CategoryID) 
	AND	(@CategoryTypeID	IS NULL OR	[dbo].[MST_Hospital].[CategoryTypeID]	=	@CategoryTypeID)
	AND	(@StateID			IS NULL OR	[dbo].[MST_City].[StateID]				=	@StateID) 
	AND	(@CityID			IS NULL OR	[dbo].[MST_Hospital].[CityID]			=	@CityID)
 


GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_SelectAll]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Hospital_SelectAll]

AS

SELECT  ROW_NUMBER() over (order by [dbo].[MST_Hospital].[HospitalID]) as SrNo
		,[dbo].[MST_Hospital].[HospitalID]
		,[dbo].[MST_Hospital].[HospitalName]
		,[dbo].[MST_City].[CityName]
		,[dbo].[MST_State].[StateName]	
		,[dbo].[MST_Hospital].[CityID]						
		,[dbo].[MST_Hospital].[Address]	
		,[dbo].[MST_Hospital].[MobileNumber]		
		,[dbo].[MST_Hospital].[TelephoneNumber]		
		,[dbo].[MST_Hospital].[Fax]					
		,[dbo].[MST_Hospital].[Website]				
		,[dbo].[MST_Hospital].[EmailID]				
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]	
		,[dbo].[MST_Hospital].[EmergencyNumber]
		,[dbo].[MST_Hospital].[HospitalImage]
		,[dbo].[MST_Hospital].[MapCode]
		,[dbo].[MST_Category].[CategoryName]
		,[dbo].[MST_CategoryType].[CategoryType]
		,[dbo].[SEC_User].[UserName]


FROM [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON [dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

INNER JOIN [dbo].[MST_Category]
ON [dbo].[MST_Category].[CategoryID] = [dbo].[MST_Hospital].[CategoryID]

INNER JOIN [dbo].[MST_CategoryType]
ON [dbo].[MST_CategoryType].[CategoryTypeID] = [dbo].[MST_Hospital].[CategoryTypeID]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_Hospital].[UserID]


GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_SelectByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Hospital_SelectByPK]
	@HospitalID		int
AS

SELECT   [dbo].[MST_Hospital].[HospitalID]
		,[dbo].[MST_Hospital].[HospitalName]		
		,[dbo].[MST_Hospital].[CityID]	
		,[dbo].[MST_Hospital].[CategoryID]
		,[dbo].[MST_Hospital].[CategoryTypeID]				
		,[dbo].[MST_Hospital].[Address]
		,[dbo].[MST_Hospital].[MobileNumber]		
		,[dbo].[MST_Hospital].[TelePhoneNumber]		
		,[dbo].[MST_Hospital].[Fax]					
		,[dbo].[MST_Hospital].[Website]				
		,[dbo].[MST_Hospital].[EmailID]				
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]	
		,[dbo].[MST_Hospital].[EmergencyNumber]
		,[dbo].[MST_Hospital].[HospitalImage]
		,[dbo].[MST_Hospital].[MapCode]

FROM [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON [dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

WHERE [dbo].[MST_Hospital].[HospitalID]		=	@HospitalID	

ORDER BY [dbo].[MST_Hospital].[HospitalName]





GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_StateWiseHospital]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_Hospital_StateWiseHospital]
	@StateID	int
AS

SELECT   ROW_NUMBER() over (order by [dbo].[MST_Hospital].[HospitalName]) as SrNo
		,[dbo].[MST_Hospital].[HospitalID]
		,[dbo].[MST_State].[StateID]
		,[dbo].[MST_State].[StateName]
		,[dbo].[MST_City].[CityID]
		,[dbo].[MST_City].[CityName]
		,[dbo].[MST_Hospital].[HospitalName]		
		,[dbo].[MST_Hospital].[CityID]	
		,[dbo].[MST_Hospital].[CategoryID]
		,[dbo].[MST_Hospital].[CategoryTypeID]				
		,[dbo].[MST_Hospital].[Address]				
		,[dbo].[MST_Hospital].[MobileNumber]		
		,[dbo].[MST_Hospital].[TelephoneNumber]		
		,[dbo].[MST_Hospital].[Fax]					
		,[dbo].[MST_Hospital].[Website]				
		,[dbo].[MST_Hospital].[EmailID]				
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]	
		,[dbo].[MST_Hospital].[EmergencyNumber]
		,[dbo].[MST_Hospital].[HospitalImage]
		,[dbo].[MST_Hospital].[MapCode]

FROM [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON [dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON [dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

WHERE [dbo].[MST_State].[StateID]	=	@StateID	

ORDER BY [dbo].[MST_Hospital].[HospitalName]





GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Hospital_UpdateByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Hospital_UpdateByPK]
	@HospitalID				int,
	@HospitalName			varchar(150),
	@CityID					int,
	@CategoryTypeID			int,
	@CategoryID				int,
	@Address				varchar(250),
	@MobileNumber			varchar(100),
	@TelephoneNumber		varchar(100),
	@Fax					varchar(100),
	@Website				varchar(100),
	@EmailID				varchar(100),
	@AmbulancePhoneNumber	varchar(100),
	@EmergencyNumber		varchar(100),
	@HospitalImage			varchar(500),
	@MapCode				varchar(500),
	@ModificationDate		datetime

AS

UPDATE	 [dbo].[MST_Hospital]

   SET	 [dbo].[MST_Hospital].[HospitalName]		=	@HospitalName
		,[dbo].[MST_Hospital].[CityID]				=	@CityID	
		,[dbo].[MST_Hospital].[CategoryID]			=	@CategoryID	
		,[dbo].[MST_Hospital].[CategoryTypeID]		=	@CategoryTypeID	
		,[dbo].[MST_Hospital].[Address]				=	@Address
		,[dbo].[MST_Hospital].[MobileNumber]		=	@MobileNumber
		,[dbo].[MST_Hospital].[TelephoneNumber]		=	@TelephoneNumber
		,[dbo].[MST_Hospital].[Fax]					=	@Fax
		,[dbo].[MST_Hospital].[Website]				=	@Website
		,[dbo].[MST_Hospital].[EmailID]				=	@EmailID
		,[dbo].[MST_Hospital].[AmbulancePhoneNumber]=	@AmbulancePhoneNumber	
		,[dbo].[MST_Hospital].[EmergencyNumber]		=	@EmergencyNumber
		,[dbo].[MST_Hospital].[HospitalImage]		=	@HospitalImage
		,[dbo].[MST_Hospital].[MapCode]				=	@MapCode
		,[dbo].[MST_Hospital].[ModificationDate]	=	@ModificationDate

WHERE	[dbo].[MST_Hospital].[HospitalID]	=	@HospitalID



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_DeleteByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_DeleteByPK]
	@StateID int

AS

DELETE FROM [dbo].[MST_State]

WHERE [dbo].[MST_State].[StateID] = @StateID





GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_Insert]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_Insert]

	@StateName			varchar(50),
	@CreationDate		datetime,
	@ModificationDate	datetime,
	@UserID				int

AS

INSERT INTO [dbo].[MST_State]
(
	[StateName],
	[CreationDate],
	[ModificationDate],
	[UserID]
)
VALUES
(
	@StateName,
	@CreationDate,
	@ModificationDate,
	@UserID
)





GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_SelectAll]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_SelectAll]

AS

SELECT
	[dbo].[MST_State].[StateID],
	[dbo].[MST_State].[StateName],
	[dbo].[MST_State].[CreationDate],
	[dbo].[MST_State].[ModificationDate],
	[dbo].[SEC_User].[UserName]

FROM	[dbo].[MST_State]

INNER JOIN [dbo].[SEC_User]
ON [dbo].[SEC_User].[UserID] = [dbo].[MST_State].[UserID]

ORDER BY [dbo].[MST_State].[StateName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_SelectByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_SelectByPK]
	@StateID int
AS

SELECT
		[dbo].[MST_State].[StateID],
		[dbo].[MST_State].[StateName]

FROM	[dbo].[MST_State]

WHERE 
		[dbo].[MST_State].[StateID] = @StateID

ORDER BY 
		[dbo].[MST_State].[StateName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_SelectDropDownList]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_SelectDropDownList]

AS

SELECT
	[dbo].[MST_State].[StateName],
	[dbo].[MST_State].[StateID]

FROM	[dbo].[MST_State]

ORDER BY [dbo].[MST_State].[StateName]



GO
/****** Object:  StoredProcedure [dbo].[PR_MST_State_UpdateByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_State_UpdateByPK]
	@StateID int,
	@StateName varchar(100),
	@ModificationDate datetime
	
AS

UPDATE	[dbo].[MST_State]

SET		[dbo].[MST_State].[StateName]			= @StateName,
		[dbo].[MST_State].[ModificationDate]	= @ModificationDate

WHERE	[dbo].[MST_State].[StateID] = @StateID




GO
/****** Object:  StoredProcedure [dbo].[PR_MST_StateWiseHospitalAndCount]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_MST_StateWiseHospitalAndCount]

AS

Select ROW_NUMBER() over (order by [dbo].[MST_State].[StateName]) as SrNo
	  ,[dbo].[MST_State].[StateName]
	  ,Count(*) AS HospitalCount
	  ,[dbo].[MST_State].[StateID]

From [dbo].[MST_Hospital]

INNER JOIN [dbo].[MST_City]
ON	[dbo].[MST_City].[CityID] = [dbo].[MST_Hospital].[CityID]

INNER JOIN [dbo].[MST_State]
ON	[dbo].[MST_State].[StateID] = [dbo].[MST_City].[StateID]

Group by [dbo].[MST_State].[StateName],[dbo].[MST_State].[StateID]



GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_CheckPassword]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_SEC_User_CheckPassword]
	@UserID   		int,
	@UserName		varchar(100),
	@UserPassword   varchar(50)

AS
SET NOCOUNT ON

DECLARE	@StartTime	datetime
DECLARE	@EndTime	datetime
SET		@StartTime = getdate()

SELECT
		[dbo].[SEC_User].[UserID],
		[dbo].[SEC_User].[UserName],
		[dbo].[SEC_User].[Password],
		[dbo].[SEC_User].[Email],
		[dbo].[SEC_User].[CreationDate],
		[dbo].[SEC_User].[ModificationDate]

FROM	[dbo].[SEC_User]

WHERE	[dbo].[SEC_User].[UserID] = @UserID AND
		[dbo].[SEC_User].[UserName] = @UserName AND
		[dbo].[SEC_User].[Password] = @UserPassword


SET		@EndTime = getdate()







GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Delete]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Delete]
	@UserID int
AS

DELETE FROM [dbo].[SEC_User]

WHERE [dbo].[SEC_User].[UserID] = @UserID





GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Insert]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Insert]

	@UserName			varchar(100),
	@Password			varchar(50),
	@Email				varchar(100),
	@CreationDate		datetime,
	@ModificationDate	datetime
	
AS

INSERT INTO [dbo].[SEC_User]
           (
			   [dbo].[SEC_User].[UserName]
			   ,[dbo].[SEC_User].[Password]
			   ,[dbo].[SEC_User].[Email]
			   ,[dbo].[SEC_User].[CreationDate]
			   ,[dbo].[SEC_User].[ModificationDate]
		   )
     VALUES
           (
				@UserName,
				@Password,
				@Email,
				@CreationDate,
				@ModificationDate
			)





GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Login]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Login]
	@UserName varchar(100),
	@Password varchar(50)

AS

SELECT
	 [dbo].[SEC_User].[UserID]
	,[dbo].[SEC_User].[UserName]
	,[dbo].[SEC_User].[Password]
	,[dbo].[SEC_User].[Email]

FROM	[dbo].[SEC_User]

WHERE	[dbo].[SEC_User].[UserName] = @UserName 
	and	[dbo].[SEC_User].[Password] = @Password





GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_SelectAll]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_SelectAll]

AS

SELECT
		[dbo].[SEC_User].[UserID],
		[dbo].[SEC_User].[UserName],
		[dbo].[SEC_User].[Email],
		[dbo].[SEC_User].[Password],
		[dbo].[SEC_User].[CreationDate],
		[dbo].[SEC_User].[ModificationDate]

FROM [dbo].[SEC_User]

ORDER BY [dbo].[SEC_User].[UserName]



GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_SelectByPK]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_SEC_User_SelectByPK]
	@UserID int
AS

SELECT
		[dbo].[SEC_User].[UserID],
		[dbo].[SEC_User].[UserName],
		[dbo].[SEC_User].[Password],
		[dbo].[SEC_User].[Email],
		[dbo].[SEC_User].[CreationDate],
		[dbo].[SEC_User].[ModificationDate]

FROM	[dbo].[SEC_User]

WHERE 
		[dbo].[SEC_User].[UserID] = @UserID

ORDER BY 
		[dbo].[SEC_User].[UserName]



GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Update]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_SEC_User_Update]
	@UserID				int,
	@UserName			varchar(100),
	@Password			varchar(50),
	@Email				varchar(100),
	@ModificationDate	datetime
	
AS

UPDATE	[dbo].[SEC_User]

SET		[dbo].[SEC_User].[UserName]			=	@UserName,
		[dbo].[SEC_User].[Password]			=	@Password,
		[dbo].[SEC_User].[Email]			=	@Email,
		[dbo].[SEC_User].[ModificationDate]	=	@ModificationDate

WHERE	[dbo].[SEC_User].[UserID] = @UserID




GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Verify]    Script Date: 27-03-2020 15:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Verify]
	@UserName	varchar(100),
	@Email		varchar(100)

AS

SELECT	
		 [dbo].[SEC_User].[UserName]
		,[dbo].[SEC_User].[Email]
		,[dbo].[SEC_User].[UserID]

FROM	[dbo].[SEC_User]

WHERE	[dbo].[SEC_User].[Email]	=	 @Email
	OR	[dbo].[SEC_User].[UserName]	=	@UserName



GO
USE [master]
GO
ALTER DATABASE [3TierHospitalFinder] SET  READ_WRITE 
GO
