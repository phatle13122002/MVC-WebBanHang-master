USE [master]
GO
/****** Object:  Database [QLWebBanHang]    Script Date: 30/08/2023 6:57:51 PM ******/
CREATE DATABASE [QLWebBanHang]

GO
ALTER DATABASE [QLWebBanHang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLWebBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLWebBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLWebBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLWebBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLWebBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLWebBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLWebBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLWebBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLWebBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLWebBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLWebBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLWebBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLWebBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLWebBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLWebBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLWebBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLWebBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLWebBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLWebBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLWebBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLWebBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLWebBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLWebBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLWebBanHang] SET RECOVERY FULL 
GO
ALTER DATABASE [QLWebBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [QLWebBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLWebBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLWebBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLWebBanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLWebBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLWebBanHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLWebBanHang', N'ON'
GO
ALTER DATABASE [QLWebBanHang] SET QUERY_STORE = OFF
GO
USE [QLWebBanHang]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 30/08/2023 6:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 30/08/2023 6:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [nvarchar](50) NOT NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[OrderDate] [date] NULL,
	[AmountPaid] [int] NULL,
	[CustomerID] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](11) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 30/08/2023 6:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [nvarchar](50) NULL,
	[OrderID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[Quantity] [int] NULL,
	[Unit] [int] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_OrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 30/08/2023 6:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[STT] [int] NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductDescription] [nvarchar](255) NULL,
	[Quantity] [int] NULL,
	[Prices] [int] NULL,
	[SupplierID] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
	[IsHide] [nchar](10) NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 30/08/2023 6:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CustomerID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[Quantity] [int] NULL,
	[Unit] [int] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_ShoppingCart_1] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 30/08/2023 6:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Distributor] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 30/08/2023 6:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](255) NOT NULL,
	[PassWord] [nchar](255) NOT NULL,
	[VaiTro] [nvarchar](50) NULL,
	[CustomerID] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'1f1d03b1-a00f-407b-96ed-f728a9ed40cb', N'mới', N'tài khoản', N'231 dô', N'093210313')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'324d60c9-b94c-40b4-b5b1-12df3074df18', N'Linh', N'Nguyễn Thị', N'222 Nguyễn Thượng Hiền', N'0121121121')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'38072962-b006-4b1e-9ac7-a27837f26662', N'hàng', N'Khách ', N'123 đâu đó', N'0112333401')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'5caeb550-61bd-466a-91f5-1b2115762beb', N'Phát', N'Lê Tiến ', N'2134 001', N'0999999999')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'6ce43c96-c16d-428c-a459-37f39c17a307', N'Đệ', N'Trần Tuấn ', N'132 lê duẫn', N'01345678901')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'88ba57b1-59ce-471a-be23-8a94c9d6c397', N'Phúc', N'Nguyễn Hồng', N'132 địa chỉ phường đâu quận đó', N'0123123456')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'96af0cc7-d83e-4b2c-bd5e-c44876ed6858', N'Liêu', N'Liêu', N'3232 đâu đó', N'09876543219')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'accd2d8f-daad-4d28-869c-df19dc0e4db4', N'Sang', N'Ngô Phước ', N'3139 tp hồ chí minh', N'01329089321')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'dc7c4154-8260-474e-a7d8-ac48c26c0f19', N'Phương', N'Đỗ Minh ', N'321 0 đâu đó nữa', N'0456321789')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'e7d96a43-45a3-434d-91b7-925bc58dced1', N'Lê', N'Văn', N'222 Nguyễn Thượng Hiền', N'01234567890')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'f37da477-2a64-41d7-91ec-9a1b4c519f0e', N'Và điệp', N'Lan', N'100 nguyễn gì đó', N'9132312313')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (N'f6b88f9f-8de8-44a2-9632-839b516d3200', N'nam', N'nam', N'122', N'019231312')
GO
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'05927c99-b11b-4b63-90af-71b9e7243787', NULL, CAST(N'2023-08-28' AS Date), 200000, N'88ba57b1-59ce-471a-be23-8a94c9d6c397', N'132 địa chỉ phường đâu quận đó', N'0123123456')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'1c70feed-5e20-424f-baaf-8a6184e0e9f4', NULL, CAST(N'2023-08-28' AS Date), 130000, N'88ba57b1-59ce-471a-be23-8a94c9d6c397', N'132 địa chỉ phường đâu quận đó', N'0123123456')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'1f9b7b86-4207-4d92-a844-31165be95642', NULL, CAST(N'2023-08-28' AS Date), 350000, N'5caeb550-61bd-466a-91f5-1b2115762beb', N'2134 001', N'0999999999')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'2a0ce6db-0200-414d-8f1c-8ac4534fab00', NULL, CAST(N'2023-08-28' AS Date), 690000, N'dc7c4154-8260-474e-a7d8-ac48c26c0f19', N'321 0 đâu đó nữa', N'0456321789')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'3dbafb77-2740-4e49-ac72-57311fa37f89', NULL, CAST(N'2023-08-28' AS Date), 120000, N'88ba57b1-59ce-471a-be23-8a94c9d6c397', N'132 địa chỉ phường đâu quận đó', N'0123123456')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'3f9547fe-8bae-4983-bce5-5182c547795e', NULL, CAST(N'2023-08-28' AS Date), 150000, N'dc7c4154-8260-474e-a7d8-ac48c26c0f19', N'321 0 đâu đó nữa', N'0456321789')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'498ae45a-8323-4550-80da-c49d59307942', NULL, CAST(N'2023-08-28' AS Date), 320000, N'6ce43c96-c16d-428c-a459-37f39c17a307', N'132 lê duẫn', N'01345678901')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'55878bf7-5ca4-4766-b387-4c1f77283413', NULL, CAST(N'2023-08-28' AS Date), 160000, N'5caeb550-61bd-466a-91f5-1b2115762beb', N'2134 001', N'0999999999')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'5b56affc-3040-4fbd-9395-e2586cc36e34', NULL, CAST(N'2023-08-24' AS Date), 1560000, N'38072962-b006-4b1e-9ac7-a27837f26662', N'123 đâu đó', N'0112333401')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'62b465d5-efcf-41da-90b5-f2d39bb4c484', NULL, CAST(N'2023-08-28' AS Date), 580000, N'5caeb550-61bd-466a-91f5-1b2115762beb', N'2134 001', N'0999999999')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'673f8d81-ae59-4cc0-923e-73721acdea75', NULL, CAST(N'2023-08-24' AS Date), 160000, N'38072962-b006-4b1e-9ac7-a27837f26662', N'123 đâu đó', N'0112333401')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'7ae49b7a-fcd4-40cb-91f8-c81a9078de85', NULL, CAST(N'2023-08-28' AS Date), 140000, N'88ba57b1-59ce-471a-be23-8a94c9d6c397', N'132 địa chỉ phường đâu quận đó', N'0123123456')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'809bac5e-5bb8-452f-bcc6-4f0dc34b3263', NULL, CAST(N'2023-08-28' AS Date), 340000, N'324d60c9-b94c-40b4-b5b1-12df3074df18', N'222 Nguyễn Thượng Hiền', N'0121121121')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'8169ab62-b459-4d86-84ea-262d56f043b7', NULL, CAST(N'2023-08-17' AS Date), 170000, N'96af0cc7-d83e-4b2c-bd5e-c44876ed6858', N'3232 đâu đó', N'09876543219')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'8a78150d-5430-4a31-aaa3-261c62d97de9', NULL, CAST(N'2023-08-28' AS Date), 140000, N'324d60c9-b94c-40b4-b5b1-12df3074df18', N'222 Nguyễn Thượng Hiền', N'0121121121')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'91a490c3-86e4-4043-8b38-0984300e6c86', NULL, CAST(N'2023-08-28' AS Date), 470000, N'324d60c9-b94c-40b4-b5b1-12df3074df18', N'222 Nguyễn Thượng Hiền', N'0121121121')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'afb710c2-d4ee-4701-ac9e-f940bf200734', NULL, CAST(N'2023-08-28' AS Date), 130000, N'accd2d8f-daad-4d28-869c-df19dc0e4db4', N'3139 tp hồ chí minh', N'01329089321')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'c244b0a8-1b43-4358-af16-68e6e4b9c77e', NULL, CAST(N'2023-08-28' AS Date), 120000, N'6ce43c96-c16d-428c-a459-37f39c17a307', N'132 lê duẫn', N'01345678901')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'd0205254-dfb4-4b04-a564-f4a984547edc', NULL, CAST(N'2023-08-28' AS Date), 100000, N'accd2d8f-daad-4d28-869c-df19dc0e4db4', N'3139 tp hồ chí minh', N'01329089321')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'e30a3a0b-d5c4-46c3-bd86-87130332a23e', NULL, CAST(N'2023-08-28' AS Date), 100000, N'dc7c4154-8260-474e-a7d8-ac48c26c0f19', N'321 0 đâu đó nữa', N'0456321789')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'e9caedb1-e370-4f58-b6bd-c384a8747f46', NULL, CAST(N'2023-08-28' AS Date), 710000, N'324d60c9-b94c-40b4-b5b1-12df3074df18', N'222 Nguyễn Thượng Hiền', N'0121121121')
INSERT [dbo].[Order] ([OrderID], [PaymentMethod], [OrderDate], [AmountPaid], [CustomerID], [Address], [Phone]) VALUES (N'efda9900-4906-480e-95c3-31448cbb9f9c', NULL, CAST(N'2023-08-28' AS Date), 60000, N'6ce43c96-c16d-428c-a459-37f39c17a307', N'132 lê duẫn', N'01345678901')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'05927c99-b11b-4b63-90af-71b9e7243787', N'5f126182-9fd4-4dbe-8473-68c512877ebb', 5, 20000, 100000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'05927c99-b11b-4b63-90af-71b9e7243787', N'a4417e7d-a83e-4589-b34c-2cbe3cdf46c1', 5, 20000, 100000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'1c70feed-5e20-424f-baaf-8a6184e0e9f4', N'93e13c14-f914-408a-b9d1-a0f64e70a104', 1, 130000, 130000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'1f9b7b86-4207-4d92-a844-31165be95642', N'798e16a3-7891-41f1-b452-3016602787e4', 1, 350000, 350000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'2a0ce6db-0200-414d-8f1c-8ac4534fab00', N'82a907e6-2e97-4e5a-9110-07587723364f', 3, 230000, 690000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'3dbafb77-2740-4e49-ac72-57311fa37f89', N'306e7784-0caf-433a-a6ad-a0c53f73c901', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'3dbafb77-2740-4e49-ac72-57311fa37f89', N'48628886-9ee7-4b50-b479-933845bc7ae5', 1, 40000, 40000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'3dbafb77-2740-4e49-ac72-57311fa37f89', N'48ad425e-f7e9-4215-bff5-9a59212431d3', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'3dbafb77-2740-4e49-ac72-57311fa37f89', N'5f126182-9fd4-4dbe-8473-68c512877ebb', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'3f9547fe-8bae-4983-bce5-5182c547795e', N'e71467d8-aec2-4f7f-9025-aea8c9d451e8', 5, 30000, 150000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'498ae45a-8323-4550-80da-c49d59307942', N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', 1, 70000, 70000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'498ae45a-8323-4550-80da-c49d59307942', N'82a907e6-2e97-4e5a-9110-07587723364f', 1, 230000, 230000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'498ae45a-8323-4550-80da-c49d59307942', N'89169aea-fceb-4ae5-8ff6-728ed0918f59', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'55878bf7-5ca4-4766-b387-4c1f77283413', N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', 1, 70000, 70000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'55878bf7-5ca4-4766-b387-4c1f77283413', N'306e7784-0caf-433a-a6ad-a0c53f73c901', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'55878bf7-5ca4-4766-b387-4c1f77283413', N'48628886-9ee7-4b50-b479-933845bc7ae5', 1, 40000, 40000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'55878bf7-5ca4-4766-b387-4c1f77283413', N'fda5ced6-e689-4a34-8201-4b694170ff1c', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'5b56affc-3040-4fbd-9395-e2586cc36e34', N'93e13c14-f914-408a-b9d1-a0f64e70a104', 12, 130000, 1560000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'62b465d5-efcf-41da-90b5-f2d39bb4c484', N'798e16a3-7891-41f1-b452-3016602787e4', 1, 350000, 350000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'62b465d5-efcf-41da-90b5-f2d39bb4c484', N'82a907e6-2e97-4e5a-9110-07587723364f', 1, 230000, 230000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'673f8d81-ae59-4cc0-923e-73721acdea75', N'48ad425e-f7e9-4215-bff5-9a59212431d3', 4, 30000, 120000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'673f8d81-ae59-4cc0-923e-73721acdea75', N'7b8dbd7f-7b1d-404e-9dfb-1832cb48e380', 1, 40000, 40000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'7ae49b7a-fcd4-40cb-91f8-c81a9078de85', N'07477ad3-49ff-476a-9a08-56b8ed6e728d', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'7ae49b7a-fcd4-40cb-91f8-c81a9078de85', N'22a54590-680e-4579-84d4-91f9ac881955', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'7ae49b7a-fcd4-40cb-91f8-c81a9078de85', N'24312240-c771-4b44-a418-2ac75d9da6dc', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'7ae49b7a-fcd4-40cb-91f8-c81a9078de85', N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', 1, 70000, 70000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'809bac5e-5bb8-452f-bcc6-4f0dc34b3263', N'22a54590-680e-4579-84d4-91f9ac881955', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'809bac5e-5bb8-452f-bcc6-4f0dc34b3263', N'7b8dbd7f-7b1d-404e-9dfb-1832cb48e380', 1, 40000, 40000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'809bac5e-5bb8-452f-bcc6-4f0dc34b3263', N'82a907e6-2e97-4e5a-9110-07587723364f', 1, 230000, 230000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'809bac5e-5bb8-452f-bcc6-4f0dc34b3263', N'a50641b3-f354-4798-832d-71ab22b1add0', 1, 50000, 50000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'8169ab62-b459-4d86-84ea-262d56f043b7', N'07477ad3-49ff-476a-9a08-56b8ed6e728d', 2, 20000, 40000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'8169ab62-b459-4d86-84ea-262d56f043b7', N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', 1, 70000, 70000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'8169ab62-b459-4d86-84ea-262d56f043b7', N'48ad425e-f7e9-4215-bff5-9a59212431d3', 2, 30000, 60000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'8a78150d-5430-4a31-aaa3-261c62d97de9', N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', 1, 70000, 70000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'8a78150d-5430-4a31-aaa3-261c62d97de9', N'48ad425e-f7e9-4215-bff5-9a59212431d3', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'8a78150d-5430-4a31-aaa3-261c62d97de9', N'a4417e7d-a83e-4589-b34c-2cbe3cdf46c1', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'8a78150d-5430-4a31-aaa3-261c62d97de9', N'f0c85402-8349-4784-bcef-d3d9f08be9a4', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'91a490c3-86e4-4043-8b38-0984300e6c86', N'24312240-c771-4b44-a418-2ac75d9da6dc', 10, 30000, 300000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'91a490c3-86e4-4043-8b38-0984300e6c86', N'306e7784-0caf-433a-a6ad-a0c53f73c901', 3, 30000, 90000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'91a490c3-86e4-4043-8b38-0984300e6c86', N'48628886-9ee7-4b50-b479-933845bc7ae5', 1, 40000, 40000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'91a490c3-86e4-4043-8b38-0984300e6c86', N'5f126182-9fd4-4dbe-8473-68c512877ebb', 2, 20000, 40000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'afb710c2-d4ee-4701-ac9e-f940bf200734', N'24312240-c771-4b44-a418-2ac75d9da6dc', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'afb710c2-d4ee-4701-ac9e-f940bf200734', N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', 1, 70000, 70000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'afb710c2-d4ee-4701-ac9e-f940bf200734', N'48ad425e-f7e9-4215-bff5-9a59212431d3', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'c244b0a8-1b43-4358-af16-68e6e4b9c77e', N'22a54590-680e-4579-84d4-91f9ac881955', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'c244b0a8-1b43-4358-af16-68e6e4b9c77e', N'24312240-c771-4b44-a418-2ac75d9da6dc', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'c244b0a8-1b43-4358-af16-68e6e4b9c77e', N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', 1, 70000, 70000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'd0205254-dfb4-4b04-a564-f4a984547edc', N'306e7784-0caf-433a-a6ad-a0c53f73c901', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'd0205254-dfb4-4b04-a564-f4a984547edc', N'48ad425e-f7e9-4215-bff5-9a59212431d3', 1, 30000, 30000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'd0205254-dfb4-4b04-a564-f4a984547edc', N'5f126182-9fd4-4dbe-8473-68c512877ebb', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'd0205254-dfb4-4b04-a564-f4a984547edc', N'db82a72a-c8ed-49c1-9eb5-620b4875b836', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'e30a3a0b-d5c4-46c3-bd86-87130332a23e', N'f3c4bbdd-9b68-4eb0-bf80-4e40cbf93698', 2, 50000, 100000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'e9caedb1-e370-4f58-b6bd-c384a8747f46', N'798e16a3-7891-41f1-b452-3016602787e4', 1, 350000, 350000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'e9caedb1-e370-4f58-b6bd-c384a8747f46', N'82a907e6-2e97-4e5a-9110-07587723364f', 1, 230000, 230000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'e9caedb1-e370-4f58-b6bd-c384a8747f46', N'93e13c14-f914-408a-b9d1-a0f64e70a104', 1, 130000, 130000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'efda9900-4906-480e-95c3-31448cbb9f9c', N'89169aea-fceb-4ae5-8ff6-728ed0918f59', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'efda9900-4906-480e-95c3-31448cbb9f9c', N'db82a72a-c8ed-49c1-9eb5-620b4875b836', 1, 20000, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Unit], [Total]) VALUES (NULL, N'efda9900-4906-480e-95c3-31448cbb9f9c', N'f0c85402-8349-4784-bcef-d3d9f08be9a4', 1, 20000, 20000)
GO
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (1, N'07477ad3-49ff-476a-9a08-56b8ed6e728d', N'Hồng sim', N'Trái hồng sim/ Sapoche ngon', 200, 20000, N'5f46580b-a570-4988-874c-c6bd803ef33a', N'sapoche.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (12, N'22a54590-680e-4579-84d4-91f9ac881955', N'Quả mận hà nội', N'Mận Hà Nội được rất nhiều người yêu thích, nó không chỉ là đặc sản vùng cao, mà còn mang hương vị chua ngọt, giòn ngon, kích thích vị giác. Cùng VinID tìm hiểu công dụng của mận Hà Nội cũng như cách chọn được những trái ngon nhất về thưởng thức nhé!', 200, 20000, N'b145e702-7ffb-46ce-99a0-3127d87ae756', N'man-ha-noi.png', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (2, N'24312240-c771-4b44-a418-2ac75d9da6dc', N'Sơ ri', N'một loại trái cây giàu dinh dưỡng của thực vật có tên khoa học là Malpighia Emarginata. Malpighia Emarginata là một loại cây bụi nhiệt đới hoặc cây gỗ nhỏ thuộc họ Malpighiaceae. Loại cây ăn quả này có nguồn gốc từ Nam Mỹ và miền nam Mexico. ', 200, 30000, N'5f46580b-a570-4988-874c-c6bd803ef33a', N'so-ri.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (3, N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', N'Mảng cầu gai', N'Mảng cầu gai siêu nhiều hạt, ngon ngọt', 200, 70000, N'ee536776-87c7-486e-8c5b-8f50b65a706a', N'mang-cau-gai.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (13, N'306e7784-0caf-433a-a6ad-a0c53f73c901', N'Trái hồng', N'Trái hồng là một loại cây ăn trái thuộc chi Thị, loại quả này có màu hồng sắc vàng cam đến đỏ cam tùy theo giống, cỡ nhỏ đường kính dưới 9 cm. Dáng quả hình cầu, hình con cù, hay dạng quả cà chua bẹp. Khi chín Đài hoa (calyx) thường dính với quả.', 200, 30000, N'fd9502a9-6a34-4f4b-960e-a9ffe40d60c3', N'trai-hong.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (4, N'48628886-9ee7-4b50-b479-933845bc7ae5', N'Mít tố nữ', N'Mít tố nữ/ mít ước ngon ngọt ', 200, 40000, N'5f46580b-a570-4988-874c-c6bd803ef33a', N'mit-to-nu.webp', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (5, N'48ad425e-f7e9-4215-bff5-9a59212431d3', N'Táo xanh', N'Táo xanh siêu nhỏ không hạt', 200, 30000, N'fd9502a9-6a34-4f4b-960e-a9ffe40d60c3', N'tao-xanh.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (18, N'5f126182-9fd4-4dbe-8473-68c512877ebb', N'Chuối vàng', N'Một quả chuối cỡ trung bình (118g) cung cấp 105 calo, 27g carbohydrate, 14,4g đường và 1,3g protein. Chuối được biết đến là một nguồn cung cấp kali tuyệt vời, và một khẩu phần ăn chứa 422mg kali.', 200, 20000, N'e3cede56-51c9-4c74-8ee8-54584a8808c8', N'trai-chuoi.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (20, N'798e16a3-7891-41f1-b452-3016602787e4', N'Dưa lưới', N'Bao gồm dưa đỏ và mật ong, mỗi loại đều có những biến thể độc đáo về hương vị và hình thức. Ngoài hương vị ngọt ngào, trái cây này còn cung cấp một lượng lớn chất xơ, vitamin A, vitamin C và kali trong mỗi khẩu phần.', 200, 350000, N'e3cede56-51c9-4c74-8ee8-54584a8808c8', N'dua-luoi.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (6, N'7b8dbd7f-7b1d-404e-9dfb-1832cb48e380', N'Nho 2 màu', N'2 chùm nho màu xanh và tím', 200, 40000, N'b145e702-7ffb-46ce-99a0-3127d87ae756', N'chum-nho.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (7, N'82a907e6-2e97-4e5a-9110-07587723364f', N'Dâu Đà lạt', N'Dâu đà lạc to ngon, mọng nước. Đến từ nhà phân phối lớn nhất nhì châu Á Nguyễn Văn Linh.', 200, 230000, N'b145e702-7ffb-46ce-99a0-3127d87ae756', N'dau-da-lat.gif', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (17, N'89169aea-fceb-4ae5-8ff6-728ed0918f59', N'Quả trứng gà / Lekima', N'Quả lê ki ma hay còn được gọi với cái tên dân dã quả trứng gà là loại trái cây được trồng rất nhiều ở nước ta. Không những thơm ngon mà theo các chuyên gia, loại trái cây này còn đem đến nhiều tác dụng hữu ích cho sức khỏe.ưởng thức nhé!', 200, 20000, N'ee536776-87c7-486e-8c5b-8f50b65a706a', N'trai-trung-ga.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (8, N'93e13c14-f914-408a-b9d1-a0f64e70a104', N'Sầu riêng', N'Sầu riêng cơm vàng bao ngon', 200, 130000, N'5f46580b-a570-4988-874c-c6bd803ef33a', N'sau-rieng.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (19, N'a4417e7d-a83e-4589-b34c-2cbe3cdf46c1', N'Trái bơ', N'Quả bơ là loại trái cây dinh dưỡng cho cơ thể gồm 20 loại vitamin cùng khoáng chất như vitamin C, E, K và B6 … tốt cho sức khỏe. Bơ cung cấp dồi dào các chất Magie, Kali, Beta – Carotene, Axit béo và Omega 3 ', 200, 20000, N'e3cede56-51c9-4c74-8ee8-54584a8808c8', N'qua-bo.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (9, N'a50641b3-f354-4798-832d-71ab22b1add0', N'Táo', N'Táo tào siêu nhăn', 200, 50000, N'b145e702-7ffb-46ce-99a0-3127d87ae756', N'tao-tau.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (11, N'db82a72a-c8ed-49c1-9eb5-620b4875b836', N'Cóc vàng', N'Cóc vàng chín cây ngon ngọt', 200, 20000, N'ee536776-87c7-486e-8c5b-8f50b65a706a', N'trai-coc.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (10, N'e71467d8-aec2-4f7f-9025-aea8c9d451e8', N'Xoài', N'Xoài chín cây không phun thuốc', 200, 30000, N'fd9502a9-6a34-4f4b-960e-a9ffe40d60c3', N'xoai.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (14, N'f0c85402-8349-4784-bcef-d3d9f08be9a4', N'Dưa hấu', N'Dưa hấu có chứa rất nhiều chất chống oxy hóa, có khả năng ngăn ngừa mức độ ảnh hưởng của gốc tự do, làm chậm quá trình thoái hóa và bảo vệ các cơ quan trong cơ thể.', 200, 20000, N'fd9502a9-6a34-4f4b-960e-a9ffe40d60c3', N'dua-hau.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (16, N'f3c4bbdd-9b68-4eb0-bf80-4e40cbf93698', N'Cam chín vàng', N'Cam Ham Lin: Là giống của Mỹ, được đưa vào Việt Nam từ năm 1971 thông qua Cu Ba. Hamlin là giống chín sớm vào tháng 9 – 10, vỏ quả mỏng, khối lượng quả trung bình 200 g/quả, ngọt đậm, 0 – 5 hạt/quả.', 200, 50000, N'e3cede56-51c9-4c74-8ee8-54584a8808c8', N'trai-cam.jpg', N'false     ')
INSERT [dbo].[Product] ([STT], [ProductID], [ProductName], [ProductDescription], [Quantity], [Prices], [SupplierID], [Image], [IsHide]) VALUES (15, N'fda5ced6-e689-4a34-8201-4b694170ff1c', N'Quả mận/ Roi', N'Roi hay còn gọi là doi, gioi, roi hoa trắng, bồng bồng, bòng bòng, miền trung gọi là đào, miền Nam gọi là mận, có tên khoa học là Syzygium samarangense, thuộc chi Trâm của họ Myrtaceae. Quả roi và mận Hà Nội là hai loại quả hoàn toàn khác nhau.', 200, 20000, N'ee536776-87c7-486e-8c5b-8f50b65a706a', N'man.jpg', N'false     ')
GO
INSERT [dbo].[ShoppingCart] ([CustomerID], [ProductID], [Quantity], [Unit], [Total]) VALUES (N'1f1d03b1-a00f-407b-96ed-f728a9ed40cb', N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', 1, 70000, 70000)
INSERT [dbo].[ShoppingCart] ([CustomerID], [ProductID], [Quantity], [Unit], [Total]) VALUES (N'38072962-b006-4b1e-9ac7-a27837f26662', N'24312240-c771-4b44-a418-2ac75d9da6dc', 3, 30000, 90000)
INSERT [dbo].[ShoppingCart] ([CustomerID], [ProductID], [Quantity], [Unit], [Total]) VALUES (N'38072962-b006-4b1e-9ac7-a27837f26662', N'26a7fb84-b585-47f6-a15a-ddfaad799b0b', 4, 70000, 280000)
GO
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Description]) VALUES (N'5f46580b-a570-4988-874c-c6bd803ef33a', N'Nguyễn Hoàng Phúc', N'Sĩ/lẽ trái cây nhiệt đới')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Description]) VALUES (N'b145e702-7ffb-46ce-99a0-3127d87ae756', N'Nguyễn Văn Linh', N'Nhà phân phối số 1')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Description]) VALUES (N'e3cede56-51c9-4c74-8ee8-54584a8808c8', N'Lê Tiến Phát', N'Nhà cung cấp trái cây hàng đầu với giá cả phải chăng')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Description]) VALUES (N'ee536776-87c7-486e-8c5b-8f50b65a706a', N'Đỗ Minh Khương', N'Cung cấp các loại trái cây tươi mới với giá cả hợp lý')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Description]) VALUES (N'fd9502a9-6a34-4f4b-960e-a9ffe40d60c3', N'Trần Tuấn Huynh', N'Chuyên cung cấp trái cây sĩ lẽ trên toàn quốc')
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([UID], [UserName], [PassWord], [VaiTro], [CustomerID]) VALUES (2, N'hehe                                                                                                                                                                                                                                                           ', N'123456                                                                                                                                                                                                                                                         ', N'customer', N'1f1d03b1-a00f-407b-96ed-f728a9ed40cb')
INSERT [dbo].[UserLogin] ([UID], [UserName], [PassWord], [VaiTro], [CustomerID]) VALUES (7, N'khachhang1                                                                                                                                                                                                                                                     ', N'khachhang1                                                                                                                                                                                                                                                     ', N'customer', N'38072962-b006-4b1e-9ac7-a27837f26662')
INSERT [dbo].[UserLogin] ([UID], [UserName], [PassWord], [VaiTro], [CustomerID]) VALUES (8, N'nvl                                                                                                                                                                                                                                                            ', N'nvl                                                                                                                                                                                                                                                            ', N'customer', N'324d60c9-b94c-40b4-b5b1-12df3074df18')
INSERT [dbo].[UserLogin] ([UID], [UserName], [PassWord], [VaiTro], [CustomerID]) VALUES (9, N'nhp                                                                                                                                                                                                                                                            ', N'nhp                                                                                                                                                                                                                                                            ', N'customer', N'88ba57b1-59ce-471a-be23-8a94c9d6c397')
INSERT [dbo].[UserLogin] ([UID], [UserName], [PassWord], [VaiTro], [CustomerID]) VALUES (10, N'dmk                                                                                                                                                                                                                                                            ', N'dmk                                                                                                                                                                                                                                                            ', N'customer', N'dc7c4154-8260-474e-a7d8-ac48c26c0f19')
INSERT [dbo].[UserLogin] ([UID], [UserName], [PassWord], [VaiTro], [CustomerID]) VALUES (11, N'ltp                                                                                                                                                                                                                                                            ', N'ltp                                                                                                                                                                                                                                                            ', N'customer', N'5caeb550-61bd-466a-91f5-1b2115762beb')
INSERT [dbo].[UserLogin] ([UID], [UserName], [PassWord], [VaiTro], [CustomerID]) VALUES (12, N'tth                                                                                                                                                                                                                                                            ', N'tth                                                                                                                                                                                                                                                            ', N'customer', N'6ce43c96-c16d-428c-a459-37f39c17a307')
INSERT [dbo].[UserLogin] ([UID], [UserName], [PassWord], [VaiTro], [CustomerID]) VALUES (13, N'nps                                                                                                                                                                                                                                                            ', N'nps                                                                                                                                                                                                                                                            ', N'customer', N'accd2d8f-daad-4d28-869c-df19dc0e4db4')
INSERT [dbo].[UserLogin] ([UID], [UserName], [PassWord], [VaiTro], [CustomerID]) VALUES (14, N'admin                                                                                                                                                                                                                                                          ', N'admin                                                                                                                                                                                                                                                          ', N'admin', NULL)
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Distributor] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Distributor]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Customer]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Product]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_Customer]
GO
USE [master]
GO
ALTER DATABASE [QLWebBanHang] SET  READ_WRITE 
GO
