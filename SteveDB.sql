USE [master]
GO
/****** Object:  Database [SteveJobs]    Script Date: 23/09/2024 2:13:27 CH ******/
CREATE DATABASE [SteveJobs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SteveJobs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SteveJobs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SteveJobs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SteveJobs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SteveJobs] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SteveJobs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SteveJobs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SteveJobs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SteveJobs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SteveJobs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SteveJobs] SET ARITHABORT OFF 
GO
ALTER DATABASE [SteveJobs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SteveJobs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SteveJobs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SteveJobs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SteveJobs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SteveJobs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SteveJobs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SteveJobs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SteveJobs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SteveJobs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SteveJobs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SteveJobs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SteveJobs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SteveJobs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SteveJobs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SteveJobs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SteveJobs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SteveJobs] SET RECOVERY FULL 
GO
ALTER DATABASE [SteveJobs] SET  MULTI_USER 
GO
ALTER DATABASE [SteveJobs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SteveJobs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SteveJobs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SteveJobs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SteveJobs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SteveJobs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SteveJobs', N'ON'
GO
ALTER DATABASE [SteveJobs] SET QUERY_STORE = ON
GO
ALTER DATABASE [SteveJobs] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SteveJobs]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [nvarchar](max) NULL,
	[BankNumber] [varchar](50) NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](max) NULL,
	[Gender] [bit] NULL,
	[Phone] [varchar](10) NULL,
	[Gmail] [nvarchar] (max) NULL,
	[BirthDate] [datetime] NULL,
	[RoleId] [int] NULL,
	[HomeAddress] [nvarchar](max) NULL,
	[WorkAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Feedbackid] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[MemberId] [int] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Feedbackid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCategory]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCategory](
	[ItemCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ItemCategoryName] [nvarchar](max) NULL,
	[Description] [nvarchar] (max) NULL,
	[Discount] [float] NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_ItemCategory] PRIMARY KEY CLUSTERED 
(
	[ItemCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[MemberName] [nvarchar](max) NULL,
	[Gender] [bit] NULL,
	[Phone] [varchar](10) NOT NULL,
	[Gmail] [nvarchar] (max) NULL,
	[BirthDate] [datetime] NULL,
	[Address] [nvarchar](max) NULL,
	[Point] [int] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuCategory]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCategory](
	[MenuItemId] [int] NOT NULL,
	[ItemCategoryId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsForCombo] [bit] NULL,
 CONSTRAINT [PK_MenuCategory] PRIMARY KEY CLUSTERED 
(
	[MenuItemId] ASC,
	[ItemCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[MenuItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[Image] [nvarchar](max) NULL,
	[IsAvailable] [bit] NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_MenuItem] PRIMARY KEY CLUSTERED 
(
	[MenuItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[MemberId] [int] NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[OrderDetailId] [int] NULL,
	[TableId] [int] NULL,
	[Cost] [float] NULL,
	[Tax] [float] NULL,
	[MemberId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[MenuItemId] [int] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnerId] [int] IDENTITY(1,1) NOT NULL,
	[OwnerName] [nvarchar](max) NULL,
	[Gender] [bit] NULL,
	[Phone] [varchar](10) NULL,
	[Gmail] [nvarchar] (max) NULL,
	[BirthDate] [datetime] NULL,
	[BankId] [int] NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[OwnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[QR] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[VocherDetailId] [int] NOT NULL,
	[ItemCategoryId] [int] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[VocherDetailId] ASC,
	[ItemCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoucherDetail]    Script Date: 23/09/2024 2:13:27 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoucherDetail](
	[VoucherDetailId]  [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_VoucherDetail] PRIMARY KEY CLUSTERED 
(
	[VoucherDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Member]
GO
ALTER TABLE [dbo].[MenuCategory]  WITH CHECK ADD  CONSTRAINT [FK_MenuCategory_ItemCategory] FOREIGN KEY([ItemCategoryId])
REFERENCES [dbo].[ItemCategory] ([ItemCategoryId])
GO
ALTER TABLE [dbo].[MenuCategory] CHECK CONSTRAINT [FK_MenuCategory_ItemCategory]
GO
ALTER TABLE [dbo].[MenuCategory]  WITH CHECK ADD  CONSTRAINT [FK_MenuCategory_MenuItem] FOREIGN KEY([MenuItemId])
REFERENCES [dbo].[MenuItem] ([MenuItemId])
GO
ALTER TABLE [dbo].[MenuCategory] CHECK CONSTRAINT [FK_MenuCategory_MenuItem]
GO
ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuItem_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[MenuItem] CHECK CONSTRAINT [FK_MenuItem_Employee]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Employee]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Member]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Table] FOREIGN KEY([TableId])
REFERENCES [dbo].[Table] ([TableId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Table]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_MenuItem] FOREIGN KEY([MenuItemId])
REFERENCES [dbo].[MenuItem] ([MenuItemId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_MenuItem]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD  CONSTRAINT [FK_Owner_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([BankId])
GO
ALTER TABLE [dbo].[Owner] CHECK CONSTRAINT [FK_Owner_Bank]
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_ItemCategory] FOREIGN KEY([ItemCategoryId])
REFERENCES [dbo].[ItemCategory] ([ItemCategoryId])
GO
ALTER TABLE [dbo].[Voucher] CHECK CONSTRAINT [FK_Voucher_ItemCategory]
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_VoucherDetail] FOREIGN KEY([VocherDetailId])
REFERENCES [dbo].[VoucherDetail] ([VoucherDetailId])
GO
ALTER TABLE [dbo].[Voucher] CHECK CONSTRAINT [FK_Voucher_VoucherDetail]
GO
USE [master]
GO
ALTER DATABASE [SteveJobs] SET  READ_WRITE 
GO

Use SteveJobs
GO


INSERT INTO [dbo].[Bank] (BankName, BankNumber)
VALUES ('NH So Timo', '9021687094268')


INSERT INTO [dbo].[Role] (RoleName)
VALUES ('Magager'),
('Staff'),
('Bartender')


INSERT INTO [dbo].[Employee] (EmployeeName, Gender, Phone, Gmail, BirthDate, RoleId, HomeAddress, WorkAddress)
VALUES('Trịnh Hoàng Dũng', 1, '0967375045', 'dungthhe170357@fpt.edu.vn', '2003-09-06', 1, 'Hà Nội', 'Azzan'),
('Hoàng Minh Tuấn', 0, '0388536414', 'vipxpert3721@gmail.com', '2003-03-01', 2, 'Hà Nội', 'Azzan'),
('Đào Nguyễn Quang Thành', 1, '0395746221', 'daothanh1121@gmail.com', '2003-11-21', 3, 'Hà Nội', 'Azzan')


INSERT INTO [dbo].[ItemCategory] (ItemCategoryName, [Description], Discount, Image)
VALUES ('CAFÉ', 'COFFEE', 0, 'https://www.flaticon.com/free-icon/coffee-cup_8230211'),
('TRÀ', 'TEA', 0, 'https://www.freepik.com/icon/hot-tea_4300605'),
('SỮA CHUA', 'YOGURT', 0, 'https://www.google.com/imgres?q=s%E1%BB%AFa%20chua%20yogurt%20icon&imgurl=https%3A%2F%2Fpng.pngtree.com%2Fpng-clipart%2F20210312%2Fourmid%2Fpngtree-yogurt-clip-art-plain-yogurt-png-image_3033785.jpg&imgrefurl=https%3A%2F%2Fvi.pngtree.com%2Ffree-png-vectors%2Fyogurt&docid=Ap701QDLEZfmFM&tbnid=cPdzadW5b2u4TM&vet=12ahUKEwjb_rbak9uIAxVnqFYBHR3-E24QM3oECDcQAA..i&w=360&h=360&hcb=2&ved=2ahUKEwjb_rbak9uIAxVnqFYBHR3-E24QM3oECDcQAA'),
('SINH TỐ & NƯỚC ÉP', 'SMOOTHIE&FRUIT JUICE', 0, 'https://www.pngegg.com/vi/png-bydmc'),
('ĐÁ XAY', 'ICE BLENDED', 0, 'https://vi.pngtree.com/free-png-vectors/%C4%91%C3%A1-xay'),
('LỚP PHỦ', 'TOPPING', 0, 'https://www.flaticon.com/free-icon/topping_3157439')


INSERT INTO [dbo].[MenuItem] (ItemName, Price, [Description], Discount, IsAvailable, EmployeeId)
VALUES 
('Café Đen/ Café Nâu', 22, 'Black Coffee/ Milk Coffee', 0, 1, 1),
('Bạc Sỉu', 25, 'White coffee', 0, 1, 1),
('Bạc Sỉu Cốt Dừa', 28, 'White coffee coconut', 0, 1, 1),
('Café Woody', 35,  'Woody Coffee', 0, 1, 1),
('Café kem trứng', 35, 'Egg Custard coffee', 0, 1, 1),
('Cacao Nóng/Đá', 30, 'Hot Cacao/Ice', 0, 1, 1),
('Café Espresso', 25, null, 0, 1, 1),
('Americano', 30, null, 0, 1, 1),
('Capucchino', 35, null, 0, 1, 1),
('Latte', 35, null, 0, 1, 1),
('Caramel Machitato', 40, null, 0, 1, 1),
('Hồng Trà Sữa', 30, 'Black Milk Tea', 0, 1, 1),
('Trà Sữa Hạt Dẻ', 35, 'Chestnut Milk Tea', 0, 1, 1),
('Trà Sữa Chocolate', 35, 'Chocolate Milk Tea', 0, 1, 1),
('Trà Sữa Hokkaido', 35, 'Hokkaido Milk Tea', 0, 1, 1),
('Trà Sữa Bạc Hà', 35, 'Mint Milk Tea', 0, 1, 1),
('Trà Thạch Đào', 25, 'Jelly Peach Tea', 0 ,1 ,1),
('Trà Hoa Quả', 35, 'Fruits Tea', 0, 1, 1),
('Trà Matcha Đậu Đỏ', 35, 'Matcha Red Beans Tea', 0, 1, 1),
('Trà Dưa Hấu Bạc Hà', 35, 'Watermelon Mint Tea', 0, 1, 1),
('Trà Đào', 25, 'Peach Tea', 0, 1, 1),
('Trà Đào Cam Sả', 35, 'Orange Lemon Grass Peach Tea', 0, 1, 1),
('Trà Lipton', 20, 'Lipton Tea', 0, 1, 1),
('Sữa Chua Đánh Đá', 20, 'Ice Yogurt', 0, 1, 1),
('Sữa Chua Coffee', 25, 'Coffee Yogurt', 0, 1, 1),
('Sữa Chua Thạch Dừa', 25, 'Jelly Coconut Yogurt', 0, 1, 1),
('Sữa Chua Việt Quất', 25, 'Blueberry Yogurt', 0, 1, 1),
('Sữa Chua Thạch Đào', 25, 'Jelly Peach Yogurt', 0, 1, 1),
('Sữa Chua Đậu Đỏ', 30, 'Red Beans Yogurt', 0, 1, 1),
('Sữa Chua Trân Châu', 30, 'Jelly Yogurt', 0, 1, 1),
('Sinh Tố Chuối', 20, 'Banana', 0, 1, 1),
('Sinh Tố Chuối Xoài', 25, 'Banana With Mango', 0, 1, 1),
('Sinh Tố Xoài', 25, 'Mango', 0, 1, 1),
('Sinh Tố Bơ', 35, 'Avocado', 0, 1, 1),
('Sinh Tố Bơ Chuối', 35, 'Avocado With Banana', 0, 1, 1),
('Nước Chanh Tươi', 20, 'Lemon Juice', 0, 1, 1),
('Nước Chanh Leo', 25, 'Passion Juice', 0, 1, 1),
('Nước Dưa Hấu', 25, 'Watermelon Juice', 0, 1, 1),
('Nước Cam', 35, 'Orange Juice', 0, 1, 1),
('Trà Xanh Matcha', 35, 'Matcha Green Tea', 0, 1, 1),
('Việt Quất', 30, 'Blueberry', 0, 1, 1),
('Chocolate Bạc Hà', 35, 'Mint Chocolate', 0, 1, 1),
('Chanh Tuyết', 30, 'Snow Lemon', 0, 1, 1),
('Chanh Leo Tuyết', 35, 'Snow Passion Fruit', 0, 1, 1),
('Đậu Xanh Cốt Dừa', 35, 'Coconut Green Beans', 0, 1, 1),
('Thạch Dừa', 5, 'Coconut Jelly', 0, 1, 1),
('Thạch Đào', 5, 'Peach Jelly', 0, 1, 1),
('Trân Châu', 7, 'Bubble', 0, 1, 1),
('Kem Tươi', 7, 'Whipping Cream', 0, 1, 1),
('Đậu Đỏ', 10, 'Red Bean', 0, 1, 1),
('Hướng Dương', 20, 'Sunflower Seeds', 0, 1, 1),
('Hạt Bí', 20, 'Pumpkin Seeds', 0, 1, 1)


INSERT INTO dbo.MenuCategory (MenuItemId, ItemCategoryId, StartDate, EndDate, IsForCombo)
VALUES
(1,1,null,null,0),
(2,1,null,null,0),
(3,1,null,null,0),
(4,1,null,null,0),
(5,1,null,null,0),
(6,1,null,null,0),
(7,1,null,null,0),
(8,1,null,null,0),
(9,1,null,null,0),
(10,1,null,null,0),
(11,1,null,null,0),
(12,2,null,null,0),
(13,2,null,null,0),
(14,2,null,null,0),
(15,2,null,null,0),
(16,2,null,null,0),
(17,2,null,null,0),
(18,2,null,null,0),
(19,2,null,null,0),
(20,2,null,null,0),
(21,2,null,null,0),
(22,2,null,null,0),
(23,2,null,null,0),
(24,3,null,null,0),
(25,3,null,null,0),
(26,3,null,null,0),
(27,3,null,null,0),
(28,3,null,null,0),
(29,3,null,null,0),
(30,3,null,null,0),
(31,4,null,null,0),
(32,4,null,null,0),
(33,4,null,null,0),
(34,4,null,null,0),
(35,4,null,null,0),
(36,4,null,null,0),
(37,4,null,null,0),
(38,4,null,null,0),
(39,4,null,null,0),
(40,5,null,null,0),
(41,5,null,null,0),
(42,5,null,null,0),
(43,5,null,null,0),
(44,5,null,null,0),
(45,5,null,null,0),
(46,6,null,null,0),
(47,6,null,null,0),
(48,6,null,null,0),
(49,6,null,null,0),
(50,6,null,null,0),
(51,6,null,null,0),
(52,6,null,null,0)
INSERT INTO [dbo].[Table] (QR, [Status], [EmployeeId])
VALUES
('QR_000', 1, 1),
('QR_001', 1, 1), 
('QR_002', 1, 1), 
('QR_003', 1, 1),
('QR_004', 1, 1), 
('QR_005', 1, 1), 
('QR_006', 1, 1),
('QR_007', 1, 1), 
('QR_008', 1, 1), 
('QR_009', 1, 1),
('QR_010', 1, 1), 
('QR_011', 1, 1), 
('QR_012', 1, 1)


INSERT INTO [dbo].[Member] (MemberName, Gender, Phone, Gmail, BirthDate, [Address], Point)
VALUES 
('Nguyễn Tuấn Cường', 1, '0934422800', 'cuongnthe171665@fpt.edu.vn', '2003-08-13', 'Hà Nội', 1000),
('Nguyễn Quốc Tuấn', 1, '0523452907', 'tuannqhe160900@fpt.edu.vn', '2000-01-25', 'Hà Nội', 1500),
('Sầm Trung Hòa An', 1, '0387919688', 'ansthhe176321@fpt.edu.vn', '2003-04-23', 'Thái Nguyên', 1000),
('Bùi Quang Minh', 1, '0399955598', 'buiquangminh.business@gmail.com', '2003-07-31', 'Quảng Ninh', 2000)


INSERT INTO [dbo].[Owner] ([OwnerName], Gender, Phone, Gmail, BirthDate, BankId)
VALUES ('Nguyễn Quang Minh', 1, '0866187621', 'nguyenminh7902@gmail.com', '2002-09-07', 1)


INSERT INTO [dbo].[Order] (OrderDate, OrderDetailId, TableId, Cost, Tax, MemberId,[Status])
VALUES 
('2024-09-20', 1, 1, 10.5, 1.05, 1, 1),
('2024-09-21', 2, 2, 8.0, 0.8, 2, 0)


INSERT INTO [dbo].[OrderDetail] (Quantity, MenuItemId, OrderId)
VALUES 
(2, 1, 1),
(1, 2, 2)


INSERT INTO [dbo].[Feedback] (Content, MemberId)
VALUES 
('Great coffee and fast service!', 1),
('Loved the atmosphere!', 2)


INSERT INTO [dbo].[Notification] (Title, Content, MemberId, EmployeeId)
VALUES 
('Discount offer', 'Get 10% off on all coffee orders', 1, 2),
('Happy Hour', '50% off on all drinks from 3-5 PM', 2, 2)


INSERT INTO dbo.VoucherDetail (Title, StartDate, EndDate, Discount)
VALUES 
('Summer Sale', '2024-06-01', '2024-06-30', 15.0),
('Black Friday', '2024-11-24', '2024-11-30', 25.0),
('Christmas Special', '2024-12-20', '2024-12-31', 20.0),
('New Year Discount', '2024-01-01', '2024-01-10', 10.0);


INSERT INTO dbo.Voucher (VocherDetailId, ItemCategoryId, IsActive)
VALUES 
(1, 1, 1),  -- Summer Sale
(2, 2, 0),  -- Black Friday
(3, 3, 0),  -- Christmas Special
(4, 4, 0);  -- New Year Discount


