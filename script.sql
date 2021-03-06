USE [master]
GO
/****** Object:  Database [bangiay]    Script Date: 9/27/2019 12:20:12 PM ******/
CREATE DATABASE [bangiay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bangiay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\bangiay.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bangiay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\bangiay_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bangiay] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bangiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bangiay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bangiay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bangiay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bangiay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bangiay] SET ARITHABORT OFF 
GO
ALTER DATABASE [bangiay] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bangiay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bangiay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bangiay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bangiay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bangiay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bangiay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bangiay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bangiay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bangiay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bangiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bangiay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bangiay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bangiay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bangiay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bangiay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bangiay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bangiay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bangiay] SET  MULTI_USER 
GO
ALTER DATABASE [bangiay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bangiay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bangiay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bangiay] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [bangiay] SET DELAYED_DURABILITY = DISABLED 
GO
USE [bangiay]
GO
/****** Object:  Table [dbo].[chitiethoadon]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiethoadon](
	[idchitiethoadon] [int] IDENTITY(1,1) NOT NULL,
	[idhoadon] [int] NULL,
	[idsanpham] [int] NOT NULL,
	[soluong] [int] NULL,
	[giatien] [float] NULL,
	[sotien] [float] NULL,
	[idsizesanpham] [int] NOT NULL,
	[idnguoidung] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [pf_chitiethoadon] PRIMARY KEY CLUSTERED 
(
	[idchitiethoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comment]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[idcomment] [int] IDENTITY(1,1) NOT NULL,
	[idsanpham] [int] NOT NULL,
	[hoten] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[ngaycomment] [datetime] NULL,
	[status] [int] NULL DEFAULT ((1)),
	[noidung] [ntext] NULL,
 CONSTRAINT [pf_comment] PRIMARY KEY CLUSTERED 
(
	[idcomment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[danhmucsanpham]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhmucsanpham](
	[iddanhmuc] [int] IDENTITY(1,1) NOT NULL,
	[tendanhmuc] [nvarchar](200) NOT NULL,
	[status] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [pf_danhmucsanpham] PRIMARY KEY CLUSTERED 
(
	[iddanhmuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[idhoadon] [int] IDENTITY(1,1) NOT NULL,
	[dienthoai] [nvarchar](15) NULL,
	[email] [nvarchar](100) NULL,
	[diachi] [nvarchar](100) NULL,
	[tongtien] [float] NULL,
	[iduser] [int] NOT NULL,
	[ngaytao] [datetime] NULL,
	[ghichu] [nvarchar](200) NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [pf_hoadon] PRIMARY KEY CLUSTERED 
(
	[idhoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mausanpham]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mausanpham](
	[idmausanpham] [int] IDENTITY(1,1) NOT NULL,
	[tenmau] [nvarchar](50) NOT NULL,
	[status] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [pf_mausanpham] PRIMARY KEY CLUSTERED 
(
	[idmausanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nguoidung](
	[iduser] [int] IDENTITY(1,1) NOT NULL,
	[tenuser] [nvarchar](100) NOT NULL,
	[tendangnhap] [varchar](30) NOT NULL,
	[matkhau] [varchar](30) NOT NULL,
	[email] [nvarchar](100) NULL,
	[diachi] [nvarchar](100) NULL,
	[dienthoai] [nvarchar](15) NULL,
	[ngaytao] [datetime] NOT NULL,
	[status] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [pf_nguoidung] PRIMARY KEY CLUSTERED 
(
	[iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nhapchitietsanpham]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhapchitietsanpham](
	[idnhapchitiet] [int] IDENTITY(1,1) NOT NULL,
	[idsanpham] [int] NOT NULL,
	[idsize] [int] NOT NULL,
	[soluong] [int] NULL,
 CONSTRAINT [pf_nhapchitietsanpham] PRIMARY KEY CLUSTERED 
(
	[idnhapchitiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [pf_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[idsanpham] [int] IDENTITY(1,1) NOT NULL,
	[iddanhmuc] [int] NOT NULL,
	[tensanpham] [nvarchar](200) NOT NULL,
	[giagoc] [float] NULL,
	[giaban] [float] NULL,
	[giakhuyenmai] [float] NULL,
	[baohanh] [ntext] NULL,
	[motangan] [ntext] NULL,
	[motachitiet] [ntext] NULL,
	[idmausanpham] [int] NOT NULL,
	[image1] [nvarchar](200) NULL,
	[image2] [nvarchar](200) NULL,
	[image3] [nvarchar](200) NULL,
	[image4] [nvarchar](200) NULL,
	[ngaynhap] [datetime] NULL,
	[status] [int] NULL DEFAULT ((1)),
 CONSTRAINT [pf_sanpham] PRIMARY KEY CLUSTERED 
(
	[idsanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sizesanpham]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sizesanpham](
	[idsizesanpham] [int] IDENTITY(1,1) NOT NULL,
	[tensize] [nvarchar](50) NOT NULL,
	[status] [int] NULL DEFAULT ((1)),
 CONSTRAINT [pf_sizesanpham] PRIMARY KEY CLUSTERED 
(
	[idsizesanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tintuc]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tintuc](
	[idtintuc] [int] IDENTITY(1,1) NOT NULL,
	[motangan] [ntext] NOT NULL,
	[tentintuc] [nvarchar](200) NOT NULL,
	[noidung] [ntext] NOT NULL,
	[image] [nvarchar](200) NULL,
	[ngaytao] [datetime] NOT NULL,
	[status] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [pf_tintuc] PRIMARY KEY CLUSTERED 
(
	[idtintuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userrole]    Script Date: 9/27/2019 12:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userrole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idrode] [int] NOT NULL,
	[idnguoidung] [int] NOT NULL,
 CONSTRAINT [pf_userrole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[chitiethoadon] ON 

INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (42, 5, 26, 1, 1216000, 1216000, 1, 9, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (45, 6, 27, 1, 665000, 665000, 1, 9, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (46, 6, 26, 1, 1216000, 1216000, 1, 9, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (47, 8, 25, 6, 1140000, 6840000, 1, 17, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (48, 8, 25, 6, 1140000, 6840000, 2, 17, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (49, 8, 25, 7, 1140000, 7980000, 3, 17, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (50, 8, 25, 5, 1140000, 5700000, 5, 17, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (51, 8, 27, 5, 665000, 3325000, 1, 17, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (52, 9, 27, 4, 665000, 2660000, 1, 17, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (53, 10, 26, 1, 1216000, 1216000, 1, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (54, 10, 26, 3, 1216000, 3648000, 4, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (55, 11, 25, 2, 1140000, 2280000, 1, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (56, 11, 25, 4, 1140000, 4560000, 2, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (57, 11, 25, 3, 1140000, 3420000, 3, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (58, 11, 25, 5, 1140000, 5700000, 5, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (59, 12, 28, 3, 665000, 1995000, 1, 20, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (60, 12, 28, 2, 665000, 1330000, 6, 20, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (61, 13, 32, 5, 1187500, 5937500, 2, 20, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (62, 14, 26, 2, 1216000, 2432000, 1, 9, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (63, 15, 25, 3, 1140000, 3420000, 1, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (64, 15, 25, 5, 1140000, 5700000, 2, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (65, 16, 25, 1, 1140000, 1140000, 1, 9, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (66, 17, 26, 4, 1216000, 4864000, 1, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (67, 17, 26, 3, 1216000, 3648000, 4, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (68, 18, 25, 3, 1140000, 3420000, 1, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (69, 18, 60, 3, 1330000, 3990000, 1, 19, 1)
INSERT [dbo].[chitiethoadon] ([idchitiethoadon], [idhoadon], [idsanpham], [soluong], [giatien], [sotien], [idsizesanpham], [idnguoidung], [status]) VALUES (70, NULL, 25, 1, 1140000, 1140000, 1, 9, 1)
SET IDENTITY_INSERT [dbo].[chitiethoadon] OFF
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (2, 25, N'Đặng Đức Tôn', N'dangducton@gmail.com', CAST(N'2019-08-22 00:33:17.770' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (3, 25, N'Đặng Đức Tôn1', N'dangducton@gmail.com', CAST(N'2019-08-22 00:34:48.420' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (4, 25, N'Đặng Đức Tôn2', N'dangducton@gmail.com', CAST(N'2019-08-22 00:34:48.420' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (5, 25, N'Đặng Đức Tôn3', N'dangducton@gmail.com', CAST(N'2019-08-22 00:34:48.423' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (6, 25, N'Đặng Đức Tôn4', N'dangducton@gmail.com', CAST(N'2019-08-22 00:34:48.423' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (7, 25, N'Đặng Đức Tôn5', N'dangducton@gmail.com', CAST(N'2019-08-22 00:34:48.423' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (8, 25, N'Đặng Đức Tôn6', N'dangducton@gmail.com', CAST(N'2019-08-22 00:34:48.423' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (9, 25, N'Đặng Đức Tôn7', N'dangducton@gmail.com', CAST(N'2019-08-22 00:34:48.423' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (10, 25, N'Đặng Đức Tôn8', N'dangducton@gmail.com', CAST(N'2019-08-22 00:34:48.427' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (11, 25, N'Đặng Đức Tôn9', N'dangducton@gmail.com', CAST(N'2019-08-22 00:34:48.427' AS DateTime), 1, N'Sản Phẩm Rất Tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (13, 61, N'Văn Tiến Thắng', N'vantienthang@gmail.com', CAST(N'2019-09-15 20:54:06.367' AS DateTime), 1, N'sản phẩm tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (14, 63, N'Đặng Đức Tôn', N'dangducton@gmail.com', CAST(N'2019-09-15 20:57:25.150' AS DateTime), 1, N'sản phẩm tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (15, 63, N'Văn Tiến Thắng', N'trangthocton@gmail.com', CAST(N'2019-09-15 20:57:50.167' AS DateTime), 1, N'sản phẩm tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (16, 63, N'Đặng Đức Tôn', N'dangducton@gmail.com', CAST(N'2019-09-15 23:19:30.253' AS DateTime), 1, N'sản phẩm rất đẹp')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (18, 57, N'Đặng Đức Tôn', N'dangducton@gmail.com', CAST(N'2019-09-15 23:19:58.940' AS DateTime), 1, N'sản phẩm tốt đi mãi chả hỏng
')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (19, 59, N'Đặng Đức Tôn', N'dangducton@gmail.com', CAST(N'2019-09-15 23:20:08.477' AS DateTime), 1, N'chất lượng tốt
')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (20, 58, N'Đặng Đức Tôn', N'dangducton@gmail.com', CAST(N'2019-09-15 23:20:17.413' AS DateTime), 1, N'giày xuất sắc')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (21, 62, N'Đặng Đức Tôn', N'dangducton@gmail.com', CAST(N'2019-09-15 23:20:33.730' AS DateTime), 1, N'không chê đc chất lượng tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (22, 61, N'Đặng Đức Tôn', N'dangducton@gmail.com', CAST(N'2019-09-15 23:20:41.563' AS DateTime), 1, N'sản phẩm tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (23, 62, N'Văn Tiến Thắng', N'dangducton@gmail.com', CAST(N'2019-09-20 23:33:51.123' AS DateTime), 1, N'Sản phẩm tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (24, 62, N'Văn Tiến Thắng', N'dangducton@gmail.com', CAST(N'2019-09-20 23:34:39.930' AS DateTime), 1, N'Sản phẩm tốt')
INSERT [dbo].[comment] ([idcomment], [idsanpham], [hoten], [email], [ngaycomment], [status], [noidung]) VALUES (25, 96, N'Văn Tiến Thắng', N'nguoivanchuyen@gmail.com', CAST(N'2019-09-21 00:17:54.087' AS DateTime), 1, N'Good')
SET IDENTITY_INSERT [dbo].[comment] OFF
SET IDENTITY_INSERT [dbo].[danhmucsanpham] ON 

INSERT [dbo].[danhmucsanpham] ([iddanhmuc], [tendanhmuc], [status]) VALUES (1, N'Giày Sneaker', 1)
INSERT [dbo].[danhmucsanpham] ([iddanhmuc], [tendanhmuc], [status]) VALUES (2, N'Giày Lười', 1)
INSERT [dbo].[danhmucsanpham] ([iddanhmuc], [tendanhmuc], [status]) VALUES (3, N'Giày Tây', 1)
SET IDENTITY_INSERT [dbo].[danhmucsanpham] OFF
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (5, N'0366640630', N'dangducton@gmail.com', N'Eco Home 1, đường Kẻ Vẽ, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', 1216000, 9, CAST(N'2019-09-12 23:23:23.973' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (6, N'0366640630', N'dangducton@gmail.com', N'Eco Home 1, đường Kẻ Vẽ, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', 1881000, 9, CAST(N'2019-09-16 02:19:29.547' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (8, N'0366640631', N'dangducton1@gmail.com', N'Eco Home1, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', 30685000, 17, CAST(N'2019-09-16 02:22:40.767' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (9, N'0366640631', N'dangducton1@gmail.com', N'Eco Home1, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', 2660000, 17, CAST(N'2019-09-16 02:23:57.927' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (10, N'0366606311', N'nguyenvanbang@gmail.com', N'Thôn Phương Tòng, Xã Hùng An, Huyện Kim Động,Tỉnh Hưng Yên', 4864000, 19, CAST(N'2019-09-18 23:13:31.363' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (11, N'0366606311', N'nguyenvanbang@gmail.com', N'Thôn Phương Tòng, Xã Hùng An, Huyện Kim Động,Tỉnh Hưng Yên', 15960000, 19, CAST(N'2019-09-18 23:14:31.880' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (12, N'0466640630', N'bangmomthoi@gmail.com', N'Eco Home 1, đường Kẻ Vẽ, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', 3325000, 20, CAST(N'2019-09-18 23:22:50.933' AS DateTime), N'', 2)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (13, N'0466640630', N'bangmomthoi@gmail.com', N'Eco Home 1, đường Kẻ Vẽ, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', 5937500, 20, CAST(N'2019-09-18 23:23:18.060' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (14, N'0366640630', N'dangducton@gmail.com', N'Eco Home 1, đường Kẻ Vẽ, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', 2432000, 9, CAST(N'2019-09-19 03:12:31.907' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (15, N'0366606311', N'nguyenvanbang@gmail.com', N'Thôn Phương Tòng, Xã Hùng An, Huyện Kim Động,Tỉnh Hưng Yên', 9120000, 19, CAST(N'2019-09-19 20:26:51.267' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (16, N'0366640630', N'dangducton@gmail.com', N'Eco Home 1, đường Kẻ Vẽ, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', 1140000, 9, CAST(N'2019-09-19 20:27:54.897' AS DateTime), N'', 1)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (17, N'0366606311', N'nguyenvanbang@gmail.com', N'Thôn Phương Tòng, Xã Hùng An, Huyện Kim Động,Tỉnh Hưng Yên', 8512000, 19, CAST(N'2019-09-19 22:46:12.463' AS DateTime), N'', 3)
INSERT [dbo].[hoadon] ([idhoadon], [dienthoai], [email], [diachi], [tongtien], [iduser], [ngaytao], [ghichu], [status]) VALUES (18, N'0366606311', N'nguyenvanbang@gmail.com', N'Thôn Phương Tòng, Xã Hùng An, Huyện Kim Động,Tỉnh Hưng Yên', 7410000, 19, CAST(N'2019-09-19 22:46:39.593' AS DateTime), N'', 1)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
SET IDENTITY_INSERT [dbo].[mausanpham] ON 

INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (1, N'Nâu', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (2, N'Trắng', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (3, N'Xanh', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (4, N'Hồng', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (5, N'Đen', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (6, N'Tím', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (7, N'Ghi', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (8, N'Xám', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (9, N'Đỏ', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (10, N'Vàng', 1)
INSERT [dbo].[mausanpham] ([idmausanpham], [tenmau], [status]) VALUES (11, N'Xanh Rêu', 1)
SET IDENTITY_INSERT [dbo].[mausanpham] OFF
SET IDENTITY_INSERT [dbo].[nguoidung] ON 

INSERT [dbo].[nguoidung] ([iduser], [tenuser], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaytao], [status]) VALUES (9, N'Đặng Đức Tôn', N'dangducton', N'dangducton', N'dangducton@gmail.com', N'Eco Home 1, đường Kẻ Vẽ, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', N'0366640630', CAST(N'2019-09-12 00:14:37.103' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([iduser], [tenuser], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaytao], [status]) VALUES (17, N'Đặng Đức Tôn', N'dangducton1', N'dangducton', N'dangducton1@gmail.com', N'Eco Home1, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', N'0366640631', CAST(N'2019-09-12 14:13:14.950' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([iduser], [tenuser], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaytao], [status]) VALUES (18, N'Đặng Đức Tôn', N'dangducton2', N'dangducton1', N'dangducton2@gmail.com', N'Eco Home1, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', N'0366640632', CAST(N'2019-09-12 21:01:15.607' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([iduser], [tenuser], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaytao], [status]) VALUES (19, N'Nguyễn Văn Bằng', N'nguyenvanbang', N'nguyenvanbang1', N'nguyenvanbang@gmail.com', N' Thôn Phương Tòng, Xã Hùng An, Huyện Kim Động,Tỉnh Hưng Yên', N'0366606314', CAST(N'2019-09-18 15:55:43.933' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([iduser], [tenuser], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaytao], [status]) VALUES (20, N'Nguyễn Văn Bằng', N'bangmomthoi', N'bangmomthoi', N'bangmomthoi@gmail.com', N'Eco Home 1, đường Kẻ Vẽ, xã Đông Ngạc, quận Bắc Từ Liêm, thành phố Hà Nội', N'0466640630', CAST(N'2019-09-18 19:44:14.590' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[nguoidung] OFF
SET IDENTITY_INSERT [dbo].[nhapchitietsanpham] ON 

INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (1, 25, 1, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (2, 25, 2, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (3, 25, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (4, 26, 1, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (5, 28, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (6, 28, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (7, 25, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (8, 25, 1, 5)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (9, 25, 5, 5)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (10, 25, 3, 5)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (11, 25, 5, 5)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (12, 25, 5, 5)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (13, 25, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (14, 25, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (15, 25, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (16, 25, 2, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (17, 27, 2, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (18, 33, 4, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (19, 31, 2, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (20, 26, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (21, 26, 4, 5)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (22, 27, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (23, 28, 1, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (24, 31, 1, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (25, 35, 1, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (26, 25, 3, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (27, 50, 1, 12)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (28, 50, 2, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (29, 50, 3, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (30, 50, 4, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (31, 50, 6, 20)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (32, 32, 2, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (33, 28, 6, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (34, 35, 1, 12)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (35, 37, 1, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (36, 37, 2, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (37, 37, 3, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (38, 37, 4, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (39, 37, 5, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (40, 37, 6, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (41, 60, 1, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (42, 27, 1, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (43, 25, 5, 12)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (44, 27, 1, 12)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (45, 26, 4, 2)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (46, 26, 4, 10)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (47, 30, 1, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (48, 30, 2, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (49, 30, 3, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (50, 30, 4, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (51, 30, 5, 15)
INSERT [dbo].[nhapchitietsanpham] ([idnhapchitiet], [idsanpham], [idsize], [soluong]) VALUES (52, 30, 6, 15)
SET IDENTITY_INSERT [dbo].[nhapchitietsanpham] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[role] ([id], [name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[sanpham] ON 

INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (25, 1, N'BREEZY SNEAKER', 1000000, 1200000, 1140000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'<p>- M&agrave;u sắc: Đen.</p>

<p>- Chất liệu da b&ograve;, mềm.</p>

<p>- Đế cao su &ecirc;m, dẻo dai, bền bỉ, chịu lực.</p>

<p>- L&oacute;t gi&agrave;y l&agrave; l&oacute;t rời gồm 2 lớp với lớp tr&ecirc;n l&agrave; da thật, lớp dưới l&agrave; cao su non &ecirc;m &aacute;i.</p>

<p>- Thiết kế trơn tối giản v&agrave; thanh lịch.</p>
', N'<p>- M&agrave;u sắc: Đen.</p>

<p>- Chất liệu da b&ograve;, mềm.</p>

<p>- Đế cao su &ecirc;m, dẻo dai, bền bỉ, chịu lực.</p>

<p>- L&oacute;t gi&agrave;y l&agrave; l&oacute;t rời gồm 2 lớp với lớp tr&ecirc;n l&agrave; da thật, lớp dưới l&agrave; cao su non &ecirc;m &aacute;i.</p>

<p>- Thiết kế trơn tối giản v&agrave; thanh lịch. Breezy Sneaker l&agrave; một trong những mẫu sneaker đại diện cho phong c&aacute;ch thời trang tối giản, với 3 gam m&agrave;u cực basic: X&aacute;m thanh lịch, N&acirc;u b&ograve; c&aacute; t&iacute;nh v&agrave; Đen đầy b&iacute; ẩn. Với thiết kế da thật cao cấp, mềm mại v&agrave; bền bỉ c&ugrave;ng form d&aacute;ng &ocirc;m ch&acirc;n sẽ khiến từng bước đi của c&aacute;c ch&agrave;ng trai th&ecirc;m tự tin v&agrave; khỏe khoắn. Đặc biệt với những anh ch&agrave;ng đam m&ecirc; kh&aacute;m ph&aacute;, Brezzy chắc chắn sẽ l&agrave; người bạn đồng h&agrave;nh kh&ocirc;ng thể thiếu tr&ecirc;n mọi nẻo đường. Ngo&agrave;i ra, phần đế cao su cao su d&agrave;y dặn, dẻo, ma s&aacute;t tốt v&agrave; tạo độ linh hoạt tối đa cho người sử dụng. Đặc biệt, phần lớp l&oacute;t trong gi&agrave;y được l&agrave;m từ cao su non v&agrave; bọc da thật phần tiếp x&uacute;c với b&agrave;n ch&acirc;n, đảm bảo cho đ&ocirc;i ch&acirc;n của bạn lu&ocirc;n được bảo vệ tốt nhất. Phối đồ với Breezy kh&ocirc;ng c&oacute; g&igrave; ngo&agrave;i c&acirc;u &quot;Dễ rất dễ!&quot;, bởi từ thiết kế, kiểu d&aacute;ng đến m&agrave;u sắc đều v&ocirc; c&ugrave;ng tối giản, thanh lịch, trẻ trung, ph&ugrave; hợp với hầu hết mọi trang phục. H&atilde;y thoải m&aacute;i lựa chọn trang phục kết hợp với Breezy Sneaker theo c&aacute; t&iacute;nh, phong c&aacute;ch v&agrave; sự s&aacute;ng tạo ri&ecirc;ng của bạn.</p>
', 5, N'306a__copy_871066__800x800.jpg', N'306b__copy_871066__800x800.jpg', N'306__copy_871066__800x800.jpg', N'302c__copy_871066__800x800.jpg', CAST(N'2019-08-18 14:35:13.990' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (26, 1, N'BREEZY SNEAKER', 1100000, 1280000, 1216000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Xám
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai, bền bỉ, chịu lực.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn tối giản và thanh lịch.', N'- Màu sắc: Xám
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai, bền bỉ, chịu lực.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn tối giản và thanh lịch.

Breezy Sneaker là một trong những mẫu sneaker đại diện cho phong cách thời trang tối giản, với 3 gam màu cực basic: Xám thanh lịch, Nâu bò cá tính và Đen đầy bí ẩn. Với thiết kế da thật cao cấp, mềm mại và bền bỉ cùng form dáng ôm chân sẽ khiến từng bước đi của các chàng trai thêm tự tin và khỏe khoắn. Đặc biệt với những anh chàng đam mê khám phá, Breezy Sneaker chắc chắn sẽ là người bạn đồng hành không thể thiếu trên mọi nẻo đường.

Ngoài ra, phần đế cao su cao su dày dặn, dẻo, ma sát tốt và tạo độ linh hoạt tối đa cho người sử dụng. Đặc biệt, phần lớp lót trong giày được làm từ cao su non và bọc da thật phần tiếp xúc với bàn chân, đảm bảo cho đôi chân của bạn luôn được bảo vệ tốt nhất. 

Phối đồ với Breezy Sneaker không có gì ngoài câu "Dễ rất dễ!", bởi từ thiết kế, kiểu dáng đến màu sắc đều vô cùng tối giản, thanh lịch, trẻ trung, phù hợp với hầu hết mọi trang phục. Hãy thoải mái lựa chọn trang phục kết hợp với Breezy Sneaker theo cá tính, phong cách và sự sáng tạo riêng của bạn.', 8, N'9496v.jpg', N'9497v.jpg', N'9498v.jpg', N'9499v.jpg', CAST(N'2019-08-18 14:39:14.503' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (27, 1, N'SHARK SNEAKER', 500000, 700000, 665000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'<p>- M&agrave;u: Trắng.</p>

<p>- Chất liệu vải tho&aacute;ng.</p>

<p>- Đế cao su &ecirc;m, dẻo dai v&agrave; độ bền cao.</p>

<p>- Lớp l&oacute;t mềm v&agrave; &ecirc;m, tạo sự thoải m&aacute;i, &ecirc;m &aacute;i khi sử dụng. -</p>

<p>Thiết kế trẻ trung với c&aacute;c đường chỉ tạo điểm nhấn</p>
', N'<p>Sản phẩm chưa c&oacute; nội dung chi tiết</p>

<p>- M&agrave;u: Trắng.</p>

<p>- Chất liệu vải tho&aacute;ng.</p>

<p>- Đế cao su &ecirc;m, dẻo dai v&agrave; độ bền cao.</p>

<p>- Lớp l&oacute;t mềm v&agrave; &ecirc;m, tạo sự thoải m&aacute;i, &ecirc;m &aacute;i khi sử dụng.</p>

<p>- Thiết kế trẻ trung với c&aacute;c đường chỉ tạo điểm nhấn</p>
', 2, N'9483v.jpg', N'9485v.jpg', N'9487v.jpg', N'9488v.jpg', CAST(N'2019-08-18 14:41:38.050' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (28, 1, N'SHARK SNEAKER', 500000, 700000, 665000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Đen.
- Chất liệu vải thoáng.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Đen.
- Chất liệu vải thoáng.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 5, N'9489v.jpg', N'9490v.jpg', N'9491v.jpg', N'9493v.jpg', CAST(N'2019-08-18 14:43:52.757' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (30, 1, N'AIR MESH SNEAKER', 500000, 720000, 684000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Trắng.
- Chất liệu da lộn kết hợp da vải thoáng.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Trắng.
- Chất liệu da lộn kết hợp da vải thoáng.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 2, N'9479v.jpg', N'9480v.jpg', N'9481v.jpg', N'9482v.jpg', CAST(N'2019-08-18 14:53:39.283' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (31, 1, N'AIR MESH SNEAKER', 500000, 720000, 684000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Xám.
- Chất liệu da lộn kết hợp da vải thoáng.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Xám.
- Chất liệu da lộn kết hợp da vải thoáng.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 8, N'2474v.jpg', N'2475v.jpg', N'2476v.jpg', N'2477v.jpg', CAST(N'2019-08-18 14:55:56.440' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (32, 1, N'LAWNGREEN SNEAKER ', 1000000, 1250000, 1187500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Trắng.
- Chất liệu da thật mềm phối vải.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Trắng.
- Chất liệu da thật mềm phối vải.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 2, N'bentoni__1096v_800x800.jpg', N'bentoni__1097v_800x800.jpg', N'bentoni__1098v_800x800.jpg', N'bentoni__1100v_800x800.jpg', CAST(N'2019-08-18 15:09:43.480' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (33, 1, N'SHADOW SNEAKER', 1000000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt', N'- Màu: Đen.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Đen.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 5, N'1212v.jpg', N'1213v.jpg', N'1214v.jpg', N'1215v.jpg', CAST(N'2019-08-18 15:17:08.617' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (34, 1, N'SHADOW SNEAKER', 1000000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 2, N'bentoni__1110v_800x800.jpg', N'bentoni__1112v_800x800.jpg', N'bentoni__1113v_800x800.jpg', N'bentoni__1114v_800x800.jpg', CAST(N'2019-08-18 15:19:24.400' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (35, 1, N'BOLD SUEDE SNEAKER', 1000000, 1250000, 1187500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Nâu.
- Chất liệu da lộn mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Nâu.
- Chất liệu da lộn mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 1, N'bentoni__1106v_800x800.jpg', N'bentoni__1107v_800x800.jpg', N'bentoni__1108v_800x800.jpg', N'bentoni__1109v_800x800.jpg', CAST(N'2019-08-18 15:21:16.170' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (36, 1, N'PALE SNEAKER', 1000000, 1290000, 1225500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Trắng.
- Chất liệu da lộn phối da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Trắng.
- Chất liệu da lộn phối da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 2, N'bentoni__0208v_800x800.jpg', N'bentoni__0209v_800x800.jpg', N'bentoni__0210v_800x800.jpg', N'bentoni__0212v_800x800.jpg', CAST(N'2019-08-18 15:30:33.123' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (37, 1, N'PALE SNEAKER', 1000000, 1290000, 1225500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'<p>- M&agrave;u: Xanh.</p>

<p>- Chất liệu da lộn phối da thật mềm.</p>

<p>- Đế cao su &ecirc;m, dẻo dai v&agrave; độ bền cao.</p>

<p>- Lớp l&oacute;t mềm v&agrave; &ecirc;m, tạo sự thoải m&aacute;i, &ecirc;m &aacute;i khi sử dụng.</p>

<p>- Thiết kế trẻ trung với c&aacute;c đường chỉ tạo điểm nhấn.</p>
', N'<p>Sản phẩm chưa c&oacute; nội dung chi tiết</p>

<p>- M&agrave;u: Xanh.</p>

<p>- Chất liệu da lộn phối da thật mềm.</p>

<p>- Đế cao su &ecirc;m, dẻo dai v&agrave; độ bền cao.</p>

<p>- Lớp l&oacute;t mềm v&agrave; &ecirc;m, tạo sự thoải m&aacute;i, &ecirc;m &aacute;i khi sử dụng.</p>

<p>- Thiết kế trẻ trung với c&aacute;c đường chỉ tạo điểm nhấn</p>
', 3, N'bentoni__0208v_800x800.jpg', N'bentoni__0209v_800x800.jpg', N'bentoni__0210v_800x800.jpg', N'bentoni__0212v_800x800.jpg', CAST(N'2019-08-18 15:31:51.130' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (38, 1, N'COMFY SNEAKER', 1000000, 1250000, 1187500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.

Đủ ÊM cho một ngày dài vận động, đủ NHẸ để người đàn ông luôn tự tin trong mọi hoàn cảnh, đó là những gì mà Comfy Sneaker có thể đem tới cho bạn.

Một trong những điểm nổi bật của đôi giày này đó chính là trọng lượng SIÊU NHẸ của nó. Với chất liệu đế cao su được cải tiến theo công nghệ mới, Comfy Sneaker sẽ luôn đem tới cho bàn chân bạn cảm giác NHẸ nhàng nhất. Và đúng như cái tên gọi của nó, Comfy - sẽ luôn thật thoải mái bởi lớp lót với miếng trợ lực phần gót chân cùng lỗ thoáng khi đem lại cảm giác ÊM ái nhât. 

Chất liệu da thật cao cấp kết hợp thiết kế nổi bật, trẻ trung giúp các chàng trai thể hiện được cá tính của bản thân mà vẫn không chút kệch cỡm, phô trương. Sẽ thật đáng tiếc nếu bạn bỏ qua đôi giày Sneaker đang cực kì HOT tại Bentoni. Đến Bentoni và sỡ hữu ngay Comfy Sneaker thôi!', 2, N'bentoni__9581v_800x800.jpg', N'bentoni__9582v_800x800.jpg', N'bentoni__9584v_800x800.jpg', N'bentoni__9585v_800x800.jpg', CAST(N'2019-08-18 15:45:26.377' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (39, 1, N'COMFY SNEAKER ', 1000000, 1250000, 1187500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.
Đủ ÊM cho một ngày dài vận động, đủ NHẸ để người đàn ông luôn tự tin trong mọi hoàn cảnh, đó là những gì mà Comfy Sneaker có thể đem tới cho bạn.

Một trong những điểm nổi bật của đôi giày này đó chính là trọng lượng SIÊU NHẸ của nó. Với chất liệu đế cao su được cải tiến theo công nghệ mới, Comfy Sneaker sẽ luôn đem tới cho bàn chân bạn cảm giác NHẸ nhàng nhất. Và đúng như cái tên gọi của nó, Comfy - sẽ luôn thật thoải mái bởi lớp lót với miếng trợ lực phần gót chân cùng lỗ thoáng khi đem lại cảm giác ÊM ái nhât. 

Chất liệu da thật cao cấp kết hợp thiết kế nổi bật, trẻ trung giúp các chàng trai thể hiện được cá tính của bản thân mà vẫn không chút kệch cỡm, phô trương. Sẽ thật đáng tiếc nếu bạn bỏ qua đôi giày Sneaker đang cực kì HOT tại Bentoni. Đến Bentoni và sỡ hữu ngay Comfy Sneaker thôi!', 10, N'bentoni__9586v_800x800.jpg', N'bentoni__9587v_800x800.jpg', N'bentoni__9590v_800x800.jpg', N'bentoni__9591v_800x800.jpg', CAST(N'2019-08-18 15:50:46.357' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (40, 1, N'TANNED SNEAKER', 1000000, 1300000, 1235000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Nâu nhạt.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết

- Màu: Nâu nhạt.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 1, N'bentoni__0231v_800x800.jpg', N'bentoni__0232v_800x800.jpg', N'bentoni__0233v_800x800.jpg', N'bentoni__0235v_800x800.jpg', CAST(N'2019-08-18 15:53:21.307' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (41, 1, N'MUDDY SHOES', 1000000, 1300000, 1235000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Nâu sáng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Nâu sáng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 1, N'bentoni__9977v_800x800.jpg', N'bentoni__9978v_800x800.jpg', N'bentoni__9980v_800x800.jpg', N'bentoni__9981v_800x800.jpg', CAST(N'2019-08-18 16:22:10.077' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (42, 1, N'COMFY SNEAKER', 1000000, 1250000, 1187500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Đen.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'- Màu: Đen.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.
Đủ ÊM cho một ngày dài vận động, đủ NHẸ để người đàn ông luôn tự tin trong mọi hoàn cảnh, đó là những gì mà Comfy Sneaker có thể đem tới cho bạn.

Một trong những điểm nổi bật của đôi giày này đó chính là trọng lượng SIÊU NHẸ của nó. Với chất liệu đế cao su được cải tiến theo công nghệ mới, Comfy Sneaker sẽ luôn đem tới cho bàn chân bạn cảm giác NHẸ nhàng nhất. Và đúng như cái tên gọi của nó, Comfy - sẽ luôn thật thoải mái bởi lớp lót với miếng trợ lực phần gót chân cùng lỗ thoáng khi đem lại cảm giác ÊM ái nhât. 

Chất liệu da thật cao cấp kết hợp thiết kế nổi bật, trẻ trung giúp các chàng trai thể hiện được cá tính của bản thân mà vẫn không chút kệch cỡm, phô trương. Sẽ thật đáng tiếc nếu bạn bỏ qua đôi giày Sneaker đang cực kì HOT tại Bentoni. Đến Bentoni và sỡ hữu ngay Comfy Sneaker thôi!', 5, N'9540v.jpg', N'9541v.jpg', N'9542v.jpg', N'9544v.jpg', CAST(N'2019-08-18 16:23:50.410' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (43, 1, N'COMFY SNEAKER', 1000000, 1250000, 1187500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Đủ ÊM cho một ngày dài vận động, đủ NHẸ để người đàn ông luôn tự tin trong mọi hoàn cảnh, đó là những gì mà Comfy Sneaker có thể đem tới cho bạn.

Một trong những điểm nổi bật của đôi giày này đó chính là trọng lượng SIÊU NHẸ của nó. Với chất liệu đế cao su được cải tiến theo công nghệ mới, Comfy Sneaker sẽ luôn đem tới cho bàn chân bạn cảm giác NHẸ nhàng nhất. Và đúng như cái tên gọi của nó, Comfy - sẽ luôn thật thoải mái bởi lớp lót với miếng trợ lực phần gót chân cùng lỗ thoáng khi đem lại cảm giác ÊM ái nhât. 

Chất liệu da thật cao cấp kết hợp thiết kế nổi bật, trẻ trung giúp các chàng trai thể hiện được cá tính của bản thân mà vẫn không chút kệch cỡm, phô trương. Sẽ thật đáng tiếc nếu bạn bỏ qua đôi giày Sneaker đang cực kì HOT tại Bentoni. Đến Bentoni và sỡ hữu ngay Comfy Sneaker thôi!', 2, N'bentoni__9576v_800x800.jpg', N'bentoni__9577v_800x800.jpg', N'bentoni__9578v_800x800.jpg', N'bentoni__9580v_800x800.jpg', CAST(N'2019-08-18 16:25:33.223' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (44, 1, N'PALE SNEAKER', 1000000, 1290000, 1225500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Nâu.
- Chất liệu da lộn phối da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết

- Màu: Nâu.
- Chất liệu da lộn phối da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 1, N'bentoni__0220v_800x800.jpg', N'bentoni__0221v_800x800.jpg', N'bentoni__0222v_800x800.jpg', N'bentoni__0262v_800x800.jpg', CAST(N'2019-08-18 16:27:19.287' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (45, 1, N'PRINT SNEAKER', 1100000, 1400000, 1330000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 2, N'bentoni__1116v_800x800.jpg', N'bentoni__1117v_800x800.jpg', N'bentoni__1118v_800x800.jpg', N'bentoni__1119v_800x800.jpg', CAST(N'2019-08-18 16:28:50.530' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (46, 1, N'COOL GRAY SNEAKER', 1000000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Ghi.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Ghi.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Bạn đang tìm một đôi giày sneaker thật cá tính, nổi bật và "cool ngầu"? Vậy thì đúng như cái tên gọi của nó, Cool gray Sneaker sẽ giúp diện mạo bạn trở nên thật đặc biệt trong mắt đối phương.

Chất liệu da thật mềm mại, kết hợp với lớp lót được cải tiến công nghệ mới giúp đôi chân bạn trở nên êm ái hơn bao giờ hết. Phần đế cao su với thiết kế đặc biệt tạo độ ma sát cao, nâng đôi chân thêm bền bỉ và dẻo dai trong mọi hoàn cảnh.

Trung thành với lối thiết kế đơn giản, kết hợp màu sắc lạnh tạo nên nét chấm phá độc đáo cho diện mạo của người đàn ông. Hãy chọn cho mình những bộ đồ tone tối màu, kết hợp với Cool gray Sneaker đảm bảo bạn sẽ rất nổi bật!', 7, N'bentoni__5839v_800x800.jpg', N'bentoni__5840v_800x800.jpg', N'bentoni__5841v_800x800.jpg', N'bentoni__5842v_800x800.jpg', CAST(N'2019-08-18 16:34:15.093' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (47, 1, N'COOL GRAY SNEAKER', 1000000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Ghi xám.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Ghi xám.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Bạn đang tìm một đôi giày sneaker thật cá tính, nổi bật và "cool ngầu"? Vậy thì đúng như cái tên gọi của nó, Cool gray Sneaker sẽ giúp diện mạo bạn trở nên thật đặc biệt trong mắt đối phương.

Chất liệu da thật mềm mại, kết hợp với lớp lót được cải tiến công nghệ mới giúp đôi chân bạn trở nên êm ái hơn bao giờ hết. Phần đế cao su với thiết kế đặc biệt tạo độ ma sát cao, nâng đôi chân thêm bền bỉ và dẻo dai trong mọi hoàn cảnh.

Trung thành với lối thiết kế đơn giản, kết hợp màu sắc lạnh tạo nên nét chấm phá độc đáo cho diện mạo của người đàn ông. Hãy chọn cho mình những bộ đồ tone tối màu, kết hợp với Cool gray Sneaker đảm bảo bạn sẽ rất nổi bật!', 8, N'325__copy_00_800x800.jpg', N'325a__copy_00_800x800.jpg', N'325b__copy_00_800x800.jpg', N'325c__copy_00_800x800.jpg', CAST(N'2019-08-18 16:36:28.633' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (48, 1, N'SUBPLOT SNEAKER', 1000000, 1180000, 1121000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Trắng.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Một nét chấm phá đơn giản, nhưng đủ tinh tế tạo nên sự nổi bật đầy cá tính cho diện mạo của người đàn ông, chắc chắn chỉ có thể là Subplot Sneaker!

Với 100% chất liệu da thật cao cấp đem đến vẻ bề ngoài sang trọng cùng lớp lót êm ái, ôm chân giúp bạn trở nên cực thoải mái. Phần đế cao su được thiết kế khác lạ làm tăng tính bền bỉ của đôi chân và tạo độ ma sát cao, giúp các chàng trai tự tin bước đi trên mọi địa hình mà không lo trơn trượt.

Bằng một điểm nhấn nhỏ thôi, nhưng Subplot Sneaker đủ tinh tế để làm nên sự khác biệt cho diện mạo của bạn. Không quá khó khăn trong việc phối đồ nên bạn hoàn toàn có thể mix&match với mọi set đồ đa phong cách mà bạn muốn.', 1, N'326__copy_00_800x800.jpg', N'326a__copy_00_800x800.jpg', N'326b__copy_00_800x800.jpg', N'326c__copy_00_800x800.jpg', CAST(N'2019-08-18 16:40:54.997' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (49, 1, N'SUBPLOT SNEAKER', 1000000, 1180000, 1121000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Đen.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Một nét chấm phá đơn giản, nhưng đủ tinh tế tạo nên sự nổi bật đầy cá tính cho diện mạo của người đàn ông, chắc chắn chỉ có thể là Subplot Sneaker!

Với 100% chất liệu da thật cao cấp đem đến vẻ bề ngoài sang trọng cùng lớp lót êm ái, ôm chân giúp bạn trở nên cực thoải mái. Phần đế cao su được thiết kế khác lạ làm tăng tính bền bỉ của đôi chân và tạo độ ma sát cao, giúp các chàng trai tự tin bước đi trên mọi địa hình mà không lo trơn trượt.

Bằng một điểm nhấn nhỏ thôi, nhưng Subplot Sneaker đủ tinh tế để làm nên sự khác biệt cho diện mạo của bạn. Không quá khó khăn trong việc phối đồ nên bạn hoàn toàn có thể mix&match với mọi set đồ đa phong cách mà bạn muốn.', 5, N'324__copy_1122_800x800.jpg', N'324a__copy_1122_800x800.jpg', N'324b__copy_1122_800x800.jpg', N'324c__copy_1122_800x800.jpg', CAST(N'2019-08-18 16:42:52.197' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (50, 1, N'COOL GRAY SNEAKER', 1000000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng ghi.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Trắng ghi.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Bạn đang tìm một đôi giày sneaker thật cá tính, nổi bật và "cool ngầu"? Vậy thì đúng như cái tên gọi của nó, Cool gray Sneaker sẽ giúp diện mạo bạn trở nên thật đặc biệt trong mắt đối phương.

Chất liệu da thật mềm mại, kết hợp với lớp lót được cải tiến công nghệ mới giúp đôi chân bạn trở nên êm ái hơn bao giờ hết. Phần đế cao su với thiết kế đặc biệt tạo độ ma sát cao, nâng đôi chân thêm bền bỉ và dẻo dai trong mọi hoàn cảnh.

Trung thành với lối thiết kế đơn giản, kết hợp màu sắc lạnh tạo nên nét chấm phá độc đáo cho diện mạo của người đàn ông. Hãy chọn cho mình những bộ đồ tone tối màu, kết hợp với Cool gray Sneaker đảm bảo bạn sẽ rất nổi bật!', 2, N'1323__copy_i_800x800.jpg', N'1323a__copy_i_800x800.jpg', N'1323b__copy_i_800x800.jpg', N'326c__copy_00_800x800.jpg', CAST(N'2019-08-18 16:47:01.677' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (51, 1, N'OMOI SNEAKER ', 1000000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng. 
- Chất liệu: Da thật mềm. 
- Đế cao su dẻo dai, bền bỉ, chịu lực tốt. 
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn tối giản, tinh tế, sang trọng.', N'Nếu bạn đang tìm một đôi giày giúp bạn "ăn gian" thêm chiều cao đôi chút thì OMOI Sneaker chính là sự lựa chọn hoàn hảo!

- Màu sắc: Trắng. 
- Chất liệu: Da thật mềm. 
- Đế cao su dẻo dai, bền bỉ, chịu lực tốt. 
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn tối giản, tinh tế, sang trọng.

Thoạt đầu nhìn có vẻ như đôi giày này sẽ rất nặng đây nhưng không! Với phần đế cao su được cải tiến theo công nghệ mới không những giúp bạn tăng thêm chiều cao mà còn đem lại sự linh hoạt cho đôi chân dù có phải hoạt động cả ngày dài. Lớp lót với phần trên là da thật được thiết kế những lỗ nhỏ làm giảm bớt mùi hôi và giúp ôm sát đôi chân bạn.

Vì là màu trắng nên không quá khó khăn trong việc phối đồ. Các chàng trai có thể mix với những chiếc áo polo cùng chiếc quần kaki hay quần cộc, khá trẻ trung và cá tính đấy chính!', 2, N'319__copy_87124i_800x800.jpg', N'319a__copy_87124i_800x800.jpg', N'319b__copy_87124i_800x800.jpg', N'319c__copy_87124i_800x800.jpg', CAST(N'2019-08-18 16:48:56.950' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (52, 1, N'ZIPPER SNEAKER', 1000000, 1200000, 1140000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen. 
- Chất liệu: Da thật mềm.
- Đế cao su dẻo dai, bền bỉ, chịu lực tốt. 
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế cá tính, năng động.', N'- Màu sắc: Đen. 
- Chất liệu: Da thật mềm.
- Đế cao su dẻo dai, bền bỉ, chịu lực tốt. 
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế cá tính, năng động.

Nếu bạn là chàng trai năng động, cá tính, thích sự nổi bật, trẻ trung, Zipper Sneaker là Item sinh ra dành cho bạn rồi!

Không còn phong cách thiết kế trơn tối giản, mà thay vào đó là sự cá tính, nổi bật bởi lối thiết kế độc đáo cách điệu bằng những đường chỉ bên phần má giày. Chất liệu da thật được Bentoni khắc họa bằng những đường kẻ sọc, kết hợp với những đường chỉ khâu uốn lượn tinh tế tạo nên cái "chất" riêng của các chàng trai. Chưa dừng lại ở đó, Zipper Sneaker được nhấn phần gót chân bằng chất liệu da lộn tạo nên sự độc đáo mà vẫn không hề kệch cỡm.

Với hai màu Trắng và Đen, Zipper Sneaker không quá "khó tính" trong việc phối đồ nhưng hãy tránh những set đồ có quá nhiều họa tiết cầu kì vì có thể nó sẽ làm cho diện mạo bạn trông rối mắt hơn đó. Zipper Sneaker - Trợ thủ đắc lực để thu hút mọi ánh nhìn! Đến Bentoni và sắm ngay một đôi thôi!', 5, N'318__copy_87124i_800x800.jpg', N'318a__copy_87124i_800x800.jpg', N'318b__copy_87124i_800x800.jpg', N'318c__copy_87124i_800x800.jpg', CAST(N'2019-08-18 16:53:03.177' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (53, 1, N'ZIPPER SNEAKER', 1000000, 1200000, 1140000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng. 
- Chất liệu: Da thật mềm.
- Đế cao su dẻo dai, bền bỉ, chịu lực tốt. 
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế cá tính, năng động.', N'- Màu sắc: Trắng. 
- Chất liệu: Da thật mềm.
- Đế cao su dẻo dai, bền bỉ, chịu lực tốt. 
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế cá tính, năng động.

Nếu bạn là chàng trai năng động, cá tính, thích sự nổi bật, trẻ trung, Zipper Sneaker là Item sinh ra dành cho bạn rồi!

Không còn phong cách thiết kế trơn tối giản, mà thay vào đó là sự cá tính, nổi bật bởi lối thiết kế độc đáo cách điệu bằng những đường chỉ bên phần má giày. Chất liệu da thật được Bentoni khắc họa bằng những đường kẻ sọc, kết hợp với những đường chỉ khâu uốn lượn tinh tế tạo nên cái "chất" riêng của các chàng trai. Chưa dừng lại ở đó, Zipper Sneaker được nhấn phần gót chân bằng chất liệu da lộn tạo nên sự độc đáo mà vẫn không hề kệch cỡm.

Với hai màu Trắng và Đen, Zipper Sneaker không quá "khó tính" trong việc phối đồ nhưng hãy tránh những set đồ có quá nhiều họa tiết cầu kì vì có thể nó sẽ làm cho diện mạo bạn trông rối mắt hơn đó. Zipper Sneaker - Trợ thủ đắc lực để thu hút mọi ánh nhìn! Đến Bentoni và sắm ngay một đôi thôi!', 2, N'317__copy_87124i_800x800.jpg', N'317a__copy_87124i_800x800.jpg', N'317b__copy_87124i_800x800.jpg', N'317c__copy_87124i_800x800.jpg', CAST(N'2019-08-18 16:55:32.327' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (54, 1, N'LEBLANC', 1100000, 1400000, 1330000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Le Blanc - Nghe cái tên thôi đã đủ thấy đôi sneaker này còn "Trắng hơn Ngọc Trinh" rồi. Trung thành với phong cách thiết kế đơn giản nhưng tinh tế của Bentoni, Le Blanc Sneaker cũng là một trong những item đã hoàn thành tốt nhiệm vụ của mình. Được cách điệu bằng hai đường viền len trắng phần gót chân, đôi chân bạn trông sẽ mềm mại hơn và có điểm nhấn hơn. Lớp lót mới với những đường rãnh tạo độ ma sát tốt cho bàn chân. Không những vậy, những bước đi sẽ trở nên linh hoạt, dẻo dai hơn nhờ phần đế cao su được cách điệu tinh tế.

Không "khó tính" như những đôi sneaker có họa tiết cầu kì, Le Blanc chắc chắn sẽ là item Sneaker "Must-Have" trong tủ giày của bạn vì độ tiện dụng và linh hoạt trong mọi hoàn cảnh của nó.', N'', 2, N'310__copy_871066__800x800.jpg', N'310a__copy_871066__800x800.jpg', N'310b__copy_871066__800x800.jpg', N'310c__copy_871066__800x800.jpg', CAST(N'2019-08-18 16:58:18.267' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (55, 1, N'CHUKKY SNEAKER', 1000000, 1380000, 1311000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Nâu.
- Chất liệu da lộn kết hợp da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Nâu.
- Chất liệu da lộn kết hợp da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế liền mạch, tối giản và lịch lãm.

Chukky Sneaker chắc hẳn sẽ là một trong item có thiết kế khác biệt và phá cách nhất tại Bentoni. Được sản xuất bằng chất liệu da lộn, thiết kế cách điệu với những miếng da thật tạo nên sự phá cách chỉ Chukky Sneaker mới có. Không chỉ vậy, đây là một item có phần đế cao su khác lạ nhất trong số những đôi giày sneaker tại Bentoni, chưa kể lớp lót được sản xuất theo công nghệ mới, đem lại cho bạn cảm giác cực êm ái và bước đi "nhẹ như gió".

Khỏi phải bàn cãi tới cách phối đồ của Chukky Sneaker, với hai màu Nâu sáng và Trắng, quá dễ dàng để bạn có thể thỏa sức sáng tạo và thể hiện phong cách của riêng mình mà chẳng lo điều gì từ kiểu dáng đến màu sắc phải không? Đến Bentoni và sắm cho mình một đôi Chukky Sneaker ngay thôi!
', 1, N'308__copy_871066__800x800.jpg', N'308a__copy_871066__800x800.jpg', N'308b__copy_871066__800x800.jpg', N'308c__copy_871066__800x800.jpg', CAST(N'2019-08-18 17:01:01.773' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (56, 1, N'CHUKKY SNEAKER ', 1000000, 1380000, 1311000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng.
- Chất liệu da lộn kết hợp da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Trắng.
- Chất liệu da lộn kết hợp da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế liền mạch, tối giản và lịch lãm.

Chukky Sneaker chắc hẳn sẽ là một trong item có thiết kế khác biệt và phá cách nhất tại Bentoni. Được sản xuất bằng chất liệu da lộn, thiết kế cách điệu với những miếng da thật tạo nên sự phá cách chỉ Chukky Sneaker mới có. Không chỉ vậy, đây là một item có phần đế cao su khác lạ nhất trong số những đôi giày sneaker tại Bentoni, chưa kể lớp lót được sản xuất theo công nghệ mới, đem lại cho bạn cảm giác cực êm ái và bước đi "nhẹ như gió".

Khỏi phải bàn cãi tới cách phối đồ của Chukky Sneaker, với hai màu Nâu sáng và Trắng, quá dễ dàng để bạn có thể thỏa sức sáng tạo và thể hiện phong cách của riêng mình mà chẳng lo điều gì từ kiểu dáng đến màu sắc phải không? Đến Bentoni và sắm cho mình một đôi Chukky Sneaker ngay thôi!', 2, N'309__copy_871066__800x800.jpg', N'309a__copy_871066__800x800.jpg', N'309b__copy_871066__800x800.jpg', N'309c__copy_871066__800x800.jpg', CAST(N'2019-08-18 17:02:41.593' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (57, 1, N'BRODY SNEAKER', 1000000, 1380000, 1311000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Đánh bật cả Rough Base Sneaker, Brody Sneaker sẽ làm cho các chàng trai phải "sửng sốt" vì mức độ siêu siêu nhẹ của nó. Kết hợp với chất liệu da thật cao cấp cùng forrm dáng ôm sát chân, Brody sẽ đem lai cho bạn một cảm giác thoải mái nhất trên mỗi bước đi. Phần đế cao su được sản xuất cách điệu với những chấm nhỏ tạo độ ma sát cực tốt. Lớp lót được sản xuất theo công nghệ mới ôm sát bàn chân bạn, giúp bạn năng động, thoải mái trong mọi hoàn cảnh.

Brody Sneaker được thiết kế tối giản cùng màu đen nam tính đầy quyền lực, sẽ là trợ thủ đắc lực của bạn trong set đồ. Dù có là những bộ đồ màu sắc sặc sỡ đầy cá tính hay những set đồ thanh lịch, lịch lãm thì Brody cũng vẫn rát tự tin giúp bạn tỏa sáng.', 5, N'302__copy_871066__800x800.jpg', N'302a__copy_871066__800x800.jpg', N'302b__copy_871066__800x800.jpg', N'302c__copy_871066__800x800.jpg', CAST(N'2019-08-18 17:04:06.120' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (58, 1, N'BOOLEAN SHOES', 1000000, 1200000, 1140000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đcảm ép nhiệt ', N'- Màu sắc: Trắng.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Trắng.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Điều đầu tiên khi nói đến Boolean Sneaker, chắc hẳn các chàng trai sẽ rât ấn tượng với dây giày của đôi Sneaker. Nhanh - gọn - tiện lợi và đúng chất trẻ trung, hiện đại. Với chất liệu da thật cao cấp, form dáng ôm sát chân sẽ tạo cho bạn một cảm giác mềm mại. Kết hợp với lớp lót êm ái và phần đế cao su dẻo dai với những đường rãnh chắc chắn tạo nên độ ma sát cao, đôi chân bạn sẽ trở nên năng động hơn bao giờ hết.

Với hai màu chủ đạo là Trắng và Đen, cùng lối thiết kế tối giản, sẽ không quá khó khăn trong việc phối đồ phải không. Tha hồ cho bạn lựa chọn để biến hóa với mọi phong cách. Đặt mua hàng ngay thôi nào!', 2, N'312__copy_87106600___800x800.jpg', N'312a__copy_87106600___800x800.jpg', N'312b__copy_87106600___800x800.jpg', N'312c__copy_87106600___800x800.jpg', CAST(N'2019-08-18 17:05:46.390' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (59, 1, N'BOOLEAN SHOES', 1000000, 1200000, 1140000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'Điều đầu tiên khi nói đến Boolean Sneaker, chắc hẳn các chàng trai sẽ rât ấn tượng với dây giày của đôi Sneaker. Nhanh - gọn - tiện lợi và đúng chất trẻ trung, hiện đại. Với chất liệu da thật cao cấp, form dáng ôm sát chân sẽ tạo cho bạn một cảm giác mềm mại. Kết hợp với lớp lót êm ái và phần đế cao su dẻo dai với những đường rãnh chắc chắn tạo nên độ ma sát cao, đôi chân bạn sẽ trở nên năng động hơn bao giờ hết.

Với hai màu chủ đạo là Trắng và Đen, cùng lối thiết kế tối giản, sẽ không quá khó khăn trong việc phối đồ phải không. Tha hồ cho bạn lựa chọn để biến hóa với mọi phong cách. Đặt mua hàng ngay thôi nào!', 5, N'306__copy_871066__800x800.jpg', N'306a__copy_871066__800x800 (1).jpg', N'306a__copy_871066__800x800.jpg', N'306b__copy_871066__800x800.jpg', CAST(N'2019-08-18 17:09:19.997' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (60, 1, N'BLACKOUT SNEAKER ', 1100000, 1400000, 1330000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Trắng.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm

Nếu bạn đang tìm một đôi sneaker tiện dụng trong mọi hoàn cảnh, đem đến cho bạn một diện mạo mạnh mẽ, nam tính, thì Bentoni "khuyên" bạn nên một lần thử Blackout Sneaker. 

Đúng tiêu chí: Tối giản - Tinh tế, Blackout được thiết kế đơn giản và tỉ mỉ với những đường chỉ khâu. Phần đế cao su bao quanh bề mặt giày là một điểm nhấn cho diện mạo bạn thêm phần mạnh mẽ hơn. Không chỉ vậy, phần đế giày được cách điệu với những lỗ nhỏ giúp đôi chân bạn trở nên thông thoáng hơn, thoải mái vận động, tự tin sải bước trong mọi hoàn cảnh.

Đã thiết kế đơn giản, lại còn phối với màu đen thì Blackout sẽ không hề làm khó bạn trong cách mix đồ đâu nha. Dù là phong cách nào, hoàn cảnh nào cũng quá xứng đáng để có Blackout Sneaker trong tủ giày mà. ', 2, N'9448v.jpg', N'9449v.jpg', N'9450v.jpg', N'9451v.jpg', CAST(N'2019-08-18 17:11:29.697' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (61, 1, N'BLACKOUT SNEAKER', 1000000, 1400000, 1330000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Nếu bạn đang tìm một đôi sneaker tiện dụng trong mọi hoàn cảnh, đem đến cho bạn một diện mạo mạnh mẽ, nam tính, thì Bentoni "khuyên" bạn nên một lần thử Blackout Sneaker.

Đúng tiêu chí: Tối giản - Tinh tế, Blackout được thiết kế đơn giản và tỉ mỉ với những đường chỉ khâu. Phần đế cao su bao quanh bề mặt giày là một điểm nhấn cho diện mạo bạn thêm phần mạnh mẽ hơn. Không chỉ vậy, phần đế giày được cách điệu với những lỗ nhỏ giúp đôi chân bạn trở nên thông thoáng hơn, thoải mái vận động, tự tin sải bước trong mọi hoàn cảnh.

Đã thiết kế đơn giản, lại còn phối với màu đen thì Blackout sẽ không hề làm khó bạn trong cách mix đồ đâu nha. Dù là phong cách nào, hoàn cảnh nào cũng quá xứng đáng để có Blackout Sneaker trong tủ giày mà.

Đến Bentoni và sắm một đôi ngay thôi!', 5, N'301__copy_5445010_800x800.jpg', N'301a__copy_5445010_800x800.jpg', N'301b__copy_5445010_800x800.jpg', N'301c__copy_5445010_800x800.jpg', CAST(N'2019-08-18 17:13:21.017' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (62, 1, N'POLAR SHOES ', 1100000, 1400000, 1330000, N'Sản phẩm chưa có nội dung bảo hành', N'- Màu sắc: Trắng ngà.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Trắng ngà.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Polar Shoes - Khác biệt, cá tính theo cách riêng của nó!

Khoác trên mình một vẻ ngoài trắng toát, không họa tiết cầu kì, chỉ một màu sắc tối giản, bạn sẽ nghĩ Polar Shoes trông bình thường vậy thôi sao? Đúng! Bình thường chứ không hề tầm thường! Thiết kế trơn tối giản nhưng lớp lót bên trong đôi giày đã khiến cho Polar Shoes trở nên cực khác lạ, hơn hẳn những đôi sneaker khác tại Bentoni. Chính cái màu xanh ấy đã tạo nên cho các chàng trai một sự nổi bật và sức hút mà không phải ai cũng có được.

Hãy thử với một chiếc quần jeans xắn ống, để lộ phần gót giày tưởng mà bình thường nhưng lại cực đặc sắc, đảm bảo bạn sẽ cực thu hút trong mắt đối phương đó. Đến Bentoni và sắm ngay cho mình một đôi thôi nào!', 2, N'300__copy_5445010_800x800.jpg', N'300a__copy_5445010_800x800.jpg', N'300b__copy_5445010_800x800.jpg', N'300c__copy_5445010_800x800.jpg', CAST(N'2019-08-18 17:15:13.910' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (63, 1, N'WANDER SNEAKER', 1000000, 1400000, 1330000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Trắng.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Nếu bạn là chàng trai thích sự đơn giản thì Wander Sneaker là Item đáng để thử! Trung thành với phong cách thiết kế đơn giản nhưng tinh tế, chỉ một màu đen tối giản nhưng đủ tạo nên sự quyền lực của người đàn ông. Lớp lót được cải tiến sản xuất theo công nghệ mới, với những đường rãnh ôm sát đôi chân bạn, tạo cảm giác êm ái, thoải mái bước đi trong mọi hoàn cảnh.

Vì tối giản nên Wander Sneaker không quá khó khăn trong việc phối đồ. Dù là với set đồ nào, phong cách nào thì Wander cũng tự tin sẽ là tốt nhiệm vụ của mình. Thật đang tiếc nếu bạn bỏ qua item này. Đến Bentoni và tậu ngay lấy một đôi thôi!', 2, N'321__copy_87124i_800x800.jpg', N'321a__copy_87124i_800x800.jpg', N'321b__copy_87124i_800x800.jpg', N'321c__copy_87124i_800x800.jpg', CAST(N'2019-08-18 17:26:53.707' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (64, 2, N'TASSEL SLIP-ON', 1100000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt', N'- Màu sắc: Nâu.
- Chất liệu da bò mềm.
- Đế crepe dẻo, nhẹ và độ bền cao.
- Sử dụng lớp bao da bọc đế chắc chắn, đường may tỉ mỉ
- Lót giày gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế sang trọng, thời trang với họa tiết nơ chuông.', N'- Màu sắc: Nâu.
- Chất liệu da bò mềm.
- Đế crepe dẻo, nhẹ và độ bền cao.
- Sử dụng lớp bao da bọc đế chắc chắn, đường may tỉ mỉ
- Lót giày gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế sang trọng, thời trang với họa tiết nơ chuông.

Tassel Slip-on thanh lịch, thời trang luôn là sự lựa chọn hàng đầu của một chàng trai có gu thời trang tinh tế. Thiết kế nơ chuông phần upper luôn mang lại vẻ đẹp kinh điển có sức hút không thể chối từ đối với một chàng trai đam mê Slip-on.

Được thiết kế với chất liệu da thật cao cấp, mềm mại, Tassel Slip-on có vẻ ngoài sang trọng, độ bền cao. Đường may tỉ mỉ, tinh tế và gọn gàng, đôi giày này thực sự sẽ gây ấn tượng mạnh mẽ đối với những người khó tính nhất.

Sẽ thật hợp lý khi phối Tassel Slip-on cùng một bộ suits hoàn chỉnh hoặc đơn giản cùng sơ-mi và quần âu. Để set đồ trở nên ấn tượng hơn, hãy mạnh dạn kết hợp thêm một số phụ kiện như chiếc kính râm trendy hay một chiếc đồng hồ signature.', 1, N'59__copy__768x768.jpg', N'59a__copy__768x768.jpg', N'59b__copy__768x768.jpg', N'59c__copy__768x768.jpg', CAST(N'2019-08-18 22:33:13.313' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (65, 2, N'TASSEL SLIP-ON ', 1000000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da bò mềm.
- Đế crepe dẻo, nhẹ và độ bền cao.
- Sử dụng lớp bao da bọc đế chắc chắn, đường may tỉ mỉ
- Lót giày gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế sang trọng, thời trang với họa tiết nơ chuông.', N'Tassel Slip-on thanh lịch, thời trang luôn là sự lựa chọn hàng đầu của một chàng trai có gu thời trang tinh tế. Thiết kế nơ chuông phần upper luôn mang lại vẻ đẹp kinh điển có sức hút không thể chối từ đối với một chàng trai đam mê Slip-on.

Được thiết kế với chất liệu da thật cao cấp, mềm mại, Tassel Slip-on có vẻ ngoài sang trọng, độ bền cao. Đường may tỉ mỉ, tinh tế và gọn gàng, đôi giày này thực sự sẽ gây ấn tượng mạnh mẽ đối với những người khó tính nhất.

Sẽ thật hợp lý khi phối Tassel Slip-on cùng một bộ suits hoàn chỉnh hoặc đơn giản cùng sơ-mi và quần âu. Để set đồ trở nên ấn tượng hơn, hãy mạnh dạn kết hợp thêm một số phụ kiện như chiếc kính râm trendy hay một chiếc đồng hồ signature.', 5, N'39__copy__768x768.jpg', N'38b__copy__768x768.jpg', N'39a__copy__768x768.jpg', N'39b__copy__768x768.jpg', CAST(N'2019-08-18 22:36:13.303' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (66, 2, N'BLAZING SLIP-ON', 1000000, 1450000, 1377500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Nâu.
- Chất liệu da lộn cao cấp.
- Đế cao su dẻo dai và độ bền cao.
- Lớp lót mềm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết

- Màu: Nâu.
- Chất liệu da lộn cao cấp.
- Đế cao su dẻo dai và độ bền cao.
- Lớp lót mềm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 1, N'0286v.jpg', N'0287v.jpg', N'0288v.jpg', N'0289v.jpg', CAST(N'2019-08-18 22:38:08.450' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (67, 2, N'BLAZING SLIP-ON', 1000000, 1450000, 1377500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Đen.
- Chất liệu da lộn cao cấp.
- Đế cao su dẻo dai và độ bền cao.
- Lớp lót mềm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết', 5, N'0273v.jpg', N'0274v.jpg', N'0275v.jpg', N'0276v.jpg', CAST(N'2019-08-18 22:42:31.323' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (68, 2, N'BLAZING SLIP-ON', 1000000, 1450000, 1377500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Xanh rêu.
- Chất liệu da lộn cao cấp.
- Đế cao su dẻo dai và độ bền cao.
- Lớp lót mềm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết

- Màu: Xanh rêu.
- Chất liệu da lộn cao cấp.
- Đế cao su dẻo dai và độ bền cao.
- Lớp lót mềm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 11, N'0277v.jpg', N'0278v.jpg', N'0279v.jpg', N'0280v.jpg', CAST(N'2019-08-18 22:54:32.450' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (69, 2, N'BLAZING SLIP-ON', 1000000, 1450000, 1377500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Ghi.
- Chất liệu da lộn cao cấp.
- Đế cao su dẻo dai và độ bền cao.
- Lớp lót mềm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.

', N'Sản phẩm chưa có nội dung chi tiết

- Màu: Ghi.
- Chất liệu da lộn cao cấp.
- Đế cao su dẻo dai và độ bền cao.
- Lớp lót mềm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.
', 7, N'0281v.jpg', N'0282v.jpg', N'0283v.jpg', N'0284v.jpg', CAST(N'2019-08-18 22:58:39.357' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (70, 2, N'BLAZING SLIP-ON', 1000000, 1450000, 1377500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Vàng.
- Chất liệu da lộn cao cấp.
- Đế cao su dẻo dai và độ bền cao.
- Lớp lót mềm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết', 10, N'0267v.jpg', N'0269v.jpg', N'0270v.jpg', N'0271v.jpg', CAST(N'2019-08-18 23:00:59.427' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (71, 2, N'COOL DRY SLIP-ON', 600000, 790000, 750500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Xám.
- Chất liệu da vải dù ít thấm nước.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết

- Màu: Xám.
- Chất liệu da vải dù ít thấm nước.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 8, N'2009v.jpg', N'2010v.jpg', N'2011v.jpg', N'2012v.jpg', CAST(N'2019-08-18 23:02:32.043' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (72, 2, N'COOL DRY SLIP-ON', 600000, 790000, 750500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Đen.
- Chất liệu da vải dù ít thấm nước.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết

- Màu: Đen.
- Chất liệu da vải dù ít thấm nước.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 5, N'2005v.jpg', N'2006v.jpg', N'2007v.jpg', N'2008v.jpg', CAST(N'2019-08-18 23:04:35.550' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (73, 2, N'BASIC SLIP-ON', 1000000, 1300000, 1235000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết
- Màu: Trắng.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', 2, N'1080v__copy__900x900.jpg', N'1081v__copy__900x900.jpg', N'1083v__copy__900x900.jpg', N'1084v__copy__900x900.jpg', CAST(N'2019-08-18 23:06:25.680' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (74, 2, N'BASIC SLIP-ON', 1000000, 1300000, 1235000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Đen.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'Sản phẩm chưa có nội dung chi tiết', 5, N'bentoni__1091v_800x800.jpg', N'bentoni__1092v_800x800.jpg', N'bentoni__1093v_800x800.jpg', N'bentoni__1095v_800x800.jpg', CAST(N'2019-08-18 23:07:50.083' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (75, 2, N'BORDER LIGHT', 1000000, 1180000, 1121000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen
- Chất liệu da bò cao cấp, bền bỉ và mềm mại.
- Thiết kế đường viền tinh tế và tỉ mỉ.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.', N'- Màu sắc: Đen
- Chất liệu da bò cao cấp, bền bỉ và mềm mại.
- Thiết kế đường viền tinh tế và tỉ mỉ.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.

Border Light là tên gọi được lấy cảm hứng từ những trải nghiệm thú vị mà mỗi người đều có khi xỏ chân vào một đôi giầy. 
Hai vệt xanh lá và đỏ ở viền giầy được coi là bước tạo điểm nhấn đặc trưng và "nhắc nhớ" mỗi tín đồ thời trang rằng: Thế giới bên ngoài đôi giày có ra sao, thì khi xỏ chân vào Border Light mọi sự hưng phấn của cảm xúc sẽ được đẩy cao - thú vị, mới lạ và vô cùng hài lòng. Bentoni đảm bảo chắc chắn với các bạn điều này!
Border Light được làm từ chất liệu da bò cao cấp bền bỉ, mềm mại và tối ưu hóa cho chuyển động của đôi chân. Phần đế crepe dẻo, ma sát tốt, đàn hồi cao và tạo sự linh hoạt tối đa cho đôi chân. Ngoài ra, lớp lót phía bên trong giầy là lót rời gồm 2 lớp với lớp trên là da thật và lớp dưới là cao su non êm ái. Form dáng ôm và chuẩn từng mili theo đôi chân tạo sự êm ái trong di chuyển và thoải mái khi cần phải vận động trong thời gian dài.
Những gợi ý trang phục đi kèm cực hợp với Border Light cực dễ dàng: Các anh em có thể thoải mái "nhắc lại" 2 màu xanh lá và đỏ trên giầy bằng áo hoặc quần cùng tông. Hoặc đơn giản hơn, hãy mặc bất cứ thứ gì mà các anh nghĩ ra trong đầu lúc này!', 5, N'55__copy_587873_800x800.jpg', N'55a__copy_587873_800x800.jpg', N'55b__copy_587873_800x800.jpg', N'55c__copy_587873_800x800.jpg', CAST(N'2019-08-18 23:12:52.037' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (76, 2, N'BORDER LIGHT', 1000000, 1180000, 1121000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen
- Chất liệu da bò cao cấp, bền bỉ và mềm mại.
- Thiết kế đường viền tinh tế và tỉ mỉ.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.', N'- Màu sắc: Đen
- Chất liệu da bò cao cấp, bền bỉ và mềm mại.
- Thiết kế đường viền tinh tế và tỉ mỉ.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.

Border Light là tên gọi được lấy cảm hứng từ những trải nghiệm thú vị mà mỗi người đều có khi xỏ chân vào một đôi giầy. 
Hai vệt xanh lá và đỏ ở viền giầy được coi là bước tạo điểm nhấn đặc trưng và "nhắc nhớ" mỗi tín đồ thời trang rằng: Thế giới bên ngoài đôi giày có ra sao, thì khi xỏ chân vào Border Light mọi sự hưng phấn của cảm xúc sẽ được đẩy cao - thú vị, mới lạ và vô cùng hài lòng. Bentoni đảm bảo chắc chắn với các bạn điều này!
Border Light được làm từ chất liệu da bò cao cấp bền bỉ, mềm mại và tối ưu hóa cho chuyển động của đôi chân. Phần đế crepe dẻo, ma sát tốt, đàn hồi cao và tạo sự linh hoạt tối đa cho đôi chân. Ngoài ra, lớp lót phía bên trong giầy là lót rời gồm 2 lớp với lớp trên là da thật và lớp dưới là cao su non êm ái. Form dáng ôm và chuẩn từng mili theo đôi chân tạo sự êm ái trong di chuyển và thoải mái khi cần phải vận động trong thời gian dài.
Những gợi ý trang phục đi kèm cực hợp với Border Light cực dễ dàng: Các anh em có thể thoải mái "nhắc lại" 2 màu xanh lá và đỏ trên giầy bằng áo hoặc quần cùng tông. Hoặc đơn giản hơn, hãy mặc bất cứ thứ gì mà các anh nghĩ ra trong đầu lúc này!', 5, N'55b__copy__768x768.jpg', N'55b__copy_587873_800x800.jpg', N'55c__copy__768x768.jpg', N'55c__copy_587873_800x800.jpg', CAST(N'2019-08-18 23:15:39.077' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (77, 2, N'BORDER LIGHT', 1000000, 1180000, 1121000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng
- Chất liệu da bò cao cấp, bền bỉ và mềm mại.
- Thiết kế đường viền tinh tế và tỉ mỉ.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn.', N'- Màu sắc: Trắng
- Chất liệu da bò cao cấp, bền bỉ và mềm mại.
- Thiết kế đường viền tinh tế và tỉ mỉ.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn.

Border Light là tên gọi được lấy cảm hứng từ những trải nghiệm thú vị mà mỗi người đều có khi xỏ chân vào một đôi giầy. Hai vệt xanh lá và đỏ ở viền giầy được coi là bước tạo điểm nhấn đặc trưng và "nhắc nhớ" mỗi tín đồ thời trang rằng: Thế giới bên ngoài đôi giày có ra sao, thì khi xỏ chân vào Border Light mọi sự hưng phấn của cảm xúc sẽ được đẩy cao - thú vị, mới lạ và vô cùng hài lòng. Bentoni đảm bảo chắc chắn với các bạn điều này!
Border Light được làm từ chất liệu da bò cao cấp bền bỉ, mềm mại và tối ưu hóa cho chuyển động của đôi chân. Phần đế crepe dẻo, ma sát tốt, đàn hồi cao và tạo sự linh hoạt tối đa cho đôi chân. Ngoài ra, lớp lót phía bên trong giầy là lót rời gồm 2 lớp với lớp trên là da thật và lớp dưới là cao su non êm ái. Form dáng ôm và chuẩn từng mili theo đôi chân tạo sự êm ái trong di chuyển và thoải mái khi cần phải vận động trong thời gian dài.
Những gợi ý trang phục đi kèm cực hợp với Border Light cực dễ dàng: Các anh em có thể thoải mái "nhắc lại" 2 màu xanh lá và đỏ trên giầy bằng áo hoặc quần cùng tông. Hoặc đơn giản hơn, hãy mặc bất cứ thứ gì mà các anh nghĩ ra trong đầu lúc này!
', 2, N'56__copy__768x768.jpg', N'56b__copy__768x768.jpg', N'56c__copy__768x768.jpg', N'56d__copy__768x768.jpg', CAST(N'2019-08-18 23:18:09.957' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (78, 2, N'DIMPLE SLIP-ON', 1000000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu: Đen.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.', N'- Màu: Đen.
- Chất liệu da thật mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái, êm ái khi sử dụng.
- Thiết kế trẻ trung với các đường chỉ tạo điểm nhấn.
Dimple Slip-on - Lịch lãm như những quý ông hiện đại.

Slip-on thì Bentoni không thiếu, nhưng nếu bạn đang tìm một đôi Slip-on mang hơi hướng cổ điển, có chút lịch lãm của những quý ông hiện đại thì Dimple Slip-on là item không thể bỏ lỡ.

Chất liệu da thật cao cấp được phủ 1 độ bóng tạo cảm giác sang trọng, kết hợp màu đen truyền thống lại càng tôn lên giá trị của người đàn ông. Lớp lót với những đường rảnh cùng những lỗ thoáng khí giúp đôi chân luôn được thông thoáng và thoái mái nhất. Phần đế cao su dẻo dai cực bền bỉ cho đôi chân luôn thật linh hoạt, tự tin bước đi trong mọi tình huống.

Một bộ suit đen kết hợp với Dimple Slip-on, bạn thấy sao? Đến Bentoni và sắm ngay một đôi thôi nào!', 5, N'bentoni__5844v_800x800.jpg', N'bentoni__5845v_800x800.jpg', N'bentoni__5846v_800x800.jpg', N'bentoni__5847v_800x800.jpg', CAST(N'2019-08-18 23:21:38.827' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (79, 2, N'ZIG-ZAG SLIP-ON', 900000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Trắng.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Nếu để liệt kê Top những đôi giày Slip-on thời thượng, lịch lãm thì chắc chắn không thể không kể tới Zig-Zag Slip-on - Một trong những đôi giày làm "điên đảo" rất nhiều chàng trai khi đến Bentoni.

Được sản xuất bằng chất liệu da thật cao cấp đem đến sự mềm mại và nét đẳng cấp cho người đàn ông đi lên chân. Lớp lót với sự cải tiến của công nghệ mới giúp ôm sát đôi chân của bạn cùng phần đế cao su bền bỉ, tăng độ ma sát tốt, giúp bạn tự tin trong mọi hoàn cảnh.

Với 3 màu sắc: trắng, xám, và đen, Zig-Zag khá "dễ tính" trong việc phối đồ nên các chàng trai hoàn toàn có thể yên tâm mix đồ với mọi phong cách mà không lo diện mạo mình trở nên kêch cỡm.', 2, N'76__copy_00_800x800.jpg', N'76a__copy_00_800x800.jpg', N'76b__copy_00_800x800.jpg', N'76c__copy_00_800x800.jpg', CAST(N'2019-08-18 23:26:50.583' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (80, 2, N'ZIG-ZAG SLIP-ON', 900000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Xám.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Xám.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Nếu để liệt kê Top những đôi giày Slip-on thời thượng, lịch lãm thì chắc chắn không thể không kể tới Zig-Zag Slip-on - Một trong những đôi giày làm "điên đảo" rất nhiều chàng trai khi đến Bentoni.

Được sản xuất bằng chất liệu da thật cao cấp đem đến sự mềm mại và nét đẳng cấp cho người đàn ông đi lên chân. Lớp lót với sự cải tiến của công nghệ mới giúp ôm sát đôi chân của bạn cùng phần đế cao su bền bỉ, tăng độ ma sát tốt, giúp bạn tự tin trong mọi hoàn cảnh.

Với 3 màu sắc: trắng, xám, và đen, Zig-Zag khá "dễ tính" trong việc phối đồ nên các chàng trai hoàn toàn có thể yên tâm mix đồ với mọi phong cách mà không lo diện mạo mình trở nên kêch cỡm', 8, N'77__copy_00_800x800.jpg', N'77a__copy_00_800x800.jpg', N'77b__copy_00_800x800.jpg', N'77c__copy_00_800x800.jpg', CAST(N'2019-08-18 23:28:25.660' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (81, 2, N'ZIG-ZAG SLIP-ON', 900000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Xám.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Xám.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Nếu để liệt kê Top những đôi giày Slip-on thời thượng, lịch lãm thì chắc chắn không thể không kể tới Zig-Zag Slip-on - Một trong những đôi giày làm "điên đảo" rất nhiều chàng trai khi đến Bentoni.

Được sản xuất bằng chất liệu da thật cao cấp đem đến sự mềm mại và nét đẳng cấp cho người đàn ông đi lên chân. Lớp lót với sự cải tiến của công nghệ mới giúp ôm sát đôi chân của bạn cùng phần đế cao su bền bỉ, tăng độ ma sát tốt, giúp bạn tự tin trong mọi hoàn cảnh.

Với 3 màu sắc: trắng, xám, và đen, Zig-Zag khá "dễ tính" trong việc phối đồ nên các chàng trai hoàn toàn có thể yên tâm mix đồ với mọi phong cách mà không lo diện mạo mình trở nên kêch cỡm', 8, N'77__copy_00_800x800.jpg', N'77a__copy_00_800x800.jpg', N'77b__copy_00_800x800.jpg', N'77c__copy_00_800x800.jpg', CAST(N'2019-08-18 23:28:25.660' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (82, 2, N'ZIG-ZAG SLIP-ON ', 1000000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Đen.
- Chất liệu da thật.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Nếu để liệt kê Top những đôi giày Slip-on thời thượng, lịch lãm thì chắc chắn không thể không kể tới Zig-Zag Slip-on - Một trong những đôi giày làm "điên đảo" rất nhiều chàng trai khi đến Bentoni.

Được sản xuất bằng chất liệu da thật cao cấp đem đến sự mềm mại và nét đẳng cấp cho người đàn ông đi lên chân. Lớp lót với sự cải tiến của công nghệ mới giúp ôm sát đôi chân của bạn cùng phần đế cao su bền bỉ, tăng độ ma sát tốt, giúp bạn tự tin trong mọi hoàn cảnh.

Với 3 màu sắc: trắng, xám, và đen, Zig-Zag khá "dễ tính" trong việc phối đồ nên các chàng trai hoàn toàn có thể yên tâm mix đồ với mọi phong cách mà không lo diện mạo mình trở nên kêch cỡm.', 5, N'78__copy_00_800x800.jpg', N'78a__copy_00_800x800.jpg', N'78b__copy_00_800x800.jpg', N'78c__copy_00_800x800.jpg', CAST(N'2019-08-18 23:35:56.337' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (83, 2, N'PATCHWORK SLIP-ON', 1000000, 1260000, 1197000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Trắng nâu. 
- Chất liệu: Da thật kết hợp da lộn. 
- Đế cao su dẻo dai, bền bỉ, chịu lực tốt. 
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn tối giản, tinh tế, sang trọng.', N'- Màu sắc: Trắng nâu. 
- Chất liệu: Da thật kết hợp da lộn. 
- Đế cao su dẻo dai, bền bỉ, chịu lực tốt. 
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn tối giản, tinh tế, sang trọng.

Patchwork Slip-on có lẽ là một trong những item độc nhất vô nhị tại Bentoni bởi phong cách thiết kế khác lạ mà vẫn tinh tế!

Khéo léo khi kết hợp giữa chất liệu da lộn với da thật để tạo nên lối thiết kế đặc biệt, đủ để làm bạn trở nên thật nổi bật nhưng không hề kệch cỡm. Lớp lót với lớp bên trên là chất liệu da thật, bên dưới là lớp cao su non giúp đôi chân bạn luôn được êm ái, thoải mái nhất. Phần đế cao su với những chấm đinh tạo độ ma sát cực tốt cho đôi chân.

Vì là tone màu đơn giản nên bạn hoàn toàn có thể yên tâm phối đồ, mix nó với mọi set đồ đa phong cách mà không bị quá lố. Đến Bentoni và sắm ngay cho mình một đôi giày tinh tế như Patchwork slip-on ngay thôi!', 2, N'175__copy_i_800x800.jpg', N'175a__copy_i_800x800.jpg', N'175b__copy_i_800x800.jpg', N'175c__copy_i_800x800.jpg', CAST(N'2019-08-18 23:39:16.203' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (84, 2, N'THE BRICK', 1000000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Nếu Ace Slip-on được thiết kế theo kiểu dáng mềm mại, thanh thoát hơn thì The Brick lại mang hơi hướng có chút mạnh mẽ, nam tính hơn. Trung thành với phong cách thiết kế trơn đơn giản, The Brick Slip-on sẽ là một item khá tiện dụng và linh hoạt trong mọi hoàn cảnh. Chất liệu da thật cùng forrm dáng ôm chân đem đến cho bạn những bước đi êm ái, thoái mái.

The Brick chắc hẳn sẽ là một item đáng để thử vì độ tiện dụng và linh hoạt khi phối đồ. Với phong cách nào thì The Brick cũng đều có thể làm tốt nhiệm vụ của nó. Đến Bentoni và sắm ngay cho mình một đôi Slip-on thôi nào!', 5, N'73__copy_871066__800x800.jpg', N'73a__copy_871066__800x800.jpg', N'73b__copy_871066__800x800.jpg', N'73c__copy_871066__800x800.jpg', CAST(N'2019-08-18 23:47:16.253' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (85, 2, N'NIGHT OWL', 500000, 690000, 655500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu vải mềm, thông thoáng
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế liền mạch, cá tính và lịch lãm.', N'- Màu sắc: Đen.
- Chất liệu vải mềm, thông thoáng
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế liền mạch, cá tính và lịch lãm.

Night-Owl - Item được mệnh danh là 1 trong TOP 3 đôi Slip-on cá tính nhất tại Bentoni.
Với thiết kế cách điệu phần trên bề mặt giày, Night Owl tượng trưng cho những chàng trai đầy mạnh mẽ, nam tính.
Chất liệu vải mềm với những lỗ thoáng khí giúp đôi chân bạn tự tin, linh hoạt trong mọi hoàn cảnh. Phần đế cao su được cách điệu với đường viền đỏ tạo điểm nhấn khác lạ cho diện mạo của bạn.
Một chiếc quần jeans kết hợp với chiếc áo polo là lựa chọn khá ổn khi đi với Night Owl Slip-on. Một đôi slip-on là khá cần thiết trong tủ giày của bạn đó chứ. Đến ngay Bentoni và sắm cho mình một đôi thôi nào!', 5, N'71__copy_554400_800x800.jpg', N'71a__copy_554400_800x800.jpg', N'71b__copy_554400_800x800.jpg', N'71c__copy_554400_800x800.jpg', CAST(N'2019-08-18 23:51:18.700' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (86, 2, N'ACE SLIP-ON', 1000000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Nâu.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Nâu.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Khác với The Brick, cách thiết kế và những đường chỉ của Ace Slip-on mềm mại và thanh thoát hơn Trung thành với phong cách thiết kế trơn đơn giản, Ace Slip-on sẽ là một item khá tiện dụng và linh hoạt trong mọi hoàn cảnh. Chất liệu da thật cùng forrm dáng ôm chân đem đến cho bạn những bước đi êm ái, thoái mái.

Ace chắc hẳn sẽ là một item đáng để thử vì độ tiện dụng và linh hoạt khi phối đồ. Với phong cách nào thì Ace cũng đều có thể làm tốt nhiệm vụ của nó. Đến Bentoni và sắm ngay cho mình một đôi Slip-on thôi nào!', 1, N'74__copy_87124i_800x800.jpg', N'74a__copy_87124i_800x800.jpg', N'74b__copy_87124i_800x800.jpg', N'74c__copy_87124i_800x800.jpg', CAST(N'2019-08-18 23:54:23.937' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (87, 2, N'ACE SLIP-ON', 1000000, 1350000, 1282500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Dây tròn mảnh sang trọng.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.
Khác với The Brick, cách thiết kế và những đường chỉ của Ace Slip-on có nét mềm mại và thanh thoát hơn.
Trung thành với phong cách thiết kế trơn đơn giản, Ace Slip-on sẽ là một item khá tiện dụng và linh hoạt trong mọi hoàn cảnh. Chất liệu da thật cùng forrm dáng ôm chân đem đến cho bạn những bước đi êm ái, thoái mái.
Ace chắc hẳn sẽ là một item đáng để thử vì độ tiện dụng và linh hoạt khi phối đồ. Với phong cách nào thì Acecũng đều có thể làm tốt nhiệm vụ của nó. Đến Bentoni và sắm ngay cho mình một đôi Slip-on thôi nào!
', 5, N'70__copy_554400_800x800.jpg', N'70a__copy_554400_800x800.jpg', N'70b__copy_554400_800x800.jpg', N'70c__copy_554400_800x800.jpg', CAST(N'2019-08-18 23:59:49.120' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (88, 2, N'COOL-MAN SLIPON', 1000000, 1220000, 1159000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đcảm ép nhiệt ', N'- Màu sắc: Trắng.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Trắng.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.
Cool-man Slip-on! Đúng là ngầu như cái tên của nó mà!
 Được thiết kế cách điệu với hình ảnh người đàn ông thật "cool ngầu", kết hợp chất liệu da thật cao cấp, tạo nên diện mạo vừa cá tính lại rất đẳng cấp cho các chàng trai. Không dừng lại ở đó, Cool-man còn giúp bạn thật nổi bật với sắc Xanh ngọc cực kì khác lạ. 
Vừa tiện dụng mà lại thể hiện được cá tính của bản thân, gây ấn tượng tốt trong mắt đôi phuong thì Cool-man xứng đáng là Item nhất định không thể thiếu trong tủ giày của mỗi chàng trai rồi.
Nhưng đừng quên! Cool-man cũng có hai màu Trắng và Đen, tha hồ cho bạn lựa chọn để biến hoa với đa dạng phong cách. Trợ thủ "đắc lực" giúp các chàng trai thu hút mọi ánh nhìn đây rồi. Đến Bentoni và sắm ngay một đôi đi thôi chứ còn đợi chờ gì nữa!
', 2, N'65__copy_518845574_800x800.jpg', N'65a__copy_518845574_800x800.jpg', N'65b__copy_518845574_800x800.jpg', N'65c__copy_518845574_800x800.jpg', CAST(N'2019-08-19 00:08:35.267' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (89, 2, N'COOL-MAN SLIPON', 1000000, 1220000, 1159000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đcảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Đen.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.

Cool-man Slip-on! Đúng là ngầu như cái tên của nó mà! Được thiết kế cách điệu với hình ảnh người đàn ông thật "cool ngầu", kết hợp chất liệu da thật cao cấp, tạo nên diện mạo vừa cá tính lại rất đẳng cấp cho các chàng trai. Không dừng lại ở đó, Cool-man còn giúp bạn thật nổi bật với sắc Xanh ngọc cực kì khác lạ. Vừa tiện dụng mà lại thể hiện được cá tính của bản thân, gây ấn tượng tốt trong mắt đôi phuong thì Cool-man xứng đáng là Item nhất định không thể thiếu trong tủ giày của mỗi chàng trai rồi.

Nhưng đừng quên! Cool-man cũng có hai màu Trắng và Đen, tha hồ cho bạn lựa chọn để biến hoa với đa dạng phong cách. Trợ thủ "đắc lực" giúp các chàng trai thu hút mọi ánh nhìn đây rồi. Đến Bentoni và sắm ngay một đôi đi thôi chứ còn đợi chờ gì nữa!', 5, N'67__copy_518845574_800x800.jpg', N'67a__copy_518845574_800x800.jpg', N'67b__copy_518845574_800x800.jpg', N'67c__copy_518845574_800x800.jpg', CAST(N'2019-08-19 00:10:09.533' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (90, 2, N'COOL-MAN SLIPON', 1000000, 1220000, 1159000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đcảm ép nhiệt ', N'- Màu sắc: Xanh ngọc.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.', N'- Màu sắc: Xanh ngọc.
- Chất liệu da bò, mềm.
- Đế cao su êm, dẻo dai và độ bền cao.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, liền mạch, tối giản và lịch lãm.
Cool-man Slip-on! Đúng là ngầu như cái tên của nó mà!
Được thiết kế cách điệu với hình ảnh người đàn ông thật "cool ngầu", kết hợp chất liệu da thật cao cấp, tạo nên diện mạo vừa cá tính lại rất đẳng cấp cho các chàng trai. Không dừng lại ở đó, Cool-man còn giúp bạn thật nổi bật với sắc Xanh ngọc cực kì khác lạ.
Vừa tiện dụng mà lại thể hiện được cá tính của bản thân, gây ấn tượng tốt trong mắt đôi phuong thì Cool-man xứng đáng là Item nhất định không thể thiếu trong tủ giày của mỗi chàng trai rồi.
Nhưng đừng quên! Cool-man cũng có hai màu Trắng và Đen, tha hồ cho bạn lựa chọn để biến hoa với đa dạng phong cách. Trợ thủ "đắc lực" giúp các chàng trai thu hút mọi ánh nhìn đây rồi. Đến Bentoni và sắm ngay một đôi đi thôi chứ còn đợi chờ gì nữa!
', 3, N'66__copy_518845574_800x800.jpg', N'66a__copy_518845574_800x800.jpg', N'66b__copy_518845574_800x800.jpg', N'66c__copy_518845574_800x800.jpg', CAST(N'2019-08-19 00:12:01.703' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (91, 2, N'CROCO SLIP-ON', 900000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Nâu.
- Chất liệu da thật mềm mại.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Phần trên thiết kế đơn giản, da vân cá sấu khỏe khoắn, sang trọng và cá tính.', N'- Màu sắc: Nâu.
- Chất liệu da thật mềm mại.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Phần trên thiết kế đơn giản, da vân cá sấu khỏe khoắn, sang trọng và cá tính.

Croco Slip-on có thiết kế đơn giản mà cá tính, chất liệu da thật cao cấp cùng vân cá sấu khỏe khoắn khiến đôi giày có vẻ ngoài vừa sang trọng vừa lịch sự, lại bền bỉ và ôm chân.

Lót giày hai lớp siêu êm, kết hợp với phần đế cao su dày dặn, đàn hồi, dẻo dai, chắc chắn sẽ mang đến cho bạn trải nghiệm sử dụng hài lòng và vừa ý nhất. Croco Slip-on là sản phẩm không thể thiếu trong tủ giày của người đàn ông ưa thích sự tiện dụng và luôn tìm kiếm chất trẻ trung, năng động, đầy lịch lãm cho phong cách thời trang của mình.

Mang màu nâu trung tính, lại không có thiết kế cầu kỳ, phức tạp, Croco Slip-on dễ dàng kết hợp với nhiều loại trang phục khác nhau. Khi đến công sở hay tham gia các hoạt động đòi hỏi tính lịch sự, bạn có thể diện Croco cùng quần Jeans, áo sơ mi. Khi đi chơi, dạo phố, bạn hãy mix đôi giày này cùng trang phục thoải mái hơn, như quần short và áo phông hoặc áo Polo, bạn sẽ có ngay diện mạo trẻ trung và năng động.', 1, N'72__copy_554400_800x800.jpg', N'72a__copy_554400_800x800.jpg', N'72b__copy_554400_800x800.jpg', N'72c__copy_554400_800x800.jpg', CAST(N'2019-08-19 00:14:44.197' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (92, 2, N'CROCO SLIP-ON', 900000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da thật mềm mại.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Phần trên thiết kế đơn giản, da vân cá sấu khỏe khoắn, sang trọng và cá tính.', N'- Màu sắc: Đen.
- Chất liệu da thật mềm mại.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Phần trên thiết kế đơn giản, da vân cá sấu khỏe khoắn, sang trọng và cá tính.

Croco Slip-on có thiết kế đơn giản mà cá tính, chất liệu da thật cao cấp cùng vân cá sấu khỏe khoắn khiến đôi giày có vẻ ngoài vừa sang trọng vừa lịch sự, lại bền bỉ và ôm chân.

Lót giày hai lớp siêu êm, kết hợp với phần đế cao su dày dặn, đàn hồi, dẻo dai, chắc chắn sẽ mang đến cho bạn trải nghiệm sử dụng hài lòng và vừa ý nhất. Croco Slip-on là sản phẩm không thể thiếu trong tủ giày của người đàn ông ưa thích sự tiện dụng và luôn tìm kiếm chất trẻ trung, năng động, đầy lịch lãm cho phong cách thời trang của mình.

Mang màu đen trung tính, lại không có thiết kế cầu kỳ, phức tạp, Croco Slip-on dễ dàng kết hợp với nhiều loại trang phục khác nhau. Khi đến công sở hay tham gia các hoạt động đòi hỏi tính lịch sự, bạn có thể diện Croco cùng quần Jeans, áo sơ mi. Khi đi chơi, dạo phố, bạn hãy mix đôi giày này cùng trang phục thoải mái hơn, như quần short và áo phông hoặc áo Polo, bạn sẽ có ngay diện mạo trẻ trung và năng động.', 5, N'63__copy___2__800x800.jpg', N'63a__copy___2__800x800.jpg', N'63b__copy___2__800x800.jpg', N'63c__copy___2__800x800.jpg', CAST(N'2019-08-19 00:16:17.387' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (93, 2, N'STANDARD SLIP-ON', 900000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da bò mềm.
- Đế cao su dày dặn, dẻo dai, độ bền cao.
- Lót giày gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, tối giản và trẻ trung, dễ phối đồ.', N'- Màu sắc: Đen.
- Chất liệu da bò mềm.
- Đế cao su dày dặn, dẻo dai, độ bền cao.
- Lót giày gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế trơn, tối giản và trẻ trung, dễ phối đồ.

Standard Slip-on chính xác là một đôi Slip-on "tiêu chuẩn" bởi kiểu dáng basic và thiết kế tối giản, không họa tiết cầu kỳ.

Tuy đơn giản là vậy, nhưng Standard không hề đơn điệu, nhàm chán. Chất liệu da bò mềm mại, bóng mịn, cùng những đường may khéo léo và tinh tế khiến đôi giày có vẻ ngoài sang trọng và vô cùng lịch lãm.

Bạn gần như có thể diện đôi giày này cho tất cả mọi sự kiện: từ đi học đến đi làm, đi chơi, đi du lịch. Standard Slip-on luôn mang đến cho bạn trải nghiệm thoải mái và dễ chịu với lớp lót êm ái, đế cao su nhẹ nhàng, phần trên ôm chân mà không hề bí bách.

Sở hữu thiết kế tối giản, màu đen trung tính, Standard Slip-on rất dễ phối đồ. Tùy theo phong cách và cá tính của bạn, cũng như tính chất của nơi bạn sẽ đến hay hoạt động bạn sẽ tham gia, bạn hãy thoải mái sáng tại cách mix đồ với đôi Slip-on tiêu chuẩn này sao cho phù hợp và tự tin nhất.', 5, N'62__copy__800x800.jpg', N'62a__copy__800x800.jpg', N'62b__copy__800x800.jpg', N'62c__copy__800x800.jpg', CAST(N'2019-08-19 00:17:56.797' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (94, 2, N'CRACK CURBED LOAFER', 900000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Nâu.
- Chất liệu da thật mềm mại.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Phần trên thiết kế vân cá sấu khỏe khoắn, cá tính, cùng điểm nhấn là đai ngang may đắp giữa thân giày.', N'- Màu sắc: Nâu.
- Chất liệu da thật mềm mại.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Phần trên thiết kế vân cá sấu khỏe khoắn, cá tính, cùng điểm nhấn là đai ngang may đắp giữa thân giày.

Với chất liệu da thật cao cấp, vân cá sấu khỏe khoắn và đai ngang may đắp tinh tế, Crack Curbed Loafer 2.0 có vẻ ngoài vừa sang trọng vừa lịch sự, lại bền bỉ và ôm chân.

Lót giày hai lớp siêu êm, kết hợp với phần đế cao su dày dặn, đàn hồi, dẻo dai, chắc chắn sẽ mang đến cho bạn trải nghiệm sử dụng hài lòng và vừa ý nhất. Crack Curbed Loafer 2.0 là sự lựa chọn hoàn hảo của người đàn ông ưa thích sự tiện dụng và luôn tìm kiếm chất trẻ trung, năng động, đầy lịch lãm cho phong cách thời trang của mình.

Sở hữu 2 màu đen và nâu trung tính, lại không có thiết kế cầu kỳ, phức tạp, Crack Curbed Loafer 2.0 dễ dàng kết hợp với nhiều loại trang phục khác nhau. Khi đến công sở, bạn có thể diện Crack Curbed cùng quần Jeans, áo sơ mi. Khi đi chơi, dạo phố, bạn hãy mix đôi giày này cùng trang phục thoải mái hơn, như quần short và áo phông hoặc áo Polo. Nếu tham gia các hoạt động đòi hỏi tính lịch sự cao, Crack Curbed hoàn toàn có thể phối cùng bộ suit cho diện mạo sang trọng, lịch lãm mà không kém phần trẻ trung.', 1, N'61__copy__800x800.jpg', N'61a__copy__800x800.jpg', N'61b__copy__800x800.jpg', N'61c__copy__800x800.jpg', CAST(N'2019-08-19 00:22:01.000' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (95, 2, N'UNI SLIP-ON', 900000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen.
- Chất liệu da bò mềm.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế phần trên ấn tượng và trẻ trung với các họa tiết sao năm cánh.', N'- Màu sắc: Đen.
- Chất liệu da bò mềm.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế phần trên ấn tượng và trẻ trung với các họa tiết sao năm cánh.
Uni Slip-on có kiểu dáng basic quen thuộc, chất liệu da thật cao cấp sang trọng và độ bền cao. Điểm đặc biệt trong thiết kế của đôi slip-on này là các họa tiết sao năm cánh độc đáo ở mũi giày. Chính họa tiết này đã mang đến cho Uni chất trẻ trung, năng động, đầy phóng khoáng.
Nếu bạn là người trẻ đam mê chủ nghĩa "xê dịch", năng động và cá tính, bạn không thể bỏ qua đôi giày này. Phần trên ôm chân, đế cao su đàn hồi và dẻo dai, cùng lót dày 2 lớp êm ái, Uni Slip-on luôn khiến cho từng bước đi của bạn trở nên vững vàng, nhẹ nhàng và thư thái nhất.
Bentoni gợi ý bạn mix Uni Slip-on với quần Jeans xắn gấu và áo phông basic, cho vẻ ngoài trẻ trung, năng động và thời thượng. Ngoài ra, bạn có thể tự do phối đồ theo cá tính và gout thẩm mỹ của bạn, bởi đôi slip-on này không hề "khó tính" hay "kén chọn" chút nào trong việc kết hợp với hầu hết các loại trang phục. 
', 5, N'58__copy__800x800.jpg', N'58a__copy__800x800.jpg', N'58b__copy__800x800.jpg', N'58c__copy__800x800.jpg', CAST(N'2019-08-19 00:23:46.893' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (96, 1, N'UNI SLIP-ON ', 900000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Nâu.
- Chất liệu da bò mềm.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế phần trên ấn tượng và trẻ trung với các họa tiết sao năm cánh.', N'- Màu sắc: Nâu.
- Chất liệu da bò mềm.
- Đế cao su êm, bền, dẻo dai.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Thiết kế phần trên ấn tượng và trẻ trung với các họa tiết sao năm cánh.

Uni Slip-on có kiểu dáng basic quen thuộc, chất liệu da thật cao cấp sang trọng và độ bền cao. Điểm đặc biệt trong thiết kế của đôi slip-on này là các họa tiết sao năm cánh độc đáo ở mũi giày. Chính họa tiết này đã mang đến cho Uni chất trẻ trung, năng động, đầy phóng khoáng.

Nếu bạn là người trẻ đam mê chủ nghĩa "xê dịch", năng động và cá tính, bạn không thể bỏ qua đôi giày này. Phần trên ôm chân, đế cao su đàn hồi và dẻo dai, cùng lót dày 2 lớp êm ái, Uni Slip-on luôn khiến cho từng bước đi của bạn trở nên vững vàng, nhẹ nhàng và thư thái nhất.

Bentoni gợi ý bạn mix Uni Slip-on với quần Jeans xắn gấu và áo phông basic, cho vẻ ngoài trẻ trung, năng động và thời thượng. Ngoài ra, bạn có thể tự do phối đồ theo cá tính và gout thẩm mỹ của bạn, bởi đôi slip-on này không hề "khó tính" hay "kén chọn" chút nào trong việc kết hợp với hầu hết các loại trang phục. ', 1, N'61__copy__800x800.jpg', N'61a__copy__800x800.jpg', N'61b__copy__800x800.jpg', N'61c__copy__800x800.jpg', CAST(N'2019-08-19 00:25:11.437' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (97, 2, N'RESISTANT SLIP-ON', 700000, 1050000, 997500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: nâu
- Giày da Resistant Slip-on sử dụng chất liệu da thật sang trọng
- Khai thác tông màu nâu vừa cổ điện, phong trần lại vừa hiện đại
- Đế giày bền chắc, đường may tinh tế', N'- Màu sắc: nâu
- Giày da Resistant Slip-on sử dụng chất liệu da thật sang trọng
- Khai thác tông màu nâu vừa cổ điện, phong trần lại vừa hiện đại
- Đế giày bền chắc, đường may tinh tế
Nếu các chàng mong muốn một đôi giày sang trọng đến từng tiểu tiết thì chắc chắn không thể bỏ qua một đôi giày như Resistant Slip-on được.

Với chất liêu da thật nên Resistant Slip-on mang một vẻ quý tộc mà ít đôi Slip-on có được.Bề mặt giày mịn, howi bóng nên không dễ bám bui, thậm chí còn dễ vệ sinh trong quá trình sử dụng. Đế giày bền, chắc đường may tinh tế khiến cho mỗi cử động giày đều không hở được lỗi nào.
Thiết kế của Resistant Slip-on dựa trên sự sang trọng cơ bản dành cho các quý ông. Các chi tiết không quá nổi bật nhưng đều có phong cách riêng, đậm chất lịch lãm và sang trọng. Với việc khai thác hai tông màu đen và nâu cổ điện, một phần nào đó mà Resistant đem lại cho các quý ông là vẻ phong trần thời thượng.
Vậy thì với một đôi giày như Resistant Slip-on có khiến bạn đứng ngồi không yên?
', 1, N'29__copy_a_1000x1000.jpg', N'29a__copy_a_1000x1000.jpg', N'29b__copy_a_1000x1000.jpg', N'29c__copy_a_1000x1000.jpg', CAST(N'2019-08-19 00:30:20.143' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (98, 2, N'RACE PRINCE ', 500000, 750000, 712500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen
- Chất liệu da PU cao cấp, mềm mại và bền bỉ
- Đế cao su dày dặn, dẻo, ma sát tốt và tạo độ linh hoạt tối đa
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái
- Thiết kế đơn giản, trẻ trung
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn
- Phom rộng hơn 1 size so với phom chuẩn', N'- Màu sắc: Đen
- Chất liệu da PU cao cấp, mềm mại và bền bỉ
- Đế cao su dày dặn, dẻo, ma sát tốt và tạo độ linh hoạt tối đa
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái
- Thiết kế đơn giản, trẻ trung
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn
- Phom rộng hơn 1 size so với phom chuẩn

Race Prince là một sự xuất hiện đầy tính ngẫu hứng và lạ lùng trong dàn Slip-on nhà Bentoni. Với thiết kế thoạt nhìn "có gì đâu" với gam màu trnawgs và đen cực đơn giản, nhưng sự hấp dẫn của Race Prince lại nằm ở phía trong đôi giầy nhiều hơn.

Lý do "dài dòng" cho cái tên Race Prince được lấy cảm hứng từ những bước đi của Hoàng tử: Dù đi đến bất cứ nơi đâu - đi săn, đi thưởng lãm hay đi làm việc - họ đều rảo bước vô cùng mạnh mẽ nhưng cũng rất khoan thai. Còn tại sao "Race"? Mỗi chàng trai, mỗi Hoành tử đều có một đường đua riêng trong cuộc đời mình và tự họ cũng đặt ra nhiệm vụ phải chinh phục nó cho bản thân. Họ tìm thấy nó, họ vươn tới nó và họ chiến thắng nó - đó là mục tiêu mà mọi Quý ông trên thế gian này muốn làm cho dù có phải là Hoàng tử hay không.

Bentoni thấu hiểu sứ mệnh phục vụ Hoàng thất trong tương lai, nên chúng tôi tự hào thông báo rằng Race Prince thực sự là một lựa chọn thông thái cho các chàng trai. Chất liệu da PU cao cấp, mềm mại và bền bỉ. Phần đế cao su dày dặn, dẻo, ma sát tốt và tạo độ linh hoạt tối đa. Tất cả mọi yếu tố được đặt ra cũng chỉ để phục vụ những bước đi "chinh chiến" của các bạn!

Let''s do it!', 5, N'2a__copy__768x768.jpg', N'img_9212__copy__768x768.jpg', N'img_9213__copy__768x768.jpg', N'img_9217__copy__768x768.jpg', CAST(N'2019-08-19 00:32:01.327' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (99, 2, N'PETIT SEW', 900000, 1180000, 1121000, N'Sản phẩm chưa có nội dung bảo hành', N'- Màu sắc: Trắng
- Chất liệu da bò, mềm.
- Thiết kế gọn gàng và tinh tế. Phần upper có đường thêu nhỏ tinh xảo và đẹp mắt.
- Đế cao su dẻo, ma sát tốt và linh hoạt tối đa.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.', N'- Màu sắc: Trắng
- Chất liệu da bò, mềm.
- Thiết kế gọn gàng và tinh tế. Phần upper có đường thêu nhỏ tinh xảo và đẹp mắt.
- Đế cao su dẻo, ma sát tốt và linh hoạt tối đa.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.

Petit Sew là đôi giầy được lấy cảm hứng từ những anh chàng điển trai với phong thái vô cùng ý nhị và lịch lãm của nước Pháp. Những chàng trai Pháp đầy tinh tế không bao giờ chọn một đôi giầy quá nổi bật và tuyệt nhiên "dị ứng" với những món đồ "phô" tên nhãn hiệu. Và Petit Sew - Đường Chỉ Nhỏ là một sản phẩm dành cho bất cứ chàng trai sành điệu nào là tín đồ của những thiết kế tối giản nhưng vô cùng tinh xảo trên từng đường kim mũi chỉ. 

Petit Sew được làm từ chất liệu da thật 100% mềm mại và bền bỉ. Phần đế cao su cao cấp dẻo, ma sát tốt và linh hoạt tối đa cho người sử dụng. Ngoài ra, phần lót giày là lót rời gồm 2 lớp với lớp trên là da thật và lớp dưới là cao su non êm ái. 

Phối đồ với một đôi Petit Sew, các chàng trai không cần phải quá cầu kỳ nhưng nên nhớ những nguyên tắc về màu trang phục sao cho tone-sur-tone và thể hiện gout thời trang tinh tế nhé!', 2, N'50__copy__768x768.jpg', N'50a__copy__768x768.jpg', N'50b__copy__768x768.jpg', N'50c__copy__768x768.jpg', CAST(N'2019-08-19 00:33:40.503' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (100, 3, N'CLASSY LOAFER 2.0', 900000, 1180000, 1121000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Đen
- Chất liệu da thật 100%, mềm mại.
- Đế crepe đúc đặc, bền bỉ.
- Thiết kế kinh điển và thời thượng, thích hợp với những bộ suits lịch lãm.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn.', N'- Màu sắc: Đen
- Chất liệu da thật 100%, mềm mại.
- Đế crepe đúc đặc, bền bỉ.
- Thiết kế kinh điển và thời thượng, thích hợp với những bộ suits lịch lãm.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn.

Classy đúng với tên gọi của nó - cực basic và cực tối giản dành cho những dịp trang trọng mà bộ suits không thể kể chuyện cá tính bạn được. Với thiết kế được lấy cảm hứng từ những đôi Loafer cơ bản nhưng đế "chưa cao", Classy Loafer là một bước tiến mới trong tủ Loafer nhà Bentoni. Chất liệu da thật 100% bền bỉ và linh hoạt sẵn sàng làm hài lòng mọi chàng trai đang kiếm tìm sự lịch lãm của một Quý ông.

Phần đế cao su dày dặn, dẻo, ma sát tốt và tạo độ linh hoạt tối đa luôn là sở trường của Bentoni. Đặc biệt, trong thiết kế đòi hỏi sự tinh xảo như Classy Loafer, phần đế dường như chiếm không ít "spotlight" trên thiết kế tổng thể của đôi giày. Chính vì vậy, việc "lòe" sự thời thượng đối với một đôi Classy Loafer là điều khó có thể làm được.

Trang phục đi kèm với một đôi Classy Loafer thường là suits and tie, tuy nhiên nếu là một chàng trai trẻ tuổi nhưng muốn "mạo hiểm" thì việc bỏ cà vạt và mặc một chiếc áo polo cũng là một sự lựa chọn thông thái.', 5, N'68__copy_518845574_800x800.jpg', N'68a__copy_518845574_800x800.jpg', N'68b__copy_518845574_800x800.jpg', N'68c__copy_518845574_800x800.jpg', CAST(N'2019-08-19 01:13:37.147' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (101, 3, N'CLASSY LOAFER', 1000000, 1400000, 1330000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Nâu đậm.
- Chất liệu da thật 100%, mềm mại.
- Đế crepe đúc đặc, bền bỉ.
- Thiết kế kinh điển và thời thượng, thích hợp với những bộ suits lịch lãm.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn.', N'- Màu sắc: Nâu đậm.
- Chất liệu da thật 100%, mềm mại.
- Đế crepe đúc đặc, bền bỉ.
- Thiết kế kinh điển và thời thượng, thích hợp với những bộ suits lịch lãm.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn.

Classy đúng với tên gọi của nó - cực basic và cực tối giản dành cho những dịp trang trọng mà bộ suits không thể kể chuyện cá tính bạn được. Với thiết kế được lấy cảm hứng từ những đôi Loafer cơ bản nhưng đế "chưa cao", Classy Loafer là một bước tiến mới trong tủ Loafer nhà Bentoni. Chất liệu da thật 100% bền bỉ và linh hoạt sẵn sàng làm hài lòng mọi chàng trai đang kiếm tìm sự lịch lãm của một Quý ông.

Phần đế cao su dày dặn, dẻo, ma sát tốt và tạo độ linh hoạt tối đa luôn là sở trường của Bentoni. Đặc biệt, trong thiết kế đòi hỏi sự tinh xảo như Classy Loafer, phần đế dường như chiếm không ít "spotlight" trên thiết kế tổng thể của đôi giày. Chính vì vậy, việc "lòe" sự thời thượng đối với một đôi Classy Loafer là điều khó có thể làm được.

Trang phục đi kèm với một đôi Classy Loafer thường là suits and tie, tuy nhiên nếu là một chàng trai trẻ tuổi nhưng muốn "mạo hiểm" thì việc bỏ cà vạt và mặc một chiếc áo polo cũng là một sự lựa chọn thông thái.', 1, N'56__copy__768x768.jpg', N'56a__copy__768x768.jpg', N'56b__copy__768x768.jpg', N'56c__copy__768x768.jpg', CAST(N'2019-08-19 01:15:23.027' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (102, 3, N'CLASSY LOAFER', 1000000, 1400000, 1330000, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Nâu.
- Chất liệu da thật 100%, mềm mại.
- Đế crepe đúc đặc, bền bỉ.
- Thiết kế kinh điển và thời thượng, thích hợp với những bộ suits lịch lãm.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn.', N'- Màu sắc: Nâu.
- Chất liệu da thật 100%, mềm mại.
- Đế crepe đúc đặc, bền bỉ.
- Thiết kế kinh điển và thời thượng, thích hợp với những bộ suits lịch lãm.
- Lót giày là lót rời gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái.
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn.

Classy đúng với tên gọi của nó - cực basic và cực tối giản dành cho những dịp trang trọng mà bộ suits không thể kể chuyện cá tính bạn được. Với thiết kế được lấy cảm hứng từ những đôi Loafer cơ bản nhưng đế "chưa cao", Classy Loafer là một bước tiến mới trong tủ Loafer nhà Bentoni. Chất liệu da thật 100% bền bỉ và linh hoạt sẵn sàng làm hài lòng mọi chàng trai đang kiếm tìm sự lịch lãm của một Quý ông.

Phần đế cao su dày dặn, dẻo, ma sát tốt và tạo độ linh hoạt tối đa luôn là sở trường của Bentoni. Đặc biệt, trong thiết kế đòi hỏi sự tinh xảo như Classy Loafer, phần đế dường như chiếm không ít "spotlight" trên thiết kế tổng thể của đôi giày. Chính vì vậy, việc "lòe" sự thời thượng đối với một đôi Classy Loafer là điều khó có thể làm được.

Trang phục đi kèm với một đôi Classy Loafer thường là suits and tie, tuy nhiên nếu là một chàng trai trẻ tuổi nhưng muốn "mạo hiểm" thì việc bỏ cà vạt và mặc một chiếc áo polo cũng là một sự lựa chọn thông thái.', 1, N'55__copy__768x768.jpg', N'55a__copy__768x768.jpg', N'55b__copy__768x768.jpg', N'55c__copy__768x768.jpg', CAST(N'2019-08-19 01:16:56.407' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (103, 3, N'DANDY HORSEBIT LOAFER', 900000, 1250000, 1187500, N'Sản phẩm chưa có nội dung bảo hành', N'- Màu sắc: Xám.
- Chất liệu: Da lộn.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.', N'- Màu sắc: Xám.
- Chất liệu: Da lộn.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.

Nổi bật đầy cá tính, lịch lãm và sang trọng, bạn có tin rằng đó là những điều mà Dandy Horsebit Loafer sẽ làm được cho bạn không? Diện cho mình một bộ suite thật sang trọng, hoặc cũng có thể kết hợp với một chiếc áo sơ mi trắng và quần kaki, Dandy Horsebit sẽ làm bạn tỏa sáng hơn cả vạn chàng trai.

Không chỉ dùng lại ở thiết kế bắt mắt, Bentoni luôn chú trọng cải tiến sản phẩm đem đến cho khách hàng những trải nghiệm tốt nhất. Và Dandy Horsebit Loafer cũng nằm trong số những tiêu chí. Vì vậy bạn hãy yên tâm và đến Bentoni lựa chọn cho mình một đôi giày tốt nhé. ', 8, N'70__copy__800x800.jpg', N'70a__copy__800x800.jpg', N'70b__copy__800x800.jpg', N'70c__copy__800x800.jpg', CAST(N'2019-08-19 01:18:31.960' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (104, 3, N'DANDY HORSEBIT LOAFER', 900000, 1250000, 1187500, N'Sản phẩm chưa có nội dung bảo hành', N'- Màu sắc: Xanh tím than.
- Chất liệu: Da lộn.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.', N'- Màu sắc: Xanh tím than.
- Chất liệu: Da lộn.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.

Nổi bật đầy cá tính, lịch lãm và sang trọng, bạn có tin rằng đó là những điều mà Dandy Horsebit Loafer sẽ làm được cho bạn không? Diện cho mình một bộ suite thật sang trọng, hoặc cũng có thể kết hợp với một chiếc áo sơ mi trắng và quần kaki, Dandy Horsebit sẽ làm bạn tỏa sáng hơn cả vạn chàng trai.

Không chỉ dùng lại ở thiết kế bắt mắt, Bentoni luôn chú trọng cải tiến sản phẩm đem đến cho khách hàng những trải nghiệm tốt nhất. Và Dandy Horsebit Loafer cũng nằm trong số những tiêu chí. Vì vậy bạn hãy yên tâm và đến Bentoni lựa chọn cho mình một đôi giày tốt nhé. ', 3, N'68__copy__800x800.jpg', N'68a__copy__800x800.jpg', N'68b__copy__800x800.jpg', N'68c__copy__800x800.jpg', CAST(N'2019-08-19 01:20:20.760' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (105, 3, N'SIMPLE HORSEBIT LOAFER', 900000, 1250000, 1187500, N'Sản phẩm chưa có nội dung bảo hành', N'- Màu sắc: Đen.
- Chất liệu: Da thật.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.
', N'- Màu sắc: Đen.
- Chất liệu: Da thật.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.
Với những chàng trai thích sự cá tính thì Simple Horsebit Loafer là item dành cho bạn rồi. Không chỉ dừng lại ở thiết kế trơn cùng những đường chỉ tỉ mỉ, Simple Horsebit còn có thêm chiếc khuy làm điểm nhấn khá bắt mắt.

Êm - Ôm - Nhẹ là những tiêu chí không thể không kể đến của Simple Horsebit. Yên tâm đi? Bentoni sẽ luôn đem đến những trải nghiệm thoải mái nhất, cùng bạn đồng hành trên con đường đi tới thành công.

Một bộ suit đen kết hợp với Simple Horsebit Loafer chắc chắn sẽ làm bạn cực bảnh trai, tin Bentoni đi! ', 5, N'66__copy__800x800.jpg', N'66a__copy__800x800.jpg', N'66b__copy__800x800.jpg', N'66c__copy__800x800.jpg', CAST(N'2019-08-19 01:21:59.200' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (106, 3, N'SIMPLE HORSEBIT LOAFER', 900000, 1250000, 1187500, N'Sản phẩm chưa có nội dung bảo hành', N'- Màu sắc: Xanh tím than.
- Chất liệu: Da thật.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.', N'- Màu sắc: Xanh tím than.
- Chất liệu: Da thật.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.

Với những chàng trai thích sự cá tính thì Simple Horsebit Loafer là item dành cho bạn rồi. Không chỉ dừng lại ở thiết kế trơn cùng những đường chỉ tỉ mỉ, Simple Horsebit còn có thêm chiếc khuy làm điểm nhấn khá bắt mắt.

Êm - Ôm - Nhẹ là những tiêu chí không thể không kể đến của Simple Horsebit. Yên tâm đi? Bentoni sẽ luôn đem đến những trải nghiệm thoải mái nhất, cùng bạn đồng hành trên con đường đi tới thành công.

Một bộ suit đen kết hợp với Simple Horsebit Loafer chắc chắn sẽ làm bạn cực bảnh trai, tin Bentoni đi! ', 6, N'69__copy__800x800.jpg', N'69a__copy__800x800.jpg', N'69b__copy__800x800.jpg', N'69c__copy__800x800.jpg', CAST(N'2019-08-19 01:24:29.527' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (107, 3, N'BOW TIE FLEXY LOAFER', 900000, 1250000, 1187500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ​', N'- Màu sắc: Xanh tím than.
- Chất liệu da thật cao cấp, vân sần sang trọng.
- Đế cao su dẻo dai, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp, đặc trưng phong cách giày thủy thủ Boat shoes với các đường chỉ may nổi phần mũi giày; cùng dây giày chạy quanh thân qua các khuyên xỏ và thắt nơ ngang phía trước.', N'- Màu sắc: Xanh tím than.
- Chất liệu da thật cao cấp, vân sần sang trọng.
- Đế cao su dẻo dai, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp, đặc trưng phong cách giày thủy thủ Boat shoes với các đường chỉ may nổi phần mũi giày; cùng dây giày chạy quanh thân qua các khuyên xỏ và thắt nơ ngang phía trước.

Bow Tie Flexy Loafer có thiết kế sang trọng và lịch thiệp, là đôi giày lười dành riêng cho những quý ông theo đuổi phong cách thời trang tinh tế, trẻ trung, đầy nam tính.

Chất liệu da thật bền đẹp, lớp lót êm ái và phần đế cao su bền bỉ, dẻo dai - tất cả những ưu điểm đó hội tụ trong Bow Tie Flexy khiến đôi giày tây này luôn mang đến trải nghiệm thoải mái nhất cho người dùng. Thiết kế ấn tượng giúp Bow Tie Flexy chinh phục các tín đồ thời trang khó tính nhất: các đường chỉ may nổi khéo léo ở phần mũi giày, dây giày chạy quanh thân qua các khuyên xỏ và cuối cùng thắt nơ tinh tế ở phía trước.

Bow Tie Flexy Loafer luôn kết cặp hoàn hảo cùng quần Jeans. Bạn có thể phối bộ đôi này cùng áo sơ mi kẻ, khoác thêm 1 chiếc áo denim hay cardigan cho diện mạo lịch lãm, kiểu cách; hay đơn giản diện cùng 1 chiếc áo phông trơn basic thôi cũng đã toát lên vẻ trẻ trung, thời trang và sang trọng.', 6, N'67__copy__800x800.jpg', N'67a__copy__800x800.jpg', N'67b__copy__800x800.jpg', N'67c__copy__800x800.jpg', CAST(N'2019-08-19 01:26:25.513' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (108, 3, N'FLOATING LOAFER', 800000, 1150000, 1092500, N'Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Nâu
- Chất liệu da bò mềm 
- Đế cao su dày dặn, cứng cáp
- Lót giày gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái
- Thiết kế kinh điển và sang trọng, dễ phối đồ
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn', N'- Màu sắc: Nâu
- Chất liệu da bò mềm 
- Đế cao su dày dặn, cứng cáp
- Lót giày gồm 2 lớp với lớp trên là da thật, lớp dưới là cao su non êm ái
- Thiết kế kinh điển và sang trọng, dễ phối đồ
- Đế giày được ép nhiệt kết hợp những đường khâu chắc chắn

Floating Loafer là một mẫu giầy kinh diển và được anh em muôn nơi săn đón nhất nhà Bentoni. Lý do vì sao? Không chi tiết cầu kỳ, không đổi màu da thuộc ngoài đen - nâu và không có bất cứ điều gì phải bàn cãi ngoài sự tối giản đầy cuốn hút. 

Floating Loafer "bỗng chốc" hot trend đương nhiên không phải không có lý do: Chất liệu da thật 100% cao cấp, bền bỉ và mềm mại; đế cao su dày dặn, dẻo, ma sát tốt và tạo độ linh hoạt tối đa; lớp lót da thuộc dầy dặn và uốn theo gan bàn chân tạo sự êm ái nhất cho người sở hữu.

Phối đồ với Floating Loafer thì hãy cứ "thả trôi" theo phong cách của bạn đi! Floating sinh ra là để hợp với phong cách của bạn dù bất kỳ hoàn cảnh nào mà, vậy nên đừng quá lo lắng khi diện Floating với quần âu hay khaki hay thậm chí là một chiếc short họa tiết mùa hè.', 1, N'62__copy_1aa_800x800.jpg', N'62a__copy_1aa_800x800.jpg', N'62b__copy_1aa_800x800.jpg', N'62c__copy_1aa_800x800.jpg', CAST(N'2019-08-19 01:28:35.167' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (109, 3, N'BOW LOAFER', 700000, 1050000, 997500, N'- Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
- Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: đen
- Chất da sần bền, đẹp, không bám bụi, dễ lau chùi
- Đường may tỉ mỉ, đều, đẹp, cắt vát gọn gàng, chắc chắn
- Đai khóa vải bện khác màu tạo điểm nhấn ấn tượng, khác biệt
- Đế cao su mềm, ma sát tốt, chịu lực tốt', N'- Màu sắc: đen
- Chất da sần bền, đẹp, không bám bụi, dễ lau chùi
- Đường may tỉ mỉ, đều, đẹp, cắt vát gọn gàng, chắc chắn
- Đai khóa vải bện khác màu tạo điểm nhấn ấn tượng, khác biệt
- Đế cao su mềm, ma sát tốt, chịu lực tốt
Bow Loafer là bộ đôi song hành với Bow Tie Suede Loafer nhưng về cơ bản, Bow Loafer là một trong những mẫu giày tây nam trẻ trung thiên về những đường may chắc chắn nhiều hơn. Với một anh chàng thấu hiểu về thời trang và tự tin trong cách phối đồ, Bow Loafer sẽ là một Item thú vị trong tủ đồ thời trang đó.

Với chất da sần, bền, đẹp, không bám bụi nên dẫu để lâu thì đôi giày vẫn trông mới toanh. Nếu gặp vấn đề về bụi thì chỉ cần dùng khăn ẩm lau qua bề mặt giày, nó sẽ về nguyên hiện trạng như ban đầu. Đế cao su mềm, giống như tất cả các sản phẩm của Bentoni, độ ma sát của giày chưa bao giờ là vấn đề với khách hàng.
Thiết kế của Bow Loafer không đơn giản hoàn toàn mà chỉ là lượt đi nhiều chi tiết rườm rà, chú trọng vào những họa tiết chính. Đầu tiên là đường may tỉ mỉ, đều, cắt vát gọn gàng và rất chắc chắn. Tiếp theo điểm nhấn cực ấn tượng chính là đai khóa vải bện khác màu hình nơ tạo sự khác lạ, không dịu dàng như Bow Tie Suede Loafer nhưng lại thể hiện được cá tính trong Gu thời trang của chàng.
Phối đồ với Bow Loafer cần một chút tâm tư nếu như bạn muốn có một Set đồ thật trẻ trung và cá tính. Thực tế, Bow Loafer rất chiều lòng người, không quá kén chọn, chỉ cần một Set đồ đơn giản cũng hoàn toàn phù hợp với nó. Tuy nhiên để phá cách hơn một chút, Bentoni gợi ý về một chiếc Jeans rách gối cùng áo phông Basic và khoác ngoài là chiếc sơ mi màu sắc và họa tiết tươi tắn, có lẽ sẽ cực kì ấn tượng đó.

Vậy thì bạn chọn đơn giản hay phá cách cùng với Bow Loafer?', 5, N'43__copy_e_1000x1000.jpg', N'43a__copy_e_1000x1000.jpg', N'43b__copy_e_1000x1000.jpg', N'43c__copy_e_1000x1000.jpg', CAST(N'2019-08-19 01:31:10.157' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (110, 3, N'BOW LOAFER', 700000, 1050000, 997500, N'- Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
- Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: xanh
- Chất da sần bền, đẹp, không bám bụi, dễ lau chùi
- Đường may tỉ mỉ, đều, đẹp, cắt vát gọn gàng, chắc chắn
- Đai khóa vải bện khác màu tạo điểm nhấn ấn tượng, khác biệt
- Đế cao su mềm, ma sát tốt, chịu lực tốt', N'- Màu sắc: xanh
- Chất da sần bền, đẹp, không bám bụi, dễ lau chùi
- Đường may tỉ mỉ, đều, đẹp, cắt vát gọn gàng, chắc chắn
- Đai khóa vải bện khác màu tạo điểm nhấn ấn tượng, khác biệt
- Đế cao su mềm, ma sát tốt, chịu lực tốt

Bow Loafer là bộ đôi song hành với Bow Tie Suede Loafer nhưng về cơ bản, Bow Loafer là mẫu giày tây nam trẻ trung chú trọng vào những đường may chắc chắn nhiều hơn. Với một anh chàng thấu hiểu về thời trang và tự tin trong cách phối đồ, Bow Loafer sẽ là một Item thú vị trong tủ đồ thời trang đó.

Với chất da sần, bền, đẹp, không bám bụi nên dẫu để lâu thì đôi giày vẫn trông mới toanh. Nếu gặp vấn đề về bụi thì chỉ cần dùng khăn ẩm lau qua bề mặt giày, nó sẽ về nguyên hiện trạng như ban đầu. Đế cao su mềm, giống như tất cả các sản phẩm của Bentoni, độ ma sát của giày chưa bao giờ là vấn đề với khách hàng.
Thiết kế của Bow Loafer không đơn giản hoàn toàn mà chỉ là lượt đi nhiều chi tiết rườm rà, chú trọng vào những họa tiết chính. Đầu tiên là đường may tỉ mỉ, đều, cắt vát gọn gàng và rất chắc chắn. Tiếp theo điểm nhấn cực ấn tượng chính là đai khóa vải bện khác màu hình nơ tạo sự khác lạ, không dịu dàng như Bow Tie Suede Loafer nhưng lại thể hiện được cá tính trong Gu thời trang của chàng.
Phối đồ với Bow Loafer cần một chút tâm tư nếu như bạn muốn có một Set đồ thật cá tính. Thực tế, Bow Loafer rất chiều lòng người, không quá kén chọn, chỉ cần một Set đồ đơn giản cũng hoàn toàn phù hợp với nó. Tuy nhiên để phá cách hơn một chút, Bentoni gợi ý về một chiếc Jeans rách gối cùng áo phông Basic và khoác ngoài là chiếc sơ mi màu sắc và họa tiết tươi tắn, có lẽ sẽ cực kì ấn tượng đó.

Vậy thì bạn chọn đơn giản hay phá cách cùng với Bow Loafer?', 3, N'42__copy_e_1000x1000.jpg', N'42a__copy_e_1000x1000.jpg', N'42b__copy_e_1000x1000.jpg', N'42c__copy_e_1000x1000.jpg', CAST(N'2019-08-19 01:33:16.437' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (111, 3, N'BUCKLE LOAFER', 1000000, 1350000, 1282500, N'- Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
- Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'Màu sắc: xanh navy
Giày làm từ chất liệu da thật, chất sần nên rất mềm và bền
Quai vải với phối màu trắng-đỏ-xanh tạo nên điểm nhấn cho đôi giày
Đế cao su mềm, nhẹ và chắc chắn, chống trơn trượt hiệu quả', N'Màu sắc: xanh navy
Giày làm từ chất liệu da thật, chất sần nên rất mềm và bền
Quai vải với phối màu trắng-đỏ-xanh tạo nên điểm nhấn cho đôi giày
Đế cao su mềm, nhẹ và chắc chắn, chống trơn trượt hiệu quả
Buckle Loafer - được làm từ chất liệu da thật, bề mặt sần nhưng rất mềm và bền. Chính vì vậy trong cuộc đua về độ bền và tuổi thọ, Bucle Loafer luôn đứng tốp đầu. Đế giày được làm bằng cao su mềm, nhẹ và chắc chắn, khả năng chống trơn trượt cũng đạt chỉ số cao.
Thiết kế của Buckle Loafer về cơ bản giống với những đôi Loafer khác, đề cao tính thời trang của đôi giày, Nhưng điểm khiến Buckle Loafer trở nên đặc biệt chính là phần quai vải với phối màu trắng - đỏ - xanh tạo cảm giác bắt mắt, thời thượng trong mọi hoàn cảnh. Đó chính là cách khiến cho Buckle Loafer trở thành đôi giày được săn đón khá nhiều trên kệ hàng của Bentoni.
Về phối đồ, làm thế nào để kết hợp quần áo với một đôi giày thời trang như Buckle Sneaker? Có lẽ đây là đôi giày hợp nhất với việc xuống phố, một chiếc quần lửng, áo sơ mi họa tiết màu mè một chút, kết hợp với Buckle Loafer chắc chắn là một Set đồ vô cùng thú vị đó.

Cùng "oanh tạc" mọi mặt trận thời trang với Buckle Loafer thôi nào bạn của tôi!', 3, N'23__copy_d_1000x1000.jpg', N'23a__copy_d_1000x1000.jpg', N'23b__copy_d_1000x1000.jpg', N'23c__copy_d_1000x1000.jpg', CAST(N'2019-08-19 01:35:45.450' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (112, 3, N'D-HORSEBIT LOAFER', 700000, 1050000, 997500, N'- Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
- Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: xanh đậm
- Chất da sần bền, đẹp, không bám bụi, dễ lau chùi
- Đường may tỉ mỉ, đều, đẹp, cắt vát gọn gàng, chắc chắn
- Đai khóa kim loại không gỉ, tạo điểm nhấn
- Đế cao su mềm, ma sát tốt, chịu lực tốt.', N'- Màu sắc: xanh đậm
- Chất da sần bền, đẹp, không bám bụi, dễ lau chùi
- Đường may tỉ mỉ, đều, đẹp, cắt vát gọn gàng, chắc chắn
- Đai khóa kim loại không gỉ, tạo điểm nhấn
- Đế cao su mềm, ma sát tốt, chịu lực tốt.

Bow Loafer là bộ đôi song hành với Bow Tie Suede Loafer nhưng về cơ bản, Bow Loafer là mẫu giày tây nam trẻ trung và chú trọng vào những đường may chắc chắn nhiều hơn. Với một anh chàng thấu hiểu về thời trang và tự tin trong cách phối đồ, Bow Loafer sẽ là một Item thú vị trong tủ đồ thời trang đó.

Với chất da sần, bền, đẹp, không bám bụi nên dẫu để lâu thì đôi giày vẫn trông mới toanh. Nếu gặp vấn đề về bụi thì chỉ cần dùng khăn ẩm lau qua bề mặt giày, nó sẽ về nguyên hiện trạng như ban đầu. Đế cao su mềm, giống như tất cả các sản phẩm của Bentoni, độ ma sát của giày chưa bao giờ là vấn đề với khách hàng.
Thiết kế của Bow Loafer không đơn giản hoàn toàn mà chỉ là lượt đi nhiều chi tiết rườm rà, chú trọng vào những họa tiết chính. Đầu tiên là đường may tỉ mỉ, đều, cắt vát gọn gàng và rất chắc chắn. Tiếp theo điểm nhấn cực ấn tượng chính là đai khóa vải bện khác màu hình nơ tạo sự khác lạ, không dịu dàng như Bow Tie Suede Loafer nhưng lại thể hiện được cá tính trong Gu thời trang của chàng.

Phối đồ với Bow Loafer cần một chút tâm tư nếu như bạn muốn có một Set đồ thật cá tính. Thực tế, Bow Loafer rất chiều lòng người, không quá kén chọn, chỉ cần một Set đồ đơn giản cũng hoàn toàn phù hợp với nó. Tuy nhiên để phá cách hơn một chút, Bentoni gợi ý về một chiếc Jeans rách gối cùng áo phông Basic và khoác ngoài là chiếc sơ mi màu sắc và họa tiết tươi tắn, có lẽ sẽ cực kì ấn tượng đó.

Vậy thì bạn chọn đơn giản hay phá cách cùng với Bow Loafer?', 3, N'46__copy_e_1000x1000.jpg', N'46a__copy_e_1000x1000.jpg', N'46b__copy_e_1000x1000.jpg', N'46c__copy_e_1000x1000.jpg', CAST(N'2019-08-19 01:38:28.973' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (113, 3, N'VELVET LOAFER', 500000, 750000, 712500, N'- Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
- Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Chất da lộn mềm mại, đơn giản mà lịch lãm
- Đường may tỉ mỉ, đều, đẹp, cắt vát gọn gàng, tinh tế
- Thiết kế tối giản, sang trọng, dễ phối đồ
- Đế giày là những miếng cao su nhỏ có rãnh ma sát, mềm mại, êm chân', N'- Chất da lộn mềm mại, đơn giản mà lịch lãm
- Đường may tỉ mỉ, đều, đẹp, cắt vát gọn gàng, tinh tế
- Thiết kế tối giản, sang trọng, dễ phối đồ
- Đế giày là những miếng cao su nhỏ có rãnh ma sát, mềm mại, êm chân
Velvet Loafer - giày tây thời trang da lộn với tông màu vàng nâu thích hợp với những chàng trai ưa thích sự cổ kính và hơi cũ một chút. Da lộn không phải là một sản phẩm dễ chiều nhưng được làm với chất liệu da lộn cao cấp nên Velvet Loafer cũng dễ tính hơn mà lại sang chảnh hơn nhiều lần nữa. Với đế cao su dẻo dảo dai, tuổi thọ của đôi giày này cũng đủ khiến các quý ông thấy hài lòng.
Thiết kế đậm chất Vintage với những chi tiết hơi cũ những toát lên vẻ sang trọng, lịch lãm. Nhưng không vì thế mà Velvet Loafer mất đi sự thoải mái vốn có của đôi giày. Điểm nhấn của đôi giày chính là thiết kế đế với hai phần cách biệt tạo điểm nhấn và đồng thời trông cũng sang trọng hơn rất nhiều. 
Phối đồ với một đôi giày Vintage như thế nào? Một chiếc quần Kaki màu tan hoặc màu cát vàng cùng chiếc áo sơ mi có phần hoa hoét hoặc nhiều họa tieert nhiều màu đan xen nhau, kết hợp với Velvet Loafer sẽ là một Item thú vị cho những ngày hè nóng nực.

Bạn đã sẵn sàng hóa thân thành chàng trai Vintage với Velvet Loafer chưa?', 1, N'52_1000x1000.jpg', N'52a_1000x1000.jpg', N'52b_1000x1000.jpg', N'52c_1000x1000.jpg', CAST(N'2019-08-19 01:41:25.547' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (115, 3, N'SUEDE PENNY LOAFER', 500000, 750000, 712500, N'Sản phẩm chưa có nội dung bảo hành', N'- Màu sắc: Xanh.
- Chất liệu: Da lộn.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.', N'- Màu sắc: Xanh.
- Chất liệu: Da lộn.
- Đế cao su dẻo dai, bền bỉ, độ bền cao.
- Lớp lót mềm và êm, tạo sự thoải mái khi sử dụng.
- Thiết kế sang trọng và lịch thiệp với các đường chỉ may nổi phần mũi giày.

Trong tủ giày của bạn đã có một đôi giày Loafer da lộn mang phong cách sang trọng, lịch lãm chưa? Tại sao không thử Suede Penny Loafer của Bentoni? Với thiết kế đơn giản kết hợp với những đường may tỉ mỉ, tinh tế, bạn chắc chắn sẽ có một diện mạo cực lịch lãm đấy.

Với chất liệu da lộn cao cấp đem lại sự sang trọng cho người đi, cùng lớp lót êm ái, cực mềm mại giúp bạn tự tin bước đi trên mọi chặng đường. Suede Penny Loafer dễ dàng phối với mọi set đồ nên các chàng trai hãy cứ yên tâm mà thể hiện phong cách của mình nhé', 3, N'71__copy_11_800x800.jpg', N'71a__copy_11_800x800.jpg', N'71b__copy_11_800x800.jpg', N'71c__copy_11_800x800.jpg', CAST(N'2019-08-19 01:48:05.717' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (116, 3, N'SUEDE PENNY LOAFER', 500000, 750000, 712500, N'- Bảo hành da trong vòng 3 tháng, đổi mới nguyên chiếc (lỗi do nhà sản xuất)
- Bảo hành keo trong vòng 6 tháng, nếu bong được bảo đảm ép nhiệt ', N'- Màu sắc: Nâu
- Chất liệu da lộn với tông màu vàng nâu
- Đế giày bằng cao su dẻo dai, ma sát tốt
- Thiết kế theo phong cách Vintage, tỉ mỉ đến từng chi tiết', N'- Màu sắc: Nâu
- Chất liệu da lộn với tông màu vàng nâu
- Đế giày bằng cao su dẻo dai, ma sát tốt
- Thiết kế theo phong cách Vintage, tỉ mỉ đến từng chi tiết

Một đôi giày cho tín đồ da lộn nhưng cũng yêu thích sự Vintage, đó chính là điều mà Suede Penny Loafer đem lại cho các "quý ông".

Suede Penny Loafer - đôi giày tây nam thời trang da lộn với tông màu vàng nâu thích hợp với những chàng trai ưa thích sự cổ kính và hơi cũ một chút. Da lộn không phải là một sản phẩm dễ chiều nhưng được làm với chất liệu da lộn cao cấp nên Suede Peeny Loafer cũng dễ tính hơn mà lại sang chảnh hơn nhiều lần nữa. Với đế cao su dẻo dảo dai, tuổi thọ của đôi giày này cũng đủ khiến các quý ông thấy hài lòng.

Thiết kế đậm chất Vintage với những chi tiết hơi cũ những toát lên vẻ sang trọng, lịch lãm. Nhưng không vì thế mà Suede Penny Loafer mất đi sự thoải mái vốn có của đôi giày. Điểm nhấn của đôi giày chính là thiết kế đế với hai phần cách biệt tạo điểm nhấn và đồng thời trông cũng sang trọng hơn rất nhiều. 

Phối đồ với một đôi giày Vintage như thế nào? Một chiếc quần Kaki màu tan hoặc màu cát vàng cùng chiếc áo sơ mi có phần hoa hoét hoặc nhiều họa tieert nhiều màu đan xen nhau, kết hợp với Suede Peeny Loafer sẽ là một Item thú vị cho những ngày hè nóng nực.', 1, N'30__copy__1000x1000.jpg', N'30a__copy__1000x1000.jpg', N'30b__copy__1000x1000.jpg', N'30c__copy__1000x1000.jpg', CAST(N'2019-08-19 01:50:13.237' AS DateTime), 1)
INSERT [dbo].[sanpham] ([idsanpham], [iddanhmuc], [tensanpham], [giagoc], [giaban], [giakhuyenmai], [baohanh], [motangan], [motachitiet], [idmausanpham], [image1], [image2], [image3], [image4], [ngaynhap], [status]) VALUES (121, 1, N'123', 10000000, 11000000, 10500000, N'a', N'<p>aaa</p>
', N'<p>a</p>
', 1, N'68474591_868420790192885_1732623690203398144_n.jpg', N'1622548_255354347974263_1505950104_o.jpg', N'69470435_1085813344956949_8357816670785372160_n.jpg', N'69685565_177672840062966_4881858088618950656_n.jpg', CAST(N'2019-09-15 14:54:01.573' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[sanpham] OFF
SET IDENTITY_INSERT [dbo].[sizesanpham] ON 

INSERT [dbo].[sizesanpham] ([idsizesanpham], [tensize], [status]) VALUES (1, N'38', 1)
INSERT [dbo].[sizesanpham] ([idsizesanpham], [tensize], [status]) VALUES (2, N'39', 1)
INSERT [dbo].[sizesanpham] ([idsizesanpham], [tensize], [status]) VALUES (3, N'40', 1)
INSERT [dbo].[sizesanpham] ([idsizesanpham], [tensize], [status]) VALUES (4, N'41', 1)
INSERT [dbo].[sizesanpham] ([idsizesanpham], [tensize], [status]) VALUES (5, N'42', 1)
INSERT [dbo].[sizesanpham] ([idsizesanpham], [tensize], [status]) VALUES (6, N'43', 1)
SET IDENTITY_INSERT [dbo].[sizesanpham] OFF
SET IDENTITY_INSERT [dbo].[tintuc] ON 

INSERT [dbo].[tintuc] ([idtintuc], [motangan], [tentintuc], [noidung], [image], [ngaytao], [status]) VALUES (1, N'   Thời trang phái mạnh nhìn chung thường không phức tạp và đa dạng như của phái đẹp. Song, điều này không có nghĩa là thế giới trang phục và phụ kiện của đàn ông luôn đơn điệu hay nhàm chán. Ngược lại, theo tiến trình phát triển và thay đổi của các xu hướng mốt, ngày càng có nhiều sản phẩm thời trang nam mới mẻ, độc đáo và đa dạng. Và những đôi giày có thể nói là 1 trong những minh chứng mạnh mẽ nhất cho thực tế này.', N'3 kiểu giày nam được ưa chuộng nhất hiện nay', N'<ul>
	<li>
	<h2><strong>Sneaker</strong></h2>
	</li>
</ul>

<p>&nbsp;<u><a href="https://bentoni.vn/giay-sneaker-pc158887.html">Snea</a></u><u><a href="https://bentoni.vn/giay-sneaker-pc158887.html">ker</a></u> c&ograve;n được gọi l&agrave; gi&agrave;y thể thao, trước đ&acirc;y chuy&ecirc;n d&ugrave;ng để chỉ c&aacute;c loại gi&agrave;y phục vụ cho vận động thể thao. Về sau, b&ecirc;n cạnh loại gi&agrave;y chuy&ecirc;n dụng, Sneaker c&ograve;n được ph&aacute;t triển th&ecirc;m những mẫu gi&agrave;y thời trang, được sử dụng cho những mục đ&iacute;ch th&ocirc;ng thường. Sneaker trở th&agrave;nh một loại phụ kiện ho&agrave;n hảo mang đến vẻ trẻ trung v&agrave; đầy sức sống cho mỗi người.</p>

<p><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1mzdS6IvJjktMkXtXj32IjYGbdudjAMAg/preview" width="640"></iframe><iframe frameborder="0" height="500" scrolling="no" src="https://drive.google.com/file/d/1mzdS6IvJjktMkXtXj32IjYGbdudjAMAg/preview" width="500"></iframe></p>

<p>Đặc trưng của Sneaker l&agrave; phần d&acirc;y buộc cố định gi&agrave;y, phần đế mềm l&agrave;m bằng cao su hoặc vật liệu tổng hợp v&agrave; phần tr&ecirc;n được l&agrave;m bằng da hoặc vải bạt.</p>

<p dir="ltr"><img alt="" src="https://cdn.nhanh.vn/cdn/store/20641/artCT/39960/img_5914_(copy)1235.jpg" /></p>

<p dir="ltr">Sneaker l&agrave; một mẫu gi&agrave;y đa năng v&agrave; rất dễ phối đồ. Nếu bạn th&iacute;ch phong c&aacute;ch trẻ trung, năng động h&atilde;y kết hợp mẫu gi&agrave;y nam h&agrave;ng hiệu n&agrave;y với quần jeans v&agrave; &aacute;o thun. Hay Sneaker kết hợp với suit, sẽ mang đến cho bạn một h&igrave;nh tượng lịch l&atilde;m, khỏe khoắn.</p>

<ul dir="ltr">
	<li>
	<h2 dir="ltr"><strong>Gi&agrave;y lười Slip-on</strong></h2>
	</li>
</ul>

<p>Nếu phải d&ugrave;ng một c&aacute;i t&ecirc;n để định nghĩa cho gi&agrave;y <u><a href="https://bentoni.vn/giay-luoi-pc158888.html">Slip-on</a></u>, th&igrave; gần ch&iacute;nh x&aacute;c nhất sẽ l&agrave; &quot;gi&agrave;y lười thể thao&quot;. Mang d&aacute;ng dấp của một đ&ocirc;i gi&agrave;y thể thao, Slip-on sở hữu phần đế cao su bệt, kh&ocirc;ng c&oacute; d&acirc;y buộc, chỉ cần xỏ ch&acirc;n v&agrave;o v&agrave; đi</p>

<p>.<iframe frameborder="0" height="500" scrolling="no" src="https://drive.google.com/file/d/1DLvgEhHXS_iJx2iwXXPqgDdT7QJd0pWI/preview" width="500"></iframe><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/158oVTNpv3E8tHx651ZPfJRNtf-CFvhr8/preview" width="640"></iframe></p>

<p>Phần tr&ecirc;n của gi&agrave;y, thay v&igrave; l&agrave; c&aacute;c lỗ nhỏ để xỏ d&acirc;y gi&agrave;y, th&igrave; giờ đ&acirc;y n&oacute; l&agrave; một khối d&iacute;nh liền với to&agrave;n bộ gi&agrave;y, c&oacute; thể c&oacute; một lớp miếng l&oacute;t để cố định mu b&agrave;n ch&acirc;n.</p>

<ul>
	<li>
	<h2><strong>Gi&agrave;y t&acirc;y Loafer</strong></h2>
	</li>
</ul>

<p>Gi&agrave;y <u><a href="https://bentoni.vn/giay-tay-pc158889.html">Loafer</a></u> được ph&aacute;t triển dựa tr&ecirc;n thiết kế của gi&agrave;y Moccasin. Cụ thể th&igrave; v&agrave;o những năm 1930, gi&agrave;y Moccasin được xuất khẩu sang ch&acirc;u &Acirc;u, sau đ&oacute; trở n&ecirc;n nổi tiếng v&agrave; được gia đ&igrave;nh Spaulding (New Hampshire, Mỹ) đưa ra một số thiết kế m&ocirc; phỏng. Họ đặt t&ecirc;n mẫu thiết kế mới ấy l&agrave; Loafer.</p>

<p><iframe frameborder="0" height="500" scrolling="no" src="https://drive.google.com/file/d/1rI0LBwkdyMDGOBfJeVrg_16GPfNnlXzq/preview" width="500"></iframe><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1rI0LBwkdyMDGOBfJeVrg_16GPfNnlXzq/preview" width="640"></iframe></p>

<p>Loafer được xem l&agrave; d&ograve;ng gi&agrave;y lười nam sang trọng nhất trong c&aacute;c loại gi&agrave;y lười, với thiết kế &ocirc;m ch&acirc;n, thu&ocirc;n gọn phần mũi, kh&ocirc;ng c&oacute; d&acirc;y gi&agrave;y (thay v&agrave;o đ&oacute; c&oacute; c&aacute;c d&acirc;y hoặc nơ với mục đ&iacute;ch trang tr&iacute;), dễ xỏ ch&acirc;n v&agrave;o. Phần đế của Loafer kh&ocirc;ng c&oacute; dạng bệt, phẳng v&agrave; liền mạch như Slip-on, m&agrave; đế gồm c&aacute;c mảng ri&ecirc;ng biệt v&agrave; thường cao hơn ở phần g&oacute;t. Loafers được giới văn ph&ograve;ng ưa chuộng, bởi ưu điểm vừa lịch sự, vừa thoải m&aacute;i, c&oacute; thể &aacute;p dụng trong thời trang c&ocirc;ng sở lẫn đời thường.</p>

<p>Kh&ocirc;ng giống Slip-on chỉ c&oacute; 1 kiểu d&aacute;ng duy nhất, gi&agrave;y Loafer rất đa dạng về kiểu d&aacute;ng. Loafer c&oacute; thể được chia th&agrave;nh nhiều d&ograve;ng nhỏ theo nhiều ti&ecirc;u ch&iacute; kh&aacute;c, một số c&oacute; thể kể đến l&agrave; Penny, Bit, Horsebit, Tassel, Hazel,...</p>

<p><em><strong>Bắt kịp thị hiếu v&agrave; xu hướng ti&ecirc;u d&ugrave;ng của đ&agrave;n &ocirc;ng Việt Nam, Bentoni tập trung v&agrave;o 3 d&ograve;ng sản phẩm ch&iacute;nh: gi&agrave;y Sneaker, gi&agrave;y lười Slip-on v&agrave; gi&agrave;y t&acirc;y Loafer. Với hơn 240 mẫu thiết kế tại Bentoni, hy vọng bạn c&oacute; thể t&igrave;m cho m&igrave;nh 1 đ&ocirc;i gi&agrave;y vừa &yacute;, bền đẹp c&ugrave;ng thời gian, n&acirc;ng bước ch&acirc;n bạn tr&ecirc;n mọi cung đường.</strong></em></p>
', N'article_1540207754_372.jpg', CAST(N'2019-09-20 02:28:08.773' AS DateTime), 1)
INSERT [dbo].[tintuc] ([idtintuc], [motangan], [tentintuc], [noidung], [image], [ngaytao], [status]) VALUES (4, N'Có bao giờ bạn tự hỏi liệu chúng ta có thể mặc những bộ đồ công sở và kết hợp với những đôi giày sneaker không ? Bentoni sẽ gợi ý cho các bạn một số cách mix đồ vừa trẻ trung mà cũng lịch sự không kém cũng với giày sneaker nhé.', N' Cách mix đồ giày sneaker nam với đồ công sở chuẩn đẹp', N'<p><strong>Gi&agrave;y sneaker với suits</strong></p>

<p><strong><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1Phu0GknFWRcLYgn-H-rS5C7nWR5WUbDH/preview" width="640"></iframe></strong></p>

<p>&nbsp;</p>

<p>Nghe c&oacute; vẻ kỳ lạ nhưng thực chất&nbsp;đ&ocirc;i gi&agrave;y sneaker vẫn c&otilde; thể ph&ugrave; hợp với những item lịch sự m&agrave; chỉ c&oacute; những ch&agrave;ng trai y&ecirc;u th&iacute;ch những&nbsp;điều mới mẻ mới d&aacute;m thử nghiệm. Những bộ suits trẻ trung với quần cropped ngắn tr&ecirc;n mắt c&aacute;, vest&nbsp;&ocirc;m vừa vặn, kiểu d&aacute;ng trẻ trung c&oacute; thể kết hợp với<strong><u><a href="https://bentoni.vn/luxe-lace-nau-p7056486.html">&nbsp;Luxe Lace</a></u></strong>&nbsp;cho phong c&aacute;ch dạo phố hoặc bữa tiệc nhẹ.</p>

<p><strong>Gi&agrave;y sneaker với qu</strong><strong>ần&nbsp;xắn gấu v&agrave; blazer</strong></p>

<p><strong><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1BjDbA_o2zR6Fru99FxLT3Kkqm7CFEMis/preview" width="640"></iframe></strong></p>

<p>Nếu suit qu&aacute; cầu k&igrave; trang trọng th&igrave;&nbsp;đ&ocirc;i khi m&ocirc;i trường c&ocirc;ng sở thoải m&aacute;i cũng cho bạn cơ hội kết hợp giữa blazer với gi&agrave;y sneaker. Phong c&aacute;ch rất ph&oacute;ng kho&aacute;ng n&agrave;y sẽ khiến bạn trẻ trung v&agrave; thoải m&aacute;i hơn nhiều. Kết hợp với quần jeans hoặc quần kaki,&nbsp;&aacute;o blazer n&ecirc;n s&aacute;ng m&agrave;u hơn quần v&agrave; gần t&ocirc;ng với gi&agrave;y sẽ&nbsp;đem lại sự h&agrave;i h&ograve;a tổng thể cho trang phục. Bạn nghĩ sao về&nbsp;<a href="https://bentoni.vn/giay-star-suede-sneaker-da-lon-mau-ghi-p5840126.html"><u><strong>Star Suede</strong></u></a>&nbsp;của Bentoni?</p>

<p><strong>Gi&agrave;y sneaker với&nbsp;&aacute;o sơ mi</strong></p>

<p><strong><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1dExYgpu8AdeaM8sldaMrLPabL9eP9Lci/preview" width="640"></iframe></strong></p>

<p>Đơn giản, tiện dung, dễ phối&nbsp;đồ, với&nbsp;<a href="https://bentoni.vn/classic-sneaker-be-p9002463.html"><u><strong>Classic sneaker</strong></u></a>&nbsp;bạn chỉ cần kết hợp những item thường ng&agrave;y m&agrave; m&igrave;nh vẫn hay mặc như quần jeans d&agrave;i, quần joggers c&ugrave;ng với chiếc&nbsp;&aacute;o sơ mi rộng r&atilde;i, thanh lịch.</p>

<p><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1ujm9VoHsmjupEF6T9pgXo-tglCYLCkDt/preview" width="640"></iframe>&Aacute;o sơ mi với chất vải bụi bặm như denim sẽ&nbsp;đem&nbsp;đến một diện mạo&nbsp;đầy phong trần khi kết hợp với gi&agrave;y sneaker. Tuy nhi&ecirc;n, c&aacute;c ch&agrave;ng trai kh&ocirc;ng n&ecirc;n kết hợp&nbsp;&aacute;o denim với quần jeans&nbsp;đồng m&agrave;u, H&atilde;y thử kết hợp&nbsp;&aacute;o sơ mi denim với quần t&acirc;y kh&aacute;c m&agrave;u, mang gi&agrave;y&nbsp;<u><strong><a href="https://bentoni.vn/brogan-sneaker-den-p8331189.html">Brogan Sneaker</a></strong></u>&nbsp;xem sao.</p>
', N'img_0234f_(copy).jpg', CAST(N'2019-09-20 21:42:08.553' AS DateTime), 1)
INSERT [dbo].[tintuc] ([idtintuc], [motangan], [tentintuc], [noidung], [image], [ngaytao], [status]) VALUES (5, N'    Đất trời vào thu, vẫn còn đó sắc nắng hanh hao ngoài khung cửa sổ, nhưng nhiều thêm chút gió nhẹ nhàng và những cơn mưa ngâu, nhiều thêm những hừng đông sương sớm chùng chình qua đầu ngõ. Thu về làm dịu mát không gian, cũng đánh thức chất nghệ sỹ trong mỗi người, khiến ta như mộng mơ và trầm lắng hơn.

 

Thời tiết đẹp như vậy, ngồi lỳ trong nhà là một loại lãng phí. Vậy mặc gì ra đường cho thời trang và lịch lãm, đồng thời thật tinh tế và lãng mạn đúng chất mùa Thu? Hãy tham khảo gợi ý từ Bentoni với Mini Lookbook của 2S Collection: “Dignité de L''homme”, để có set đồ đúng chuẩn quý ông, tự tin và nổi bật khi xuống phố.', N'Quý ông hiện đại mặc gì khi xuống phố mùa Thu?', N'<p dir="ltr"><strong>1. Sơ mi trắng + Quần Kaki + Cider Sneaker</strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Sơ mi trắng v&agrave; quần Kaki c&oacute; thể n&oacute;i l&agrave; bộ đ&ocirc;i kinh điển của thời trang ph&aacute;i mạnh, đơn giản m&agrave; kh&ocirc;ng đơn điệu, cũng kh&ocirc;ng bao giờ lỗi mốt. Thế nhưng cặp đ&ocirc;i ho&agrave;n hảo n&agrave;y chỉ ph&aacute;t huy tối đa chất sang trọng v&agrave; lịch l&atilde;m khi kết hợp c&ugrave;ng một đ&ocirc;i gi&agrave;y cổ điển như&nbsp;<u><strong><a href="https://bentoni.vn/cider-sneaker-nau-vang-p8728680.html">Cider Sneaker</a></strong></u>.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1yaUS8NpSACI6Z5J3C6lBryQomEVEWmC6/preview"></iframe></p>

<p dir="ltr">Kh&ocirc;ng họa tiết cầu kỳ, chỉ duy nhất sắc n&acirc;u v&agrave;ng ấn tượng của Cider Sneaker đ&atilde; đủ cho diện mạo bạn trở n&ecirc;n nổi bật hơn bao giờ hết. Đồng thời, Cider với kiểu d&aacute;ng cổ điển, chất liệu da buck mềm mịn v&agrave; đế 2S &ecirc;m, nhẹ, bền c&ograve;n mang đến cho bạn từng bước đi &ecirc;m &aacute;i nhất, mang đến cho set đồ chất ho&agrave;i cổ, lịch l&atilde;m, đầy sang trọng.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><strong>2. &Aacute;o Polo d&agrave;i tay + Quần &acirc;u tối m&agrave;u + Block Sneaker</strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">L&agrave; trang phục gắn liền với m&ocirc;n thể thao kh&uacute;c c&ocirc;n cầu tr&ecirc;n lưng ngựa, chất qu&yacute; tộc Anh to&aacute;t l&ecirc;n từ chiếc &aacute;o Polo d&agrave;i tay c&agrave;ng trở n&ecirc;n ho&agrave;n hảo hơn khi diện c&ugrave;ng quần &acirc;u tối m&agrave;u v&agrave; đ&ocirc;i&nbsp;<u><strong><a href="https://bentoni.vn/block-sneaker-nau-vang-p8413405.html">Block Sneaker</a></strong></u>&nbsp;trẻ trung v&agrave; năng động.<iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1aX4G8dRbDXHuRqtNDLNCQ_Fx4wt8h1ry/preview" width="640"></iframe></p>

<p dir="ltr">Chất liệu da thật khiến Block Sneaker c&oacute; vẻ ngo&agrave;i sang trọng, thanh lịch. Song, đ&ocirc;i gi&agrave;y n&agrave;y kh&ocirc;ng hề gi&agrave; dặn hay nh&agrave;m ch&aacute;n bởi sự phối hợp h&agrave;i h&ograve;a m&agrave;u sắc v&agrave; chất liệu da lộn ở m&aacute; gi&agrave;y. C&ugrave;ng với &aacute;o Polo v&agrave; quần &acirc;u, bộ 3 n&agrave;y sẽ tạo n&ecirc;n vẻ ngo&agrave;i v&ocirc; c&ugrave;ng sang trọng, h&agrave;o hoa m&agrave; kh&ocirc;ng k&eacute;m phần năng động, khỏe khoắn.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><strong>3. &Aacute;o sơ mi basic s&aacute;ng m&agrave;u + Quần &acirc;u c&ugrave;ng t&ocirc;ng + Flexy Shoes</strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><u><strong><a href="https://bentoni.vn/flexy-shoes-nau-p6810850.html">Flexy Shoes</a></strong></u>&nbsp;nổi bật v&agrave; đậm chất nghệ sĩ dường như sinh ra để xuất hiện trong set đồ đẳng cấp qu&yacute; &ocirc;ng c&ugrave;ng &aacute;o sơ mi basic xanh ngọc tinh tế v&agrave; quần &acirc;u x&aacute;m thanh lịch. Diện mạo ph&aacute;i mạnh sẽ th&ecirc;m ấn tượng với chất ho&agrave;i cổ khi kết hợp c&ugrave;ng c&aacute;c phụ kiện l&agrave; chiếc mũ beret đen v&agrave; tất cao cổ s&aacute;ng m&agrave;u tiệp với t&ocirc;ng của &aacute;o v&agrave; quần.</p>

<p dir="ltr"><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1sCcwr_ivhdlHhq0V9keB6Qt2-NuCs5Lp/preview" width="640"></iframe></p>

<p dir="ltr">Flexy Shoes &ldquo;sang chảnh&rdquo;, ph&aacute; c&aacute;ch v&agrave; nổi bật, l&agrave; mẫu gi&agrave;y d&agrave;nh ri&ecirc;ng cho những ai muốn thể hiện c&aacute; t&iacute;nh v&agrave; chất ri&ecirc;ng rất đặc biệt của bản th&acirc;n m&igrave;nh. Phần th&acirc;n gi&agrave;y được nạm đinh c&aacute;ch điệu, thể hiện c&aacute; t&iacute;nh rất ri&ecirc;ng, mang hơi hướng &ldquo;Rock Chic&rdquo; đầy nghệ sĩ. Khi kết hợp c&ugrave;ng &aacute;o sơ mi basic s&aacute;ng m&agrave;u v&agrave; quần &acirc;u c&ugrave;ng t&ocirc;ng, Flexy vẫn giữ nguy&ecirc;n c&aacute;c đặc t&iacute;nh đ&oacute;, nhưng bớt đi 1 ch&uacute;t ph&aacute; c&aacute;ch, đồng th&igrave; tăng th&ecirc;m sự chỉn chu v&agrave; sang trọng.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><strong>4. &Aacute;o Polo ngắn tay + Quần &acirc;u tối m&agrave;u + Brogan Sneaker</strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Phẩm chất qu&yacute; &ocirc;ng đ&iacute;ch thực kh&ocirc;ng được thể hiện bởi trang phục đắt tiền h&agrave;o nho&aacute;ng, sặc sỡ. Ngược&nbsp;lại, chất qu&yacute; &ocirc;ng to&aacute;t l&ecirc;n từ phong th&aacute;i trưởng th&agrave;nh, cử chỉ lịch l&atilde;m v&agrave; trang phục tối giản đầy nam t&iacute;nh. Set đồ &aacute;o Polo ngắn tay xanh t&iacute;m than, c&ugrave;ng quần &acirc;u tối m&agrave;u v&agrave; gi&agrave;y&nbsp;<u><strong><a href="https://bentoni.vn/brogan-sneaker-nau-den-p8413355.html">Brogan Sneaker</a></strong></u>&nbsp;thanh lịch l&agrave; minh chứng r&otilde; r&agrave;ng cho nhận định n&agrave;y.</p>

<p dir="ltr"><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1XLuq_XzLid7aLfofQc-Ih_ypIVk3qXQv/preview" width="640"></iframe></p>

<p dir="ltr">Thiết kế của Brogan Sneaker được c&aacute;ch t&acirc;n từ đ&ocirc;i gi&agrave;y Basic truyền thống với cổ gi&agrave;y mang hơi hướng những đ&ocirc;i gi&agrave;y T&acirc;y sang trọng v&agrave; phần d&acirc;y gi&agrave;y tr&ograve;n mảnh độc đ&aacute;o v&agrave; trẻ trung. Kh&ocirc;ng c&oacute; nhiều chi tiết cầu k&igrave;, Brogan Sneaker được tỉ mỉ ch&uacute; trọng v&agrave;o từng đường may đều đặn, kh&eacute;o l&eacute;o v&agrave; tinh tế. Nhờ đ&oacute;, bộ trang phục tối giản vẫn v&ocirc; c&ugrave;ng cuốn h&uacute;t bởi sự nam t&iacute;nh đầy lịch l&atilde;m.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><strong>5. &Aacute;o Polo ngắn tay trắng + Quần &acirc;u s&aacute;ng m&agrave;u + Luxe Lace hoặc Retro Stage</strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Nếu bạn l&agrave; người đ&agrave;n &ocirc;ng hiện đại y&ecirc;u th&iacute;ch phong c&aacute;ch ho&agrave;i cổ, bạn kh&ocirc;ng thể bỏ qua những&nbsp;đ&ocirc;i gi&agrave;y pha trộn tinh tế chất cổ điển v&agrave; t&acirc;n thời&nbsp;<u><strong><a href="https://bentoni.vn/luxe-lace-den-p7055809.html">Luxe Lace</a></strong></u>&nbsp;v&agrave;&nbsp;<u><strong><a href="https://bentoni.vn/retro-stage-den-p7110588.html">Retro Stage</a></strong></u>. Kết hợp c&ugrave;ng &aacute;o Polo ngắn tay trắng v&agrave; quần &acirc;u ghi x&aacute;m, bạn đ&atilde; c&oacute; ngay set đồ thanh lịch, vừa hiện đại vừa đậm chất ho&agrave;i cổ.</p>

<p dir="ltr"><iframe frameborder="0" height="480" scrolling="no" src="https://drive.google.com/file/d/1EQcyL_SUc5UrhkSzrWzs93IJn5sdPwIH/preview" width="640"></iframe>Nếu Luxe Lace ghi điểm bởi họa tiết Baroque diềm rập đăng ten v&ocirc; c&ugrave;ng tinh tế, th&igrave; Retro Stage nổi bật với thiết kế T-toe basic v&agrave; họa tiết ng&ocirc;i sao 5 c&aacute;nh kh&acirc;u đắp ở m&aacute; gi&agrave;y.</p>

<p dir="ltr">Giữa 2 đ&ocirc;i gi&agrave;y c&oacute; điểm kh&aacute;c biệt kh&ocirc;ng nhỏ, bởi Luxe Lace kiểu c&aacute;ch v&agrave; v&agrave; c&oacute; phần lịch sự, trong khi Retro Stage thi&ecirc;n về chất trẻ trung v&agrave; năng động. Tuy vậy, cả 2 đều mang phong vị ho&agrave;i cổ h&ograve;a quyện với chất t&acirc;n thời, do đ&oacute; đều rất ph&ugrave; hợp với set đồ n&agrave;y, tạo n&ecirc;n vẻ ngo&agrave;i lịch l&atilde;m, cổ điển m&agrave; thời thượng.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr"><em><strong>Tr&ecirc;n đ&acirc;y l&agrave; những gợi &yacute; trang phục xuống phố m&ugrave;a Thu đậm chất qu&yacute; &ocirc;ng từ Bentoni. C&aacute;c bạn c&oacute; thể tham khảo, v&agrave; s&aacute;ng tạo những set đồ ấn tượng cho ri&ecirc;ng m&igrave;nh c&ugrave;ng những đ&ocirc;i gi&agrave;y da cao cấp từ 2S Collection, từ đ&oacute; c&oacute; diện mạo lịch l&atilde;m v&agrave; tự tin nhất, cuốn h&uacute;t mọi &aacute;nh nh&igrave;n.</strong>&nbsp;&nbsp;</em></p>
', N'img_0482_(copy).jpg', CAST(N'2019-09-20 21:55:27.290' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tintuc] OFF
SET IDENTITY_INSERT [dbo].[userrole] ON 

INSERT [dbo].[userrole] ([id], [idrode], [idnguoidung]) VALUES (9, 1, 9)
INSERT [dbo].[userrole] ([id], [idrode], [idnguoidung]) VALUES (17, 2, 17)
INSERT [dbo].[userrole] ([id], [idrode], [idnguoidung]) VALUES (18, 2, 18)
INSERT [dbo].[userrole] ([id], [idrode], [idnguoidung]) VALUES (19, 2, 19)
INSERT [dbo].[userrole] ([id], [idrode], [idnguoidung]) VALUES (20, 2, 20)
SET IDENTITY_INSERT [dbo].[userrole] OFF
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [fk_chitiethoadon1] FOREIGN KEY([idhoadon])
REFERENCES [dbo].[hoadon] ([idhoadon])
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [fk_chitiethoadon1]
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [fk_chitiethoadon2] FOREIGN KEY([idsanpham])
REFERENCES [dbo].[sanpham] ([idsanpham])
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [fk_chitiethoadon2]
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [fk_chitiethoadon3] FOREIGN KEY([idsizesanpham])
REFERENCES [dbo].[sizesanpham] ([idsizesanpham])
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [fk_chitiethoadon3]
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [fk_chitiethoadon4] FOREIGN KEY([idnguoidung])
REFERENCES [dbo].[nguoidung] ([iduser])
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [fk_chitiethoadon4]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [fk_comment] FOREIGN KEY([idsanpham])
REFERENCES [dbo].[sanpham] ([idsanpham])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [fk_comment]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [fk_hoadon] FOREIGN KEY([iduser])
REFERENCES [dbo].[nguoidung] ([iduser])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [fk_hoadon]
GO
ALTER TABLE [dbo].[nhapchitietsanpham]  WITH CHECK ADD  CONSTRAINT [fk_nhapchitietsanpham1] FOREIGN KEY([idsanpham])
REFERENCES [dbo].[sanpham] ([idsanpham])
GO
ALTER TABLE [dbo].[nhapchitietsanpham] CHECK CONSTRAINT [fk_nhapchitietsanpham1]
GO
ALTER TABLE [dbo].[nhapchitietsanpham]  WITH CHECK ADD  CONSTRAINT [fk_nhapchitietsanpham2] FOREIGN KEY([idsize])
REFERENCES [dbo].[sizesanpham] ([idsizesanpham])
GO
ALTER TABLE [dbo].[nhapchitietsanpham] CHECK CONSTRAINT [fk_nhapchitietsanpham2]
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD  CONSTRAINT [fk_sanpham1] FOREIGN KEY([iddanhmuc])
REFERENCES [dbo].[danhmucsanpham] ([iddanhmuc])
GO
ALTER TABLE [dbo].[sanpham] CHECK CONSTRAINT [fk_sanpham1]
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD  CONSTRAINT [fk_sanpham2] FOREIGN KEY([idmausanpham])
REFERENCES [dbo].[mausanpham] ([idmausanpham])
GO
ALTER TABLE [dbo].[sanpham] CHECK CONSTRAINT [fk_sanpham2]
GO
ALTER TABLE [dbo].[userrole]  WITH CHECK ADD  CONSTRAINT [fk_userrole1] FOREIGN KEY([idrode])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[userrole] CHECK CONSTRAINT [fk_userrole1]
GO
ALTER TABLE [dbo].[userrole]  WITH CHECK ADD  CONSTRAINT [fk_userrole2] FOREIGN KEY([idnguoidung])
REFERENCES [dbo].[nguoidung] ([iduser])
GO
ALTER TABLE [dbo].[userrole] CHECK CONSTRAINT [fk_userrole2]
GO
USE [master]
GO
ALTER DATABASE [bangiay] SET  READ_WRITE 
GO
