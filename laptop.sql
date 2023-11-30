-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 13, 2023 lúc 08:37 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

create database laptop;

use laptop;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laptop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account`
(
    `IdAccount`   int(11)      NOT NULL,
    `IdNhanVien`  varchar(255) DEFAULT NULL,
    `IdKhachHang` varchar(255) DEFAULT NULL,
    `UserName`    varchar(255) NOT NULL,
    `Password`    varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`IdAccount`, `IdNhanVien`, `IdKhachHang`, `UserName`, `Password`)
VALUES (146, 'BHQL22911102023', NULL, 'BHQL22911102023', 'BHQL@@22911102023'),
       (148, 'BHNV22816102023', NULL, 'BHNV22816102023', 'BHNV@22816102023'),
       (150, 'KVNV22310102023', NULL, 'KVNV22310102023\r\n', 'KVNV@@22310102023\r\n'),
       (152, 'KVQL23501102023', NULL, 'KVQL23501102023', 'KVQL@23501102023'),
       (161, NULL, 'KH2350247953213', 'KH2350247953213', 'KH@2350247953213'),
       (273, NULL, NULL, 'adffdsf', 'dfsdfdf'),
       (275, NULL, NULL, 'adffdsf', 'dfsdfdf'),
       (277, NULL, NULL, 'adffdsf', 'dfsdfdf'),
       (281, NULL, NULL, 'adffdsf', 'dfsdfdf'),
       (283, NULL, 'KH2180247953213', 'kh', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang`
(
    `IdDonHang`       varchar(255) NOT NULL,
    `IdNhanVien`      varchar(255) DEFAULT NULL,
    `IdKhachHang`     varchar(255) DEFAULT ' ',
    `IdKhuyenMai`     varchar(255) DEFAULT NULL,
    `NgayLap`         date         NOT NULL,
    `TongSoLuong`     int(11)      NOT NULL,
    `TongTienTamTinh` double       NOT NULL,
    `PhiVanChuyen`    double       NOT NULL,
    `ThanhTien`       double       NOT NULL,
    `GhiChu`          varchar(255) DEFAULT NULL,
    `TrangThai`       varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`IdDonHang`, `IdNhanVien`, `IdKhachHang`, `IdKhuyenMai`, `NgayLap`, `TongSoLuong`,
                       `TongTienTamTinh`, `PhiVanChuyen`, `ThanhTien`, `GhiChu`, `TrangThai`)
VALUES ('DH0001', 'BHNV22816102023', 'KH2350247953213', NULL, '2023-10-31', 0, 0, 0, 10000000, 'test đơn hàng 1',
        'Chờ'),
       ('DH0002', 'BHNV22816102023', NULL, NULL, '2023-10-31', 0, 0, 0, 0, 'Đơn hàng 2', 'Chờ'),
       ('DH0006', 'BHNV22816102023', 'KH2180247953213', NULL, '2023-11-07', 0, 0, 0, 0, '', 'Đã xác nhận'),
       ('DH0008', 'BHNV22816102023', 'KH2180247953213', NULL, '2023-11-07', 0, 0, 0, 0, '', 'Đang giao'),
       ('DH0010', 'BHNV22816102023', 'KH2180247953213', NULL, '2023-11-08', 0, 0, 0, 0, '', 'Hủy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhangchitiet`
--

CREATE TABLE `donhangchitiet`
(
    `Id`         int(11)      NOT NULL,
    `IdDonHang`  varchar(255) NOT NULL,
    `IdSanPham`  varchar(255) NOT NULL,
    `SoLuongDat` int(11)      NOT NULL,
    `SoLuongCo`  int(11)      NOT NULL,
    `ThanhTien`  double       NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhangchitiet`
--

INSERT INTO `donhangchitiet` (`Id`, `IdDonHang`, `IdSanPham`, `SoLuongDat`, `SoLuongCo`, `ThanhTien`)
VALUES (1, 'DH0001', 'LTAC0001', 0, 0, 0),
       (2, 'DH0002', 'LTAC0002', 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence`
(
    `next_val` int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`)
VALUES (284);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon`
(
    `IdHoaDon`     varchar(255) NOT NULL,
    `IdNhanVien`   varchar(255) NOT NULL,
    `IdKhachHang`  varchar(255) DEFAULT NULL,
    `IdNhaCungCap` varchar(255) DEFAULT NULL,
    `NgayLap`      date         NOT NULL,
    `TongSoLuong`  int(11)      NOT NULL,
    `TongTien`     double       NOT NULL,
    `PhiVanChuyen` double       NOT NULL,
    `ThanhTien`    double       NOT NULL,
    `KhachDua`     double       NOT NULL,
    `TienThua`     double       NOT NULL,
    `GhiChu`       varchar(255) NOT NULL,
    `Loai`         varchar(255) NOT NULL,
    `TrangThai`    varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonchitiet`
--

CREATE TABLE `hoadonchitiet`
(
    `Id`         int(11)      NOT NULL,
    `IdHoaDon`   varchar(255) NOT NULL,
    `IdSanPham`  varchar(255) NOT NULL,
    `SoLuongDat` int(11)      NOT NULL,
    `SoLuongCo`  int(11)      NOT NULL,
    `ThanhTien`  double       NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image`
(
    `IdImage`   int(11)      NOT NULL,
    `IdPerson`  varchar(255) DEFAULT NULL,
    `IdSanPham` varchar(255) DEFAULT NULL,
    `URL`       varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`IdImage`, `IdPerson`, `IdSanPham`, `URL`)
VALUES (145, 'BHQL22911102023', NULL, 'BHQL22911102023.png'),
       (147, 'BHNV22816102023', NULL, 'BHNV22816102023.png'),
       (149, 'KVNV22310102023', NULL, 'KVNV22310102023.png'),
       (151, 'KVQL23501102023', NULL, 'KVQL23501102023.png'),
       (160, 'KH2350247953213', NULL, 'KH2350247953213.png'),
       (162, NULL, 'LTAC0001', 'LTAC0001_1.png'),
       (163, NULL, 'LTAC0001', 'LTAC0001_2.png'),
       (164, NULL, 'LTAC0001', 'LTAC0001_3.png'),
       (165, NULL, 'LTAC0001', 'LTAC0001_4.png'),
       (166, NULL, 'LTAC0001', 'LTAC0001_5.png'),
       (167, NULL, 'LTAC0001', 'LTAC0001_6.png'),
       (168, NULL, 'LTAC0001', 'LTAC0001_7.png'),
       (169, NULL, 'LTAC0001', 'LTAC0001_8.png'),
       (170, NULL, 'LTAC0001', 'LTAC0001_9.png'),
       (171, NULL, 'LTAC0002', 'LTAC0002_1.png'),
       (172, NULL, 'LTAC0002', 'LTAC0002_2.png'),
       (173, NULL, 'LTAC0002', 'LTAC0002_3.png'),
       (174, NULL, 'LTAC0002', 'LTAC0002_4.png'),
       (175, NULL, 'LTAC0002', 'LTAC0002_5.png'),
       (176, NULL, 'LTAC0002', 'LTAC0002_6.png'),
       (177, NULL, 'LTAC0002', 'LTAC0002_7.png'),
       (178, NULL, 'LTAC0003', 'LTAC0003_1.png'),
       (179, NULL, 'LTAC0003', 'LTAC0003_2.png'),
       (180, NULL, 'LTAC0003', 'LTAC0003_3.png'),
       (181, NULL, 'LTAC0003', 'LTAC0003_4.png'),
       (182, NULL, 'LTAC0003', 'LTAC0003_5.png'),
       (183, NULL, 'LTAC0003', 'LTAC0003_6.png'),
       (184, NULL, 'LTAC0003', 'LTAC0003_7.png'),
       (185, NULL, 'LTAC0003', 'LTAC0003_8.png'),
       (186, NULL, 'LTAP0001', 'LTAP0001_1.png'),
       (187, NULL, 'LTAP0001', 'LTAP0001_2.png'),
       (188, NULL, 'LTAP0001', 'LTAP0001_3.png'),
       (189, NULL, 'LTAP0001', 'LTAP0001_4.png'),
       (190, NULL, 'LTAP0001', 'LTAP0001_5.png'),
       (191, NULL, 'LTAP0002', 'LTAP0002_1.png'),
       (192, NULL, 'LTAP0002', 'LTAP0002_2.png'),
       (193, NULL, 'LTAP0002', 'LTAP0002_3.png'),
       (194, NULL, 'LTAP0002', 'LTAP0002_4.png'),
       (195, NULL, 'LTAP0002', 'LTAP0002_5.png'),
       (196, NULL, 'LTAP0002', 'LTAP0002_6.png'),
       (197, NULL, 'LTAP0003', 'LTAP0003_1.png'),
       (198, NULL, 'LTAP0003', 'LTAP0003_2.png'),
       (199, NULL, 'LTAP0003', 'LTAP0003_3.png'),
       (200, NULL, 'LTAP0003', 'LTAP0003_4.png'),
       (201, NULL, 'LTAP0003', 'LTAP0003_5.png'),
       (202, NULL, 'LTDE0001', 'LTDE0001_3.png'),
       (203, NULL, 'LTDE0001', 'LTDE0001_4.png'),
       (204, NULL, 'LTDE0001', 'LTDE0001_5.png'),
       (205, NULL, 'LTDE0001', 'LTDE0001_6.png'),
       (206, NULL, 'LTDE0001', 'LTDE0001_7.png'),
       (207, NULL, 'LTDE0001', 'LTDE0001_8.png'),
       (208, NULL, 'LTDE0002', 'LTDE0002_1.png'),
       (209, NULL, 'LTDE0002', 'LTDE0002_2.png'),
       (210, NULL, 'LTDE0002', 'LTDE0002_3.png'),
       (211, NULL, 'LTDE0002', 'LTDE0002_4.png'),
       (212, NULL, 'LTDE0002', 'LTDE0002_5.png'),
       (213, NULL, 'LTDE0002', 'LTDE0002_6.png'),
       (214, NULL, 'LTDE0003', 'LTDE0003_1.png'),
       (215, NULL, 'LTDE0003', 'LTDE0003_2.png'),
       (216, NULL, 'LTDE0003', 'LTDE0003_3.png'),
       (217, NULL, 'LTDE0003', 'LTDE0003_4.png'),
       (218, NULL, 'LTDE0003', 'LTDE0003_5.png'),
       (219, NULL, 'LTDE0003', 'LTDE0003_6.png'),
       (220, NULL, 'LTDE0003', 'LTDE0003_7.png'),
       (221, NULL, 'LTDE0003', 'LTDE0003_8.png'),
       (222, NULL, 'LTGI0001', 'LTGI0001_1.png'),
       (223, NULL, 'LTGI0001', 'LTGI0001_2.png'),
       (224, NULL, 'LTGI0001', 'LTGI0001_3.png'),
       (225, NULL, 'LTGI0001', 'LTGI0001_4.png'),
       (226, NULL, 'LTGI0001', 'LTGI0001_5.png'),
       (227, NULL, 'LTGI0001', 'LTGI0001_6.png'),
       (228, NULL, 'LTGI0001', 'LTGI0001_7.png'),
       (229, NULL, 'LTGI0001', 'LTGI0001_8.png'),
       (230, NULL, 'LTGI0001', 'LTGI0001_9.png'),
       (231, NULL, 'LTGI0002', 'LTGI0002_1.png'),
       (232, NULL, 'LTGI0002', 'LTGI0002_2.png'),
       (233, NULL, 'LTGI0002', 'LTGI0002_3.png'),
       (234, NULL, 'LTGI0002', 'LTGI0002_4.png'),
       (235, NULL, 'LTGI0002', 'LTGI0002_5.png'),
       (236, NULL, 'LTGI0002', 'LTGI0002_6.png'),
       (237, NULL, 'LTGI0002', 'LTGI0002_7.png'),
       (238, NULL, 'LTGI0002', 'LTGI0002_8.png'),
       (239, NULL, 'LTGI0002', 'LTGI0002_9.png'),
       (240, NULL, 'LTGI0003', 'LTGI0003_1.png'),
       (241, NULL, 'LTGI0003', 'LTGI0003_2.png'),
       (242, NULL, 'LTGI0003', 'LTGI0003_3.png'),
       (243, NULL, 'LTGI0003', 'LTGI0003_4.png'),
       (244, NULL, 'LTGI0003', 'LTGI0003_5.png'),
       (245, NULL, 'LTGI0003', 'LTGI0003_6.png'),
       (246, NULL, 'LTHP0001', 'LTHP0001_1.png'),
       (247, NULL, 'LTHP0001', 'LTHP0001_2.png'),
       (248, NULL, 'LTHP0001', 'LTHP0001_3.png'),
       (249, NULL, 'LTHP0001', 'LTHP0001_4.png'),
       (250, NULL, 'LTHP0001', 'LTHP0001_5.png'),
       (251, NULL, 'LTHP0001', 'LTHP0001_6.png'),
       (252, NULL, 'LTHP0002', 'LTHP0002_1.png'),
       (253, NULL, 'LTHP0002', 'LTHP0002_2.png'),
       (254, NULL, 'LTHP0002', 'LTHP0002_3.png'),
       (255, NULL, 'LTHP0002', 'LTHP0002_4.png'),
       (256, NULL, 'LTHP0002', 'LTHP0002_5.png'),
       (257, NULL, 'LTHP0002', 'LTHP0002_6.png'),
       (258, NULL, 'LTHP0003', 'LTHP0003_1.png'),
       (259, NULL, 'LTHP0003', 'LTHP0003_2.png'),
       (260, NULL, 'LTHP0003', 'LTHP0003_3.png'),
       (261, NULL, 'LTHP0003', 'LTHP0003_4.png'),
       (262, NULL, 'LTHP0003', 'LTHP0003_5.png'),
       (268, 'NCCCN777151023092714', NULL, 'NCCCN777151023092714.png\r\n'),
       (269, 'NCCTC777151023092714', NULL, 'NCCTC777151023092714.png'),
       (272, NULL, NULL, 'dfsdfsdf'),
       (274, NULL, NULL, 'dfsdfsdf'),
       (276, NULL, NULL, 'dfsdfsdf'),
       (280, NULL, NULL, 'dfsdfsdf'),
       (282, 'KH2180247953213', NULL, 'KH2180247953213.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang`
(
    `IdPerson`    varchar(255) NOT NULL,
    `IdAccount`   int(11)      NOT NULL,
    `XepHang`     varchar(255) DEFAULT NULL,
    `DiemTichLuy` double       DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`IdPerson`, `IdAccount`, `XepHang`, `DiemTichLuy`)
VALUES ('KH2350247953213', 161, NULL, 0),
       ('KH2180247953213', 283, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kho`
--

CREATE TABLE `kho`
(
    `IdKho`   int(11) NOT NULL AUTO_INCREMENT,
    `GiaNhap` double  NOT NULL,
    `GiaBan`  double  NOT NULL,
    `SoLuong` int(11) NOT NULL,
    PRIMARY KEY (`IdKho`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
--
-- Đang đổ dữ liệu cho bảng `kho`
--

INSERT INTO `kho` (`IdKho`, `GiaNhap`, `GiaBan`, `SoLuong`)
VALUES (1, 25000, 29000, 20),
       (2, 30000, 39000, 10),
       (3, 10000, 12000, 15),
       (4, 30000, 36000, 10),
       (5, 29000, 31000, 10),
       (6, 27000, 32000, 20),
       (7, 12000, 15000, 20),
       (8, 22000, 27000, 10),
       (9, 29000, 35000, 15),
       (10, 15000, 19000, 20),
       (11, 25000, 32000, 10),
       (12, 10000, 14000, 10),
       (13, 25000, 29000, 5),
       (14, 21000, 25500, 0),
       (15, 25000, 30000, 15),
       (16, 22000, 25000, 0),
       (17, 21000, 25000, 20),
       (18, 35000, 39000, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyenmai`
--

CREATE TABLE `khuyenmai`
(
    `IdKhuyenMai` varchar(255) NOT NULL,
    `KhuyenMai`   varchar(255) NOT NULL,
    `NoiDung`     varchar(255) NOT NULL,
    `IdSanPham`   varchar(255) DEFAULT NULL,
    `IdKhachHang` varchar(255) DEFAULT NULL,
    `Loai`        varchar(255) NOT NULL,
    `NgayBatDau`  date         NOT NULL,
    `NgayKetThuc` date         NOT NULL,
    `TrangThai`   varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khuyenmai`
--

INSERT INTO `khuyenmai` (`IdKhuyenMai`, `KhuyenMai`, `NoiDung`, `IdSanPham`, `IdKhachHang`, `Loai`, `NgayBatDau`,
                         `NgayKetThuc`, `TrangThai`)
VALUES ('KMSP0001', '-450000', 'Giảm 450.000 VNĐ', 'LTAC0001', NULL, 'Sản phẩm', '2023-10-16', '2023-12-31',
        'Đang diễn ra');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap`
(
    `IdPerson` varchar(255) NOT NULL,
    `Loai`     varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`IdPerson`, `Loai`)
VALUES ('NCCCN777151023092714', 'Cá nhân'),
       ('NCCTC777151023092714', 'Tổ chức');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien`
(
    `IdPerson`  varchar(255) NOT NULL,
    `IdAccount` int(11)      NOT NULL,
    `NgaySinh`  date         NOT NULL,
    `BoPhan`    varchar(255) NOT NULL,
    `ChucVu`    varchar(255) NOT NULL,
    `TrangThai` tinyint(1)   NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`IdPerson`, `IdAccount`, `NgaySinh`, `BoPhan`, `ChucVu`, `TrangThai`)
VALUES ('BHQL22911102023', 146, '2023-10-11', 'Bán hàng', 'Quản lý', 0),
       ('BHNV22816102023', 148, '2023-10-16', 'Bán hàng', 'Nhân viên', 0),
       ('KVNV22310102023', 150, '2023-10-10', 'Kho vận', 'Nhân viên', 0),
       ('KVQL23501102023', 152, '2023-10-01', 'Kho vận', 'Quản lý', 0),
       ('BHNV21406112023', 281, '2023-11-06', 'Bán hàng', 'Nhân viên', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `person`
--

CREATE TABLE `person`
(
    `IdPerson` varchar(255) NOT NULL,
    `Ten`      varchar(255) NOT NULL,
    `Email`    varchar(255) NOT NULL,
    `DiaChi`   varchar(255) NOT NULL,
    `SDT`      varchar(255) NOT NULL,
    `IdImage`  int(11) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `person`
--

INSERT INTO `person` (`IdPerson`, `Ten`, `Email`, `DiaChi`, `SDT`, `IdImage`)
VALUES ('BHNV21406112023', 'Ha My Anh', '', 'dsfsfsf', 'asdsadas', 280),
       ('BHNV22816102023', 'Mai Văn A', 'abc@gmail.com', '123/32 Nguyễn Tri Phương', '0247124135', 147),
       ('BHQL22911102023', 'Nguyễn Văn A', '123@gmail.com\'', '123/32 Nguyễn Văn Linh', '0247894135', 145),
       ('KH2180247953213', 'Cao Văn A', 'kh001@gmail.com', '123/32 Nguyễn Văn Tạo', '0247953213', 282),
       ('KH2350247953213', 'Trần Văn A', 'kh001@gmail.com', '123/32 Nguyễn Văn Tạo', '0247953213', 160),
       ('KVNV22310102023', 'Huỳnh Văn A', 'kho1231@gmail.com', '123/32 Nguyễn Văn Quỳ', '0247189213', 149),
       ('KVQL23501102023', 'Trần Văn A', 'khosdsf@gmail.com', '123/32 Nguyễn Văn Tạo', '0247953213', 151),
       ('NCCCN777151023092714', 'Mai Văn A', 'ncccn@gmail.com', '123/32 Nguyễn Văn Tạo', '0247953213', 268),
       ('NCCTC777151023092714', 'Bùi Văn A', 'ncctcf@gmail.com', '123/32 Nguyễn Văn Tạo', '0247953213', 269);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu`
--

CREATE TABLE `phieu`
(
    `IdPhieu`    varchar(255) NOT NULL,
    `IdNhanVien` varchar(255) NOT NULL,
    `NgayTao`    date         NOT NULL,
    `GhiChu`     varchar(255) NOT NULL,
    `Loai`       varchar(255) NOT NULL,
    `TrangThai`  varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieuchitiet`
--

CREATE TABLE `phieuchitiet`
(
    `Id`            int(11)      NOT NULL,
    `IdPhieu`       varchar(255) NOT NULL,
    `IdSanPham`     varchar(255) NOT NULL,
    `SoLuongDat`    int(11)      NOT NULL,
    `ThanhTienDat`  double DEFAULT NULL,
    `SoLuongNhan`   int(11)      NOT NULL,
    `ThanhTienNhan` double DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieunhap`
--

CREATE TABLE `phieunhap`
(
    `IdPhieu`         varchar(255) NOT NULL,
    `IdNhanVienNhap`  varchar(255) NOT NULL,
    `IdNhaCungCap`    varchar(255) NOT NULL,
    `TongSoLuongDat`  int(11) DEFAULT NULL,
    `TongTienDat`     int(11)      NOT NULL,
    `NgayNhap`        date    DEFAULT NULL,
    `TongSoLuongNhap` int(11) DEFAULT NULL,
    `TongTienNhap`    double       NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieuxuat`
--

CREATE TABLE `phieuxuat`
(
    `IdPhieu`         varchar(255) NOT NULL,
    `IdKhachHang`     varchar(255) DEFAULT NULL,
    `IdNhaCungCap`    varchar(255) DEFAULT NULL,
    `LoaiXuat`        varchar(255) NOT NULL,
    `TongSoLuongXuat` int(11)      NOT NULL,
    `TongTienXuat`    double       NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham`
(
    `IdSanPham`    varchar(255) NOT NULL,
    `TenSanPham`   varchar(255) DEFAULT NULL,
    `ThuongHieu`   varchar(255) DEFAULT NULL,
    `Mau`          varchar(255) DEFAULT NULL,
    `SeriesLapTop` varchar(255) DEFAULT NULL,
    `NhuCau`       varchar(255) DEFAULT NULL,
    `SeriesCPU`    varchar(255) DEFAULT NULL,
    `CPU`          varchar(255) DEFAULT NULL,
    `DoHoa`        varchar(255) DEFAULT NULL,
    `DoHoaRoi`     varchar(255) DEFAULT NULL,
    `RAM`          varchar(255) DEFAULT NULL,
    `BoNho`        varchar(255) DEFAULT NULL,
    `KTManHinh`    varchar(255) DEFAULT NULL,
    `PhanGiai`     varchar(255) DEFAULT NULL,
    `MHCamUng`     varchar(255) DEFAULT NULL,
    `KhoiLuong`    varchar(255) DEFAULT NULL,
    `IdKho`        int(11)      NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`IdSanPham`, `TenSanPham`, `ThuongHieu`, `Mau`, `SeriesLapTop`, `NhuCau`, `SeriesCPU`, `CPU`,
                       `DoHoa`, `DoHoaRoi`, `RAM`, `BoNho`, `KTManHinh`, `PhanGiai`, `MHCamUng`, `KhoiLuong`, `IdKho`)
VALUES ('LTAC0001', 'Laptop ACER Predator Helios Neo PHN16-71-53M7 (NH.QLUSV.005)', 'ACER', 'Đen', 'Predator', 'Gaming',
        'Core i5 , Intel Core thế hệ thứ 13', 'Intel Core i5-13500HX ', 'Intel UHD Graphics 710', 'RTX 4060 8GB GDDR6',
        '2 x 8GB DDR5 4800MHz ', '512GB SSD', '16\"', '( 1920 x 1200 ) WUXGA', 'Không', '2.6kg', 1),
       ('LTAC0002', 'Laptop ACER Aspire 3 A315-58-529V', 'ACER', 'Bạc', 'Aspire 3', 'Văn phòng',
        'Core i5 , Intel Core thế hệ thứ 11', 'Intel Core i5-1135G7', 'Onboard Intel Iris Xe Graphics', 'Không',
        '8GB (4GB + 4GB Onboard) DDR4 2400MHz', '256GB SSD', '15.6\"', '( 1920 x 1080 ) Full HD', 'Không', '1.7kg', 2),
        ('LTAC0003', 'Laptop ACER Nitro 16 Phoenix AN16-41-R5M4', 'ACER', 'Đen', 'Nitro 16', 'Gaming, Văn phòng',
         'Ryzen 5 , AMD', 'AMD Ryzen 5 7535HS ', 'AMD Radeon 660M', 'RTX 4050 6GB GDDR6', '1 x 8GB DDR5 4800MHz',
         '512GB SSD', '16\" ', '( 1920 x 1200 ) WUXGA IPS 165Hz', 'Không', '2.6kg', 3),
        ('LTAP0001', 'Laptop APPLE MacBook Air 2023 ', 'APPLE', 'Xám', 'Macbook Air', 'Văn phòng', 'Apple M', 'Apple M2',
         'Onbroad', '', '1 x 8GB', '256GB SSD', '15.3\"', '( 2880 x 1864 )', 'Không', '1.5 kg', 4),
        ('LTAP0002', 'MacBook Pro 2022 13.3 inch MNEP3SA/A', 'APPLE', 'Bạc', 'MacBook Pro',
         'Văn phòng, Gia đình, Doanh nhân, Doanh nghiệp', 'Apple M', 'Apple M2 chip', 'Onboard', 'Không', '8GB',
         '256GB SSD', '13.3\"', '( 2560 x 1600 )', 'Không', '1.4 kg', 5),
        ('LTAP0003', 'MacBook Air 2022 13.6 inch MLY33SA/A', 'APPLE', 'Midnight', 'Macbook Air',
         'Văn phòng, Gia đình, Doanh nhân, Doanh nghiệp', 'Apple M', 'Apple M2 chip', 'Onboard', 'Không', '8GB',
         '256GB SSD', '13.6\"', '( 2560 x 1664 )', 'Không', '1.3 kg', 6),
        ('LTAS0001', 'Laptop ASUS TUF Gaming F15 FX507ZU4-LP054W', 'ASUS', 'Xám', 'TUF', 'Gaming',
         'Core i7 , Intel Core thế hệ thứ 12', 'Intel Core i7-12700H', 'Intel Iris Xe Graphics', 'RTX 4050 6GB GDDR6',
         '2 x 8GB DDR4 3200MHz', '512GB SSD', '15.6\"', '( 1920 x 1080 ) Full HD', 'Không', '2.2 kg', 7),
        ('LTAS0002', 'Laptop ASUS Vivobook Go 15 E1504FA-NJ454W', 'ASUS', 'Bạc', 'VivoBook', 'Văn phòng', 'Ryzen 5',
         'AMD Ryzen 5 7520U', 'Onboard AMD Radeon 610M', 'Không', '16GB Onboard LPDDR5 5500MHz', '512GB SSD', '15.6\"',
         '( 1920 x 1080 ) Full HD', 'Không', '1.8 kg', 8),
        ('LTAS0003', 'Laptop ASUS ROG Strix G G513RC-HN038W', 'ASUS', 'Xám', 'ROG', 'Gaming', 'Ryzen 7',
         'AMD Ryzen 7 6800HS', 'AMD Radeon 680M', 'RTX 3050 4GB GDDR6', '1 x 8GB DDR5 4800MHz', '512GB SSD', '15.6\"',
         '( 1920 x 1080 ) Full HD', 'Không', '2.1 kg', 9),
        ('LTDE0001', 'Laptop Dell Vostro 3430 - 71015715 ', 'Dell', 'Xám', 'Vostro', 'Văn phòng',
         'Core i3 , Intel Core thế hệ thứ 13', 'Intel Core i3-1305U', 'Onboard Intel UHD Graphics', 'Không',
         '1 x 8GB DDR4 2666MHz', '256GB SSD', '14\"', '( 1920 x 1080 ) Full HD', 'Không', '1.5 kg', 10),
        ('LTDE0002', 'Laptop Dell Vostro 3530 - V5I5267W1', 'Dell', 'Xám', 'Vostro', 'Văn phòng',
         'Core i5 , Intel Core thế hệ thứ 13', 'Intel Core i5-1335U', 'Onboard Intel Iris Xe Graphics', 'Không',
         '1 x 8GB DDR4 2666MHz', '256GB SSD', '15.6\"', '( 1920 x 1080 ) Full HD', 'Không', '1.6 kg', 11),
        ('LTDE0003', 'Laptop Dell Inspiron 14 5430', 'Dell', 'Bạc', 'Inspiron', 'Văn phòng',
         'Core i7 , Intel Core thế hệ thứ 13', 'Intel Core i7-1360P', 'Intel Iris Xe Graphics', 'RTX 2050 4GB GDDR6',
         '16GB Onbard DDR5 4800MHz', '1TB SSD', '14\"', '( 2560 x 1600 ) WQXGA', 'Không', '1.8 kg', 12),
        ('LTGI0001', 'Laptop GIGABYTE G5 KF-E3PH333SH', 'GIGABYTE', 'Đen', 'G5 Series', 'Gaming, Văn phòng',
         'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-12500H', 'Intel Iris Xe Graphics', 'RTX 4060 8GB GDDR6',
         '1 x 8GB DDR4 3200MHz', '512GB SSD', '15.6\"', '( 1920 x 1080 ) Full HD', 'Không', '1.9 kg', 13),
        ('LTGI0002', 'Laptop GIGABYTE G5 MF-F2VN333SH', 'GIGABYTE', 'Đen', 'G5 Series', 'Gaming, Văn phòng',
         'Core i5 , Intel Core thế hệ thứ 12', 'Intel Core i5-12450H', 'Intel UHD Graphics', 'RTX 4050 6GB GDDR6',
         '1 x 8GB DDR4 3200MHz', '512GB SSD', '15.6\"', '( 1920 x 1080 ) Full HD', 'Không', '1.9 kg', 14),
        ('LTGI0003', 'Laptop GIGABYTE G5 KF-E3VN313SH', 'GIGABYTE', 'Đen', 'G5 Series', 'Văn phòng',
         'Core i5 , Intel Core thế hệ thứ 13', 'Intel Core i5-12500H', 'Intel Iris Xe Graphics', 'RTX 4060 8GB GDDR6',
         '2 x 8GB DDR4 3200MHz ', '512GB SSD', '15.6\"', '( 1920 x 1080 ) Full HD', 'Không', '1.9 kg', 15),
        ('LTHP0001', 'Laptop HP Pavilion 15-eg3091TU - 8C5L2PA', 'HP', 'Gold', 'Pavilion', 'Văn phòng',
         'Core i7 , Intel Core thế hệ thứ 13', 'Intel Core i7-1355U', 'Onboard Intel Iris Xe Graphics', 'Không',
         '2 x 8GB DDR4 3200MHz', '512GB SSD', '15.6\"', '( 1920 x 1080 ) Full HD', 'Không', '1.7 kg', 16),
        ('LTHP0002', 'Laptop HP ProBook 450 G10 - 873J7PA ', 'HP', 'Bạc', 'ProBook', 'Văn phòng',
         'Core i5 , Intel Core thế hệ thứ 13', 'Intel Core i5-1340P', 'Onboard Intel Iris Xe Graphics', 'Không',
         '1 x 16GB DDR4 3200MHz', '512GB SSD', '15.6\" ', ' ( 1920 x 1080 ) Full HD', 'Không', '1.8 kg', 17),
        ('LTHP0003', 'Laptop HP Victus 16-r0127TX - 8C5N2PA', 'HP', 'Đen', 'VICTUS', 'Gaming',
         'Core i7 , Intel Core thế hệ thứ 13', 'Intel Core i7-13700H', ' Intel Iris Xe Graphics', 'RTX 4060 8GB GDDR6',
         '2 x 8GB DDR5 5200MHz', '512GB SSD', '16.1\"', '( 1920 x 1080 ) Full HD', 'Không', '2.3 kg', 18);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
    ADD PRIMARY KEY (`IdAccount`),
    ADD KEY `fk_IdNhanVien_Account` (`IdNhanVien`),
    ADD KEY `fk_IdKhachHang_Account` (`IdKhachHang`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
    ADD PRIMARY KEY (`IdDonHang`),
    ADD KEY `fk_IdKhachHang_DonHang` (`IdKhachHang`),
    ADD KEY `fk_IdKhuyenMai_DonHang` (`IdKhuyenMai`),
    ADD KEY `fk_IdNhanVien_DonHang` (`IdNhanVien`);

--
-- Chỉ mục cho bảng `donhangchitiet`
--
ALTER TABLE `donhangchitiet`
    ADD PRIMARY KEY (`Id`),
    ADD KEY `fk_IdDonHangChiTiet` (`IdDonHang`),
    ADD KEY `fk_IdSanPham_DonHang` (`IdSanPham`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
    ADD PRIMARY KEY (`IdHoaDon`),
    ADD KEY `fk_IdNhanVien_HoaDon` (`IdNhanVien`),
    ADD KEY `fk_IdNhaCungCap_HoaDon` (`IdNhaCungCap`),
    ADD KEY `fk_IdKhachHang_HoaDon` (`IdKhachHang`);

--
-- Chỉ mục cho bảng `hoadonchitiet`
--
ALTER TABLE `hoadonchitiet`
    ADD PRIMARY KEY (`Id`),
    ADD KEY `fk_IdHoaDon_HoaDonChiTiet` (`IdHoaDon`),
    ADD KEY `fk_IdSanPham_HoaDonChiTiet` (`IdSanPham`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
    ADD PRIMARY KEY (`IdImage`),
    ADD KEY `fk_IdPerson_Image` (`IdPerson`),
    ADD KEY `fk_IdSanPham_Image` (`IdSanPham`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
    ADD KEY `fk_IdPerson_KhachHang` (`IdPerson`),
    ADD KEY `fk_IdAccount_KhachHang` (`IdAccount`);

--
-- Chỉ mục cho bảng `kho`
--
# ALTER TABLE `kho`
    #     MODIFY COLUMN `IdKho` int(11) NOT NULL AUTO_INCREMENT,
    #     ADD PRIMARY KEY (`IdKho`);

--
-- Chỉ mục cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
    ADD PRIMARY KEY (`IdKhuyenMai`),
    ADD KEY `fk_IdSanPham_KhuyenMai` (`IdSanPham`),
    ADD KEY `fk_IdKhachHang_KhuyenMai` (`IdKhachHang`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
    ADD KEY `fk_IdPerson_NhaCungCap` (`IdPerson`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
    ADD KEY `fk_IdPerson_NhanVien` (`IdPerson`),
    ADD KEY `fk_IdAccounte_NhanVien` (`IdAccount`);

--
-- Chỉ mục cho bảng `person`
--
ALTER TABLE `person`
    ADD PRIMARY KEY (`IdPerson`),
    ADD KEY `fk_IdImage_Person` (`IdImage`);

--
-- Chỉ mục cho bảng `phieu`
--
ALTER TABLE `phieu`
    ADD PRIMARY KEY (`IdPhieu`),
    ADD KEY `fk_IdNhanVien_Phieu` (`IdNhanVien`);

--
-- Chỉ mục cho bảng `phieuchitiet`
--
ALTER TABLE `phieuchitiet`
    ADD PRIMARY KEY (`Id`),
    ADD KEY `fk_IdPhieu_PhieuChiTiet` (`IdPhieu`),
    ADD KEY `fk_IdSanPham_PhieuChiTiet` (`IdSanPham`);

--
-- Chỉ mục cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
    ADD KEY `fk_IdPhieu_PhieuNhap` (`IdPhieu`),
    ADD KEY `fk_IdNhanVienNhap_PhieuNhap` (`IdNhanVienNhap`),
    ADD KEY `fk_IdNhaCungCap_PhieuNhap` (`IdNhaCungCap`);

--
-- Chỉ mục cho bảng `phieuxuat`
--
ALTER TABLE `phieuxuat`
    ADD KEY `fk_IdPhieu_PhieuXuat` (`IdPhieu`),
    ADD KEY `fk_IdKhachHang_PhieuXuat` (`IdKhachHang`),
    ADD KEY `fk_IdNhaCungCap_PhieuXuat` (`IdNhaCungCap`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
    ADD PRIMARY KEY (`IdSanPham`),
    ADD KEY `fk_Idkho_SanPham` (`IdKho`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
    MODIFY `IdImage` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 283;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account`
--
ALTER TABLE `account`
    ADD CONSTRAINT `fk_IdKhachHang_Account` FOREIGN KEY (`IdKhachHang`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdNhanVien_Account` FOREIGN KEY (`IdNhanVien`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
    ADD CONSTRAINT `fk_IdKhachHang_DonHang` FOREIGN KEY (`IdKhachHang`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdKhuyenMai_DonHang` FOREIGN KEY (`IdKhuyenMai`) REFERENCES `khuyenmai` (`IdKhuyenMai`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdNhanVien_DonHang` FOREIGN KEY (`IdNhanVien`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `donhangchitiet`
--
ALTER TABLE `donhangchitiet`
    ADD CONSTRAINT `fk_IdDonHangChiTiet` FOREIGN KEY (`IdDonHang`) REFERENCES `donhang` (`IdDonHang`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdSanPham_DonHang` FOREIGN KEY (`IdSanPham`) REFERENCES `sanpham` (`IdSanPham`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
    ADD CONSTRAINT `fk_IdKhachHang_HoaDon` FOREIGN KEY (`IdKhachHang`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdNhaCungCap_HoaDon` FOREIGN KEY (`IdNhaCungCap`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdNhanVien_HoaDon` FOREIGN KEY (`IdNhanVien`) REFERENCES `nhanvien` (`IdPerson`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hoadonchitiet`
--
ALTER TABLE `hoadonchitiet`
    ADD CONSTRAINT `fk_IdHoaDon_HoaDonChiTiet` FOREIGN KEY (`IdHoaDon`) REFERENCES `hoadon` (`IdHoaDon`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdSanPham_HoaDonChiTiet` FOREIGN KEY (`IdSanPham`) REFERENCES `sanpham` (`IdSanPham`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
    ADD CONSTRAINT `fk_IdPerson_Image` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdSanPham_Image` FOREIGN KEY (`IdSanPham`) REFERENCES `sanpham` (`IdSanPham`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
    ADD CONSTRAINT `fk_IdAccount_KhachHang` FOREIGN KEY (`IdAccount`) REFERENCES `account` (`IdAccount`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdPerson_KhachHang` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `kho`
--
--
-- Các ràng buộc cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
    ADD CONSTRAINT `fk_IdKhachHang_KhuyenMai` FOREIGN KEY (`IdKhachHang`) REFERENCES `khachhang` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdSanPham_KhuyenMai` FOREIGN KEY (`IdSanPham`) REFERENCES `sanpham` (`IdSanPham`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
    ADD CONSTRAINT `fk_IdPerson_NhaCungCap` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
    ADD CONSTRAINT `fk_IdAccounte_NhanVien` FOREIGN KEY (`IdAccount`) REFERENCES `account` (`IdAccount`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdPerson_NhanVien` FOREIGN KEY (`IdPerson`) REFERENCES `person` (`IdPerson`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `person`
--
ALTER TABLE `person`
    ADD CONSTRAINT `fk_IdImage_Person` FOREIGN KEY (`IdImage`) REFERENCES `image` (`IdImage`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `phieu`
--
ALTER TABLE `phieu`
    ADD CONSTRAINT `fk_IdNhanVien_Phieu` FOREIGN KEY (`IdNhanVien`) REFERENCES `nhanvien` (`IdPerson`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `phieuchitiet`
--
ALTER TABLE `phieuchitiet`
    ADD CONSTRAINT `fk_IdPhieu_PhieuChiTiet` FOREIGN KEY (`IdPhieu`) REFERENCES `phieu` (`IdPhieu`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdSanPham_PhieuChiTiet` FOREIGN KEY (`IdSanPham`) REFERENCES `sanpham` (`IdSanPham`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
    ADD CONSTRAINT `fk_IdNhaCungCap_PhieuNhap` FOREIGN KEY (`IdNhaCungCap`) REFERENCES `nhacungcap` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdNhanVienNhap_PhieuNhap` FOREIGN KEY (`IdNhanVienNhap`) REFERENCES `nhanvien` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdPhieu_PhieuNhap` FOREIGN KEY (`IdPhieu`) REFERENCES `phieu` (`IdPhieu`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `phieuxuat`
--
ALTER TABLE `phieuxuat`
    ADD CONSTRAINT `fk_IdKhachHang_PhieuXuat` FOREIGN KEY (`IdKhachHang`) REFERENCES `khachhang` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdNhaCungCap_PhieuXuat` FOREIGN KEY (`IdNhaCungCap`) REFERENCES `nhacungcap` (`IdPerson`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_IdPhieu_PhieuXuat` FOREIGN KEY (`IdPhieu`) REFERENCES `phieu` (`IdPhieu`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
    ADD CONSTRAINT `fk_Idkho_SanPham` FOREIGN KEY (`IdKho`) REFERENCES `kho` (`IdKho`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
