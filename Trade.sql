USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 10.04.2023 12:19:58 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files (x86)\MSSQL16.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files (x86)\MSSQL16.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = ON
GO
ALTER DATABASE [Trade] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] NOT NULL,
	[ManufacturerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderContents] [nvarchar](50) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDelivery] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[UserInfoID] [int] NULL,
	[CodeForReceiving] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF7E5F2782] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointID] [int] NOT NULL,
	[IndexPickupPoint] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[SreetID] [int] NOT NULL,
	[House] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductNameID] [int] NOT NULL,
	[ProductUnitID] [int] NOT NULL,
	[ProductCost] [int] NOT NULL,
	[ProductMaxDiscountAmount] [tinyint] NOT NULL,
	[ProductManufacturerID] [int] NOT NULL,
	[ProductProviderID] [int] NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[ProductDiscountAmount] [tinyint] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductPhoto] [nvarchar](50) NULL,
 CONSTRAINT [PK__Product__2EA7DCD5CF161E97] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductName]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductName](
	[ID] [int] NOT NULL,
	[NameOfProduct] [nvarchar](50) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ID] [int] NOT NULL,
	[ProviderName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Role__8AFACE3AE3E36FB6] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[ID] [int] NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[ID] [int] NOT NULL,
	[NameUnit] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserRole] [int] NOT NULL,
	[UserInfoID] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCAC5EE615D1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 10.04.2023 12:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [int] NOT NULL,
	[UserSurname] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPatronymic] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (1, N'Общестроительные материалы')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (2, N'Стеновые и фасадные материалы')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (3, N'Сухие строительные смеси и гидроизоляция')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (4, N'Ручной инструмент')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (5, N'Защита лица, глаз, головы')
GO
INSERT [dbo].[City] ([ID], [CityName]) VALUES (1, N' г.Сыктывкар
')
GO
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (0, N'Хасбик')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (1, N'М500
')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (2, N'Изостронг')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (3, N'Knauf')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (4, N'MixMaster')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (5, N'ЛСР')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (6, N'ВОЛМА')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (7, N'Vinylon')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (8, N'Павловский завод ')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (9, N'Weber')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (10, N'Hesler')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (11, N'Armero')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (12, N'Wenzo Roma')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (13, N'KILIMGRIN')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (14, N'RUIZ')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (15, N'Исток')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (16, N'Delta')
INSERT [dbo].[Manufacturer] ([ID], [ManufacturerName]) VALUES (17, N'Husqvarna')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (1, 1, N'PMEZMH, 2, BPV4MM, 2', CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 18, NULL, 701, 1)
INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (2, 2, N'JVL42J, 15, F895RB, 15', CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), 14, NULL, 702, 2)
INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (3, 3, N'3XBOTN, 13, 3L7RCZ, 17', CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-23T00:00:00.000' AS DateTime), 22, 9, 703, 1)
INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (4, 4, N'2G3280, 40, MIO8YV, 100', CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-24T00:00:00.000' AS DateTime), 22, NULL, 704, 2)
INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (5, 5, N'UER2QD, 100, ZR70B4, 100', CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), 26, 8, 705, 1)
INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (6, 6, N'LPDDM4, 20, LQ48MW, 20', CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 28, NULL, 706, 2)
INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (7, 7, N'O43COU, 50, M26EXW, 50', CAST(N'2022-05-21T00:00:00.000' AS DateTime), CAST(N'2022-05-27T00:00:00.000' AS DateTime), 28, 10, 707, 1)
INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (8, 8, N'K0YACK, 40, ASPXSG, 40', CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2022-05-28T00:00:00.000' AS DateTime), 32, NULL, 708, 2)
INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (9, 9, N'4WZEOT, 10, 4JR1HN, 10', CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-29T00:00:00.000' AS DateTime), 36, NULL, 709, 1)
INSERT [dbo].[Order] ([OrderID], [OrderNumber], [OrderContents], [OrderDate], [OrderDelivery], [OrderPickupPoint], [UserInfoID], [CodeForReceiving], [OrderStatus]) VALUES (10, 10, N'QHNOKR, 1, EQ6RKO, 1', CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-30T00:00:00.000' AS DateTime), 36, 7, 710, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (1, 344288, 1, 1, N'1')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (2, 614164, 1, 2, N'30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (3, 394242, 1, 3, N'43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (4, 660540, 1, 4, N'25')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (5, 125837, 1, 5, N'40')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (6, 125703, 1, 6, N'49')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (7, 625283, 1, 7, N'46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (8, 614611, 1, 8, N'50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (9, 454311, 1, 9, N'19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (10, 660007, 1, 10, N'19')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (11, 603036, 1, 11, N'4')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (12, 450983, 1, 12, N'26')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (13, 394782, 1, 1, N'3')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (14, 603002, 1, 13, N'28')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (15, 450558, 1, 14, N'30')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (16, 394060, 1, 15, N'43')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (17, 410661, 1, 16, N'50')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (18, 625590, 1, 3, N'20')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (19, 625683, 1, 17, N'')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (20, 400562, 1, 18, N'32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (21, 614510, 1, 19, N'47')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (22, 410542, 1, 20, N'46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (23, 620839, 1, 21, N'8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (24, 443890, 1, 3, N'1')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (25, 603379, 1, 22, N'46')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (26, 603721, 1, 23, N'41')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (27, 410172, 1, 24, N'13')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (28, 420151, 1, 25, N'32')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (29, 125061, 1, 26, N'8')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (30, 630370, 1, 5, N'24')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (31, 614753, 1, 27, N'35')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (32, 426030, 1, 19, N'44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (33, 450375, 1, 28, N'44')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (34, 625560, 1, 29, N'12')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (35, 630201, 1, 12, N'17')
INSERT [dbo].[PickupPoint] ([PickupPointID], [IndexPickupPoint], [CityID], [SreetID], [House]) VALUES (36, 190949, 1, 30, N'26')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'0YGHZ7', 30, 1, 700, 9, 17, 17, 5, 9, 36, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'2G3280', 8, 1, 795, 16, 7, 7, 2, 9, 20, N'2G3280.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'3L7RCZ', 6, 1, 7400, 7, 5, 5, 2, 2, 20, N'3L7RCZ.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'3XBOTN', 5, 1, 110, 14, 4, 4, 1, 5, 21, N'3XBOTN.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'4JR1HN', 20, 1, 26, 3, 10, 10, 4, 6, 7, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'4WZEOT', 19, 1, 110, 2, 11, 11, 4, 6, 17, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'61PGH3', 24, 1, 184, 2, 13, 13, 5, 6, 25, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'81F1WG', 29, 1, 1500, 1, 16, 16, 5, 2, 13, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'83M5ME', 23, 1, 122, 16, 11, 11, 4, 9, 26, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'ASPXSG', 17, 1, 711, 17, 9, 9, 3, 10, 20, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'BPV4MM', 2, 1, 8, 13, 2, 2, 1, 8, 2, N'BPV4MM.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'DSDFS', 0, 1, 500, 50, 0, 0, 1, 30, 1000, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'EQ6RKO', 28, 1, 36, 17, 17, 17, 5, 3, 22, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'F895RB', 4, 1, 102, 17, 3, 3, 1, 6, 7, N'F895RB.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'GN6ICZ', 25, 1, 154, 10, 15, 15, 5, 6, 8, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'I6MH89', 22, 1, 326, 12, 12, 12, 4, 6, 3, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'JVL42J', 3, 1, 13, 1, 2, 2, 1, 4, 34, N'JVL42J.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'K0YACK', 16, 1, 160, 9, 4, 4, 3, 8, 19, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'LPDDM4', 12, 1, 500, 17, 3, 3, 3, 6, 38, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'LQ48MW', 13, 1, 462, 16, 9, 9, 3, 6, 33, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'M26EXW', 15, 1, 340, 8, 3, 3, 3, 8, 2, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'MIO8YV', 9, 1, 30, 9, 6, 6, 2, 9, 31, N'MIO8YV.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'O43COU', 14, 1, 750, 9, 6, 6, 3, 1, 16, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'PMEZMH', 1, 1, 440, 10, 1, 1, 1, 8, 34, N'PMEZMH.jpg
')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'QHNOKR', 27, 1, 251, 6, 15, 15, 5, 2, 22, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'S72AM3', 7, 1, 500, 9, 6, 6, 2, 5, 35, N'S72AM3.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'UER2QD', 10, 1, 25, 20, 3, 3, 2, 8, 27, N'UER2QD.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'Z3LO0U', 26, 1, 228, 19, 14, 14, 5, 9, 11, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'Z3XFSP', 21, 1, 63, 19, 10, 10, 4, 8, 5, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'ZKQ5FF', 18, 1, 65, 13, 10, 10, 4, 6, 6, N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductNameID], [ProductUnitID], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturerID], [ProductProviderID], [ProductCategoryID], [ProductDiscountAmount], [ProductQuantityInStock], [ProductPhoto]) VALUES (N'ZR70B4', 11, 1, 16, 3, 8, 8, 2, 3, 26, N'')
GO
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (0, N'Клубника', N'Бомба честно говоря')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (1, N'Цемент', N'Цемент Евроцемент М500 Д0 ЦЕМ I 42,5 50 кг')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (2, N'Пленка техническая', N'Пленка техническая полиэтиленовая Изостронг 60 мк 3 м рукав 1,5 м, пог.м')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (3, N'Пленка техническая', N'Пленка техническая полиэтиленовая Изостронг 100 мк 3 м рукав 1,5 м, пог.м')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (4, N'Песок строительный', N'Песок строительный 50 кг')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (5, N'Керамзит фракция', N'Керамзит фракция 10-20 мм 0,05 куб.м')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (6, N'Газобетон', N'Газобетон ЛСР 100х250х625 мм D400')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (7, N'Пазогребневая плита ', N'Пазогребневая плита ВОЛМА Гидро 667х500х80 мм полнотелая')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (8, N'Угол наружный', N'Угол наружный Vinylon 3050 мм серо-голубой')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (9, N'Кирпич', N'Кирпич рядовой Боровичи полнотелый М150 250х120х65 мм 1NF')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (10, N'Скоба для пазогребневой плиты', N'Скоба для пазогребневой плиты Knauf С1 120х100 мм')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (11, N'Кирпич', N'Кирпич рядовой силикатный Павловский завод полнотелый М200 250х120х65 мм 1NF')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (12, N'Штукатурка гипсовая', N'Штукатурка гипсовая Knauf Ротбанд 30 кг')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (13, N'Штукатурка гипсовая', N'Штукатурка гипсовая Knauf МП-75 машинная 30 кг')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (14, N'Шпаклевка', N'Шпаклевка полимерная Weber.vetonit LR + для сухих помещений белая 20 кг')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (15, N'Клей для плитки, керамогранита и камня', N'Клей для плитки, керамогранита и камня Крепс Усиленный серый (класс С1) 25 кг')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (16, N'Смесь цементно-песчаная', N'Смесь цементно-песчаная (ЦПС) 300 по ТУ MixMaster Универсал 25 кг')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (17, N'Ровнитель', N'Ровнитель (наливной пол) финишный Weber.vetonit 4100 самовыравнивающийся высокопрочный 20 кг')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (18, N'Лезвие для ножа ', N'Лезвие для ножа Hesler 18 мм прямое (10 шт.)')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (19, N'Лезвие для ножа ', N'Лезвие для ножа Armero 18 мм прямое (10 шт.)')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (20, N'Шпатель', N'Шпатель малярный 100 мм с пластиковой ручкой')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (21, N'Нож строительный ', N'Нож строительный Hesler 18 мм с ломающимся лезвием пластиковый корпус')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (22, N'Валик', N'Валик Wenzo Roma полиакрил 250 мм ворс 18 мм для красок грунтов и антисептиков на водной основе с рукояткой')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (23, N'Кисть', N'Кисть плоская смешанная щетина 100х12 мм для красок и антисептиков на водной основе')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (24, N'Очки защитные', N'Очки защитные Delta Plus KILIMANDJARO (KILIMGRIN) открытые с прозрачными линзами')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (25, N'Каска защитная ', N'Каска защитная Исток (КАС001О) оранжевая')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (26, N'Очки защитные ', N'Очки защитные Delta Plus RUIZ (RUIZ1VI) закрытые с прозрачными линзами')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (27, N'Маска защитная', N'Маска защитная Исток (ЩИТ001) ударопрочная и термостойкая')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (28, N'Подшлемник', N'Подшлемник для каски одноразовый')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (29, N'Каска защитная', N'Каска защитная Delta Plus BASEBALL DIAMOND V UP (DIAM5UPBCFLBS) белая')
INSERT [dbo].[ProductName] ([ID], [NameOfProduct], [ProductDescription]) VALUES (30, N'Очки защитные ', N'Очки защитные Husqvarna Clear (5449638-01) открытые с прозрачными линзами')
GO
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (0, N'Хасбик')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (1, N'М500')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (2, N'Изостронг')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (3, N'Knauf')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (4, N'MixMaster')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (5, N'ЛСР')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (6, N'ВОЛМА')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (7, N'Vinylon')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (8, N'Павловский завод ')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (9, N'Weber')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (10, N'Hesler')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (11, N'Armero')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (12, N'Wenzo Roma')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (13, N'KILIMGRIN')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (14, N'RUIZ')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (15, N'Исток')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (16, N'Delta')
INSERT [dbo].[Provider] ([ID], [ProviderName]) VALUES (17, N'Husqvarna')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
GO
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Завершен')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Новый ')
GO
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (1, N' ул. Чехова')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (2, N'  ул. Степная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (3, N' ул. Коммунистическая')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (4, N' ул. Солнечная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (5, N' ул. Шоссейная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (6, N' ул. Партизанская')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (7, N' ул. Победы')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (8, N' ул. Молодежная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (9, N' ул. Новая')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (10, N' ул. Октябрьская')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (11, N' ул. Садовая')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (12, N' ул. Комсомольская')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (13, N' ул. Дзержинского')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (14, N' ул. Набережная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (15, N' ул. Фрунзе')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (16, N' ул. Школьная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (17, N' ул. 8 Марта')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (18, N' ул. Зеленая')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (19, N' ул. Маяковского')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (20, N' ул. Светлая')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (21, N' ул. Цветочная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (22, N' ул. Спортивная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (23, N' ул. Гоголя')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (24, N' ул. Северная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (25, N' ул. Вишневая')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (26, N' ул. Подгорная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (27, N' ул. Полевая')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (28, N'ул. Клубная')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (29, N' ул. Некрасова')
INSERT [dbo].[Street] ([ID], [StreetName]) VALUES (30, N' ул. Мичурина')
GO
INSERT [dbo].[Unit] ([ID], [NameUnit]) VALUES (1, N'шт')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (1, N'klh7pi4rcbtz@gmail.com', N'2L6KZG', 1, 1)
INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (2, N'gn0354mbiork@outlook.com', N'uzWC67', 1, 2)
INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (3, N'1o4l05k8dwpv@yahoo.com', N'8ntwUp', 1, 3)
INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (4, N'hsqixl2vebuz@mail.com', N'YOyhfR', 2, 4)
INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (5, N'towkse0hf26b@outlook.com', N'RSbvHv', 2, 5)
INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (6, N'khx0ncdwz4uj@gmail.com', N'rwVDh9', 2, 6)
INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (7, N'01zji3wfuq7h@outlook.com', N'LdNyos', 3, 7)
INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (8, N'am65k18q7bwp@mail.com', N'gynQMT', 3, 8)
INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (9, N'wt9q8i6ypx47@outlook.com', N'AtnDjr', 3, 9)
INSERT [dbo].[User] ([UserID], [UserLogin], [UserPassword], [UserRole], [UserInfoID]) VALUES (10, N'4o72gufv3xlz@tutanota.com', N'JlFRCZ', 3, 10)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (1, N'Басова', N'Амина', N'Кирилловна')
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (2, N'Михайлов', N'Андрей', N'Денисович')
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (3, N'Сидоров', N'Егор', N'Александрович')
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (4, N'Аксенова', N'Ульяна', N'Ивановна')
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (5, N'Васильева', N'Камила', N'Ивановна')
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (6, N'Ильин', N'Артём', N'Родионович')
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (7, N'Васильева', N'Василиса', N'Фёдоровна')
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (8, N'Кудрявцева', N'Василиса', N'Матвеевна')
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (9, N'Кириллова', N'Николь', N'Святославовна')
INSERT [dbo].[UserInfo] ([ID], [UserSurname], [UserName], [UserPatronymic]) VALUES (10, N'Андреева', N'Полина', N'Артёмовна')
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([PickupPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserInfo]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__3F466844] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__3F466844]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__403A8C7D] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__403A8C7D]
GO
ALTER TABLE [dbo].[PickupPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickupPoint_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[PickupPoint] CHECK CONSTRAINT [FK_PickupPoint_City]
GO
ALTER TABLE [dbo].[PickupPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickupPoint_Street] FOREIGN KEY([SreetID])
REFERENCES [dbo].[Street] ([ID])
GO
ALTER TABLE [dbo].[PickupPoint] CHECK CONSTRAINT [FK_PickupPoint_Street]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductName] FOREIGN KEY([ProductNameID])
REFERENCES [dbo].[ProductName] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductName]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([ProductProviderID])
REFERENCES [dbo].[Provider] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Unit] FOREIGN KEY([ProductUnitID])
REFERENCES [dbo].[Unit] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Unit]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__38996AB5] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__38996AB5]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserInfo]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
