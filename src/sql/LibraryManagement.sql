USE [LibraryManagement]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 7/1/2020 10:16:27 PM ******/
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
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Borrow_Order]    Script Date: 7/1/2020 10:16:27 PM ******/
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
/****** Object:  Table [dbo].[Library_User]    Script Date: 7/1/2020 10:16:27 PM ******/
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
 CONSTRAINT [PK_Library_User] PRIMARY KEY CLUSTERED 
(
	[library_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 7/1/2020 10:16:27 PM ******/
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
	[note] [nvarchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role_User]    Script Date: 7/1/2020 10:16:27 PM ******/
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
ALTER TABLE [dbo].[Borrow_Order]  WITH CHECK ADD  CONSTRAINT [FK__Borrow_Or__libra__403A8C7D] FOREIGN KEY([library_user_id])
REFERENCES [dbo].[Library_User] ([library_user_id])
GO
ALTER TABLE [dbo].[Borrow_Order] CHECK CONSTRAINT [FK__Borrow_Or__libra__403A8C7D]
GO
ALTER TABLE [dbo].[Library_User]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role_User] ([role_id])
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
