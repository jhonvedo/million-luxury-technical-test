/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30/09/2024 10:35:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 30/09/2024 10:35:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[IdOwner] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[Birthday] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[IdOwner] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 30/09/2024 10:35:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[IdProperty] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CodeInternal] [nvarchar](450) NOT NULL,
	[Year] [int] NOT NULL,
	[IdOwner] [int] NOT NULL,
 CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
(
	[IdProperty] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyImages]    Script Date: 30/09/2024 10:35:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyImages](
	[IdPropertyImage] [int] IDENTITY(1,1) NOT NULL,
	[IdProperty] [int] NOT NULL,
	[File] [nvarchar](max) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_PropertyImages] PRIMARY KEY CLUSTERED 
(
	[IdPropertyImage] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyTraces]    Script Date: 30/09/2024 10:35:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyTraces](
	[IdPropertyTrace] [int] IDENTITY(1,1) NOT NULL,
	[DateSale] [datetime2](7) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
	[IdProperty] [int] NOT NULL,
 CONSTRAINT [PK_PropertyTraces] PRIMARY KEY CLUSTERED 
(
	[IdPropertyTrace] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240927220119_Init', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240927225856_SetUniqueInternalCode', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240928040019_Init', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[Owners] ON 

INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (1, N'John Doe', N'123 Elm Street, Springfield, IL', NULL, CAST(N'1985-04-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (2, N'Jane Smith', N'456 Oak Avenue, Denver, CO', NULL, CAST(N'1990-07-22T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (3, N'Carlos Garcia', N'789 Maple Street, Miami, FL', NULL, CAST(N'1978-11-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (4, N'Maria Lopez', N'321 Pine Street, Seattle, WA', NULL, CAST(N'1982-03-14T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (5, N'Emma Brown', N'654 Cedar Drive, Austin, TX', NULL, CAST(N'1995-09-30T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (6, N'David Johnson', N'987 Birch Lane, New York, NY', NULL, CAST(N'1988-02-19T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (7, N'Sophia Martinez', N'741 Cedar Drive, Houston, TX', NULL, CAST(N'1989-06-28T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (8, N'James Wilson', N'258 Walnut Ave, Boston, MA', NULL, CAST(N'1975-01-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (9, N'Linda Clark', N'369 Pine Avenue, Portland, OR', NULL, CAST(N'1992-08-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Owners] ([IdOwner], [Name], [Address], [Photo], [Birthday]) VALUES (10, N'Michael Lee', N'741 Oak Street, Chicago, IL', NULL, CAST(N'1983-11-25T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Owners] OFF
GO
SET IDENTITY_INSERT [dbo].[Properties] ON 

INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (601, N'Property 1', N'Address 1, City, State', CAST(101000.00 AS Decimal(18, 2)), N'PROP001', 2020, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (602, N'Property 2', N'Address 2, City, State', CAST(102000.00 AS Decimal(18, 2)), N'PROP002', 2017, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (603, N'Property 3', N'Address 3, City, State', CAST(103000.00 AS Decimal(18, 2)), N'PROP003', 2020, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (604, N'Property 4', N'Address 4, City, State', CAST(104000.00 AS Decimal(18, 2)), N'PROP004', 2020, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (605, N'Property 5', N'Address 5, City, State', CAST(105000.00 AS Decimal(18, 2)), N'PROP005', 2017, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (606, N'Property 6', N'Address 6, City, State', CAST(106000.00 AS Decimal(18, 2)), N'PROP006', 2017, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (607, N'Property 7', N'Address 7, City, State', CAST(107000.00 AS Decimal(18, 2)), N'PROP007', 2012, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (608, N'Property 8', N'Address 8, City, State', CAST(108000.00 AS Decimal(18, 2)), N'PROP008', 2019, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (609, N'Property 9', N'Address 9, City, State', CAST(109000.00 AS Decimal(18, 2)), N'PROP009', 2011, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (610, N'Property 10', N'Address 10, City, State', CAST(110000.00 AS Decimal(18, 2)), N'PROP010', 2019, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (611, N'Property 11', N'Address 11, City, State', CAST(111000.00 AS Decimal(18, 2)), N'PROP011', 2012, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (612, N'Property 12', N'Address 12, City, State', CAST(112000.00 AS Decimal(18, 2)), N'PROP012', 2014, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (613, N'Property 13', N'Address 13, City, State', CAST(113000.00 AS Decimal(18, 2)), N'PROP013', 2010, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (614, N'Property 14', N'Address 14, City, State', CAST(114000.00 AS Decimal(18, 2)), N'PROP014', 2022, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (615, N'Property 15', N'Address 15, City, State', CAST(115000.00 AS Decimal(18, 2)), N'PROP015', 2020, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (616, N'Property 16', N'Address 16, City, State', CAST(116000.00 AS Decimal(18, 2)), N'PROP016', 2018, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (617, N'Property 17', N'Address 17, City, State', CAST(117000.00 AS Decimal(18, 2)), N'PROP017', 2018, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (618, N'Property 18', N'Address 18, City, State', CAST(118000.00 AS Decimal(18, 2)), N'PROP018', 2015, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (619, N'Property 19', N'Address 19, City, State', CAST(119000.00 AS Decimal(18, 2)), N'PROP019', 2014, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (620, N'Property 20', N'Address 20, City, State', CAST(120000.00 AS Decimal(18, 2)), N'PROP020', 2018, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (621, N'Property 21', N'Address 21, City, State', CAST(121000.00 AS Decimal(18, 2)), N'PROP021', 2010, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (622, N'Property 22', N'Address 22, City, State', CAST(122000.00 AS Decimal(18, 2)), N'PROP022', 2014, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (623, N'Property 23', N'Address 23, City, State', CAST(123000.00 AS Decimal(18, 2)), N'PROP023', 2013, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (624, N'Property 24', N'Address 24, City, State', CAST(124000.00 AS Decimal(18, 2)), N'PROP024', 2012, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (625, N'Property 25', N'Address 25, City, State', CAST(125000.00 AS Decimal(18, 2)), N'PROP025', 2013, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (626, N'Property 26', N'Address 26, City, State', CAST(126000.00 AS Decimal(18, 2)), N'PROP026', 2020, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (627, N'Property 27', N'Address 27, City, State', CAST(127000.00 AS Decimal(18, 2)), N'PROP027', 2012, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (628, N'Property 28', N'Address 28, City, State', CAST(128000.00 AS Decimal(18, 2)), N'PROP028', 2016, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (629, N'Property 29', N'Address 29, City, State', CAST(129000.00 AS Decimal(18, 2)), N'PROP029', 2013, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (630, N'Property 30', N'Address 30, City, State', CAST(130000.00 AS Decimal(18, 2)), N'PROP030', 2010, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (631, N'Property 31', N'Address 31, City, State', CAST(131000.00 AS Decimal(18, 2)), N'PROP031', 2020, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (632, N'Property 32', N'Address 32, City, State', CAST(132000.00 AS Decimal(18, 2)), N'PROP032', 2019, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (633, N'Property 33', N'Address 33, City, State', CAST(133000.00 AS Decimal(18, 2)), N'PROP033', 2019, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (634, N'Property 34', N'Address 34, City, State', CAST(134000.00 AS Decimal(18, 2)), N'PROP034', 2011, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (635, N'Property 35', N'Address 35, City, State', CAST(135000.00 AS Decimal(18, 2)), N'PROP035', 2019, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (636, N'Property 36', N'Address 36, City, State', CAST(136000.00 AS Decimal(18, 2)), N'PROP036', 2016, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (637, N'Property 37', N'Address 37, City, State', CAST(137000.00 AS Decimal(18, 2)), N'PROP037', 2016, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (638, N'Property 38', N'Address 38, City, State', CAST(138000.00 AS Decimal(18, 2)), N'PROP038', 2018, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (639, N'Property 39', N'Address 39, City, State', CAST(139000.00 AS Decimal(18, 2)), N'PROP039', 2014, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (640, N'Property 40', N'Address 40, City, State', CAST(140000.00 AS Decimal(18, 2)), N'PROP040', 2019, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (641, N'Property 41', N'Address 41, City, State', CAST(141000.00 AS Decimal(18, 2)), N'PROP041', 2018, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (642, N'Property 42', N'Address 42, City, State', CAST(142000.00 AS Decimal(18, 2)), N'PROP042', 2011, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (643, N'Property 43', N'Address 43, City, State', CAST(143000.00 AS Decimal(18, 2)), N'PROP043', 2015, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (644, N'Property 44', N'Address 44, City, State', CAST(144000.00 AS Decimal(18, 2)), N'PROP044', 2014, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (645, N'Property 45', N'Address 45, City, State', CAST(145000.00 AS Decimal(18, 2)), N'PROP045', 2017, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (646, N'Property 46', N'Address 46, City, State', CAST(146000.00 AS Decimal(18, 2)), N'PROP046', 2013, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (647, N'Property 47', N'Address 47, City, State', CAST(147000.00 AS Decimal(18, 2)), N'PROP047', 2022, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (648, N'Property 48', N'Address 48, City, State', CAST(148000.00 AS Decimal(18, 2)), N'PROP048', 2022, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (649, N'Property 49', N'Address 49, City, State', CAST(149000.00 AS Decimal(18, 2)), N'PROP049', 2013, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (650, N'Property 50', N'Address 50, City, State', CAST(150000.00 AS Decimal(18, 2)), N'PROP050', 2011, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (651, N'Property 51', N'Address 51, City, State', CAST(151000.00 AS Decimal(18, 2)), N'PROP051', 2013, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (652, N'Property 52', N'Address 52, City, State', CAST(152000.00 AS Decimal(18, 2)), N'PROP052', 2014, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (653, N'Property 53', N'Address 53, City, State', CAST(153000.00 AS Decimal(18, 2)), N'PROP053', 2013, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (654, N'Property 54', N'Address 54, City, State', CAST(154000.00 AS Decimal(18, 2)), N'PROP054', 2013, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (655, N'Property 55', N'Address 55, City, State', CAST(155000.00 AS Decimal(18, 2)), N'PROP055', 2011, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (656, N'Property 56', N'Address 56, City, State', CAST(156000.00 AS Decimal(18, 2)), N'PROP056', 2015, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (657, N'Property 57', N'Address 57, City, State', CAST(157000.00 AS Decimal(18, 2)), N'PROP057', 2010, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (658, N'Property 58', N'Address 58, City, State', CAST(158000.00 AS Decimal(18, 2)), N'PROP058', 2019, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (659, N'Property 59', N'Address 59, City, State', CAST(159000.00 AS Decimal(18, 2)), N'PROP059', 2019, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (660, N'Property 60', N'Address 60, City, State', CAST(160000.00 AS Decimal(18, 2)), N'PROP060', 2017, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (661, N'Property 61', N'Address 61, City, State', CAST(161000.00 AS Decimal(18, 2)), N'PROP061', 2013, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (662, N'Property 62', N'Address 62, City, State', CAST(162000.00 AS Decimal(18, 2)), N'PROP062', 2022, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (663, N'Property 63', N'Address 63, City, State', CAST(163000.00 AS Decimal(18, 2)), N'PROP063', 2022, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (664, N'Property 64', N'Address 64, City, State', CAST(164000.00 AS Decimal(18, 2)), N'PROP064', 2014, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (665, N'Property 65', N'Address 65, City, State', CAST(165000.00 AS Decimal(18, 2)), N'PROP065', 2012, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (666, N'Property 66', N'Address 66, City, State', CAST(166000.00 AS Decimal(18, 2)), N'PROP066', 2022, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (667, N'Property 67', N'Address 67, City, State', CAST(167000.00 AS Decimal(18, 2)), N'PROP067', 2018, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (668, N'Property 68', N'Address 68, City, State', CAST(168000.00 AS Decimal(18, 2)), N'PROP068', 2021, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (669, N'Property 69', N'Address 69, City, State', CAST(169000.00 AS Decimal(18, 2)), N'PROP069', 2014, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (670, N'Property 70', N'Address 70, City, State', CAST(170000.00 AS Decimal(18, 2)), N'PROP070', 2020, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (671, N'Property 71', N'Address 71, City, State', CAST(171000.00 AS Decimal(18, 2)), N'PROP071', 2010, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (672, N'Property 72', N'Address 72, City, State', CAST(172000.00 AS Decimal(18, 2)), N'PROP072', 2016, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (673, N'Property 73', N'Address 73, City, State', CAST(173000.00 AS Decimal(18, 2)), N'PROP073', 2017, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (674, N'Property 74', N'Address 74, City, State', CAST(174000.00 AS Decimal(18, 2)), N'PROP074', 2011, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (675, N'Property 75', N'Address 75, City, State', CAST(175000.00 AS Decimal(18, 2)), N'PROP075', 2014, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (676, N'Property 76', N'Address 76, City, State', CAST(176000.00 AS Decimal(18, 2)), N'PROP076', 2019, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (677, N'Property 77', N'Address 77, City, State', CAST(177000.00 AS Decimal(18, 2)), N'PROP077', 2015, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (678, N'Property 78', N'Address 78, City, State', CAST(178000.00 AS Decimal(18, 2)), N'PROP078', 2019, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (679, N'Property 79', N'Address 79, City, State', CAST(179000.00 AS Decimal(18, 2)), N'PROP079', 2018, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (680, N'Property 80', N'Address 80, City, State', CAST(180000.00 AS Decimal(18, 2)), N'PROP080', 2012, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (681, N'Property 81', N'Address 81, City, State', CAST(181000.00 AS Decimal(18, 2)), N'PROP081', 2013, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (682, N'Property 82', N'Address 82, City, State', CAST(182000.00 AS Decimal(18, 2)), N'PROP082', 2019, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (683, N'Property 83', N'Address 83, City, State', CAST(183000.00 AS Decimal(18, 2)), N'PROP083', 2020, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (684, N'Property 84', N'Address 84, City, State', CAST(184000.00 AS Decimal(18, 2)), N'PROP084', 2013, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (685, N'Property 85', N'Address 85, City, State', CAST(185000.00 AS Decimal(18, 2)), N'PROP085', 2022, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (686, N'Property 86', N'Address 86, City, State', CAST(186000.00 AS Decimal(18, 2)), N'PROP086', 2014, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (687, N'Property 87', N'Address 87, City, State', CAST(187000.00 AS Decimal(18, 2)), N'PROP087', 2014, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (688, N'Property 88', N'Address 88, City, State', CAST(188000.00 AS Decimal(18, 2)), N'PROP088', 2017, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (689, N'Property 89', N'Address 89, City, State', CAST(189000.00 AS Decimal(18, 2)), N'PROP089', 2017, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (690, N'Property 90', N'Address 90, City, State', CAST(190000.00 AS Decimal(18, 2)), N'PROP090', 2015, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (691, N'Property 91', N'Address 91, City, State', CAST(191000.00 AS Decimal(18, 2)), N'PROP091', 2011, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (692, N'Property 92', N'Address 92, City, State', CAST(192000.00 AS Decimal(18, 2)), N'PROP092', 2010, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (693, N'Property 93', N'Address 93, City, State', CAST(193000.00 AS Decimal(18, 2)), N'PROP093', 2019, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (694, N'Property 94', N'Address 94, City, State', CAST(194000.00 AS Decimal(18, 2)), N'PROP094', 2015, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (695, N'Property 95', N'Address 95, City, State', CAST(195000.00 AS Decimal(18, 2)), N'PROP095', 2019, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (696, N'Property 96', N'Address 96, City, State', CAST(196000.00 AS Decimal(18, 2)), N'PROP096', 2010, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (697, N'Property 97', N'Address 97, City, State', CAST(197000.00 AS Decimal(18, 2)), N'PROP097', 2018, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (698, N'Property 98', N'Address 98, City, State', CAST(198000.00 AS Decimal(18, 2)), N'PROP098', 2012, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (699, N'Property 99', N'Address 99, City, State', CAST(199000.00 AS Decimal(18, 2)), N'PROP099', 2016, 5)
GO
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (700, N'Property 100', N'Address 100, City, State', CAST(200000.00 AS Decimal(18, 2)), N'PROP100', 2010, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (701, N'Property 101', N'Address 101, City, State', CAST(201000.00 AS Decimal(18, 2)), N'PROP101', 2021, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (702, N'Property 102', N'Address 102, City, State', CAST(202000.00 AS Decimal(18, 2)), N'PROP102', 2012, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (703, N'Property 103', N'Address 103, City, State', CAST(203000.00 AS Decimal(18, 2)), N'PROP103', 2017, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (704, N'Property 104', N'Address 104, City, State', CAST(204000.00 AS Decimal(18, 2)), N'PROP104', 2016, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (705, N'Property 105', N'Address 105, City, State', CAST(205000.00 AS Decimal(18, 2)), N'PROP105', 2021, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (706, N'Property 106', N'Address 106, City, State', CAST(206000.00 AS Decimal(18, 2)), N'PROP106', 2021, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (707, N'Property 107', N'Address 107, City, State', CAST(207000.00 AS Decimal(18, 2)), N'PROP107', 2010, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (708, N'Property 108', N'Address 108, City, State', CAST(208000.00 AS Decimal(18, 2)), N'PROP108', 2015, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (709, N'Property 109', N'Address 109, City, State', CAST(209000.00 AS Decimal(18, 2)), N'PROP109', 2012, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (710, N'Property 110', N'Address 110, City, State', CAST(210000.00 AS Decimal(18, 2)), N'PROP110', 2011, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (711, N'Property 111', N'Address 111, City, State', CAST(211000.00 AS Decimal(18, 2)), N'PROP111', 2010, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (712, N'Property 112', N'Address 112, City, State', CAST(212000.00 AS Decimal(18, 2)), N'PROP112', 2017, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (713, N'Property 113', N'Address 113, City, State', CAST(213000.00 AS Decimal(18, 2)), N'PROP113', 2022, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (714, N'Property 114', N'Address 114, City, State', CAST(214000.00 AS Decimal(18, 2)), N'PROP114', 2012, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (715, N'Property 115', N'Address 115, City, State', CAST(215000.00 AS Decimal(18, 2)), N'PROP115', 2011, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (716, N'Property 116', N'Address 116, City, State', CAST(216000.00 AS Decimal(18, 2)), N'PROP116', 2022, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (717, N'Property 117', N'Address 117, City, State', CAST(217000.00 AS Decimal(18, 2)), N'PROP117', 2020, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (718, N'Property 118', N'Address 118, City, State', CAST(218000.00 AS Decimal(18, 2)), N'PROP118', 2011, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (719, N'Property 119', N'Address 119, City, State', CAST(219000.00 AS Decimal(18, 2)), N'PROP119', 2017, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (720, N'Property 120', N'Address 120, City, State', CAST(220000.00 AS Decimal(18, 2)), N'PROP120', 2010, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (721, N'Property 121', N'Address 121, City, State', CAST(221000.00 AS Decimal(18, 2)), N'PROP121', 2017, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (722, N'Property 122', N'Address 122, City, State', CAST(222000.00 AS Decimal(18, 2)), N'PROP122', 2020, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (723, N'Property 123', N'Address 123, City, State', CAST(223000.00 AS Decimal(18, 2)), N'PROP123', 2013, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (724, N'Property 124', N'Address 124, City, State', CAST(224000.00 AS Decimal(18, 2)), N'PROP124', 2014, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (725, N'Property 125', N'Address 125, City, State', CAST(225000.00 AS Decimal(18, 2)), N'PROP125', 2019, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (726, N'Property 126', N'Address 126, City, State', CAST(226000.00 AS Decimal(18, 2)), N'PROP126', 2014, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (727, N'Property 127', N'Address 127, City, State', CAST(227000.00 AS Decimal(18, 2)), N'PROP127', 2014, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (728, N'Property 128', N'Address 128, City, State', CAST(228000.00 AS Decimal(18, 2)), N'PROP128', 2017, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (729, N'Property 129', N'Address 129, City, State', CAST(229000.00 AS Decimal(18, 2)), N'PROP129', 2012, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (730, N'Property 130', N'Address 130, City, State', CAST(230000.00 AS Decimal(18, 2)), N'PROP130', 2014, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (731, N'Property 131', N'Address 131, City, State', CAST(231000.00 AS Decimal(18, 2)), N'PROP131', 2019, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (732, N'Property 132', N'Address 132, City, State', CAST(232000.00 AS Decimal(18, 2)), N'PROP132', 2010, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (733, N'Property 133', N'Address 133, City, State', CAST(233000.00 AS Decimal(18, 2)), N'PROP133', 2011, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (734, N'Property 134', N'Address 134, City, State', CAST(234000.00 AS Decimal(18, 2)), N'PROP134', 2014, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (735, N'Property 135', N'Address 135, City, State', CAST(235000.00 AS Decimal(18, 2)), N'PROP135', 2015, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (736, N'Property 136', N'Address 136, City, State', CAST(236000.00 AS Decimal(18, 2)), N'PROP136', 2017, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (737, N'Property 137', N'Address 137, City, State', CAST(237000.00 AS Decimal(18, 2)), N'PROP137', 2018, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (738, N'Property 138', N'Address 138, City, State', CAST(238000.00 AS Decimal(18, 2)), N'PROP138', 2017, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (739, N'Property 139', N'Address 139, City, State', CAST(239000.00 AS Decimal(18, 2)), N'PROP139', 2011, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (740, N'Property 140', N'Address 140, City, State', CAST(240000.00 AS Decimal(18, 2)), N'PROP140', 2013, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (741, N'Property 141', N'Address 141, City, State', CAST(241000.00 AS Decimal(18, 2)), N'PROP141', 2014, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (742, N'Property 142', N'Address 142, City, State', CAST(242000.00 AS Decimal(18, 2)), N'PROP142', 2012, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (743, N'Property 143', N'Address 143, City, State', CAST(243000.00 AS Decimal(18, 2)), N'PROP143', 2016, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (744, N'Property 144', N'Address 144, City, State', CAST(244000.00 AS Decimal(18, 2)), N'PROP144', 2019, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (745, N'Property 145', N'Address 145, City, State', CAST(245000.00 AS Decimal(18, 2)), N'PROP145', 2016, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (746, N'Property 146', N'Address 146, City, State', CAST(246000.00 AS Decimal(18, 2)), N'PROP146', 2011, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (747, N'Property 147', N'Address 147, City, State', CAST(247000.00 AS Decimal(18, 2)), N'PROP147', 2016, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (748, N'Property 148', N'Address 148, City, State', CAST(248000.00 AS Decimal(18, 2)), N'PROP148', 2012, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (749, N'Property 149', N'Address 149, City, State', CAST(249000.00 AS Decimal(18, 2)), N'PROP149', 2018, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (750, N'Property 150', N'Address 150, City, State', CAST(250000.00 AS Decimal(18, 2)), N'PROP150', 2012, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (751, N'Property 151', N'Address 151, City, State', CAST(251000.00 AS Decimal(18, 2)), N'PROP151', 2010, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (752, N'Property 152', N'Address 152, City, State', CAST(252000.00 AS Decimal(18, 2)), N'PROP152', 2011, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (753, N'Property 153', N'Address 153, City, State', CAST(253000.00 AS Decimal(18, 2)), N'PROP153', 2013, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (754, N'Property 154', N'Address 154, City, State', CAST(254000.00 AS Decimal(18, 2)), N'PROP154', 2012, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (755, N'Property 155', N'Address 155, City, State', CAST(255000.00 AS Decimal(18, 2)), N'PROP155', 2016, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (756, N'Property 156', N'Address 156, City, State', CAST(256000.00 AS Decimal(18, 2)), N'PROP156', 2012, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (757, N'Property 157', N'Address 157, City, State', CAST(257000.00 AS Decimal(18, 2)), N'PROP157', 2020, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (758, N'Property 158', N'Address 158, City, State', CAST(258000.00 AS Decimal(18, 2)), N'PROP158', 2010, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (759, N'Property 159', N'Address 159, City, State', CAST(259000.00 AS Decimal(18, 2)), N'PROP159', 2017, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (760, N'Property 160', N'Address 160, City, State', CAST(260000.00 AS Decimal(18, 2)), N'PROP160', 2019, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (761, N'Property 161', N'Address 161, City, State', CAST(261000.00 AS Decimal(18, 2)), N'PROP161', 2020, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (762, N'Property 162', N'Address 162, City, State', CAST(262000.00 AS Decimal(18, 2)), N'PROP162', 2021, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (763, N'Property 163', N'Address 163, City, State', CAST(263000.00 AS Decimal(18, 2)), N'PROP163', 2020, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (764, N'Property 164', N'Address 164, City, State', CAST(264000.00 AS Decimal(18, 2)), N'PROP164', 2013, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (765, N'Property 165', N'Address 165, City, State', CAST(265000.00 AS Decimal(18, 2)), N'PROP165', 2014, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (766, N'Property 166', N'Address 166, City, State', CAST(266000.00 AS Decimal(18, 2)), N'PROP166', 2010, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (767, N'Property 167', N'Address 167, City, State', CAST(267000.00 AS Decimal(18, 2)), N'PROP167', 2015, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (768, N'Property 168', N'Address 168, City, State', CAST(268000.00 AS Decimal(18, 2)), N'PROP168', 2018, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (769, N'Property 169', N'Address 169, City, State', CAST(269000.00 AS Decimal(18, 2)), N'PROP169', 2022, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (770, N'Property 170', N'Address 170, City, State', CAST(270000.00 AS Decimal(18, 2)), N'PROP170', 2021, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (771, N'Property 171', N'Address 171, City, State', CAST(271000.00 AS Decimal(18, 2)), N'PROP171', 2013, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (772, N'Property 172', N'Address 172, City, State', CAST(272000.00 AS Decimal(18, 2)), N'PROP172', 2016, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (773, N'Property 173', N'Address 173, City, State', CAST(273000.00 AS Decimal(18, 2)), N'PROP173', 2012, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (774, N'Property 174', N'Address 174, City, State', CAST(274000.00 AS Decimal(18, 2)), N'PROP174', 2020, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (775, N'Property 175', N'Address 175, City, State', CAST(275000.00 AS Decimal(18, 2)), N'PROP175', 2022, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (776, N'Property 176', N'Address 176, City, State', CAST(276000.00 AS Decimal(18, 2)), N'PROP176', 2015, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (777, N'Property 177', N'Address 177, City, State', CAST(277000.00 AS Decimal(18, 2)), N'PROP177', 2018, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (778, N'Property 178', N'Address 178, City, State', CAST(278000.00 AS Decimal(18, 2)), N'PROP178', 2022, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (779, N'Property 179', N'Address 179, City, State', CAST(279000.00 AS Decimal(18, 2)), N'PROP179', 2022, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (780, N'Property 180', N'Address 180, City, State', CAST(280000.00 AS Decimal(18, 2)), N'PROP180', 2013, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (781, N'Property 181', N'Address 181, City, State', CAST(281000.00 AS Decimal(18, 2)), N'PROP181', 2014, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (782, N'Property 182', N'Address 182, City, State', CAST(282000.00 AS Decimal(18, 2)), N'PROP182', 2017, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (783, N'Property 183', N'Address 183, City, State', CAST(283000.00 AS Decimal(18, 2)), N'PROP183', 2014, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (784, N'Property 184', N'Address 184, City, State', CAST(284000.00 AS Decimal(18, 2)), N'PROP184', 2012, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (785, N'Property 185', N'Address 185, City, State', CAST(285000.00 AS Decimal(18, 2)), N'PROP185', 2013, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (786, N'Property 186', N'Address 186, City, State', CAST(286000.00 AS Decimal(18, 2)), N'PROP186', 2013, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (787, N'Property 187', N'Address 187, City, State', CAST(287000.00 AS Decimal(18, 2)), N'PROP187', 2014, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (788, N'Property 188', N'Address 188, City, State', CAST(288000.00 AS Decimal(18, 2)), N'PROP188', 2020, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (789, N'Property 189', N'Address 189, City, State', CAST(289000.00 AS Decimal(18, 2)), N'PROP189', 2013, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (790, N'Property 190', N'Address 190, City, State', CAST(290000.00 AS Decimal(18, 2)), N'PROP190', 2022, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (791, N'Property 191', N'Address 191, City, State', CAST(291000.00 AS Decimal(18, 2)), N'PROP191', 2015, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (792, N'Property 192', N'Address 192, City, State', CAST(292000.00 AS Decimal(18, 2)), N'PROP192', 2021, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (793, N'Property 193', N'Address 193, City, State', CAST(293000.00 AS Decimal(18, 2)), N'PROP193', 2020, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (794, N'Property 194', N'Address 194, City, State', CAST(294000.00 AS Decimal(18, 2)), N'PROP194', 2016, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (795, N'Property 195', N'Address 195, City, State', CAST(295000.00 AS Decimal(18, 2)), N'PROP195', 2020, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (796, N'Property 196', N'Address 196, City, State', CAST(296000.00 AS Decimal(18, 2)), N'PROP196', 2010, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (797, N'Property 197', N'Address 197, City, State', CAST(297000.00 AS Decimal(18, 2)), N'PROP197', 2015, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (798, N'Property 198', N'Address 198, City, State', CAST(298000.00 AS Decimal(18, 2)), N'PROP198', 2014, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (799, N'Property 199', N'Address 199, City, State', CAST(299000.00 AS Decimal(18, 2)), N'PROP199', 2014, 7)
GO
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (800, N'Property 200', N'Address 200, City, State', CAST(300000.00 AS Decimal(18, 2)), N'PROP200', 2017, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (801, N'Property 201', N'Address 201, City, State', CAST(301000.00 AS Decimal(18, 2)), N'PROP201', 2013, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (802, N'Property 202', N'Address 202, City, State', CAST(302000.00 AS Decimal(18, 2)), N'PROP202', 2019, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (803, N'Property 203', N'Address 203, City, State', CAST(303000.00 AS Decimal(18, 2)), N'PROP203', 2012, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (804, N'Property 204', N'Address 204, City, State', CAST(304000.00 AS Decimal(18, 2)), N'PROP204', 2021, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (805, N'Property 205', N'Address 205, City, State', CAST(305000.00 AS Decimal(18, 2)), N'PROP205', 2015, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (806, N'Property 206', N'Address 206, City, State', CAST(306000.00 AS Decimal(18, 2)), N'PROP206', 2017, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (807, N'Property 207', N'Address 207, City, State', CAST(307000.00 AS Decimal(18, 2)), N'PROP207', 2010, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (808, N'Property 208', N'Address 208, City, State', CAST(308000.00 AS Decimal(18, 2)), N'PROP208', 2014, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (809, N'Property 209', N'Address 209, City, State', CAST(309000.00 AS Decimal(18, 2)), N'PROP209', 2015, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (810, N'Property 210', N'Address 210, City, State', CAST(310000.00 AS Decimal(18, 2)), N'PROP210', 2017, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (811, N'Property 211', N'Address 211, City, State', CAST(311000.00 AS Decimal(18, 2)), N'PROP211', 2020, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (812, N'Property 212', N'Address 212, City, State', CAST(312000.00 AS Decimal(18, 2)), N'PROP212', 2017, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (813, N'Property 213', N'Address 213, City, State', CAST(313000.00 AS Decimal(18, 2)), N'PROP213', 2013, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (814, N'Property 214', N'Address 214, City, State', CAST(314000.00 AS Decimal(18, 2)), N'PROP214', 2020, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (815, N'Property 215', N'Address 215, City, State', CAST(315000.00 AS Decimal(18, 2)), N'PROP215', 2010, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (816, N'Property 216', N'Address 216, City, State', CAST(316000.00 AS Decimal(18, 2)), N'PROP216', 2019, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (817, N'Property 217', N'Address 217, City, State', CAST(317000.00 AS Decimal(18, 2)), N'PROP217', 2011, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (818, N'Property 218', N'Address 218, City, State', CAST(318000.00 AS Decimal(18, 2)), N'PROP218', 2018, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (819, N'Property 219', N'Address 219, City, State', CAST(319000.00 AS Decimal(18, 2)), N'PROP219', 2010, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (820, N'Property 220', N'Address 220, City, State', CAST(320000.00 AS Decimal(18, 2)), N'PROP220', 2013, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (821, N'Property 221', N'Address 221, City, State', CAST(321000.00 AS Decimal(18, 2)), N'PROP221', 2018, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (822, N'Property 222', N'Address 222, City, State', CAST(322000.00 AS Decimal(18, 2)), N'PROP222', 2011, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (823, N'Property 223', N'Address 223, City, State', CAST(323000.00 AS Decimal(18, 2)), N'PROP223', 2018, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (824, N'Property 224', N'Address 224, City, State', CAST(324000.00 AS Decimal(18, 2)), N'PROP224', 2011, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (825, N'Property 225', N'Address 225, City, State', CAST(325000.00 AS Decimal(18, 2)), N'PROP225', 2019, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (826, N'Property 226', N'Address 226, City, State', CAST(326000.00 AS Decimal(18, 2)), N'PROP226', 2011, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (827, N'Property 227', N'Address 227, City, State', CAST(327000.00 AS Decimal(18, 2)), N'PROP227', 2015, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (828, N'Property 228', N'Address 228, City, State', CAST(328000.00 AS Decimal(18, 2)), N'PROP228', 2012, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (829, N'Property 229', N'Address 229, City, State', CAST(329000.00 AS Decimal(18, 2)), N'PROP229', 2013, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (830, N'Property 230', N'Address 230, City, State', CAST(330000.00 AS Decimal(18, 2)), N'PROP230', 2011, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (831, N'Property 231', N'Address 231, City, State', CAST(331000.00 AS Decimal(18, 2)), N'PROP231', 2018, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (832, N'Property 232', N'Address 232, City, State', CAST(332000.00 AS Decimal(18, 2)), N'PROP232', 2016, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (833, N'Property 233', N'Address 233, City, State', CAST(333000.00 AS Decimal(18, 2)), N'PROP233', 2012, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (834, N'Property 234', N'Address 234, City, State', CAST(334000.00 AS Decimal(18, 2)), N'PROP234', 2016, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (835, N'Property 235', N'Address 235, City, State', CAST(335000.00 AS Decimal(18, 2)), N'PROP235', 2018, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (836, N'Property 236', N'Address 236, City, State', CAST(336000.00 AS Decimal(18, 2)), N'PROP236', 2014, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (837, N'Property 237', N'Address 237, City, State', CAST(337000.00 AS Decimal(18, 2)), N'PROP237', 2012, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (838, N'Property 238', N'Address 238, City, State', CAST(338000.00 AS Decimal(18, 2)), N'PROP238', 2010, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (839, N'Property 239', N'Address 239, City, State', CAST(339000.00 AS Decimal(18, 2)), N'PROP239', 2020, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (840, N'Property 240', N'Address 240, City, State', CAST(340000.00 AS Decimal(18, 2)), N'PROP240', 2012, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (841, N'Property 241', N'Address 241, City, State', CAST(341000.00 AS Decimal(18, 2)), N'PROP241', 2016, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (842, N'Property 242', N'Address 242, City, State', CAST(342000.00 AS Decimal(18, 2)), N'PROP242', 2021, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (843, N'Property 243', N'Address 243, City, State', CAST(343000.00 AS Decimal(18, 2)), N'PROP243', 2015, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (844, N'Property 244', N'Address 244, City, State', CAST(344000.00 AS Decimal(18, 2)), N'PROP244', 2020, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (845, N'Property 245', N'Address 245, City, State', CAST(345000.00 AS Decimal(18, 2)), N'PROP245', 2016, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (846, N'Property 246', N'Address 246, City, State', CAST(346000.00 AS Decimal(18, 2)), N'PROP246', 2011, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (847, N'Property 247', N'Address 247, City, State', CAST(347000.00 AS Decimal(18, 2)), N'PROP247', 2021, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (848, N'Property 248', N'Address 248, City, State', CAST(348000.00 AS Decimal(18, 2)), N'PROP248', 2020, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (849, N'Property 249', N'Address 249, City, State', CAST(349000.00 AS Decimal(18, 2)), N'PROP249', 2017, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (850, N'Property 250', N'Address 250, City, State', CAST(350000.00 AS Decimal(18, 2)), N'PROP250', 2022, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (851, N'Property 251', N'Address 251, City, State', CAST(351000.00 AS Decimal(18, 2)), N'PROP251', 2010, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (852, N'Property 252', N'Address 252, City, State', CAST(352000.00 AS Decimal(18, 2)), N'PROP252', 2019, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (853, N'Property 253', N'Address 253, City, State', CAST(353000.00 AS Decimal(18, 2)), N'PROP253', 2017, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (854, N'Property 254', N'Address 254, City, State', CAST(354000.00 AS Decimal(18, 2)), N'PROP254', 2019, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (855, N'Property 255', N'Address 255, City, State', CAST(355000.00 AS Decimal(18, 2)), N'PROP255', 2014, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (856, N'Property 256', N'Address 256, City, State', CAST(356000.00 AS Decimal(18, 2)), N'PROP256', 2011, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (857, N'Property 257', N'Address 257, City, State', CAST(357000.00 AS Decimal(18, 2)), N'PROP257', 2010, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (858, N'Property 258', N'Address 258, City, State', CAST(358000.00 AS Decimal(18, 2)), N'PROP258', 2011, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (859, N'Property 259', N'Address 259, City, State', CAST(359000.00 AS Decimal(18, 2)), N'PROP259', 2011, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (860, N'Property 260', N'Address 260, City, State', CAST(360000.00 AS Decimal(18, 2)), N'PROP260', 2019, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (861, N'Property 261', N'Address 261, City, State', CAST(361000.00 AS Decimal(18, 2)), N'PROP261', 2020, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (862, N'Property 262', N'Address 262, City, State', CAST(362000.00 AS Decimal(18, 2)), N'PROP262', 2018, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (863, N'Property 263', N'Address 263, City, State', CAST(363000.00 AS Decimal(18, 2)), N'PROP263', 2020, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (864, N'Property 264', N'Address 264, City, State', CAST(364000.00 AS Decimal(18, 2)), N'PROP264', 2017, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (865, N'Property 265', N'Address 265, City, State', CAST(365000.00 AS Decimal(18, 2)), N'PROP265', 2014, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (866, N'Property 266', N'Address 266, City, State', CAST(366000.00 AS Decimal(18, 2)), N'PROP266', 2015, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (867, N'Property 267', N'Address 267, City, State', CAST(367000.00 AS Decimal(18, 2)), N'PROP267', 2016, 5)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (868, N'Property 268', N'Address 268, City, State', CAST(368000.00 AS Decimal(18, 2)), N'PROP268', 2022, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (869, N'Property 269', N'Address 269, City, State', CAST(369000.00 AS Decimal(18, 2)), N'PROP269', 2021, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (870, N'Property 270', N'Address 270, City, State', CAST(370000.00 AS Decimal(18, 2)), N'PROP270', 2010, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (871, N'Property 271', N'Address 271, City, State', CAST(371000.00 AS Decimal(18, 2)), N'PROP271', 2019, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (872, N'Property 272', N'Address 272, City, State', CAST(372000.00 AS Decimal(18, 2)), N'PROP272', 2019, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (873, N'Property 273', N'Address 273, City, State', CAST(373000.00 AS Decimal(18, 2)), N'PROP273', 2017, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (874, N'Property 274', N'Address 274, City, State', CAST(374000.00 AS Decimal(18, 2)), N'PROP274', 2017, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (875, N'Property 275', N'Address 275, City, State', CAST(375000.00 AS Decimal(18, 2)), N'PROP275', 2019, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (876, N'Property 276', N'Address 276, City, State', CAST(376000.00 AS Decimal(18, 2)), N'PROP276', 2011, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (877, N'Property 277', N'Address 277, City, State', CAST(377000.00 AS Decimal(18, 2)), N'PROP277', 2021, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (878, N'Property 278', N'Address 278, City, State', CAST(378000.00 AS Decimal(18, 2)), N'PROP278', 2013, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (879, N'Property 279', N'Address 279, City, State', CAST(379000.00 AS Decimal(18, 2)), N'PROP279', 2022, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (880, N'Property 280', N'Address 280, City, State', CAST(380000.00 AS Decimal(18, 2)), N'PROP280', 2014, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (881, N'Property 281', N'Address 281, City, State', CAST(381000.00 AS Decimal(18, 2)), N'PROP281', 2013, 2)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (882, N'Property 282', N'Address 282, City, State', CAST(382000.00 AS Decimal(18, 2)), N'PROP282', 2011, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (883, N'Property 283', N'Address 283, City, State', CAST(383000.00 AS Decimal(18, 2)), N'PROP283', 2020, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (884, N'Property 284', N'Address 284, City, State', CAST(384000.00 AS Decimal(18, 2)), N'PROP284', 2018, 8)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (885, N'Property 285', N'Address 285, City, State', CAST(385000.00 AS Decimal(18, 2)), N'PROP285', 2014, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (886, N'Property 286', N'Address 286, City, State', CAST(386000.00 AS Decimal(18, 2)), N'PROP286', 2017, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (887, N'Property 287', N'Address 287, City, State', CAST(387000.00 AS Decimal(18, 2)), N'PROP287', 2015, 7)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (888, N'Property 288', N'Address 288, City, State', CAST(388000.00 AS Decimal(18, 2)), N'PROP288', 2016, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (889, N'Property 289', N'Address 289, City, State', CAST(389000.00 AS Decimal(18, 2)), N'PROP289', 2015, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (890, N'Property 290', N'Address 290, City, State', CAST(390000.00 AS Decimal(18, 2)), N'PROP290', 2014, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (891, N'Property 291', N'Address 291, City, State', CAST(391000.00 AS Decimal(18, 2)), N'PROP291', 2012, 1)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (892, N'Property 292', N'Address 292, City, State', CAST(392000.00 AS Decimal(18, 2)), N'PROP292', 2019, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (893, N'Property 293', N'Address 293, City, State', CAST(393000.00 AS Decimal(18, 2)), N'PROP293', 2017, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (894, N'Property 294', N'Address 294, City, State', CAST(394000.00 AS Decimal(18, 2)), N'PROP294', 2020, 10)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (895, N'Property 295', N'Address 295, City, State', CAST(395000.00 AS Decimal(18, 2)), N'PROP295', 2011, 4)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (896, N'Property 296', N'Address 296, City, State', CAST(396000.00 AS Decimal(18, 2)), N'PROP296', 2011, 3)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (897, N'Property 297', N'Address 297, City, State', CAST(397000.00 AS Decimal(18, 2)), N'PROP297', 2015, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (898, N'Property 298', N'Address 298, City, State', CAST(398000.00 AS Decimal(18, 2)), N'PROP298', 2014, 6)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (899, N'Property 299', N'Address 299, City, State', CAST(399000.00 AS Decimal(18, 2)), N'PROP299', 2010, 1)
GO
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (900, N'Property 300', N'Address 300, City, State', CAST(400000.00 AS Decimal(18, 2)), N'PROP300', 2015, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (901, N'Property from postman', N'Address 1, City, State', CAST(101000.00 AS Decimal(18, 2)), N'NX-001', 2020, 9)
INSERT [dbo].[Properties] ([IdProperty], [Name], [Address], [Price], [CodeInternal], [Year], [IdOwner]) VALUES (902, N'Property from postman2 edited', N'Address 1, City, State', CAST(101000.00 AS Decimal(18, 2)), N'NX-002', 2020, 9)
SET IDENTITY_INSERT [dbo].[Properties] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyImages] ON 

INSERT [dbo].[PropertyImages] ([IdPropertyImage], [IdProperty], [File], [Enabled]) VALUES (1, 902, N'https://milliontest.blob.core.windows.net/images/81d2ad75-a221-4893-b8aa-7676abbff0bf.jpg', 1)
INSERT [dbo].[PropertyImages] ([IdPropertyImage], [IdProperty], [File], [Enabled]) VALUES (2, 859, N'https://milliontest.blob.core.windows.net/images/2965eaa7-7de7-4fb6-a6ed-41aa401130fd.jpg', 1)
INSERT [dbo].[PropertyImages] ([IdPropertyImage], [IdProperty], [File], [Enabled]) VALUES (3, 859, N'https://milliontest.blob.core.windows.net/images/94bda203-6509-4147-b3ee-c043c23f21a8.jpg', 1)
INSERT [dbo].[PropertyImages] ([IdPropertyImage], [IdProperty], [File], [Enabled]) VALUES (4, 859, N'https://milliontest.blob.core.windows.net/images/758b3b3c-4916-40f0-9219-368118f0baaf.jpg', 1)
INSERT [dbo].[PropertyImages] ([IdPropertyImage], [IdProperty], [File], [Enabled]) VALUES (5, 859, N'https://milliontest.blob.core.windows.net/images/93304993-3513-4071-b5e4-13cf2366d7d6.jpg', 1)
SET IDENTITY_INSERT [dbo].[PropertyImages] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyTraces] ON 

INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (51, CAST(N'2024-07-23T22:12:29.1633333' AS DateTime2), N'Trace 1', CAST(74015.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 859)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (52, CAST(N'2024-04-12T22:12:29.1666667' AS DateTime2), N'Trace 2', CAST(73222.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 753)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (53, CAST(N'2024-06-04T22:12:29.1733333' AS DateTime2), N'Trace 3', CAST(33214.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 666)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (54, CAST(N'2024-01-29T22:12:29.1766667' AS DateTime2), N'Trace 4', CAST(34427.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 774)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (55, CAST(N'2024-08-20T22:12:29.1766667' AS DateTime2), N'Trace 5', CAST(101868.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 765)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (56, CAST(N'2024-07-29T22:12:29.1800000' AS DateTime2), N'Trace 6', CAST(89003.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), 741)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (57, CAST(N'2023-11-12T22:12:29.1833333' AS DateTime2), N'Trace 7', CAST(48637.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 619)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (58, CAST(N'2024-08-10T22:12:29.1866667' AS DateTime2), N'Trace 8', CAST(45645.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 890)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (59, CAST(N'2024-06-04T22:12:29.1866667' AS DateTime2), N'Trace 9', CAST(16190.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 843)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (60, CAST(N'2024-02-27T22:12:29.1900000' AS DateTime2), N'Trace 10', CAST(102751.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), 885)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (61, CAST(N'2023-12-27T22:12:29.1933333' AS DateTime2), N'Trace 11', CAST(95458.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 721)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (62, CAST(N'2024-05-07T22:12:29.1966667' AS DateTime2), N'Trace 12', CAST(81383.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), 662)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (63, CAST(N'2024-09-14T22:12:29.1966667' AS DateTime2), N'Trace 13', CAST(42954.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 753)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (64, CAST(N'2024-01-13T22:12:29.2000000' AS DateTime2), N'Trace 14', CAST(12281.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), 893)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (65, CAST(N'2024-08-09T22:12:29.2033333' AS DateTime2), N'Trace 15', CAST(33053.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 725)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (66, CAST(N'2024-08-01T22:12:29.2066667' AS DateTime2), N'Trace 16', CAST(60819.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), 699)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (67, CAST(N'2024-07-05T22:12:29.2066667' AS DateTime2), N'Trace 17', CAST(27592.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 749)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (68, CAST(N'2024-03-27T22:12:29.2100000' AS DateTime2), N'Trace 18', CAST(97867.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 654)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (69, CAST(N'2024-03-22T22:12:29.2133333' AS DateTime2), N'Trace 19', CAST(20647.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 791)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (70, CAST(N'2024-05-19T22:12:29.2166667' AS DateTime2), N'Trace 20', CAST(73946.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 825)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (71, CAST(N'2024-06-03T22:12:29.2200000' AS DateTime2), N'Trace 21', CAST(67738.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), 735)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (72, CAST(N'2023-12-23T22:12:29.2200000' AS DateTime2), N'Trace 22', CAST(83713.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 724)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (73, CAST(N'2024-07-15T22:12:29.2233333' AS DateTime2), N'Trace 23', CAST(19784.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 757)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (74, CAST(N'2024-05-23T22:12:29.2266667' AS DateTime2), N'Trace 24', CAST(41486.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 661)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (75, CAST(N'2024-07-18T22:12:29.2300000' AS DateTime2), N'Trace 25', CAST(63335.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 726)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (76, CAST(N'2024-08-18T22:12:29.2333333' AS DateTime2), N'Trace 26', CAST(54856.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 754)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (77, CAST(N'2024-07-27T22:12:29.2366667' AS DateTime2), N'Trace 27', CAST(91498.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 673)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (78, CAST(N'2023-11-28T22:12:29.2366667' AS DateTime2), N'Trace 28', CAST(25816.00 AS Decimal(18, 2)), CAST(19.00 AS Decimal(18, 2)), 809)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (79, CAST(N'2024-03-10T22:12:29.2400000' AS DateTime2), N'Trace 29', CAST(33023.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 816)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (80, CAST(N'2024-08-16T22:12:29.2433333' AS DateTime2), N'Trace 30', CAST(31744.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 616)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (81, CAST(N'2024-07-19T22:12:29.2466667' AS DateTime2), N'Trace 31', CAST(38666.00 AS Decimal(18, 2)), CAST(19.00 AS Decimal(18, 2)), 736)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (82, CAST(N'2024-07-08T22:12:29.2466667' AS DateTime2), N'Trace 32', CAST(38036.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 652)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (83, CAST(N'2024-05-20T22:12:29.2500000' AS DateTime2), N'Trace 33', CAST(78687.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), 618)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (84, CAST(N'2024-05-27T22:12:29.2500000' AS DateTime2), N'Trace 34', CAST(32328.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)), 820)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (85, CAST(N'2024-07-29T22:12:29.2533333' AS DateTime2), N'Trace 35', CAST(56103.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 749)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (86, CAST(N'2024-02-11T22:12:29.2566667' AS DateTime2), N'Trace 36', CAST(64973.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 820)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (87, CAST(N'2024-09-12T22:12:29.2600000' AS DateTime2), N'Trace 37', CAST(46778.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 657)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (88, CAST(N'2024-03-19T22:12:29.2600000' AS DateTime2), N'Trace 38', CAST(23586.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 840)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (89, CAST(N'2024-03-12T22:12:29.2633333' AS DateTime2), N'Trace 39', CAST(28131.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 748)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (90, CAST(N'2023-11-27T22:12:29.2666667' AS DateTime2), N'Trace 40', CAST(55563.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)), 808)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (91, CAST(N'2024-06-12T22:12:29.2700000' AS DateTime2), N'Trace 41', CAST(73064.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 894)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (92, CAST(N'2023-12-20T22:12:29.2700000' AS DateTime2), N'Trace 42', CAST(83071.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 689)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (93, CAST(N'2024-01-20T22:12:29.2766667' AS DateTime2), N'Trace 43', CAST(77860.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 893)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (94, CAST(N'2023-10-14T22:12:29.2800000' AS DateTime2), N'Trace 44', CAST(33978.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 615)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (95, CAST(N'2024-09-13T22:12:29.2833333' AS DateTime2), N'Trace 45', CAST(66703.00 AS Decimal(18, 2)), CAST(19.00 AS Decimal(18, 2)), 887)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (96, CAST(N'2024-04-22T22:12:29.2866667' AS DateTime2), N'Trace 46', CAST(70267.00 AS Decimal(18, 2)), CAST(19.00 AS Decimal(18, 2)), 770)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (97, CAST(N'2024-09-07T22:12:29.2900000' AS DateTime2), N'Trace 47', CAST(31280.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 736)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (98, CAST(N'2024-02-02T22:12:29.2900000' AS DateTime2), N'Trace 48', CAST(14918.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 732)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (99, CAST(N'2023-10-30T22:12:29.2933333' AS DateTime2), N'Trace 49', CAST(38784.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 814)
INSERT [dbo].[PropertyTraces] ([IdPropertyTrace], [DateSale], [Name], [Value], [Tax], [IdProperty]) VALUES (100, CAST(N'2023-12-30T22:12:29.2966667' AS DateTime2), N'Trace 50', CAST(88650.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 736)
SET IDENTITY_INSERT [dbo].[PropertyTraces] OFF
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_Owners_IdOwner] FOREIGN KEY([IdOwner])
REFERENCES [dbo].[Owners] ([IdOwner])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_Properties_Owners_IdOwner]
GO
ALTER TABLE [dbo].[PropertyImages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyImages_Properties_IdProperty] FOREIGN KEY([IdProperty])
REFERENCES [dbo].[Properties] ([IdProperty])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropertyImages] CHECK CONSTRAINT [FK_PropertyImages_Properties_IdProperty]
GO
ALTER TABLE [dbo].[PropertyTraces]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTraces_Properties_IdProperty] FOREIGN KEY([IdProperty])
REFERENCES [dbo].[Properties] ([IdProperty])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropertyTraces] CHECK CONSTRAINT [FK_PropertyTraces_Properties_IdProperty]
GO
