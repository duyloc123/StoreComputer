USE [master]
GO
/****** Object:  Database [StoreComputer]    Script Date: 4/4/2023 10:51:53 AM ******/
CREATE DATABASE [StoreComputer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoreComputer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StoreComputer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoreComputer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StoreComputer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StoreComputer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreComputer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreComputer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreComputer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreComputer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreComputer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreComputer] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreComputer] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StoreComputer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreComputer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreComputer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreComputer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreComputer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreComputer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreComputer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreComputer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreComputer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StoreComputer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreComputer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreComputer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreComputer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreComputer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreComputer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreComputer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreComputer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreComputer] SET  MULTI_USER 
GO
ALTER DATABASE [StoreComputer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreComputer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreComputer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreComputer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreComputer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreComputer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StoreComputer] SET QUERY_STORE = OFF
GO
USE [StoreComputer]
GO
/****** Object:  Table [dbo].[ChiTietDatHang]    Script Date: 4/4/2023 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDatHang](
	[maHD] [int] NOT NULL,
	[maHang] [int] NOT NULL,
	[soLuong] [int] NOT NULL,
	[thanhTien] [float] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC,
	[maHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 4/4/2023 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[maHD] [int] IDENTITY(1,1) NOT NULL,
	[tenKhachHang] [nvarchar](30) NULL,
	[sdtKhachHang] [nvarchar](13) NULL,
	[diaChi] [nvarchar](50) NULL,
	[ghiChu] [nvarchar](1000) NULL,
	[soLuong] [int] NULL,
	[tongTien] [float] NULL,
	[ptThanhToan] [nvarchar](50) NULL,
	[tinhtrangThanhToan] [nvarchar](50) NULL,
	[tinhtrangDonHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 4/4/2023 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[maHang] [int] IDENTITY(1,1) NOT NULL,
	[maLoai] [int] NOT NULL,
	[maNCC] [int] NOT NULL,
	[tenHang] [nvarchar](30) NOT NULL,
	[ngayNhap] [date] NOT NULL,
	[giaMoi] [float] NOT NULL,
	[giaCu] [float] NOT NULL,
	[soLuong] [int] NOT NULL,
	[hinhAnh] [nvarchar](1000) NULL,
	[moTa] [nvarchar](2000) NOT NULL,
	[maTaChiTiet] [nvarchar](4000) NOT NULL,
	[giamGia] [nvarchar](10) NULL,
	[trangThaiSP] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[maHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/4/2023 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [int] IDENTITY(1,1) NOT NULL,
	[tenKH] [nvarchar](30) NOT NULL,
	[diaChi] [nvarchar](500) NOT NULL,
	[soDienThoai] [nvarchar](13) NOT NULL,
	[taiKhoan] [nvarchar](30) NOT NULL,
	[matKhau] [nvarchar](1000) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 4/4/2023 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[maLoai] [int] NOT NULL,
	[tenLoai] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LoaiHang] PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 4/4/2023 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[maNCC] [int] IDENTITY(1,1) NOT NULL,
	[tenNCC] [nvarchar](30) NOT NULL,
	[diaChi] [nvarchar](20) NOT NULL,
	[soDienThoai] [nvarchar](13) NOT NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[maNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 4/4/2023 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](20) NOT NULL,
	[hoTen] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietDatHang] ([maHD], [maHang], [soLuong], [thanhTien]) VALUES (5, 6, 3, 22990000)
INSERT [dbo].[ChiTietDatHang] ([maHD], [maHang], [soLuong], [thanhTien]) VALUES (6, 12, 3, 4199000)
GO
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([maHD], [tenKhachHang], [sdtKhachHang], [diaChi], [ghiChu], [soLuong], [tongTien], [ptThanhToan], [tinhtrangThanhToan], [tinhtrangDonHang]) VALUES (5, N'Đỗ Xuân Hoàng', N'0938312381', N'125 Hoa Lư', N'Không có gì', NULL, 68970000, N'COD', N'Đã thanh toán', N'Đã giao hàng')
INSERT [dbo].[DatHang] ([maHD], [tenKhachHang], [sdtKhachHang], [diaChi], [ghiChu], [soLuong], [tongTien], [ptThanhToan], [tinhtrangThanhToan], [tinhtrangDonHang]) VALUES (6, N'123', N'123', N'123', N'123', NULL, 12597000, N'COD', N'Đã thanh toán', N'Chưa giao hàng')
SET IDENTITY_INSERT [dbo].[DatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (6, 1, 8, N'ASUS ROG Strix G15', CAST(N'2023-04-02' AS Date), 22990000, 26990000, 10, N'Data/gearvn-laptop-gaming-asus-rog-strix-g15-g513ie-hn246w-1_21909f6cb1144db7a4b8ce164efcd13f.jpg', N'AMD Ryzen 7 4800H 2.9GHz up to 4.2GHz 8MB , 1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC 3x USB 3.2 Gen 1 Type-A 1x HDMI 2.0b 1x 3.5mm Combo Audio Jack 1x RJ45 LAN Jack', N'Đánh giá chi tiết laptop gaming ASUS ROG Strix G15 G513IE-HN246W Là một sản phẩm laptop gaming, không có gì lạ khi ASUS ROG Strix G15 G513IE-HN246W sở hữu vẻ ngoài bụ bẫm, mạnh mẽ phù hợp với những game thủ. Nếu bạn đang tìm cho mình dòng laptop gaming có thể đáp ứng mọi nhu cầu sử dụng thì Asus ROG Strix G15 sẽ là nhân vật đáng để bạn lưu tâm.Cấu hình mạnh mẽ Khác với những chiếc laptop cho sinh viên có cấu hình trung bình, laptop gaming ASUS ROG Strix G15 G513IE-HN246W sở hữu cấu hình siêu khủng với AMD Ryzen 7 4800H 2.9GHz up to 4.2GHz 8MB, 8GB RAM chuẩn DDR4, ổ cứng SSD 512GB cùng card đồ họa NVIDIA GeForce RTX 3050Ti 4GB GDDR6 mạnh mẽ. Với cấu hình trên ASUS ROG Strix G15 hầu như có thể cân trọn mọi tựa game AAA với cài đặt cấu hình cao, phần mềm đồ họa khó nhằn,...Thiết kế ngoài cực đậm chất gaming ASUS ROG Strix G15 sở hữu thiết bị mạnh mẽ và có phần cồng kềnh với tông màu Eclipse Gray cá tính. Logo ROG kim loại được đặt nghiêng về một bên tạo điểm nhấn của dòng sản phẩm gaming Asus. Từng góc cạnh vuông vắn thể hiện sự chắc chắn được đi viền LED RGB xung quanh đẹp mắt mở rộng không gian giải trí được tỏa sáng hơn. Trọng lượng của laptop cũng chỉ khoảng 2.1kg, thuận lợi cho việc di chuyển đi bất cứ đâu.', N'-10%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (7, 1, 8, N'ASUS TUF A15 ', CAST(N'2023-04-03' AS Date), 18990000, 21990000, 10, N'Data/gearvn-laptop-gaming-asus-tuf-a15-fa506icb-hn355w-1_96a61949a11345ac906fce99162c2b81.jpg', N'CPU	AMD Ryzen 5 4600H 3.0GHz up to 4.0GHz 11MB, 6-core/ 12-thread RAM	8GB DDR4 3200MHzHz (2x SO-DIMM socket, up to 32GB SDRAM) Ổ cứng	512GB SSD M.2 PCIE G3X2 (2 Slot M2 PCIE, 1 Slot trống)  Card đồ họa	NVIDIA® GeForce RTX™ 3050 Laptop GPU 4GB GDDR6, up to 1600Mhz at 60W ( 75W with Dynamic Boost) Màn hình	15.6inch FHD (1920 x 1080) IPS, 144Hz, Wide View, 250nits, Narrow Bezel, Non-Glare with 45% NTSC, 63% sRGB', N'Đánh giá chi tiết laptop gaming ASUS TUF A15 FA506ICB HN355W Laptop gaming ASUS TUF A15 FA506ICB HN355W là sự kết hợp giữ bộ xử lý AMD Ryzen 5 và card đồ họa NVIDIA GeForce RTX 3050 mang đến hiệu năng vượt trội mà ít mẫu laptop nào có được. Khung máy được thiết kế nhỏ gọn, hỗ trợ màn hình FHD 144Hz với Adaptive-Sync và tỷ lệ màn hình 16:9 tạo cảm giác rất thoải mái khi sử dụng.  Thiết kế mạnh mẽ dành riêng cho game thủ ASUS TUF A15 thể hiện một thiết kế đẹp mắt với từng đường nét độc đáo kết hợp thành một vẻ ngoài đầy mạnh mẽ. Logo dòng TUF gaming được chạm nổi, điêu khắc bằng laser tạo một điểm nhấn đầy ấn tượng ở phần nắp máy tính. Để tối ưu hóa trải nghiệm chơi game của các bạn trẻ, ASUS TUF A15 đã được trang bị hệ thống bàn phím chất lượng. Đèn nền RGB cho phép cá nhân hóa theo phong cách sử dụng riêng của mỗi người. Các phím điều hướng WASD nổi bật để những lần combat không xảy ra sai sót. Độ bền các phím lên đến 20 triệu lần nhấn, mọi phản hồi đều nhanh nhạy và chính xác.   Sẵn sàng chiến đầu với cấu hình chuẩn gaming Laptop gaming ASUS TUF A15 thể hiện sức mạnh của chính nó qua bộ cấu hình mạnh mẽ từ CPU AMD Ryzen 5 4600H, 8GB RAM DDR4, 512GB SSD và card màn hình rời NVIDIA GeForce RTX 3050. Tận hưởng thoải mái các tựa game hot trên thị trường mà không lo bị cản bước. ', N'-10%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (8, 1, 10, N'Gigabyte G5 GE 51VN263SH', CAST(N'2023-04-03' AS Date), 21690000, 25590000, 5, N'Data/g5-ge-51vn263sh-fix_3da6856774d849cf8c80548b6ef3f0cd_c55c38c0994f498b8ded543fd86fbeb4.jpg', N'Intel® Core™ i5-12500H (2.5GHz~4.5GHz), 12 Cores, 16 Threads (4P + 8E), 18 MB Intel® Smart Cache  RAM	8GB (1x8GB) DDR4-3200Mhz (2 khe ram, nâng cấp tối đa 64GB RAM) Ổ cứng	512GB SSD M.2 PCIE G4X4 (2 khe M.2, Còn trống 1 khe SSD M.2 PCIE G3x4) Card đồ họa	NVidia Geforce RTX 3050 4GB GDDR6 Màn hình	15.6 inch FHD (1920x1080),  144Hz,  IPS-level, Thin Bezel', N'Đánh giá chi tiết laptop gaming Gigabyte G5 GE 51VN263SH GIGABYTE, thương hiệu đi lên với những sản phẩm linh kiện máy tính chất lượng. Hướng đến thị trường gaming đang vô cùng sôi động, GIGABYTE còn mang đến những chiếc laptop gaming chất lượng. Và hôm nay chúng ta sẽ cùng tìm hiểu chiếc laptop với tên Gigabyte G5 GE 51VN263SH - một mẫu laptop gaming mới ra mắt và hứa hẹn khuấy đảo cộng đồng game thủ thời gian sắp tới.Hiệu năng xử lý mạnh mẽ Được trang bị con chip Intel Core i5-12500H, với tốc độ xử lý tối đa đạt 4.5GHz, Gigabyte G5 GE sẽ giúp bạn tối ưu tốc độ xử lý các tác vụ từ công việc đến giải trí. Kết hợp cùng 8GB RAM đem lại khả năng đa tác vụ mượt mà, cho bạn có thể làm nhiều công việc cùng lúc; 512GB SSD cung cấp cho bạn không gian lưu trữ tài liệu khổng lồ cùng tốc độ khởi động máy nhanh.Sức mạnh xử lý đồ họa đỉnh cao từ RTX Sức mạnh từ chiếc card đồ họa RTX 3050 Ti hứa hẹn mang đến cho Gigabyte G5 GE hiệu quả xử lý các tác vụ hình ảnh một cách tuyệt vời nhất. Mang đến những công nghệ như Ray Tracing, DLSS AI, Resizable BAR, Dynamic Boost 2.0,... Tất cả sẽ đưa trải nghiệm chơi game, làm việc của người dùng lên một tầm cao mới.  Công nghệ Mux Switch Công nghệ MUX Switch hỗ trợ điều chỉnh phương thức xử lý và xuất khung hình từ GPU rời trên laptop đến thẳng với người dùng thông qua màn hình để cải thiện hiệu suất. GPU rời có thể được xuất trực tiếp ra màn hình thông qua giao diện BIOS tích hợp của laptop, giúp dễ dàng cải thiện hiệu suất trò chơi và tăng tốc độ khung hình lên mức đáng kể.  Tản nhiệt mang đến hiệu suất cao Hệ thống tản nhiệt WINDFORCE gồm 2 chiếc quạt 5V với 47 cánh, 4 ống dẫn nhiệt và 3 lỗ thoát khí đem lại khả năng thoát nhiệt tối ưu nhất cho Gigabyte G5 GE. Hướng đến khả năng duy trì hiệu năng hoạt động mạnh mẽ và lâu dài nhất cho chiếc laptop khi sử dụng cho làm việc và chơi game.', N'-20%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (9, 1, 9, N'Acer Aspire 7 A715', CAST(N'2023-04-03' AS Date), 16490000, 20990000, 10, N'Data/laptop_gaming_acer_aspire_7_a715_42g_r05g_f9b4034f328d4211b9ffe51f7b1c4cbf.jpg', N'CPU	AMD Ryzen 5 – 5500U (6 nhân 12 luồng) RAM	8GB DDR4 (2x SO-DIMM socket, up to 32GB SDRAM) Ổ cứng	512GB PCIe® NVMe™ M.2 SSD Card đồ họa	NVIDIA GeForce GTX 1650 4GB GDDR6 Màn hình	15.6" FHD (1920 x 1080) IPS, Anti-Glare, 144Hz Cổng giao tiếp	1x USB 3.0 1x USB Type C 2x USB 2.0 1x HDMI 1x RJ45 Ổ quang	None Audio	True Harmony; Dolby® Audio Premium Đọc thẻ nhớ	None Chuẩn LAN	10/100/1000/Gigabits Base T Chuẩn WIFI	Wi-Fi 6(Gig+)(802.11ax) (2x2) Bluetooth	v5.0 Webcam	HD Webcam Hệ điều hành	Windows 11 Home Pin	4 Cell 48Whr Trọng lượng	2.1 kg Màu sắc	Đen, Có đèn bàn phím Kích thước	363.4 x 254.5 x 23.25 (mm)', N'Đánh giá chi tiết laptop gaming Acer Aspire 7 A715 42G R05G Laptop gaming tốt nhất phân khúc Acer Aspire 7 2020 A715 42G tích hợp card đồ họa NVIDIA GTX1650 4GB GDDR6, là laptop chơi game tốt nhất phân khúc. Không chỉ vậy, phiên bản này còn mang thiết kế mới gọn gàng và sexy hơn.Aspire 7 2020 được trang bị hệ thống tản nhiệt mạnh mẽ bậc nhất trong phân khúc, thừa hưởng công nghệ từ các dòng máy cao cấp hơn của Acer, cùng cấu hình đỉnh cao, giúp cho người dùng có thể vừa chơi game vừa làm việc ở bất cứ lúc nào.  Thiết kế tối ưu trải nghiệm chơi game Hệ thống hai quạt tản nhiệt, 3 ống đồng fullsize, heatsink size lớn giúp Acer Aspire 7 A715 tối ưu khả năng tản nhiệt. Bản lề thiết kế chắc chắn ít bị rung lắc khi chơi, có khả năng mở góc 180 độ giúp bảo vệ máy tốt hơn.', N'-30%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (10, 1, 11, N'MSI Katana GF66', CAST(N'2023-04-03' AS Date), 25990000, 32990000, 10, N'Data/836vn_d9b5e5cf468d40cdbac9281b068957c9.jpg', N'CPU	Intel Core i7-11800H 2.3GHz up to 4.6GHz 24MB Ram	16GB (8x2) DDR4 3200MHz (2x SO-DIMM socket, up to 64GB SDRAM) Ổ cứng	512GB NVMe PCIe Gen3x4 SSD (2 slot) VGA	NVIDIA GeForce RTX 3060 6GB GDDR6, Up to 1485MHz Boost Clock, 85W Maximum Graphics Power. Màn hình	15.6 inch FHD (1920x1080), 144Hz, IPS-Level, 45% NTSC, 65% sRGB  Cổng giao tiếp	 1x Type-C USB 3.2 Gen1 2x Type-A USB 3.2 Gen1 1x Type-A USB 2.0 1x RJ45 1x (4K @ 60Hz) HDMI 1x Mic-in/Headphone-out Combo Jack Bàn phím	Có phím số, hỗ trợ Single Led (Red) Chuẩn LAN	Gigabit Ethernet Chuẩn WIFI	Intel Wi-Fi 6 AX201(2*2 ax)  Bluetooth	v5.2 Webcam	HD type (30fps@720p) Hệ điều hành	Windows 11 Home Pin	3 cell, 53.5Whr Trọng lượng	2.1 kg Màu sắc	Đen Kích thước	359 x 259 x 24.9 mm', N'Đánh giá chi tiết sản phẩm laptop gaming MSI Katana GF66 11UE 836VN Laptop gaming MSI Katana GF66 11UE 836VN đáp ứng mọi nhu cầu chơi game của người dùng. Được sản xuất bởi hãng MSI với phần chau chuốt kỹ lưỡng về thiết kế cũng như đầu tư từ những linh kiện hàng đầu hứa hẹn một sản phẩm tuyệt vời cho các tín đồ đam mê game tham chiến cùng bạn bè. Thiết kế mạnh mẽ đậm chất gaming  Laptop MSI Katana GF66 11UE 836VN sở hữu từng đường nét vuông vắn mạnh mẽ được bao phủ một màu đen cá tính. Phần khung được làm từ chất liệu cao cấp tạo độ cứng cáp cho toàn bộ linh kiện bên trong laptop MSI. Trọng lượng chỉ khoảng 2.1kg nên việc bỏ vào balo mang đi bất cứ đâu cũng vô cùng dễ dàng cho người dùng. Bàn phím dễ thao tác Bàn phím của MSI Katana GF66 11UE 836VN cho một độ nảy phím ổn định với hành trình phím sâu tạo cảm giác thoải mái cho mọi thao tác nhấn. Được trang bị hệ thống đèn nền LED đơn sắc màu đỏ gia tăng thêm sự mạnh mẽ cá tính đầy thu hút. Bên cạnh đó việc thao tác trong môi trường thiếu ánh sáng cũng chính xác hơn, dễ dàng đạt được mục tiêu mong muốn trong mọi hoàn cảnh. ', N'-40%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (11, 5, 12, N'CPU INTEL Core i5-12400', CAST(N'2023-04-03' AS Date), 4890000, 6439000, 15, N'Data/unnamed.jpg', N'Socket: 1700, Intel Core thế hệ thứ 12 Tốc độ: 2.50 GHz - 4.40 GHz (6nhân, 12 luồng) Bộ nhớ đệm: 18MB Chip đồ họa tích hợp: Intel UHD Graphics 730', N'Mô tả sản phẩm CPU Intel Core i5 12400 thế hệ thứ 12 mạnh mẽ và tương thích tốt với socket LGA 1700. Là một trong những CPU dòng Alder Lake cao cấp, Core i5 12400 sở hữu hiệu năng nổi bật, hứa hẹn sẽ nâng cấp cấu hình dàn PC cũng như mang đến cho bạn những trải nghiệm mượt mà ấn tượng.  Tính tương thích cao, cấu trúc 6 nhân 12 luồng mạnh mẽ CPU Intel Core i5 12400 sử dụng socket LGA 1700 thế hệ mới và hỗ trợ chạy được trên các bo mạch chủ như H610, B660, H670 hay Z690. Là CPU nằm ở phân khúc tầm trung mà vẫn đảm bảo hiệu năng mạnh mẽ, Core i5 sẽ là lựa chọn phù hợp với các bộ máy từ tầm trung đến cao cấp, đáp ứng nhu cầu gaming hay stream, làm việc với phần mềm chuyên dụng. Bộ vi xử lý có cấu trúc 6 nhân và 12 luồng, cùng bộ nhớ đệm 18MB và cung cấp dung lượng bộ nhớ tối đa lên đến 128GB, đồng thời tích hợp bộ nhớ kênh đôi DDR4 3200 MT/s, DDR5 4800 MT/s, mang đến cho hệ thống của bạn hiệu suất đáng kinh ngạc để trải nghiệm trở nên mượt mà.', N'-24%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (12, 5, 12, N'CPU INTEL Core i5-11400', CAST(N'2023-04-03' AS Date), 4199000, 5629000, 10, N'Data/unnamed1.jpg', N'Socket: 1200, Intel Core thế hệ thứ 11 Tốc độ: 2.6GHz - 4.4GHz (6nhân, 12 luồng) Bộ nhớ đệm: 12MB Chip đồ họa tích hợp: Intel UHD Graphics 730', N'Mô tả sản phẩm Bộ vi xử lý/ CPU Intel Core i5-11400 (6 Cores 12 Threads up to 4.4Ghz 11th Gen LGA 1200) là thế hệ CPU tiếp theo có những cải tiến về hiệu năng, giúp nâng cấp cấu hình hệ thống để bạn có những trải nghiệm tuyệt vời hơn khi sử dụng các phần mềm, trò chơi đòi hỏi cấu hình cao. Đây là bộ vi xử lý thế hệ mới nằm ở mức giá tầm trung rất đáng để bạn đầu tư.  Tích hợp chip đồ họa Intel UHD Graphics 730, băng thông RAM ấn tượng Bộ vi xử lý/ CPU Intel Core i5-11400 (6 Cores 12 Threads up to 4.4Ghz 11th Gen LGA 1200) thế hệ mới được trang bị chip đồ họa Intel UHD Graphics 730 (kiến trúc Iris Xe), cho phép cải thiện đáng kể khả năng đa phương tiện cũng như đồ họa thông minh. Từ đó giúp tăng cường độ phức tạp của hình ảnh, xử lý đồ họa nhanh chóng, và nâng cao hiệu suất 3D. Bộ vi xử lý/ CPU Intel Core i5-11400 (6 Cores 12 Threads up to 4.4Ghz 11th Gen LGA 1200) đã có những bước cải tiến mới so với thế hệ tiền nhiệm i5-10400 khi nâng cấp bus RAM từ 2666MHz lên 3200MHz, giúp cấu hình chạy đa nhiệm hiệu quả hơn trước. ', N'-20%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (13, 9, 13, N'Ổ cứng SSD Kingston A400', CAST(N'2023-04-03' AS Date), 519000, 889000, 15, N'Data/unnamed3.jpg', N'- Dung lượng: 240GB - Kích thước: 2.5" - Kết nối: SATA 3 - Tốc độ đọc / ghi (tối đa): 500MB/s / 350MB/s', N'TỔNG QUAN Nhãn hiệu: Công ty công nghệ Kingston có trụ sở tại Califonia, Hoa Kỳ. Là 1 tập đoàn công nghệ máy tính đa quốc gia chuyên phát triển, sản xuất và bán hàng các sản phẩm bộ nhớ. Kingston là nhà sản xuất DRAM độc lập lớn nhất thế giới, ngoài ra bộ nhớ flash và USB cũng nằm trong top đứng đầu thế giới.  Loại sản phẩm: Ổ cứng Solid State Drive (SSD)  Giao diện kết nối: SATA III 6Gb/s  Loại ổ cứng SSD nhờ việc sử dụng  bộ nhớ flash để lưu dữ liệu, nên các hoạt động đọc và ghi dữ liệu của SSD không ảnh hưởng tới bất kì hoạt động của bộ phận nào trên ổ đĩa do đó làm ổ đĩa hoạt động yên tĩnh hơn so với HDD, gần như không gây ra tiếng ồn, không có độ trễ cơ học nên mang lại tốc độ truy cập cao hơn. Cùng với những yêu điểm về âm thanh vận hành ổ cứng SSD còn có khả năng không mất thời gian khởi động như ổ HDD.  Ổ cứng SSD còn tiêu tốn ít điện năng hơn ổ HDD và có thể hoạt động trong môi trường điện áp thấp hơn vì nhờ khả năng không sử dụng đầu đọc cơ học giống như ổ HDD để truy cập vào dữ liệu. Kích thước nhỏ hơn, gọn hơn ( ổ HDD thường là 3,5” ) chuyên dùng cho các loại laptop mỏng cũng như là các loại case diện tích bé.', N'-10%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (14, 6, 8, N'Card màn hình ASUS TUF Gaming', CAST(N'2023-04-03' AS Date), 5190000, 6499000, 10, N'Data/unnamed4.jpg', N'- Chip đồ họa: GeForce GTX 1660 Super - Bộ nhớ: 6GB GDDR6 (192-bit) - OC Mode - 1845 MHz (Boost Clock) - Gaming Mode (Default) - GPU Boost Clock : 1815 MHz , GPU Base Clock : 1530 MHz - Nguồn phụ: 1 x 8-pin', N'Mô tả sản phẩm Tản nhiệt hiệu quả với 2 quạt Card đồ họa ASUS TUF Gaming GeForce GTX 1660 SUPER OC Edition với kết cấu đơn giản và các tính năng được tinh giản những vẫn không ảnh hưởng đến hiệu năng, hai quạt tản nhiệt chống bụi mạnh mẽ cùng với các linh kiện PCB được lắp ráp bằng quá trình sản xuất tự động hóa. Do đó chiếc card đồ họa này được lựa chọn để trở thành thế hệ mới nhất của cạc đồ họa hiệu năng, với mục đích tạo ra một cỗ máy có hiệu suất bền bỉ.Công nghệ chống bụi IP5X Bụi được xem là tác nhân gây giảm hiệu suất và làm hỏng quạt. Đối với hệ thống quạt tản nhiệt thông thường thì việc phải tháo quạt ra để vệ sinh phần cứng bên trong dường như là một điều bất khả thi. Quạt tản nhiệt mới được chứng nhận IP5X từ các chuyên gia cho phép giữ cho các hạt bụi luôn ở bên ngoài vỏ. Vì thế việc vệ sinh quạt sẽ trở nên đơn giản hơn với bạn.', N'-5%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (15, 7, 10, N'Nguồn máy tính GIGABYTE P850GM', CAST(N'2023-03-31' AS Date), 2459000, 2650000, 5, N'Data/unnamed5.jpg', N'Công suất: 850W Chuẩn hiệu suất: 80 Plus Gold Quạt: 1 x 120 mm', N'Mô tả sản phẩm Power Gigabyte GP-P850GM 850W 80 Plus Gold Modular là bộ nguồn phổ thông của Gigabyte có thiết kế nhỏ gọn hiện đại cùng các đặc điểm nổi bật rất riêng được tạo ra nhằm hướng tới những game thủ đang xây dựng 1 bộ máy tính chơi game với cấu hình tầm trung.  Thiết kế nhỏ gọn hiện đại, chứng nhận vàng 80 Plus  Power Gigabyte GP-P850GM 850W 80 Plus Gold Modular có kích thước nhỏ gọn 150 x 140 x 86 mm phù hợp với mọi khung gầm nhỏ. Tất cả các cáp dẹt màu đen là thiết kế mô-đun, người dùng chỉ cần lắp đặt các loại cáp mình cần để tránh sự lộn xộn, tăng luồng không khí và hiệu suất tản nhiệt của khung gầm.Power Gigabyte GP-P850GM 850W 80 Plus Gold Modular được chứng nhận 80 Plus Gold mang lại hiệu suất 90% khi tải 50%. Hiệu suất điện tốt hơn với công suất hoạt động 850W dẫn đến ít lãng phí điện năng hơn, ít nóng và quạt ít gây ồn hơn khi hoạt động. Ngoài ra, với sự hỗ trợ của bộ vi xử lý Intel, sản phẩm sẽ tiết kiệm năng lượng hơn.', N'-8%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (16, 8, 8, N'ASUS TUF GAMING B660M-PLUS D4', CAST(N'2023-04-07' AS Date), 3690000, 4890000, 10, N'Data/unnamed6.jpg', N'Chuẩn mainboard: Micro-ATX - Socket: 1700 , Chipset: B660 - Hỗ trợ RAM: 4 khe DDR4, tối đa 128GB - Lưu trữ: 4 x SATA 3 6Gb/s, 2 x M.2 NVMe - Cổng xuất hình: 1 x HDMI, 1 x DisplayPort', N'Mô tả sản phẩm Mainboard Asus TUF Gaming B660M-PLUS D4 là dòng bo mạch chính bền bỉ tương thích vi xử lý Intel 12, hiệu ứng RGB bắt mắt cùng nhiều tính năng cao cấp khác. Hứa hẹn đem đến cho người dùng những trải nghiệm chơi game trực tuyến tuyệt vời hơn bao giờ hết. Vẻ ngoài ấn tượng, chất liệu cấu tạo cao cấp Mainboard B660M-PLUS D4 có kích thước Micro-ATX nhỏ gọn, vẫn là gam màu đen chủ đạo cùng các linh kiện thiết kế một cách tinh tế và hiệu ứng đèn led RGB bắt mắt. Đặc biệt, nổi bật trên đó là phần logo TUF Gaming mới chính hãng tạo nên một sự sang trọng và mạnh mẽ cho sản phẩm.Toàn bộ linh kiện cấu tạo nên chiếc bo mạch chính Asus này đều được làm từ những nguyên liệu cao cấp. Không những mang đến sự bền bỉ, chắc chắn mà còn hỗ trợ cho quá trình hoạt động ổn định, giải pháp tăng cường truyền tải điện năng, hệ thống tản nhiệt được toàn diện hơn.Hiệu năng hoạt động vượt trội cùng đa dạng kết nối hiện đại   Bo mạch chính Asus tích hợp chipset B660 socket Intel LGA 1700 tương thích dễ dàng với bộ vi xử lý Intel thế hệ 12 nâng cấp trải nghiệm chơi game. Bộ nhớ lưu trữ tối đa 128GB cùng với 4 khe ram kiểu DDR4 hỗ trợ các bus như: 2800MHz, 2400MHz, 2666MHz, 3000MHz, 3200MHz, 3333MHz, 3600MHz, 3733MHz, 3866MHz, 4000MHz.', N'-10%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (17, 11, 8, N'Tản nước AIO ASUS ROG ', CAST(N'2023-04-05' AS Date), 5559000, 5990000, 5, N'Data/unnamed7.jpg', N'- Kích thước tản: 272 x 122 x 27 mm - Tốc độ quạt: 450 ~ 2000 RPM +/- 10 % - Màn hình OLED 1.77 " Full Color OLED - AURA Sync RGB - Fan: 2 x Noctua NF-F12 industrialPPC 2000 PWM', N'Mô tả sản phẩm Giới thiệu tản nhiệt nước AIO ASUS ROG RYUJIN 240 Thiết kế ROG RYUJIN 240 là bộ tản nhiệt nước AIO cao cấp của ASUS, với khả năng tản nhiệt rất tốt kết hợp với thiết kế cứng cáp đặc trưng của dòng sản phẩm ROG kèm theo nhiều tính năng độc đáo như màn hình OLED giúp hiển thị các thông tin cần thiết. Nếu bạn đang tìm kiếm một sản phẩm không chỉ đơn thuần là một bộ tản nhiệt thông thường mà còn để thể hiện cá tính của bản thân thì ROG RYUJIN 240 là một lựa chọn rất đáng tham khảo.Hiệu năng Sử dụng lớp tản nhiệt lớn với kích thước 240mm, đi kèm với hai quạt tản nhiệt hiệu năng cao có tốc độ quay tối đa 2000RPM và áp lực 3.9mm H2O giúp di chuyển một luồng gió lớn lên tới 71CFM, tối ưu luồng gió di chuyển qua cánh quạt và tản nhiệt. Kết hợp với bơm sử dụng công nghệ mới nhất, đem lại hiệu năng tản nhiệt xuất sắc.Một trong những nhược điểm lớn nhất của tản nước AIO là việc thiếu khả năng làm mát cho các linh kiện xung quanh CPU như RAM, bộ cấp nguồn, ROG RYUJIN 240 khắc phục điều này bằng cách tích hợp 1 chiếc fan 60mm ngay trên phần khung của bơm, đem lại giải pháp tản nhiệt hoàn hảo.', N'-8%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (18, 4, 10, N'GIGABYTE GP-ARS32G52D5', CAST(N'2023-04-03' AS Date), 7450000, 7999000, 10, N'Data/unnamed8.jpg', N'- Dung lượng: 2 x 16GB - Thế hệ: DDR5 - Bus: 5200MHz - Cas: 40', N'Mô tả sản phẩm Ram Gigabyte Aorus 32GB DDR5 (GP-ARS32G52D5) cung cấp tốc độ bộ nhớ DDR5-5200 đáng tin cậy, mang đến trải nghiệm nâng cao với XMP 3.0 mới nhất. Thiết kế đồng-nhôm với bộ tản nhiệt Nano Carbon bền bỉ chất lượng, hỗ trợ đáng kể khi bạn muốn ép xung. Bộ nhớ DDR5 thế hệ mới, hỗ trợ băng thông vượt trội  Bộ nhớ RAM AORUS cao cấp thuộc thế hệ DDR5 mang đến giải pháp mới, hiệu quả hơn dành cho những ai đam mê xây dựng PC và các game thủ với hiệu suất xử lý nâng cao, mang lại tốc độ cực nhanh để cải thiện đáng kể trải nghiệm PC của người dùng. Bên cạnh đó, RAM AORUS còn cung cấp băng thông tốt hơn, đồng thời tối ưu hóa điện áp ở mức 1.1V, do đó dù chạy ở tần số tương tự, bộ nhớ AORUS DDR5 cho khả năng hoạt động tiết kiệm năng lượng hơn, với mức tiêu thụ điện năng thấp hơn so với bộ nhớ DDR4 thế hệ cũ. ', N'-8%', N'Còn hàng')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP]) VALUES (19, 3, 8, N'Màn hình LCD ASUS VP249QGR', CAST(N'2023-04-03' AS Date), 3690000, 4090000, 10, N'Data/unnamed10.jpg', N'Độ phân giải 1920 x 1080 ( 16:9 ) Tấm nền IPS LED Tần số quét 144Hz Thời gian phản hồi 1 ms Kiểu màn hình Màn hình phẳng Công nghệ đồng bộ FreeSync Độ sáng 250 cd/m2', N'Mô tả sản phẩm Asus 24 inch VP249QGR dòng màn hình phẳng thuộc phân khúc tầm trung đến từ thương hiệu Asus. Sản phẩm được trau chuốt kỹ lưỡng về thiết kế bên ngoài lẫn khả năng hiển thị bên trong đem đến sự sang trọng, hiện đại với màn hình chất lượng thỏa mãn được dải nhu cầu sử dụng rộng.Thiết kế với viền mỏng độc đáo, thao tác dễ sử dụng Màn hình LCD Asus 24 inch được thiết kế với 3 cạnh được viền mỏng khá ấn tượng đem lại cảm giác hiển thị rộng rãi với khung viền không quá dày. Cùng với tên thương hiệu được đặt ở cạnh dưới màn hình làm nổi bật được thương hiệu Asus làm điểm nhấn cho mặt trước của màn hình này.Bên cạnh đó, trọng lượng màn hình chỉ 3.56 kg cùng với loa được tích hợp phía sau làm tăng mọi trải nghiệm của người dùng trên màn hình này. Ngoài ra, thiết bị còn được trang bị loa tích hợp trên màn hình.  Màn hình rộng 24 inch, tấm nền IPS LED cho khả năng hiển thị chân thực Sở hữu màn hình nổi bật, rộng rãi lên đến 24 inch cùng với tấm nền IPS LED, độ phân giải cao 1920 x 1080 pixels (16:9) cho khả năng hiển thị hình ảnh sắc nét, chân thực và sống động nâng tầm trải nghiệm của người dùng trên màn hình LCD Asus.', N'-10%', N'Còn hàng')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([maKH], [tenKH], [diaChi], [soDienThoai], [taiKhoan], [matKhau], [Email]) VALUES (3, N'Đỗ Xuân Hoàng', N'250 Hoa Lư Quận Phú Nhuận', N'0938388445', N'hoang123', N'202cb962ac59075b964b07152d234b70', N'hoang@gmail.com')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (1, N'Laptop')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (2, N'Bàn Phím & Chuột')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (3, N'Màn Hình')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (4, N'RAM')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (5, N'CPU')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (6, N'VGA')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (7, N'PSU')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (8, N'Mainboard')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (9, N'Ổ cứng')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (10, N'Case')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (11, N'Tản nhiệt')
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (8, N'ASUS', N'130 Điện Biên Phủ', N'0938123456')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (9, N'Acer', N'150 Đồng Nai', N'0908457764')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (10, N'Gigabyte', N'123 Đà Nẵng', N'0989765894')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (11, N'MSI', N'150 Hà Nội', N'0123456789')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (12, N'Intel', N'123 Tôn thất hiệp', N'09383845123')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (13, N'Kingston', N'123 Phan đăng lưu', N'093123123')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [hoTen]) VALUES (N'admin', N'admin', N'Phan Duy Lộc')
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDatHang_DatHang] FOREIGN KEY([maHD])
REFERENCES [dbo].[DatHang] ([maHD])
GO
ALTER TABLE [dbo].[ChiTietDatHang] CHECK CONSTRAINT [FK_ChiTietDatHang_DatHang]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDatHang_HangHoa] FOREIGN KEY([maHang])
REFERENCES [dbo].[HangHoa] ([maHang])
GO
ALTER TABLE [dbo].[ChiTietDatHang] CHECK CONSTRAINT [FK_ChiTietDatHang_HangHoa]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_LoaiHang] FOREIGN KEY([maLoai])
REFERENCES [dbo].[LoaiHang] ([maLoai])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_LoaiHang]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_NhaCungCap] FOREIGN KEY([maNCC])
REFERENCES [dbo].[NhaCungCap] ([maNCC])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_NhaCungCap]
GO
USE [master]
GO
ALTER DATABASE [StoreComputer] SET  READ_WRITE 
GO
