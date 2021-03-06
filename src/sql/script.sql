USE [master]
GO
/****** Object:  Database [LibraryManagement]    Script Date: 7/13/2020 8:35:43 PM ******/
CREATE DATABASE [LibraryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEPRESS\MSSQL\DATA\LibraryManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEPRESS\MSSQL\DATA\LibraryManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LibraryManagement]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 7/13/2020 8:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[book_id] [char](10) NOT NULL,
	[book_name] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[publisher] [nvarchar](50) NULL,
	[total_books] [int] NULL,
	[available_books] [int] NULL,
	[year_export] [char](10) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Borrow_Order]    Script Date: 7/13/2020 8:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow_Order](
	[borrow_order_id] [int] IDENTITY(1,1) NOT NULL,
	[library_user_id] [nvarchar](50) NULL,
	[borrow_date] [date] NULL,
	[return_date] [date] NULL,
	[is_returned] [bit] NULL,
 CONSTRAINT [PK_Borrow_Order] PRIMARY KEY CLUSTERED 
(
	[borrow_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Library_User]    Script Date: 7/13/2020 8:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library_User](
	[library_user_id] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[role_id] [nchar](10) NULL,
	[name] [nvarchar](100) NULL,
	[gender] [nchar](10) NULL,
	[phone] [nchar](10) NULL,
	[address] [nvarchar](200) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Library_User] PRIMARY KEY CLUSTERED 
(
	[library_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 7/13/2020 8:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[borrow_order_id] [int] NOT NULL,
	[book_id] [char](10) NOT NULL,
	[quantity] [int] NULL,
	[note] [nvarchar](100) NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[borrow_order_id] ASC,
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role_User]    Script Date: 7/13/2020 8:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_User](
	[role_id] [nchar](10) NOT NULL,
	[role_name] [nchar](10) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'1         ', N'toi thay hoa vang tren co xanh', N'Nguyen Nhat Anh', N'Nhi Dong', 14, 11, N'0         ', 0)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'10        ', N'10', N'10', N'10', 13, 6, N'0         ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'11        ', N'1', N'1', N'1', 1, 0, N'1         ', 0)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'2         ', N'One Piece', N'c', N'c', 40, 4, N'4444      ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'22        ', N'22', N'22', N'22', 22, 21, N'22        ', 0)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'24        ', N'22', N'22', N'22', 22, 22, N'22        ', 0)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'3         ', N'Than dong dat viet', N'w', N'Giao duc', 7, 0, N'1212      ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'33        ', N'33', N'33', N'3', 3, 0, N'3         ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'34        ', N'33', N'33', N'', 3, 3, N'0         ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'4         ', N'Doraemon', N'e', N'e', 30, 16, N'3333      ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'44        ', N'4', N'4', N'4', 4, 0, N'4         ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'5         ', N'Pokemon', N'q', N'q', 25, 15, N'2222      ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'55        ', N'5', N'5', N'5', 5, 0, N'0         ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'6         ', N'Toi di code dao', N's', N's', 35, 18, N'1111      ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'77        ', N'7', N'7', N'7', 8, 1, N'7         ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'8         ', N'7', N'7', N'7', 7, 0, N'7         ', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'9         ', N'9', N'9', N'9', 9, 0, N'9         ', 0)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'99        ', N'9', N'9', N'9', 9, 8, N'9999      ', 0)
SET IDENTITY_INSERT [dbo].[Borrow_Order] ON 

INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (134, N'giang', CAST(0x47410B00 AS Date), CAST(0x66410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (135, N'giang', CAST(0x47410B00 AS Date), CAST(0x66410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (136, N'giang', CAST(0x47410B00 AS Date), CAST(0x66410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (137, N'giang', CAST(0x47410B00 AS Date), CAST(0x66410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (138, N'giang', CAST(0x47410B00 AS Date), CAST(0x66410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (139, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (140, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (141, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (142, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (143, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (144, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (145, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (146, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (147, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (148, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (149, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (150, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (151, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (152, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (153, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (154, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (155, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (156, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (157, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (158, N'phuong', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (159, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (160, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (161, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (162, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (163, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (164, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (165, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (166, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (167, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (168, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (169, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (170, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (171, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (172, N'giang', CAST(0x48410B00 AS Date), CAST(0x67410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (173, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (174, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (175, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (176, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (177, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (178, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (179, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (180, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (181, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (182, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (183, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (184, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (185, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (186, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (187, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (188, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (189, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (190, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (191, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (192, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (193, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (194, N'phuong', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (195, N'giang', CAST(0x4B410B00 AS Date), CAST(0x6A410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (196, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (197, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (198, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (199, N'phuong', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (200, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (201, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (202, N'phuong', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (203, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (204, N'phuong', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (205, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (206, N'phuong', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (207, N'phuong', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (208, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (209, N'phuong', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (210, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (211, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (212, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (213, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (214, N'phuong', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (215, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (216, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (217, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (218, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (219, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (220, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (221, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (222, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (223, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (224, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (225, N'giang', CAST(0x4C410B00 AS Date), CAST(0x6B410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (234, N'phuong', CAST(0x50410B00 AS Date), CAST(0x6F410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (235, N'giang', CAST(0x50410B00 AS Date), CAST(0x6F410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (236, N'giang', CAST(0x50410B00 AS Date), CAST(0x6F410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (237, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (238, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (239, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (240, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
GO
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (241, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (242, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (243, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (244, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (245, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (246, N'phuong', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (247, N'giang', CAST(0x51410B00 AS Date), CAST(0x70410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (248, N'giang', CAST(0x52410B00 AS Date), CAST(0x71410B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[Borrow_Order] OFF
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'1', N'1', N'US        ', N'1', N'female    ', N'1         ', N'1', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'a', N'a', N'US        ', N'a', N'male      ', N'a         ', N'aa', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'admin@gmail.com', N'123', N'US        ', N'q', N'male      ', N'1         ', N'1', 0)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'duy', N'duy', N'US        ', N'Tran Le Duy', N'male      ', N'123       ', N'123 Tang Nhon Phu', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'giang', N'giang', N'US        ', N'Vũ Thu Giang', N'female    ', N'0988888888', N'105 duong so 144444', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'h', N'h', N'US        ', N'h', N'male      ', N'h         ', N'h', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'hello', N'hello', N'US        ', N'Nguyen Thi Hello', N'male      ', N'123123    ', N'123 hello ', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'hieu', N'hieu', N'US        ', N'Nguyen Mau Hieu', N'male      ', N'123123    ', N'123 Do Xuan Hop', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'hoa', N'hoa', N'AD        ', N'Lưu Diệu Hoa', N'female    ', N'0987      ', N'103 duong so 111111', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'hoa1', N'hoa', N'US        ', N'hoa', N'male      ', N'123       ', N'123', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'hoa2', N'hoa', N'US        ', N'hoa', N'male      ', N'123       ', N'123', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'hoa4', N'hoa', N'US        ', N'hoa', N'male      ', N'123       ', N'123', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'hoa5', N'hoa5', N'US        ', N'hoa', N'female    ', N'          ', N'', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'nam', N'nam', N'US        ', N'Nguyen Ke Nam', N'male      ', N'098123    ', N'123 Le Van Viet', 0)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'phuong', N'phuong', N'US        ', N'Phạm Thanh Phương', N'male      ', N'09876     ', N'104 duong so 12', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'q', N'q', N'US        ', N'q', N'male      ', N'q         ', N'q', 0)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (134, N'2         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (134, N'99        ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (135, N'8         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (135, N'9         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (136, N'5         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (137, N'3         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (137, N'5         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (137, N'55        ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (137, N'8         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (138, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (138, N'4         ', 10, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (138, N'9         ', 4, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (139, N'2         ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (140, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (140, N'5         ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (140, N'6         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (141, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (142, N'3         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (143, N'5         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (143, N'6         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (144, N'5         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (144, N'77        ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (145, N'3         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (146, N'6         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (147, N'8         ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (148, N'2         ', 6, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (149, N'2         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (150, N'6         ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (151, N'2         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (152, N'2         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (153, N'2         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (154, N'4         ', 6, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (155, N'4         ', 5, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (156, N'4         ', 5, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (157, N'4         ', 5, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (158, N'4         ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (159, N'6         ', 8, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (160, N'6         ', 6, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (161, N'6         ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (162, N'4         ', 5, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (163, N'6         ', 8, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (164, N'2         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (165, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (165, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (165, N'6         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (166, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (167, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (168, N'4         ', 6, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (169, N'4         ', 4, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (170, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (170, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (170, N'6         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (171, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (171, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (171, N'6         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (172, N'2         ', 5, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (173, N'5         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (174, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (175, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (176, N'4         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (177, N'4         ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (178, N'4         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (179, N'4         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (180, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (181, N'4         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (182, N'4         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (183, N'4         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (184, N'4         ', 6, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (185, N'4         ', 5, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (186, N'4         ', 6, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (187, N'6         ', 5, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (188, N'6         ', 3, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (189, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (190, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (191, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (192, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (193, N'2         ', 4, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (194, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (195, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (196, N'22        ', 20, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (197, N'5         ', 10, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (198, N'5         ', 10, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (199, N'5         ', 10, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (200, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (201, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (202, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (203, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (204, N'5         ', 4, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (205, N'5         ', 0, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (206, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (207, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (208, N'4         ', 0, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (209, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (210, N'4         ', 0, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (211, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (212, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (213, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (214, N'4         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (215, N'4         ', 15, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (216, N'4         ', 4, NULL)
GO
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (217, N'99        ', 0, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (218, N'2         ', 5, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (219, N'99        ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (220, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (221, N'4         ', 0, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (221, N'6         ', 0, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (222, N'5         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (222, N'6         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (223, N'5         ', 12, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (223, N'99        ', 4, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (224, N'6         ', 7, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (225, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (234, N'1         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (235, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (236, N'10        ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (236, N'5         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (236, N'6         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (237, N'1         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (237, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (238, N'10        ', 10, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (238, N'2         ', 2, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (239, N'2         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (240, N'22        ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (241, N'22        ', 20, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (242, N'1         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (242, N'2         ', 0, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (243, N'4         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (244, N'1         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (245, N'1         ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (246, N'10        ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (247, N'10        ', 1, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (248, N'10        ', 7, NULL)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity], [note]) VALUES (248, N'2         ', 1, NULL)
INSERT [dbo].[Role_User] ([role_id], [role_name]) VALUES (N'AD        ', N'admin     ')
INSERT [dbo].[Role_User] ([role_id], [role_name]) VALUES (N'US        ', N'user      ')
ALTER TABLE [dbo].[Borrow_Order]  WITH CHECK ADD  CONSTRAINT [FK__Borrow_Or__libra__403A8C7D] FOREIGN KEY([library_user_id])
REFERENCES [dbo].[Library_User] ([library_user_id])
GO
ALTER TABLE [dbo].[Borrow_Order] CHECK CONSTRAINT [FK__Borrow_Or__libra__403A8C7D]
GO
ALTER TABLE [dbo].[Library_User]  WITH CHECK ADD  CONSTRAINT [FK__Library_U__role___1B0907CE] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role_User] ([role_id])
GO
ALTER TABLE [dbo].[Library_User] CHECK CONSTRAINT [FK__Library_U__role___1B0907CE]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__book___20C1E124] FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK__Order_Det__book___20C1E124]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__borro__3A81B327] FOREIGN KEY([borrow_order_id])
REFERENCES [dbo].[Borrow_Order] ([borrow_order_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK__Order_Det__borro__3A81B327]
GO
USE [master]
GO
ALTER DATABASE [LibraryManagement] SET  READ_WRITE 
GO
