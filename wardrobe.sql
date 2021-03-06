USE [master]
GO
/****** Object:  Database [Wardrode]    Script Date: 8/6/2017 12:02:15 AM ******/
CREATE DATABASE [Wardrode]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wardrode', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Wardrode.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Wardrode_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Wardrode_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Wardrode] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wardrode].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wardrode] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wardrode] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wardrode] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wardrode] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wardrode] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wardrode] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wardrode] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wardrode] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wardrode] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wardrode] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wardrode] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wardrode] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wardrode] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wardrode] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wardrode] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wardrode] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wardrode] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wardrode] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wardrode] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wardrode] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wardrode] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wardrode] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wardrode] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wardrode] SET  MULTI_USER 
GO
ALTER DATABASE [Wardrode] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wardrode] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wardrode] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wardrode] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Wardrode] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Wardrode]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 8/6/2017 12:02:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[AccessoryID] [int] NOT NULL,
	[AccessoryName] [nvarchar](50) NOT NULL,
	[AccessoryType] [nvarchar](50) NOT NULL,
	[AccessoryColor] [nvarchar](50) NOT NULL,
	[AccessorySeason] [nvarchar](20) NULL,
	[AccessoryOccassion] [nvarchar](50) NULL,
	[AccessoryPhoto] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[AccessoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bottoms]    Script Date: 8/6/2017 12:02:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bottoms](
	[BottomID] [int] IDENTITY(1,1) NOT NULL,
	[BottomName] [nvarchar](50) NOT NULL,
	[BottomType] [nvarchar](50) NOT NULL,
	[BottomColor] [nvarchar](50) NOT NULL,
	[BottomSeason] [nvarchar](10) NULL,
	[BottomOccasion] [nvarchar](50) NULL,
	[BottomPhoto] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Bottoms] PRIMARY KEY CLUSTERED 
(
	[BottomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outfits]    Script Date: 8/6/2017 12:02:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outfits](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[TopID] [int] NOT NULL,
	[BottomID] [int] NOT NULL,
	[ShoeID] [int] NOT NULL,
	[AccessoryID] [int] NOT NULL,
 CONSTRAINT [PK_Outfits] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoes]    Script Date: 8/6/2017 12:02:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoes](
	[ShoeID] [int] IDENTITY(1,1) NOT NULL,
	[ShoeName] [nvarchar](50) NOT NULL,
	[ShoeType] [nvarchar](50) NOT NULL,
	[ShoeColor] [nvarchar](50) NOT NULL,
	[ShoeSeason] [nvarchar](10) NULL,
	[ShoeOccasion] [nvarchar](50) NULL,
	[ShoePhoto] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Shoes] PRIMARY KEY CLUSTERED 
(
	[ShoeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tops]    Script Date: 8/6/2017 12:02:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tops](
	[TopID] [int] IDENTITY(1,1) NOT NULL,
	[TopName] [nvarchar](50) NOT NULL,
	[TopType] [nvarchar](50) NOT NULL,
	[TopColor] [nvarchar](50) NOT NULL,
	[TopSeason] [nvarchar](10) NULL,
	[TopOccasion] [nvarchar](50) NULL,
	[TopPhoto] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Tops] PRIMARY KEY CLUSTERED 
(
	[TopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Accessories] ([AccessoryID], [AccessoryName], [AccessoryType], [AccessoryColor], [AccessorySeason], [AccessoryOccassion], [AccessoryPhoto]) VALUES (1, N'Sunglasses', N'Ray-Bans', N'Black', NULL, NULL, N'/Content/Images/raybans.jpg')
SET IDENTITY_INSERT [dbo].[Bottoms] ON 

INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomType], [BottomColor], [BottomSeason], [BottomOccasion], [BottomPhoto]) VALUES (1, N'Short shorts', N'Chubbies', N'Tan', N'Summer', N'Bro', N'/Content/Images/chubbieshorts.jpg')
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomType], [BottomColor], [BottomSeason], [BottomOccasion], [BottomPhoto]) VALUES (2, N'Khaki', N'Dockers', N'Tan', NULL, N'Casual', N'/Content/Images/khakis.jpg')
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomType], [BottomColor], [BottomSeason], [BottomOccasion], [BottomPhoto]) VALUES (3, N'Jeans', N'Levis', N'Blue', NULL, N'Casual', N'/Content/Images/bluejeans.jpg')
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomType], [BottomColor], [BottomSeason], [BottomOccasion], [BottomPhoto]) VALUES (4, N'Basketball Shorts', N'Nike', N'Gray', NULL, N'Workout', N'/Content/Images/nikebbs.jpg')
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomType], [BottomColor], [BottomSeason], [BottomOccasion], [BottomPhoto]) VALUES (5, N'Sweatpants ', N'Nike', N'Black', NULL, N'Workout', N'/Content/Images/nikesweat.jpg')
INSERT [dbo].[Bottoms] ([BottomID], [BottomName], [BottomType], [BottomColor], [BottomSeason], [BottomOccasion], [BottomPhoto]) VALUES (6, N'Overalls', N'Chubbies', N'American', N'Summer', N'Bro', N'/Content/Images/chubberalls.jpg')
SET IDENTITY_INSERT [dbo].[Bottoms] OFF
SET IDENTITY_INSERT [dbo].[Shoes] ON 

INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoeType], [ShoeColor], [ShoeSeason], [ShoeOccasion], [ShoePhoto]) VALUES (1, N'Boat Shoe', N'Sperry', N'Brown', NULL, N'Beach', N'/Content/Images/sperryshoes.jpg')
INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoeType], [ShoeColor], [ShoeSeason], [ShoeOccasion], [ShoePhoto]) VALUES (2, N'Man sandals', N'American Eagle', N'Brown', N'Summer', N'Beach', N'/Content/Images/AEsandals.jpg')
INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoeType], [ShoeColor], [ShoeSeason], [ShoeOccasion], [ShoePhoto]) VALUES (3, N'Sneakers', N'Vans', N'Black', NULL, NULL, N'/Content/Images/vanshigh.jpg')
INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoeType], [ShoeColor], [ShoeSeason], [ShoeOccasion], [ShoePhoto]) VALUES (4, N'Sneakers', N'Converse', N'White', NULL, NULL, N'/Content/Images/whitechucks.jpg')
INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoeType], [ShoeColor], [ShoeSeason], [ShoeOccasion], [ShoePhoto]) VALUES (5, N'Running', N'Nike', N'Black', NULL, N'Workout', N'/Content/Images/nikerunning.jpg')
INSERT [dbo].[Shoes] ([ShoeID], [ShoeName], [ShoeType], [ShoeColor], [ShoeSeason], [ShoeOccasion], [ShoePhoto]) VALUES (6, N'Boots', N'E', N'Brown', NULL, NULL, N'/Content/Images/boots.jpg')
SET IDENTITY_INSERT [dbo].[Shoes] OFF
SET IDENTITY_INSERT [dbo].[Tops] ON 

INSERT [dbo].[Tops] ([TopID], [TopName], [TopType], [TopColor], [TopSeason], [TopOccasion], [TopPhoto]) VALUES (1, N'Aloha', N'Chubbies', N'Floral', N'Summer', N'Beach', N'/Content/Images/hawaii.jpg')
INSERT [dbo].[Tops] ([TopID], [TopName], [TopType], [TopColor], [TopSeason], [TopOccasion], [TopPhoto]) VALUES (2, N'Tank Top', N'Chubbies', N'White', N'Summer', N'Beach', N'/Content/Images/skysout.jpg')
INSERT [dbo].[Tops] ([TopID], [TopName], [TopType], [TopColor], [TopSeason], [TopOccasion], [TopPhoto]) VALUES (3, N'Polo', N'Ralph Lauren', N'Pink', NULL, N'Casual', N'/Content/Images/pinkpolo2.jpg')
INSERT [dbo].[Tops] ([TopID], [TopName], [TopType], [TopColor], [TopSeason], [TopOccasion], [TopPhoto]) VALUES (4, N'Long sleeve button down', N'Ralph Lauren', N'Yellow', NULL, N'Casual', N'/Content/Images/yellowlsbd.jpg')
INSERT [dbo].[Tops] ([TopID], [TopName], [TopType], [TopColor], [TopSeason], [TopOccasion], [TopPhoto]) VALUES (5, N'T-Shirt', N'Nike', N'Blue', NULL, N'Workout', N'/Content/Images/niketshirt.jpg')
INSERT [dbo].[Tops] ([TopID], [TopName], [TopType], [TopColor], [TopSeason], [TopOccasion], [TopPhoto]) VALUES (6, N'Romper', N'Romphim', N'Red', NULL, N'Bro', N'/Content/Images/romp.png')
SET IDENTITY_INSERT [dbo].[Tops] OFF
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Accessories] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessories] ([AccessoryID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Accessories]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Bottoms] FOREIGN KEY([BottomID])
REFERENCES [dbo].[Bottoms] ([BottomID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Bottoms]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Shoes] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[Shoes] ([ShoeID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Shoes]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_Tops] FOREIGN KEY([TopID])
REFERENCES [dbo].[Tops] ([TopID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_Tops]
GO
USE [master]
GO
ALTER DATABASE [Wardrode] SET  READ_WRITE 
GO
