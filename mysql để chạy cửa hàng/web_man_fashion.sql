-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 02, 2024 lúc 04:52 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_man_fashion`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_bill`
--

CREATE TABLE `tb_bill` (
  `id_bill` int(11) NOT NULL,
  `code_bill` char(10) NOT NULL,
  `status_bill` char(2) NOT NULL,
  `id_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_bill`
--

INSERT INTO `tb_bill` (`id_bill`, `code_bill`, `status_bill`, `id_order`) VALUES
(58, '5481403', '1', 122),
(59, '8736368', '1', 121),
(61, '2621708', '1', 125),
(62, '8693356', '1', 124),
(63, '3583278', '1', 123),
(64, '6968285', '1', 128),
(65, '3132278', '1', 127),
(66, '123153', '1', 126),
(67, '8111245', '1', 131),
(68, '8739743', '1', 130),
(69, '8706304', '1', 129),
(70, '2819362', '1', 135);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_category`
--

CREATE TABLE `tb_category` (
  `id_category` int(11) NOT NULL,
  `code_category` char(30) NOT NULL,
  `name_category` varchar(255) NOT NULL,
  `unaccentname_category` char(100) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_category`
--

INSERT INTO `tb_category` (`id_category`, `code_category`, `name_category`, `unaccentname_category`, `parent_id`) VALUES
(166, 'Nam', 'Nam', 'nam', 0),
(167, 'Nu', 'Nữ', 'nu', 0),
(168, 'TreEm', 'Trẻ Em', 'treem', 0),
(169, 'GiayDep', 'Giày Dép', 'giaydep', 0),
(170, 'PhuKien', 'Phụ Kiện', 'phukien', 0),
(172, 'AoNam', ' Áo', 'ao', 166),
(173, 'QuanNam', 'Quần', 'quan', 166),
(174, 'AoThun', 'Áo Thun', 'aothun', 172),
(175, 'AoSoMi', 'Áo Sơ Mi nam', 'aosomi', 172),
(176, 'AoKhoac', 'Áo Khoác', 'aokhoac', 172),
(177, 'AoVest', 'Áo Vest', 'aovest', 172),
(178, 'QuanTay', 'Quần Tây', 'quantay', 173),
(179, 'QuanJean', 'Quần Jean', 'quanjean', 173),
(180, 'QuanLung', 'Quần Lửng', 'quanlung', 173),
(181, 'AoNu', 'Áo', 'ao', 167),
(182, 'QuanNu', 'Quần', 'quan', 167),
(183, 'ChanVayNu', 'Chân Váy', 'chanvay', 167),
(187, 'AoSoMiNu', 'Áo Sơ Mi Nữ', 'aosomi', 181),
(188, 'AoThunNu', 'Áo Thun', 'aothun', 181),
(189, 'AoCropTop', 'Áo CropTop', 'aocroptop', 181),
(191, 'QuanDaiNu', 'Quần Dài', 'quandai', 182),
(192, 'QuanJeans', 'Quần Jeans', 'quanjeans', 182),
(194, 'Jumpsuit', 'Jumpsuit', 'jumpsuit', 182),
(195, 'ChanVayButChi', 'Chân Váy Bút Chì', 'chanvaybutchi', 183),
(196, 'ChanVayChuA', 'Chân Váy Chữ A', 'chanvaychua', 183),
(197, 'ChanVayJeans', 'Chân Váy Jeans', 'chanvayjeans', 183),
(198, 'AoVestNu', 'Áo Vest/Blazer', 'aovest/blazer', 184),
(199, 'AoDa', 'Áo Dạ / Măng tô', 'aoda/mangto', 184),
(200, 'DamCongSo', 'Đầm Công Sở', 'Đamcongso', 185),
(201, 'DamVanHoa', 'Đầm Van Hoa', 'Đamvanhoa', 185),
(202, 'AoDaiTruyenThong', 'Áo Dài Truyền Thống', 'aodaitruyenthong', 186),
(203, 'AoDaiCachTan', 'Áo Dài Cách Tân', 'aodaicachtan', 186),
(204, 'BeGai', 'Bé Gái', 'begai', 168),
(205, 'BeTrai', 'Bé Trai', 'betrai', 168),
(206, 'AoBeGai', 'Áo Bé Gái', 'aobegai', 204),
(207, 'AoBeTrai', 'Áo Bé Trai', 'aobetrai', 205),
(208, 'QuanBeGai', 'Quần Bé Gái', 'quanbegai', 204),
(209, 'QuanBeTrai', 'Quần Bé Trai', 'quanbetrai', 205),
(210, 'VayBeGai', 'Váy Bé Gái', 'vaybegai', 204),
(211, 'PhuKienBeTrai', 'Phụ Kiện Bé Trai', 'phukienbetrai', 205),
(212, 'GiayNam', 'Giày Nam', 'giaynam', 169),
(213, 'GiayNu', 'Giày Nữ', 'giaynu', 169),
(214, 'DepNam', 'Dép Nam', 'depnam', 169),
(215, 'DepNu', 'Dép Nữ', 'depnu', 169),
(216, 'PhuKienNam', 'Phụ Kiện Nam', 'phukiennam', 170),
(217, 'PhuKienNu', 'Phụ Kiện Nữ', 'phukiennu', 170),
(224, 'quandainam123', 'Quần dài nam', 'quandainam', 173),
(225, 'quandainam1234', 'Quần dài nam', 'quandainam', 173),
(226, 'Ngo', 'Ngọ', 'ngo', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_city`
--

CREATE TABLE `tb_city` (
  `id_city` int(11) NOT NULL,
  `code_city` char(10) NOT NULL,
  `name_city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_city`
--

INSERT INTO `tb_city` (`id_city`, `code_city`, `name_city`) VALUES
(3, 'AnGiang', 'An Giang'),
(4, 'VungTau', 'Bà Rịa - Vũng tàu'),
(5, 'BacGiang', 'Bắc Giang'),
(6, 'BacKan', 'Bắc Kạn'),
(7, 'BacLieu', 'Bạc Liêu'),
(8, 'BacNinh', 'Bắc Ninh'),
(9, 'BenTre', 'Bến Tre'),
(10, 'BinhDinh', 'Bình Định'),
(11, 'BinhDuong', 'Bình Dương'),
(12, 'BinhPhuoc', 'Bình Phước'),
(13, 'BinhThuan', 'Bình Thuận'),
(14, 'CaMau', 'Cà Mau'),
(15, 'CaoBang', 'Cao Bằng'),
(16, 'DakLak', 'Đắk Lắk'),
(17, 'DakNong', 'Đắk Nông'),
(18, 'DienBien', 'Điện Biên'),
(19, 'DongNai', 'Đồng Nai'),
(20, 'DongThap', 'Đồng Tháp'),
(21, 'GiaLai', 'Gia Lai'),
(22, 'HaGiang', 'Hà Giang'),
(23, 'HaNam', 'Hà Nam'),
(24, 'HaTinh', 'Hà Tĩnh'),
(25, 'HaiDuong', 'Hải Dương'),
(26, 'HauGiang', 'Hậu Giang'),
(27, 'HoaBinh', 'Hòa Bình'),
(28, 'HungYen', 'Hưng Yên'),
(29, 'KhanhHoa', 'Khánh Hòa'),
(30, 'KienGiang', 'Kiên Giang'),
(31, 'KonTum', 'Kon Tum'),
(32, 'LaiChau', 'Lai Châu'),
(33, 'LamDong', 'Lâm Đồng'),
(34, 'LangSon', 'Lạng Sơn'),
(35, 'LaoCai', 'Lào Cai'),
(36, 'LongAn', 'Long An'),
(37, 'NamDinh', 'Nam Định'),
(38, 'NgheAn', 'Nghệ An'),
(39, 'NinhBinh', 'Ninh Bình'),
(40, 'NinhThuan', 'Ninh Thuận'),
(41, 'PhuTho', 'Phú Thọ'),
(42, 'QuangBinh', 'Quảng Bình'),
(43, 'QuangNam', 'Quảng Nam'),
(44, 'QuangNgai', 'Quảng Ngãi'),
(45, 'QuangNinh', 'Quảng Ninh'),
(46, 'QuangTri', 'Quảng Trị'),
(47, 'SocTrang', 'Sóc Trăng'),
(48, 'SonLa', 'Sơn La'),
(49, 'TayNinh', 'Tây Ninh'),
(50, 'ThaiBinh', 'Thái Bình'),
(51, 'ThaiNguyen', 'Thái Nguyên'),
(52, 'ThanhHoa', 'Thanh Hóa'),
(53, 'ThuaThienH', 'Thừa Thiên Huế'),
(54, 'TienGiang', 'Tiền Giang'),
(55, 'TraVinh', 'Trà Vinh'),
(56, 'TuyenQuang', 'Tuyên Quang'),
(57, 'VinhLong', 'Vĩnh Long'),
(58, 'VinhPhuc', 'Vĩnh Phúc'),
(59, 'YenBai', 'Yên Bái'),
(60, 'PhuYen', 'Phú Yên'),
(61, 'CanTho', 'Cần Thơ'),
(62, 'DaNang', 'Đà Nẵng'),
(63, 'HaiPhong', 'Hải Phòng'),
(64, 'HaNoi', 'Hà Nội'),
(65, 'TP.HCM', 'Thành phố Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_contact`
--

CREATE TABLE `tb_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` char(100) NOT NULL,
  `number_phone` char(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_contact`
--

INSERT INTO `tb_contact` (`id`, `name`, `email`, `number_phone`, `address`, `content`, `status`) VALUES
(8, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'sửa đồ', '1'),
(9, 'ngọ3', 'ngo147665@gmail.com', '0787023467', 'Ninh Bình', 'alo thử', '1'),
(11, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'áo tôi quá nhỏ cần đổi sang size lớn hơn', '1'),
(12, 'ngọ', 'ngo147665@huce.edu.vn', '0353055782', 'Ninh Bình', 'shop giao nhầm size', '1'),
(13, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'đổi', '1'),
(25, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '1'),
(26, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '0'),
(28, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '0'),
(29, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '0'),
(30, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '0'),
(31, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '0'),
(32, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '0'),
(33, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '0'),
(34, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '1'),
(35, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi muốn đổi size áo', '0'),
(36, 'Trần Văn Ngọ', 'ngoktksnb@gmail.com', '0353055782', 'Ninh Bình', 'tôi cần đổi size áo', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_district`
--

CREATE TABLE `tb_district` (
  `id_district` int(11) NOT NULL,
  `code_district` char(10) NOT NULL,
  `name_district` varchar(50) NOT NULL,
  `id_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_district`
--

INSERT INTO `tb_district` (`id_district`, `code_district`, `name_district`, `id_city`) VALUES
(5, 'AnPhu', 'An Phú', 3),
(6, 'TanChau', 'Tân Châu', 3),
(7, 'PhuTan', 'Phú Tân', 3),
(8, 'ChauDoc', 'Châu Đốc', 3),
(9, 'TinhBien', 'Tịnh Biên', 3),
(10, 'TriTon', 'Trị Tôn', 3),
(11, 'ChauPhu', 'Châu Phú', 3),
(12, 'ChauThanh', 'Châu Thành', 3),
(13, 'ChoMoi', 'Chợ Mới', 3),
(14, 'LongXuyen', 'Long Xuyên', 3),
(15, 'ThoaiSon', 'Thoại Sơn', 3),
(16, 'VungTau', 'Vũng Tàu', 4),
(17, 'BaRia', 'Bà Rịa', 4),
(18, 'XuyenMoc', 'Xuyên Mộc', 4),
(19, 'LongDien', 'Long Điền', 4),
(20, 'ConDao', 'Côn Đảo', 4),
(21, 'TanThanh', 'Tân Thành', 4),
(22, 'ChauDuc', 'Châu Đức', 4),
(23, 'DatDo', 'Đất Đỏ', 4),
(24, 'HiepHoa', 'Hiệp Hòa', 5),
(25, 'YenDung', 'Yên Dũng', 5),
(26, 'LucNam', 'Lục Nam', 5),
(27, 'SonDong', 'Sơn Động', 5),
(28, 'LangGiang', 'Lạng Giang', 5),
(29, 'VietYen', 'Việt Yên', 5),
(30, 'LucNgan', 'Lục Ngạn', 5),
(31, 'YenThe', 'Yên Thế', 5),
(32, 'BacKan', 'Bắc Kạn', 6),
(33, 'PacNam', 'Pác Nặm', 6),
(34, 'BaBe', 'Ba Bể', 6),
(35, 'NganSon', 'Ngân Sơn', 6),
(36, 'BachThong', 'Bạch Thông', 6),
(37, 'ChoDon', 'Chợ Đồn', 6),
(38, 'ChoMoi', 'Chợ Mới', 6),
(39, 'NaRi', 'Na Rì', 6),
(40, 'BacLieu', 'Bạc Liêu', 7),
(41, 'VinhLoi', 'Vĩnh Lợi', 7),
(42, 'HongDan', 'Hồng Dân', 7),
(43, 'GiaRai', 'Giá Rai', 7),
(44, 'PhuocLong', 'Phước Long', 7),
(45, 'DongHai', 'Đông Hải', 7),
(46, 'HoaBinh', 'Hòa Bình', 7),
(47, 'BacNinh', 'Bắc Ninh', 8),
(48, 'YenPhong', 'Yên Phong', 8),
(49, 'QueVo', 'Quế Võ', 8),
(50, 'TienDu', 'Tiên Du', 8),
(51, 'TuSon', 'Từ Sơn', 8),
(52, 'ThuanThanh', 'Thuận Thành', 8),
(53, 'GiaBinh', 'Gia Bình', 8),
(54, 'LuongTai', 'Lương Tài', 8),
(55, '1', 'Quận Ba Đình', 64),
(56, '2', 'Quận Hoàn Kiếm', 64),
(57, '3', 'Quận Tây Hồ', 64),
(58, '4', 'Quận Long Biên', 64),
(59, '5', 'Quận Cầu Giấy', 64),
(60, '6', 'Quận Đống Đa', 64),
(61, '7', 'Quận Hai Bà Trưng', 64),
(62, '8', 'Quận Hoàng Ma', 64),
(63, '9', 'Quận Thanh Xuân', 64),
(64, '10', 'Huyện Sóc Sơn', 64),
(65, '11', 'Huyện Đông Anh', 64),
(66, '12', 'Huyện Gia Lâm', 64),
(67, '13', 'Quận Nam Từ Liêm', 64),
(68, '14', 'Huyện Thanh Trì', 64),
(69, '15', 'Quận Bắc Từ Liêm', 64),
(70, '16', 'Huyện Mê Linh', 64),
(71, '17', 'Quận Hà Đông', 64),
(72, '18', 'Thị xã Sơn Tây', 64),
(73, '19', 'Huyện Ba Vì', 64),
(74, '20', 'Huyện Phúc Thọ', 64),
(75, '21', 'Huyện Đan Phượng', 64),
(76, '22', 'Huyện Hoài Đức', 64),
(77, '23', 'Huyện Quốc Oai', 64),
(78, '24', 'Huyện Thạch Thất', 64),
(79, '25', 'Huyện Chương Mỹ', 64),
(80, '26', 'Huyện Thanh Oai', 64),
(81, '27', 'Huyện Thường Tín', 64),
(82, '28', 'Huyện Phú Xuyên', 64),
(83, '29', 'Huyện Ứng Hòa', 64),
(84, '30', 'Huyện Mỹ Đức', 64),
(85, 'O1', 'Thành phố Hà Giang', 22),
(86, '026', 'Huyện Đồng Văn', 22),
(87, '027', 'Huyện Mèo Vạc', 22),
(88, '028', 'Huyện Yên Minh', 22),
(89, '029', 'Huyện Quản Bạ', 22),
(90, '030', 'Huyện Vị Xuyên', 22),
(91, '031', 'Huyện Bắc Mê', 22),
(92, '032', 'Huyện Hoàng Su Phì', 22),
(93, '033', 'Huyện Xín Mần', 22),
(94, '034', 'Huyện Bắc Quang', 22),
(95, '035', 'Huyện Quang Bình', 22),
(96, '040', 'Thành phố Cao Bằng', 15),
(97, '042', 'Huyện Bảo Lâm', 15),
(98, '043', 'Huyện Bảo Lạc', 15),
(99, '044', 'Huyện Thông Nông', 15),
(100, '045', 'Huyện Hà Quảng', 15),
(101, '046', 'Huyện Trà Lĩnh', 15),
(102, '047', 'Huyện Trùng Khánh', 15),
(103, '048', 'Huyện Hạ Lang', 15),
(104, '049', 'Huyện Quảng Uyên', 15),
(105, '050', 'Huyện Phục Hoà', 15),
(106, '051', 'Huyện Hoà An', 15),
(107, '052', 'Huyện Nguyên Bình', 15),
(108, '053', 'Huyện Thạch An', 15),
(110, '058', 'Thành Phố Bắc Kạn', 6),
(111, '060', 'Huyện Pác Nặm', 6),
(112, '061', 'Huyện Ba Bể', 6),
(113, '062', 'Huyện Ngân Sơn', 6),
(114, '063', 'Huyện Bạch Thông', 6),
(115, '064', 'Huyện Chợ Đồn', 6),
(116, '066', 'Huyện Na Rì', 6),
(119, '070', 'Thành phố Tuyên Quang', 56),
(120, '071', 'Huyện Lâm Bình', 56),
(121, '072', 'Huyện Nà Hang', 56),
(122, '073', 'Huyện Chiêm Hóa', 56),
(123, '074', 'Huyện Hàm Yên', 56),
(124, '075', 'Huyện Yên Sơn', 56),
(125, '076', 'Huyện Sơn Dương', 56),
(126, '080', 'Thành phố Lào Cai', 35),
(127, '082', 'Huyện Bát Xát', 35),
(128, '083', 'Huyện Mường Khương', 35),
(129, '084', 'Huyện Si Ma Cai', 35),
(130, '085', 'Huyện Bắc Hà', 35),
(131, '086', 'Huyện Bảo Thắng', 35),
(132, '087', 'Huyện Bảo Yên', 35),
(133, '088', 'Huyện Sa Pa', 35),
(134, '089', 'Huyện Văn Bàn', 35),
(135, '094', 'Thành phố Điện Biên Phủ', 18),
(136, '095', 'Thị Xã Mường Lay', 18),
(137, '096', 'Huyện Mường Nhé', 18),
(138, '097', 'Huyện Mường Chà', 18),
(139, '098', 'Huyện Tủa Chùa', 18),
(140, '099', 'Huyện Tuần Giáo', 18),
(141, '100', 'Huyện Điện Biên', 18),
(142, '101', 'Huyện Điện Biên Đông', 18),
(143, '102', 'Huyện Mường Ảng', 18),
(144, '103', 'Huyện Nậm Pồ', 18),
(145, '105', 'Thành phố Lai Châu', 32),
(146, '106', 'Huyện Tam Đường', 32),
(147, '107', 'Huyện Mường Tè', 32),
(148, '108', 'Huyện Sìn Hồ', 32),
(149, '109', 'Huyện Phong Thổ', 32),
(150, '110', 'Huyện Than Uyên', 32),
(151, '111', 'Huyện Tân Uyên', 32),
(152, '112', 'Huyện Nậm Nhùn', 32),
(153, '116', 'Thành phố Sơn La', 48),
(154, '118', 'Huyện Quỳnh Nhai', 48),
(155, '119', 'Huyện Thuận Châu', 48),
(156, '120', 'Huyện Mường La', 48),
(157, '121', 'Huyện Bắc Yên', 48),
(158, '122', 'Huyện Phù Yên', 48),
(159, '123', 'Huyện Mộc Châu', 48),
(160, '124', 'Huyện Yên Châu', 48),
(161, '125', 'Huyện Mai Sơn', 48),
(162, '126', 'Huyện Sông Mã', 48),
(163, '127', 'Huyện Sốp Cộp', 48),
(164, '128', 'Huyện Vân Hồ', 48),
(165, '132', 'Thành phố Yên Bái', 59),
(166, '133', 'Thị xã Nghĩa Lộ', 59),
(167, '134', 'Huyện Lục Yên', 59),
(168, '136', 'Huyện Văn Yên', 59),
(169, '137', 'Huyện Mù Căng Chải', 59),
(170, '138', 'Huyện Trấn Yên', 59),
(171, '139', 'Huyện Trạm Tấu', 59),
(172, '140', 'Huyện Văn Chấn', 59),
(173, '141', 'Huyện Yên Bình', 59),
(174, '148', 'Thành phố Hòa Bình', 27),
(175, '150', 'Huyện Đà Bắc', 27),
(176, '151', 'Huyện Kỳ Sơn', 27),
(177, '152', 'Huyện Lương Sơn', 27),
(178, '153', 'Huyện Kim Bôi', 27),
(179, '154', 'Huyện Cao Phong', 27),
(180, '155', 'Huyện Tân Lạc', 27),
(181, '156', 'Huyện Mai Châu', 27),
(182, '157', 'Huyện Lạc Sơn', 27),
(183, '158', 'Huyện Yên Thủy', 27),
(184, '159', 'Huyện Lạc Thủy', 27),
(185, '164', 'Thành phố Thái Nguyên', 51),
(186, '165', 'Thành phố Sông Công', 51),
(187, '167', 'Huyện Định Hóa', 51),
(188, '168', 'Huyện Phú Lương', 51),
(189, '169', 'Huyện Đồng Hỷ', 51),
(190, '170', 'Huyện Võ Nhai', 51),
(191, '171', 'Huyện Đại Từ', 51),
(192, '172', 'Thị xã Phổ Yên', 51),
(193, '173', 'Huyện Phú Bình', 51),
(194, '178', 'Thành phố Lạng Sơn', 34),
(195, '180', 'Huyện Tràng Định', 34),
(196, '181', 'Huyện Bình Gia', 34),
(197, '182', 'Huyện Văn Lãng', 34),
(198, '183', 'Huyện Cao Lộc', 34),
(199, '184', 'Huyện Văn Quan', 34),
(200, '185', 'Huyện Bắc Sơn', 34),
(201, '186', 'Huyện Hữu Lũng', 34),
(202, '187', 'Huyện Chi Lăng', 34),
(203, '188', 'Huyện Lộc Bình', 34),
(204, '189', 'Huyện Đình Lập', 34),
(205, '193', 'Thành phố Hạ Long', 45),
(206, '194', 'Thành Phố Móng Cái', 45),
(207, '195', 'Thành Phố Cẩm Phả', 45),
(208, '196', 'Thành Phố Uông Bí', 45),
(209, '198', 'Huyện Bình Liêu', 45),
(210, '199', 'Huyện Tiên Yên', 45),
(211, '200', 'Huyện Đầm Hà', 45),
(212, '201', 'Huyện Hải Hà', 45),
(213, '202', 'Huyện Ba Chẽ', 45),
(214, '203', 'Huyện Vân Đồn', 45),
(215, '204', 'Huyện Hoành Bồ', 45),
(216, '205', 'Thị xã Đông Triều', 45),
(217, '206', 'Thị xã Quảng Yên', 45),
(218, '207', 'Huyện Cô Tô', 45),
(219, '227', 'Thành phố Việt Trì', 41),
(220, '228', 'Thị xã Phú Thọ', 41),
(221, '230', 'Huyện Đoan Hùng', 41),
(222, '231', 'Huyện Hạ Hoà', 41),
(223, '232', 'Huyện Thanh Ba', 41),
(224, '233', 'Huyện Phù Ninh', 41),
(225, '234', 'Huyện Yên Lập', 41),
(226, '235', 'Huyện Cẩm Khê', 41),
(227, '236', 'Huyện Tam Nông', 41),
(228, '237', 'Huyện Lâm Thao', 41),
(229, '238', 'Huyện Thanh Sơn', 41),
(230, '239', 'Huyện Thanh Thuỷ', 41),
(231, '240', 'Huyện Tân Sơn', 41),
(232, '243', 'Thành phố Vĩnh Yên', 58),
(233, '244', 'Thị xã Phúc Yên', 58),
(234, '246', 'Huyện Lập Thạch', 58),
(235, '247', 'Huyện Tam Dương', 58),
(236, '248', 'Huyện Tam Đảo', 58),
(237, '249', 'Huyện Bình Xuyên', 58),
(238, '251', 'Huyện Yên Lạc', 58),
(239, '252', 'Huyện Vĩnh Tường', 58),
(240, '253', 'Huyện Sông Lô', 58),
(241, '288', 'Thành phố Hải Dương', 25),
(242, '290', 'Thị xã Chí Linh', 25),
(243, '291', 'Huyện Nam Sách', 25),
(244, '292', 'Huyện Kinh Môn', 25),
(245, '293', 'Huyện Kim Thành', 25),
(246, '294', 'Huyện Thanh Hà', 25),
(247, '295', 'Huyện Cẩm Giàng', 25),
(248, '296', 'Huyện Bình Giang', 25),
(249, '297', 'Huyện Gia Lộc', 25),
(250, '298', 'Huyện Tứ Kỳ', 25),
(251, '299', 'Huyện Ninh Giang', 25),
(252, '300', 'Huyện Thanh Miện', 25),
(253, '303', 'Quận Hồng Bàng', 63),
(254, '304', 'Quận Ngô Quyền', 63),
(255, '305', 'Quận Lê Chân', 63),
(256, '306', 'Quận Hải An', 63),
(257, '307', 'Quận Kiến An', 63),
(258, '308', 'Quận Đồ Sơn', 63),
(259, '309', 'Quận Dương Kinh', 63),
(260, '311', 'Huyện Thuỷ Nguyên', 63),
(261, '312', 'Huyện An Dương', 63),
(262, '313', 'Huyện An Lão', 63),
(263, '314', 'Huyện Kiến Thuỵ', 63),
(264, '315', 'Huyện Tiên Lãng', 63),
(265, '316', 'Huyện Vĩnh Bảo', 63),
(266, '317', 'Huyện Cát Hải', 63),
(267, '323', 'Thành phố Hưng Yên', 28),
(268, '325', 'Huyện Văn Lâm', 28),
(269, '326', 'Huyện Văn Giang', 28),
(270, '327', 'Huyện Yên Mỹ', 28),
(271, '328', 'Huyện Mỹ Hào', 28),
(272, '329', 'Huyện Ân Thi', 28),
(273, '330', 'Huyện Khoái Châu', 28),
(274, '331', 'Huyện Kim Động', 28),
(275, '332', 'Huyện Tiên Lữ', 28),
(276, '333', 'Huyện Phù Cừ', 28),
(277, '336', 'Thành phố Thái Bình', 50),
(278, '338', '-Huyện Quỳnh Phụ', 50),
(279, '339', 'Huyện Hưng Hà', 50),
(280, '340', 'Huyện Đông Hưng', 50),
(281, '341', 'Huyện Thái Thụy', 50),
(282, '342', 'Huyện Tiền Hải', 50),
(283, '343', 'Huyện Kiến Xương', 50),
(284, '344', 'Huyện Vũ Thư', 50),
(285, '347', 'Thành phố Phủ Lý', 23),
(286, '349', 'Huyện Duy Tiên', 23),
(287, '350', 'Huyện Kim Bảng', 23),
(288, '351', 'Huyện Thanh Liêm', 23),
(289, '353', 'Huyện Bình Lục', 23),
(290, '352', 'Huyện Lý Nhân', 23),
(291, '356', 'Thành phố Nam Định', 37),
(292, '358', 'Huyện Mỹ Lộc', 37),
(293, '359', 'Huyện Vụ Bản', 37),
(294, '360', 'Huyện Ý Yên', 37),
(295, '361', 'Huyện Nghĩa Hưng', 37),
(296, '362', 'Huyện Nam Trực', 37),
(297, '363', 'Huyện Trực Ninh', 37),
(298, '364', 'Huyện Xuân Trường', 37),
(299, '365', 'Huyện Giao Thủy', 37),
(300, '366', 'Huyện Hải Hậu', 37),
(301, '369', 'Thành phố Ninh Bình', 39),
(302, '370', 'Thành phố Tam Điệp', 39),
(303, '372', 'Huyện Nho Quan', 39),
(304, '373', 'Huyện Gia Viễn', 39),
(305, '374', 'Huyện Hoa Lư', 39),
(306, '375', 'Huyện Yên Khánh', 39),
(307, '376', 'Huyện Kim Sơn', 39),
(308, '377', 'Huyện Yên Mô', 39),
(309, '380', 'Thành phố Thanh Hóa', 52),
(310, '381', 'Thị xã Bỉm Sơn', 52),
(311, '382', 'Thị xã Sầm Sơn', 52),
(312, '384', 'Huyện Mường Lát', 52),
(313, '385', 'Huyện Quan Hóa', 52),
(314, '386', 'Huyện Bá Thước', 52),
(315, '387', 'Huyện Quan Sơn', 52),
(316, '388', 'Huyện Lang Chánh', 52),
(317, '389', 'Huyện Ngọc Lặc', 52),
(318, '390', 'Huyện Cẩm Thủy', 52),
(319, '391', 'Huyện Thạch Thành', 52),
(320, '392', 'Huyện Hà Trung', 52),
(321, '393', 'Huyện Vĩnh Lộc', 52),
(322, '394', 'Huyện Yên Định', 52),
(323, '395', 'Huyện Thọ Xuân', 52),
(324, '396', 'Huyện Thường Xuân', 52),
(325, '397', 'Huyện Triệu Sơn', 52),
(326, '398', 'Huyện Thiệu Hóa', 52),
(327, '399', 'Huyện Hoằng Hóa', 52),
(328, '400', 'Huyện Hậu Lộc', 52),
(329, '401', 'Huyện Nga Sơn', 52),
(330, '402', 'Huyện Như Xuân', 52),
(331, '403', 'Huyện Như Thanh', 52),
(332, '404', 'Huyện Nông Cống', 52),
(333, '405', 'Huyện Đông Sơn', 52),
(334, '406', 'Huyện Quảng Xương', 52),
(335, '407', 'Huyện Tĩnh Gia', 52),
(336, '412', 'Thành phố Vinh', 38),
(337, '413', 'Thị xã Cửa Lò', 38),
(338, '414', 'Thị xã Thái Hoà', 38),
(339, '415', 'Huyện Quế Phong', 38),
(340, '416', 'Huyện Quỳ Châu', 38),
(341, '417', 'Huyện Kỳ Sơn', 38),
(342, '418', 'Huyện Tương Dương', 38),
(343, '419', 'Huyện Nghĩa Đàn', 38),
(344, '420', 'Huyện Quỳ Hợp', 38),
(345, '421', 'Huyện Quỳnh Lưu', 38),
(346, '422', 'Huyện Con Cuông', 38),
(347, '423', 'Huyện Tân Kỳ', 38),
(348, '424', 'Huyện Anh Sơn', 38),
(349, '425', 'Huyện Diễn Châu', 38),
(350, '426', 'Huyện Yên Thành', 38),
(351, '427', 'Huyện Đô Lương', 38),
(352, '428', 'Huyện Thanh Chương', 38),
(353, '429', 'Huyện Nghi Lộc', 38),
(354, '430', 'Huyện Nam Đàn', 38),
(355, '431', 'Huyện Hưng Nguyên', 38),
(356, '432', 'Thị xã Hoàng Mai', 38),
(357, '436', 'Thành phố Hà Tĩnh', 24),
(358, '437', 'Thị xã Hồng Lĩnh', 24),
(359, '439', 'Huyện Hương Sơn', 24),
(360, '440', 'Huyện Đức Thọ', 24),
(361, '441', 'Huyện Vũ Quang', 24),
(362, '442', 'Huyện Nghi Xuân', 24),
(363, '443', 'Huyện Can Lộc', 24),
(364, '444', 'Huyện Hương Khê', 24),
(365, '445', 'Huyện Thạch Hà', 24),
(366, '446', 'Huyện Cẩm Xuyên', 24),
(367, '447', 'Huyện Kỳ Anh', 24),
(368, '448', 'Huyện Lộc Hà', 24),
(369, '449', 'Thị xã Kỳ Anh', 24),
(370, '450', 'Thành Phố Đồng Hới', 42),
(371, '452', 'Huyện Minh Hóa', 42),
(372, '453', 'Huyện Tuyên Hóa', 42),
(373, '454', 'Huyện Quảng Trạch', 42),
(374, '455', 'Huyện Bố Trạch', 42),
(375, '456', 'Huyện Quảng Ninh', 42),
(376, '457', 'Huyện Lệ Thủy', 42),
(377, '458', 'Thị xã Ba Đồn', 42),
(378, '461', 'Thành phố Đông Hà', 46),
(379, '462', 'Thị xã Quảng Trị', 46),
(380, '464', 'Huyện Vĩnh Linh', 46),
(381, '465', 'Huyện Hướng Hóa', 46),
(382, '466', 'Huyện Gio Linh', 46),
(383, '467', 'Huyện Đa Krông', 46),
(384, '468', 'Huyện Cam Lộ', 46),
(385, '469', 'Huyện Triệu Phong', 46),
(386, '470', 'Huyện Hải Lăng', 46),
(387, '474', 'Thành phố Huế', 53),
(388, '476', 'Huyện Phong Điền', 53),
(389, '477', 'Huyện Quảng Điền', 53),
(390, '478', 'Huyện Phú Vang', 53),
(391, '479', 'Thị xã Hương Thủy', 53),
(392, '480', 'Thị xã Hương Trà', 53),
(393, '481', 'Thị xã Hương Trà', 53),
(394, '482', 'Huyện Phú Lộc', 53),
(395, '483', 'Huyện Nam Đông', 53),
(396, '490', 'Quận Liên Chiểu', 62),
(397, '491', 'Quận Thanh Khê', 62),
(398, '492', 'Quận Hải Châu', 62),
(399, '493', 'Quận Sơn Trà', 62),
(400, '494', 'Quận Ngũ Hành Sơn', 62),
(401, '495', 'Quận Cẩm Lệ', 62),
(402, '497', 'Huyện Hòa Vang', 62),
(403, '502', 'Thành phố Tam Kỳ', 43),
(404, '503', 'Thành phố Hội An', 43),
(405, '504', 'Huyện Tây Giang', 43),
(406, '505', 'Huyện Đông Giang', 43),
(407, '506', 'Huyện Đại Lộc', 43),
(408, '507', 'Thị xã Điện Bàn', 43),
(409, '508', 'Huyện Duy Xuyên', 43),
(410, '509', 'Huyện Quế Sơn', 43),
(411, '510', 'Huyện Nam Giang', 43),
(412, '511', 'Huyện Phước Sơn', 43),
(413, '512', 'Huyện Hiệp Đức', 43),
(414, '513', 'Huyện Thăng Bình', 43),
(415, '514', 'Huyện Tiên Phước', 43),
(416, '515', 'Huyện Bắc Trà My', 43),
(417, '516', 'Huyện Nam Trà My', 43),
(418, '517', 'Huyện Núi Thành', 43),
(419, '518', 'Huyện Phú Ninh', 43),
(420, '519', 'Huyện Nông Sơn', 43),
(421, '522', 'Thành phố Quảng Ngãi', 44),
(422, '524', 'Huyện Bình Sơn', 44),
(423, '525', 'Huyện Trà Bồng', 44),
(424, '526', 'Huyện Tây Trà', 44),
(425, '527', 'Huyện Sơn Tịnh', 44),
(426, '528', 'Huyện Tư Nghĩa', 44),
(427, '529', 'Huyện Sơn Hà', 44),
(428, '530', 'Huyện Sơn Tây', 44),
(429, '531', 'Huyện Minh Long', 44),
(430, '532', 'Huyện Nghĩa Hành', 44),
(431, '533', 'Huyện Mộ Đức', 44),
(432, '534', 'Huyện Đức Phổ', 44),
(433, '535', 'Huyện Ba Tơ', 44),
(434, '536', 'Huyện Lý Sơn', 44),
(435, '540', 'Thành phố Qui Nhơn', 10),
(436, '542', 'Huyện An Lão', 10),
(437, '543', 'Huyện Hoài Nhơn', 10),
(438, '544', 'Huyện Hoài Ân', 10),
(439, '545', 'Huyện Phù Mỹ', 10),
(440, '546', 'Huyện Vĩnh Thạnh', 10),
(441, '547', 'Huyện Tây Sơn', 10),
(442, '548', 'Huyện Phù Cát', 10),
(443, '549', 'Thị xã An Nhơn', 10),
(444, '550', 'Huyện Tuy Phước', 10),
(445, '551', 'Huyện Vân Canh', 10),
(446, '555', 'Thành phố Tuy Hoà', 60),
(447, '557', 'Thị xã Sông Cầu', 60),
(448, '558', 'Huyện Đồng Xuân', 60),
(449, '559', 'Huyện Tuy An', 60),
(450, '560', 'Huyện Sơn Hòa', 60),
(451, '561', 'Huyện Sông Hinh', 60),
(452, '562', 'Huyện Tây Hoà', 60),
(453, '563', 'Huyện Phú Hoà', 60),
(454, '564', 'Huyện Đông Hòa', 60),
(455, '568', 'Thành phố Nha Trang', 29),
(456, '569', 'Thành phố Cam Ranh', 29),
(457, '570', 'Huyện Cam Lâm', 29),
(458, '571', 'Huyện Vạn Ninh', 29),
(459, '572', 'Thị xã Ninh Hòa', 29),
(460, '573', 'Huyện Khánh Vĩnh', 29),
(461, '574', 'Huyện Diên Khánh', 29),
(462, '575', 'Huyện Khánh Sơn', 29),
(463, '576', 'Huyện Trường Sa', 29),
(464, '582', 'Thành phố Phan Rang-Tháp Chàm', 40),
(465, '584', 'Huyện Bác Ái', 40),
(466, '585', 'Huyện Ninh Sơn', 40),
(467, '586', 'Huyện Ninh Hải', 40),
(468, '587', 'Huyện Ninh Phước', 40),
(469, '588', 'Huyện Thuận Bắc', 40),
(470, '589', 'Huyện Thuận Nam', 40),
(471, '593', 'Thành phố Phan Thiết', 13),
(472, '594', 'Thị xã La Gi', 13),
(473, '595', 'Huyện Tuy Phong', 13),
(474, '596', 'Huyện Bắc Bình', 13),
(475, '598', 'Huyện Hàm Thuận Nam', 13),
(476, '599', 'Huyện Tánh Linh', 13),
(477, '600', 'Huyện Đức Linh', 13),
(478, '601', 'Huyện Hàm Tân', 13),
(479, '602', 'Huyện Phú Qui', 13),
(480, '608', 'Thành phố Kon Tum', 31),
(481, '610', 'Huyện Đắk Glei', 31),
(482, '611', 'Huyện Ngọc Hồi', 31),
(483, '612', 'Huyện Đắk Tô', 31),
(484, '613', 'Huyện Kon Plông', 31),
(485, '614', 'Huyện Kon Rẫy', 31),
(486, '615', 'Huyện Đắk Hà', 31),
(487, '616', 'Huyện Sa Thầy', 31),
(488, '617', 'Huyện Tu Mơ Rông', 31),
(489, '622', 'Thành phố Pleiku', 21),
(490, '623', 'Thị xã An Khê', 21),
(491, '624', 'Thị xã Ayun Pa', 21),
(492, '625', 'Huyện KBang', 21),
(493, '626', 'Huyện Đăk Đoa', 21),
(494, '627', 'Huyện Chư Păh', 21),
(495, '628', 'Huyện Ia Grai', 21),
(496, '629', 'Huyện Mang Yang', 21),
(497, '630', 'Huyện Kông Chro', 21),
(498, '631', 'Huyện Đức Cơ', 21),
(499, '632', 'Huyện Chư Prông', 21),
(500, '633', 'Huyện Chư Sê', 21),
(501, '634', 'Huyện Đăk Pơ', 21),
(502, '635', 'Huyện Ia Pa', 21),
(503, '637', 'Huyện Krông Pa', 21),
(504, '638', 'Huyện Phú Thiện', 21),
(505, '639', 'Huyện Chư Pưh', 21),
(506, '643', 'Thành phố Buôn Ma Thuột', 16),
(507, '644', 'Thị Xã Buôn Hồ', 16),
(508, '646', 'Huyện Ea Súp', 16),
(509, '647', 'Huyện Buôn Đôn', 16),
(510, '649', 'Huyện Krông Búk', 16),
(511, '648', 'Huyện Cư M gar', 16),
(512, '645', 'Huyện Ea H leo', 16),
(513, '650', 'Krông Năng', 16),
(514, '651', 'Huyện Ea Kar', 16),
(515, '652', 'Huyện M Đrắk', 16),
(516, '653', 'Huyện Krông Bông', 16),
(517, '654', 'Huyện Krông Pắc', 16),
(518, '655', 'Huyện Krông Pắc', 16),
(519, '656', 'Huyện Lắk', 16),
(520, '657', 'Huyện Cư Kuin', 16),
(521, '660', 'Thị xã Gia Nghĩa', 17),
(522, '661', 'Huyện Đăk Glong', 17),
(523, '662', 'Huyện Cư Jút', 17),
(524, '663', 'Huyện Đắk Mil', 17),
(525, '664', 'Huyện Krông Nô', 17),
(526, '665', 'Huyện Đắk Song', 17),
(527, '666', 'Huyện Đắk R Lấp', 17),
(528, '667', 'Huyện Tuy Đức', 17),
(529, '672', 'Thành phố Đà Lạt', 33),
(530, '673', 'Thành phố Bảo Lộc', 33),
(531, '674', 'Huyện Đam Rông', 33),
(532, '675', 'Huyện Lạc Dương', 33),
(533, '676', 'Huyện Lâm Hà', 33),
(534, '677', 'Huyện Đơn Dương', 33),
(535, '678', 'Huyện Đức Trọng', 33),
(536, '679', 'Huyện Di Linh', 33),
(537, '680', 'Huyện Bảo Lâm', 33),
(538, '681', 'Huyện Đạ Huoai', 33),
(539, '682', 'Huyện Đạ Tẻh', 33),
(540, '683', 'Huyện Cát Tiên', 33),
(541, '688', 'Thị xã Phước Long', 12),
(542, '689', 'Thị xã Đồng Xoài', 12),
(543, '690', 'Thị xã Bình Long', 12),
(544, '691', 'Huyện Bù Gia Mập', 12),
(545, '692', 'Huyện Lộc Ninh', 12),
(546, '693', 'Huyện Bù Đốp', 12),
(547, '694', 'Huyện Hớn Quản', 12),
(548, '695', 'Huyện Đồng Phú', 12),
(549, '696', 'Huyện Bù Đăng', 12),
(550, '697', 'Huyện Chơn Thành', 12),
(551, '698', 'Huyện Phú Riềng', 12),
(552, '703', 'Thành phố Tây Ninh', 49),
(553, '705', 'Huyện Tân Biên', 49),
(554, '706', 'Huyện Tân Châu', 49),
(555, '707', 'Huyện Dương Minh Châu', 49),
(556, '708', 'Huyện Châu Thành', 49),
(557, '709', 'Huyện Hòa Thành', 49),
(558, '710', 'Huyện Gò Dầu', 49),
(559, '711', 'Huyện Bến Cầu', 49),
(560, '712', 'Huyện Trảng Bàng', 49),
(561, '718', 'Thành phố Thủ Dầu Một', 11),
(562, '719', 'Huyện Bàu Bàng', 11),
(563, '720', 'Huyện Dầu Tiếng', 11),
(564, '721', 'Thị xã Bến Cát', 11),
(565, '722', 'Huyện Phú Giáo', 11),
(566, '723', 'Thị xã Tân Uyên', 11),
(567, '724', 'Thị xã Dĩ An', 11),
(568, '725', 'Thị xã Thuận An', 11),
(569, '726', 'Huyện Bắc Tân Uyên', 11),
(570, '731', 'Thành phố Biên Hòa', 19),
(571, '732', 'Thị xã Long Khánh', 19),
(572, '733', 'Huyện Tân Phú', 19),
(573, '735', 'Huyện Vĩnh Cửu', 19),
(574, '736', 'Huyện Định Quán', 19),
(575, '737', 'Huyện Trảng Bom', 19),
(576, '738', 'Huyện Thống Nhất', 19),
(577, '739', 'Huyện Cẩm Mỹ', 19),
(578, '740', 'Huyện Long Thành', 19),
(579, '741', 'Huyện Xuân Lộc', 19),
(580, '742', 'Huyện Nhơn Trạch', 19),
(581, '760', 'Quận 1', 65),
(582, '761', 'Quận 12', 65),
(583, '762', 'Quận Thủ Đức', 65),
(584, '763', 'Quận 9', 65),
(585, '764', 'Quận Gò Vấp', 65),
(586, '765', 'Quận Bình Thạnh', 65),
(587, '766', 'Quận Tân Bình', 65),
(588, '767', 'Quận Tân Phú', 65),
(589, '768', 'Quận Phú Nhuận', 65),
(590, '769', 'Quận 2', 65),
(591, '770', 'Quận 3', 65),
(592, '771', 'Quận 10', 65),
(593, '772', 'Quận 11', 65),
(594, '773', 'Quận 4', 65),
(595, '774', 'Quận 5', 65),
(596, '775', 'Quận 6', 65),
(597, '776', 'Quận 8', 65),
(598, '777', 'Quận Bình Tân', 65),
(599, '778', 'Quận 7', 65),
(600, '783', 'Huyện Củ Chi', 65),
(601, '784', 'Huyện Hóc Môn', 65),
(602, '785', 'Huyện Bình Chánh', 65),
(603, '786', 'Huyện Nhà Bè', 65),
(604, '787', 'Huyện Cần Giờ', 65),
(605, '794', 'Thành phố Tân An', 36),
(606, '795', 'Thị xã Kiến Tường', 36),
(607, '796', 'Huyện Tân Hưng', 36),
(608, '797', 'Huyện Vĩnh Hưng', 36),
(609, '798', 'Huyện Mộc Hóa', 36),
(610, '7800', 'Huyện Thạnh Hóa', 36),
(611, '801', 'Huyện Đức Huệ', 36),
(612, '802', 'Huyện Đức Hòa', 36),
(613, '803', 'Huyện Bến Lức', 36),
(614, '804', 'Huyện Thủ Thừa', 36),
(615, '805', 'Huyện Tân Trụ', 36),
(616, '806', 'Huyện Cần Đước', 36),
(617, '808', 'Huyện Châu Thành', 36),
(618, '807', 'Huyện Cần Giuộc', 36),
(619, '815', 'Thành phố Mỹ Tho', 54),
(620, '816', 'Thị xã Gò Công', 54),
(621, '817', 'Thị xã Cai Lậy', 54),
(622, '818', 'Huyện Tân Phước', 54),
(623, '819', 'Huyện Cái Bè', 54),
(624, '820', 'Huyện Cai Lậy', 54),
(625, '821', 'Huyện Châu Thành', 54),
(626, '822', 'Huyện Chợ Gạo', 54),
(627, '823', 'Huyện Gò Công Tây', 54),
(628, '8234', 'Huyện Gò Công Đông', 54),
(629, '825', 'Huyện Tân Phú Đông', 54),
(630, '815', 'Thành phố Mỹ Tho', 9),
(631, '816', 'Thị xã Gò Công', 9),
(632, '817', 'Thị xã Cai Lậy', 9),
(633, '818', 'Huyện Tân Phước', 9),
(634, '819', 'Huyện Cái Bè', 9),
(635, '820', 'Huyện Cai Lậy', 9),
(636, '821', 'Huyện Châu Thành', 9),
(637, '822', 'Huyện Chợ Gạo', 9),
(638, '823', 'Huyện Gò Công Tây', 9),
(639, '824', 'Huyện Gò Công Đông', 9),
(640, '825', 'Huyện Tân Phú Đông', 9),
(641, '842', 'Thành phố Trà Vinh', 55),
(642, '844', 'Huyện Càng Long', 55),
(643, '845', 'Huyện Cầu Kè', 55),
(644, '846', 'Huyện Tiểu Cần', 55),
(645, '847', 'Huyện Châu Thành', 55),
(646, '848', 'Huyện Cầu Ngang', 55),
(647, '849', 'Huyện Trà Cú', 55),
(648, '850', 'Huyện Duyên Hải', 55),
(649, '851', 'Thị xã Duyên Hải', 55),
(650, '855', 'Thành phố Vĩnh Long', 57),
(651, '857', 'Huyện Long Hồ', 57),
(652, '858', 'Huyện Mang Thít', 57),
(653, '859', 'Huyện Vũng Liêm', 58),
(654, '860', 'Huyện Tam Bình', 57),
(655, '861', 'Thị xã Bình Minh', 57),
(656, '862', 'Huyện Trà Ôn', 57),
(657, '863', 'Huyện Bình Tân', 57),
(658, '866', 'Thành phố Cao Lãnh', 20),
(659, '867', 'Thành phố Sa Đéc', 20),
(660, '868', 'Thị xã Hồng Ngự', 20),
(661, '869', 'Huyện Tân Hồng', 20),
(662, '870', 'Huyện Hồng Ngự', 20),
(663, '871', 'Huyện Tam Nông', 20),
(664, '872', 'Huyện Tháp Mười', 20),
(665, '873', 'Huyện Cao Lãnh', 20),
(666, '874', 'Huyện Thanh Bình', 20),
(667, '875', 'Huyện Lấp Vò', 20),
(668, '876', 'Huyện Lai Vung', 20),
(669, '877', 'Huyện Châu Thành', 20),
(670, '899', 'Thành phố Rạch Giá', 30),
(671, '900', 'Thị xã Hà Tiên', 30),
(672, '902', 'Huyện Kiên Lương', 30),
(673, '903', 'Huyện Hòn Đất', 30),
(674, '904', 'Huyện Tân Hiệp', 30),
(675, '905', 'Huyện Châu Thành', 30),
(676, '907', 'Huyện Gò Quao', 30),
(677, '906', 'Huyện Giồng Riềng', 30),
(678, '908', 'Huyện An Biên', 30),
(679, '909', 'Huyện An Minh', 30),
(680, '910', 'Huyện Vĩnh Thuận', 30),
(681, '911', 'Huyện Phú Quốc', 30),
(682, '912', 'Huyện Kiên Hải', 30),
(683, '913', 'Huyện U Minh Thượng', 30),
(684, '914', 'Huyện Giang Thành', 30),
(685, '916', 'Quận Ninh Kiều', 61),
(686, '917', 'Quận Ô Môn', 61),
(687, '918', 'Quận Bình Thuỷ', 61),
(688, '919', 'Quận Cái Răng', 61),
(689, '923', 'Quận Thốt Nốt', 60),
(690, '924', 'Huyện Vĩnh Thạnh', 61),
(691, '925', 'Huyện Cờ Đỏ', 61),
(692, '926', 'Huyện Phong Điền', 61),
(693, '927', 'Huyện Thới Lai', 61),
(694, '930', 'Thành phố Vị Thanh', 26),
(695, '931', 'Thị xã Ngã Bảy', 26),
(696, '932', 'Huyện Châu Thành A', 26),
(697, '933', 'Huyện Châu Thành', 26),
(698, '934', 'Huyện Phụng Hiệp', 26),
(699, '935', 'Huyện Vị Thuỷ', 26),
(700, '936', 'Huyện Long Mỹ', 26),
(701, '937', 'Thị xã Long Mỹ', 26),
(702, '941', 'Thành phố Sóc Trăng', 47),
(703, '942', 'Huyện Châu Thành', 47),
(704, '943', 'Huyện Kế Sách', 47),
(705, '944', 'Huyện Mỹ Tú', 47),
(706, '945', 'Huyện Cù Lao Dung', 47),
(707, '946', 'Huyện Long Phú', 47),
(708, '947', 'Huyện Mỹ Xuyên', 47),
(709, '948', 'Thị xã Ngã Năm', 47),
(710, '949', 'Huyện Thạnh Trị', 47),
(711, '950', 'Thị xã Vĩnh Châu', 47),
(712, '951', 'Huyện Trần Đề', 47),
(713, '964', 'Thành phố Cà Mau', 14),
(714, '966', 'Huyện U Minh', 14),
(715, '968', 'Huyện Trần Văn Thời', 14),
(716, '969', 'Huyện Cái Nước', 14),
(717, '967', 'Huyện Thới Bình', 15),
(718, '970', 'Huyện Đầm Dơi', 14),
(719, '971', 'Huyện Năm Căn', 14),
(720, '972', 'Huyện Phú Tân', 14),
(721, '973', 'Huyện Ngọc Hiển', 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_information`
--

CREATE TABLE `tb_information` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_information`
--

INSERT INTO `tb_information` (`id`, `name`, `value`) VALUES
(1, 'name', 'Fashion'),
(2, 'description', 'Thương hiệu thời trang nam fashion Chuyên các dòng sản phẩm thời trang nam nữ: Quần jean, quần tây, quần kaki, áo sơ mi, áo khoác, áo vest, áo thun, phụ kiện nam,...'),
(3, 'logo_header', 'image/logo3.jpg'),
(4, 'logo_footer', 'image/logo3.jpg'),
(5, 'email', ' ngoktksnb@gmail.com'),
(6, 'phone', ' 0354146537 0787023467'),
(7, 'adress', '$%^$%^55 giải phóng'),
(15, 'slider', 'image/sl6.jpg image/sl5.jpg image/sl2.jpg image/sl7.jpg'),
(16, 'fb', 'https://www.facebook.com/profile.php?id=100035233270076'),
(17, 'image_1', 'image/slide-1-trang-chu-slide-1.jpg'),
(18, 'category_1', '17'),
(19, 'image_2', 'image/slide-2-trang-chu-slide-2.jpg'),
(20, 'category_2', '22'),
(21, 'image_3', 'image/slide-3-trang-chu-slide-3.jpg'),
(22, 'category_3', '23'),
(23, 'image_4', 'image/slide-4-trang-chu-slide-4.jpg'),
(24, 'category_4', '18'),
(25, 'gioithieu', '<p>Thương hiệu thời trang &quot;Fashion&quot; được th&agrave;nh lập từ th&aacute;ng 3 năm 2024, l&agrave; một trong những thương hiệu thời trang nam uy t&iacute;n h&agrave;ng đầu v&agrave; c&oacute; độ phổ biến tại Việt Nam. Với sự quản l&yacute; chặt chẽ, chuy&ecirc;n nghiệp từ đội ngũ quản l&yacute;; sự s&aacute;ng tạo kh&ocirc;ng ngừng từ bộ phận thiết kế v&agrave; l&ograve;ng tận t&acirc;m của nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng, &quot;Fashion&quot; đ&atilde; v&agrave; đang trở th&agrave;nh biểu tượng của phong c&aacute;ch thời trang nam đương đại.</p>\r\n\r\n<p>&quot;Fashion&quot; lu&ocirc;n đặt niềm tin rằng thời trang l&agrave; một h&agrave;nh tr&igrave;nh kh&ocirc;ng ngừng t&igrave;m kiếm v&agrave; s&aacute;ng tạo. Mỗi sản phẩm của &quot;Fashion&quot; được thiết kế ri&ecirc;ng, mang đến sự trẻ trung v&agrave; hiện đại, hấp dẫn nhất cho cộng đồng người y&ecirc;u thời trang nam. Từ &aacute;o sơ mi, &aacute;o thun, &aacute;o kho&aacute;c, &aacute;o vest, quần jean, quần t&acirc;y đến c&aacute;c phụ kiện thời trang đa dạng, &quot;Fashion&quot; cam kết mang đến sự đa dạng v&agrave; phong c&aacute;ch cho mọi qu&yacute; &ocirc;ng.</p>\r\n\r\n<p>&quot;Fashion&quot; kh&ocirc;ng chỉ ch&uacute; trọng v&agrave;o việc thiết kế, m&agrave; c&ograve;n lu&ocirc;n đặt lợi &iacute;ch v&agrave; quyền lợi của kh&aacute;ch h&agrave;ng l&ecirc;n h&agrave;ng đầu. Điều n&agrave;y được thể hiện qua việc cung cấp những sản phẩm thời trang chất lượng, mới lạ v&agrave; đẹp mắt, nhưng với mức gi&aacute; cạnh tranh v&agrave; hấp dẫn nhất tr&ecirc;n thị trường.</p>\r\n\r\n<p>Ng&agrave;y nay, thương hiệu thời trang nam &quot;Fashion&quot; kh&ocirc;ng chỉ l&agrave; một c&aacute;i t&ecirc;n, m&agrave; l&agrave; một hệ thống cửa h&agrave;ng rộng lớn với nhiều chi nh&aacute;nh tại TPHCM, Đồng Nai v&agrave; Vũng T&agrave;u. Hệ thống b&aacute;n h&agrave;ng online của &quot;Fashion&quot; gi&uacute;p kh&aacute;ch h&agrave;ng mua sắm một c&aacute;ch thuận tiện v&agrave; dễ d&agrave;ng, với dịch vụ giao h&agrave;ng tận nơi tr&ecirc;n to&agrave;n quốc.</p>\r\n\r\n<p>Đến với &quot;Fashion,&quot; ch&uacute;ng t&ocirc;i cam kết tạo ra trải nghiệm mua sắm th&uacute; vị, tư vấn tận t&acirc;m v&agrave; gi&uacute;p kh&aacute;ch h&agrave;ng t&igrave;m được những sản phẩm ph&ugrave; hợp với phong c&aacute;ch v&agrave; c&aacute; nh&acirc;n của họ, đồng thời g&oacute;p phần tạo n&ecirc;n phong c&aacute;ch thời trang ri&ecirc;ng biệt v&agrave; ấn tượng.</p>\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_label`
--

CREATE TABLE `tb_label` (
  `id_label` int(11) NOT NULL,
  `code_label` char(10) NOT NULL,
  `name_label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `tb_label`
--

INSERT INTO `tb_label` (`id_label`, `code_label`, `name_label`) VALUES
(23, 'Gucci', 'Gucci'),
(24, 'Burberry', 'Burberry'),
(25, 'Nike', 'Nike'),
(26, 'Adidas', 'Adidas'),
(27, 'Converse', 'Converse'),
(28, 'LouisVuitt', 'Louis Vuitton'),
(29, 'Prada', 'Prada'),
(30, 'Versace', 'Versace'),
(31, 'Dior', 'Dior'),
(33, 'ngo', 'Ngọ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL,
  `code_order` char(10) NOT NULL,
  `status_order` char(2) NOT NULL,
  `id_product` int(11) NOT NULL,
  `size_product` char(255) NOT NULL,
  `quantity_product` int(5) NOT NULL,
  `name_customer` varchar(255) NOT NULL,
  `phone_customer` char(11) NOT NULL,
  `address_customer` text NOT NULL,
  `email_customer` char(255) NOT NULL,
  `order_day` datetime NOT NULL,
  `id_district` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `code_order`, `status_order`, `id_product`, `size_product`, `quantity_product`, `name_customer`, `phone_customer`, `address_customer`, `email_customer`, `order_day`, `id_district`) VALUES
(121, '5833923', '1', 138, 'M', 1, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'ngoktksnb@gmail.com', '2024-05-01 22:58:49', 521),
(122, '4346779', '1', 119, '27', 1, 'Trần Văn Ngọ', '0353055782', '14, nam', 'ngoktksnb@gmail.com', '2024-05-01 23:02:00', 686),
(123, '596224', '1', 124, 'M', 1, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'ngoktksnb@gmail.com', '2024-05-02 01:11:21', 517),
(124, '4800031', '1', 129, 'M', 1, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'ngoktksnb@gmail.com', '2024-05-02 01:20:12', 25),
(125, '7216407', '1', 201, 's', 1, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'ngoktksnb@gmail.com', '2024-05-02 01:29:00', 475),
(126, '7263471', '1', 124, 'M', 1, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'ngoktksnb@gmail.com', '2024-05-02 01:47:49', 102),
(127, '9595402', '1', 140, 'S', 1, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'ngoktksnb@gmail.com', '2024-05-02 02:02:14', 106),
(128, '4611640', '1', 204, 's', 1, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'ngoktksnb@gmail.com', '2024-05-02 02:08:00', 24),
(129, '5749283', '1', 124, 'M', 1, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'ngoktksnb@gmail.com', '2024-05-02 02:13:04', 561),
(130, '3705021', '1', 151, 'S', 1, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'tranvanngo12nbm@gmail.com', '2024-05-02 02:13:30', 686),
(131, '2252621', '1', 176, 'S', 2, 'Trần Văn Ngọ', '0353055782', '14, kim tân', 'ngo147665@huce.edu.vn', '2024-05-02 02:13:57', 686),
(135, '2639272', '1', 279, 'xxl', 1, 'Trần Văn Ngọ', '0353055782', '  14, kim tân', 'ngo147665@huce.edu.vn', '2024-05-05 00:51:00', 307);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_product`
--

CREATE TABLE `tb_product` (
  `id_product` int(11) NOT NULL,
  `code_product` char(10) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_label` int(11) NOT NULL,
  `image` text NOT NULL,
  `image_thump` text NOT NULL,
  `price_product` int(11) NOT NULL,
  `saleprice_product` int(11) NOT NULL,
  `describe_product` text NOT NULL,
  `size_product` char(255) NOT NULL,
  `view_product` int(11) NOT NULL,
  `date_product` date NOT NULL,
  `status_product` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_product`
--

INSERT INTO `tb_product` (`id_product`, `code_product`, `name_product`, `id_category`, `id_label`, `image`, `image_thump`, `price_product`, `saleprice_product`, `describe_product`, `size_product`, `view_product`, `date_product`, `status_product`) VALUES
(119, 'N5274', 'Áo sơ mi Raw cloth ', 175, 23, 'upload/resize/1cf0c113df81d4021afaa5ccb575de15_thump.jpg upload/2cd593b4f89d2c0cdb4b81be47767344.jpg', 'upload/resize/1cf0c113df81d4021afaa5ccb575de15_thump.jpg upload/resize/2cd593b4f89d2c0cdb4b81be47767344_thump.jpg', 250000, 350000, '- Áo cổ đức\r\n\r\n- Thiết kế tay cộc\r\n\r\n- Có khuy cài\r\n\r\n- Kiểu dáng Regular\r\n\r\n- Chất liệu Raw cloth và oxford\r\n\r\n- Thấm hút mồ hôi tốt\r\n\r\n- Chống nhăn hiệu quả\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 185 cm\r\n\r\nCân nặng: 70 kg\r\n\r\nSố đo 3 vòng: 92-78-98 cm\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua màn hình máy tính/ điện thoại.', 'a:6:{i:27;i:9;i:28;s:2:\"10\";i:29;s:2:\"10\";i:30;s:2:\"10\";i:31;i:9;i:32;s:2:\"10\";}', 3, '2024-04-20', '1'),
(120, 'N901', 'Áo sơ mi cổ đức', 175, 25, 'upload/resize/267e5eac6709fbf91113564856ce4adf_thump.jpg upload/3a.jpg upload/3b.jpg upload/3c.jpg', 'upload/resize/267e5eac6709fbf91113564856ce4adf_thump.jpg upload/resize/3a_thump.jpg upload/resize/3b_thump.jpg upload/resize/3c_thump.jpg', 100000, 150000, 'Áo sơ mi cổ Đức kiểu dáng Regular fit ôm vừa vặn cơ thể nhưng vẫn mang lại sự thoải mái. Thiết kế cổ tay lịch lãm, mát mẻ rất dễ phối đồ mang lại vẻ ngoài lịch sự.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 175 cm\r\n\r\nCân nặng: 70 kg\r\n\r\nSố đo 3 vòng:98-75-97 cm\r\n\r\nMẫu mặc size L\r\n\r\n', 'a:4:{s:1:\"m\";i:9;s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 5, '2024-04-20', '1'),
(122, 'N9725', 'Resort Shirt', 175, 28, 'upload/resize/dd019096c8f1bf1ff43985247b2bb782_thump.jpg upload/2a.jpg upload/2b.jpg upload/2c.jpg', 'upload/resize/dd019096c8f1bf1ff43985247b2bb782_thump.jpg upload/resize/2a_thump.jpg upload/resize/2b_thump.jpg upload/resize/2c_thump.jpg', 100000, 110000, '- Thiết kế áo sơ mi kiểu dáng Regular cổ đức khỏe khoắn, thời trang, hiện đại. \r\n\r\n- Lựa chọn gam màu basic dễ dàng phối với nhiều kiểu áo và quần khác nhau. \r\n\r\n- Sử dụng chất liệu thô cao cấp mang đến cảm giác mặc thoải mái nhất trong ngày hè oi nóng. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 185 cm\r\n\r\nCân nặng: 70 kg\r\n\r\nSố đo 3 vòng: 92-78-98 cm\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua màn hình máy tính/ điện thoại.', 'a:4:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";i:27;i:-1;}', 4, '2024-04-20', '1'),
(124, 'N9972', ' ÁO SƠ MI LỤA', 187, 26, 'upload/resize/ab7abb931ca792f3d978c32be34e0833_thump.jpg upload/5.jpg upload/5b.jpg upload/5c.jpg', 'upload/resize/ab7abb931ca792f3d978c32be34e0833_thump.jpg upload/resize/5_thump.jpg upload/resize/5b_thump.jpg upload/resize/5c_thump.jpg', 200000, 235000, 'Đón Xuân - Hè qua dòng chất liệu lụa cao cấp để cảm nhận sự mềm mại, nhẹ nhàng trên từng điểm chạm. Dark Beige Set được tạo nên từ thiết kế sơ mi cổ điển bên cạnh dáng chân váy xếp ly thời thượng. \r\n\r\nÁo sơ mi cổ đức, ngắn tay gập gấu cách điệu, thân trước cố đính qua hàng khuy kim loại sang trọng. Chân váy xếp ly độ dài qua gối, tạo độ bồng nhẹ, đặc biệt che khuyết điểm cực tốt.  \r\n\r\nThiết kế trẻ trung, hiện đại nhưng vẫn thời thượng và sang trọng dành cho nàng công sở thêm vào tủ đồ Xuân - Hè của mình.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua màn hình máy tính/ điện thoại.', 'a:4:{s:1:\"m\";s:1:\"3\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 30, '2024-04-20', '1'),
(125, 'N6657', 'ÁO SƠ MI HỌA TIẾT CROPTOP', 189, 27, 'upload/resize/454bcbe33fc16550d5775c6cadbab480_thump.jpg upload/4.jpg upload/2.jpg upload/ncr1.jpg upload/ncr1.jpg', 'upload/resize/454bcbe33fc16550d5775c6cadbab480_thump.jpg upload/resize/4_thump.jpg upload/resize/2_thump.jpg upload/resize/ncr1_thump.jpg upload/resize/ncr1_thump.jpg', 100000, 130000, 'Áo sơ mi được làm từ chất liệu Batiste in họa tiết nét vẽ, có độ mềm mại, tạo sự sang trọng và thoải mái khi mặc.\r\n\r\nThiết kế cổ 2 ve, tay ngắn, kiểu dáng croptop năng động, trẻ trung. \r\n\r\nVới nền họa tiết bắt mắt, cùng kiểu dáng trẻ trung, thích hợp để nàng diện trong nhiều dịp khác nhau. \r\n\r\n', 'a:4:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 7, '2024-04-20', '1'),
(129, 'N4682', 'ÁO TENCEL DẬP NỔI', 187, 25, 'upload/resize/50c3fff915cb3f7d268357b686bc1ace_thump.jpg upload/57c2e8ee9ca5cda264ea671f2bd78378.jpg upload/0280ac3f9a66bb50a4a6934ebc124747.jpg upload/1.jpg', 'upload/resize/50c3fff915cb3f7d268357b686bc1ace_thump.jpg upload/resize/57c2e8ee9ca5cda264ea671f2bd78378_thump.jpg upload/resize/0280ac3f9a66bb50a4a6934ebc124747_thump.jpg upload/resize/1_thump.jpg', 142000, 200000, 'Thiết kế áo suông, không tay. Cổ V cách điệu cùng dây buộc phần cổ. Phần vai và tay áo cánh tiên được viền nhấn bèo chun. Chất liệu lụa phù hợp cho thời tiết ngày hè.\r\n\r\nThiết kế áo kiểu không tay luôn được các quý cô ưu ái mỗi khi hè sang. Chất liệu lụa nhẹ nhàng với họa tiết dập nổi mang đến vẻ đẹp sang trọng, tinh tế. Điểm nhấn giúp cho chiếc áo trở nên nổi bật hơn là phần bèo nhún trên vai, góp phần tạo nên vẻ ngoài nữ tính, duyên dáng cho phái đẹp.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:3:{s:1:\"s\";s:1:\"0\";s:1:\"m\";s:1:\"0\";s:1:\"l\";s:1:\"0\";}', 12, '2024-04-20', '0'),
(132, 'N259', 'Áo sơ mi tay cộc cổ đức', 175, 24, 'upload/resize/1asmn_thump.jpg upload/2asmn.jpg upload/3asmn.jpg upload/4asmn.jpg upload/5asmn.jpg', 'upload/resize/1asmn_thump.jpg upload/resize/2asmn_thump.jpg upload/resize/3asmn_thump.jpg upload/resize/4asmn_thump.jpg upload/resize/5asmn_thump.jpg', 100000, 150000, '- Thiết kế sơ mi nam cộc tay đẹp và thời trang, phù hợp với những người yêu thích phong cách lịch sự nhưng không kém phần thoải mái.\r\n\r\n- Áo có kiểu dáng regular rộng rãi, mang lại cảm giác dễ chịu cho người mặc sơ mi. Điểm nhấn là họa tiết kẻ tinh tế, tạo nên sự trẻ trung và năng động.\r\n\r\n- Với chất vải thô, sản phẩm có độ bền cao và dễ dàng chăm sóc, giúp cho người mặc có thể thoải mái sử dụng trong nhiều hoàn cảnh khác nhau, từ công sở đến các sự kiện thường ngày. \r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua màn hình máy tính/ điện thoại.', 'a:3:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 7, '2024-04-24', '1'),
(134, 'N4231', 'ÁO SƠ MI TAY CÁNH TIÊN', 187, 26, 'upload/smna2.jpg upload/smna3.jpg upload/smna4.jpg upload/smna5.jpg', 'upload/resize/smna2_thump.jpg upload/resize/smna3_thump.jpg upload/resize/smna4_thump.jpg upload/resize/smna5_thump.jpg', 100000, 130000, 'Áo sơ mi cổ tròn dáng xuông. Tay liền tạo kiểu cánh tiên mềm mại kết hợp các đường xếp ly nhỏ, tinh tế thể hiện vẻ đẹp dịu dàng.  \r\n\r\nThết kế áo sơ mi nữ với chất liệu lụa bóng mềm mại, thoáng mát, kiểu dáng áo xuông rộng rãi. Mẫu áo vừa tôn lên nét đẹp thanh lịch vừa mang nét đẹp trẻ trung, năng động phù hợp với thời tiết ngày hè. Nàng có thể dễ dàng kết hợp mãu áo sơ mi này cùng chân váy, quần sooc hoặc quần jeans để diện đi làm.', 'a:2:{s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";}', 2, '2024-04-24', '1'),
(135, 'N5253', 'ÁO SƠ MI PEPLUM VAI KIỂU', 187, 25, 'upload/resize/smnb1_thump.jpg upload/smnb2.jpg upload/smnb3.jpg upload/smnb4.jpg upload/smnb5.jpg', 'upload/resize/smnb1_thump.jpg upload/resize/smnb2_thump.jpg upload/resize/smnb3_thump.jpg upload/resize/smnb4_thump.jpg upload/resize/smnb5_thump.jpg', 100000, 125000, 'Thiết kế áo sơ mi mềm mại, nhẹ nhàng, thích hợp diện trong mùa Xuân - Hè. \r\n\r\nCổ áo được may nếp ly, mang đến vẻ nền nã và nữ tính cho thiết kế. Điểm nhấn đặc biệt là chi tiết xếp vai lệch cùng phần Peplum tinh tế, giúp tôn lên vòng eo thon gọn và làm nổi bật cho vẻ đẹp của sản phẩm.\r\n\r\nSản phẩm được kết hợp từ 2 dòng chất liệu Tencel, Rayon cao cấp mang đến bề mặt mịn màng, mềm mại, mượt và bóng. Có độ co giãn nhẹ, thấm hút mồ hôi tốt, thoáng mát, dễ chịu\r\n\r\nÁo có thể được kết hợp với nhiều trang phục và phụ kiện khác nhau. Bạn có thể phối nó với một chiếc chân váy midi hoặc quần cạp cao để tạo nên một bộ trang phục thanh lịch và nữ tính. Nếu muốn tạo ra một phong cách cá nhân và thời trang hơn, hãy kết hợp áo với một đôi quần jeans và giày cao gót.', 'a:5:{s:1:\"s\";s:1:\"1\";s:1:\"m\";s:1:\"1\";s:1:\"l\";s:1:\"1\";s:2:\"xl\";s:1:\"1\";s:3:\"xxl\";s:1:\"1\";}', 0, '2024-04-24', '1'),
(136, 'N1207', 'Sơ Mi WHITE WOVEN ', 187, 26, 'upload/resize/smnc1_thump.jpg upload/smnc2.jpg upload/smnc3.jpg upload/smnc4.jpg upload/smnc5.jpg', 'upload/resize/smnc1_thump.jpg upload/resize/smnc2_thump.jpg upload/resize/smnc3_thump.jpg upload/resize/smnc4_thump.jpg upload/resize/smnc5_thump.jpg', 100000, 140000, 'White Woven là sản phẩm thời trang sành điệu và nổi bật được phối hợp giữa áo sơ mi kiểu và chân váy ngắn chữ A. Chất liệu vải Tencel đồng bộ tạo cảm giác mềm mại và rất dễ chịu khi mặc.\r\n\r\nÁo của Woven set với thiết kế cổ đức cùng điểm nhấn nổi bật là phần xếp ly vai tạo sự quyến rũ và thu hút.\r\n\r\nChân váy được may theo dáng chữ A, có độ dài trên gối mang đến sự trẻ trung và năng động. Phía sau chân váy được trang bị khoá kéo tiện dụng, cùng đường may dây đan xen ở cạp tạo điểm nhấn, giúp bộ đồ trở nên phá cách và cá tính hơn.\r\n\r\nWhite Woven là sự kết hợp hoàn hảo giữa sự tinh tế và phong cách thời trang hiện đại, phù hợp với nhiều dịp khác nhau như đi chơi, dạo phố, hẹn hò hay dự tiệc.', 'a:5:{s:1:\"s\";s:1:\"1\";s:1:\"m\";s:1:\"1\";s:1:\"l\";s:1:\"1\";s:2:\"xl\";s:1:\"1\";s:3:\"xxl\";s:1:\"1\";}', 1, '2024-04-24', '1'),
(137, 'N1909', 'SƠ MI HỌA TIẾT REN', 187, 25, 'upload/resize/smnd1_thump.jpg upload/smnd2.jpg upload/smnd3.jpg upload/smnd4.jpg upload/smnd5.jpg', 'upload/resize/smnd1_thump.jpg upload/resize/smnd2_thump.jpg upload/resize/smnd3_thump.jpg upload/resize/smnd4_thump.jpg upload/resize/smnd5_thump.jpg', 100000, 130000, 'Với sự kết hợp tuyệt vời giữa chất liệu cao cấp, kiểu dáng thoải mái nhưng không kém phần nổi bật nhờ những họa tiết ren đẹp mắt, chiếc áo sơ mi sẽ giúp người diện trở nên nổi bật và tự tin hơn trong mọi dịp.\r\n\r\nChất liệu sợi vải mềm mịn, thoáng mát được tuyển chọn cẩn thận để đảm bảo sự thoải mái tuyệt đối khi mặc vào. Kiểu dáng áo dài thướt tha sẽ tôn lên vẻ đẹp sang trọng. Đặc biệt, hoa văn ren được điểm trên thân áo, may nổi trên nền vải sẽ tăng thêm vẻ nhã nhặn và quý phái cho chiếc áo.\r\n\r\nNhờ thiết kế tỉ mỉ đến từng đường may, hàng khuy đính kèm, đây sẽ là lựa chọn hoàn hảo cho các buổi tiệc, sự kiện hay những buổi gặp gỡ công việc hoặc cuộc hẹn cuối tuần.', 'a:4:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:1:\"0\";}', 4, '2024-04-24', '1'),
(138, 'N9863', 'SƠ MI HỌA TIẾT REN', 187, 26, 'upload/resize/smne1_thump.jpg upload/smne2.jpg upload/smne3.jpg upload/smne4.jpg', 'upload/resize/smne1_thump.jpg upload/resize/smne2_thump.jpg upload/resize/smne3_thump.jpg upload/resize/smne4_thump.jpg', 100000, 135000, 'Với sự kết hợp tuyệt vời giữa chất liệu cao cấp, kiểu dáng thoải mái nhưng không kém phần nổi bật nhờ những họa tiết ren đẹp mắt, chiếc áo sơ mi sẽ giúp người diện trở nên nổi bật và tự tin hơn trong mọi dịp.\r\n\r\nChất liệu sợi vải mềm mịn, thoáng mát được tuyển chọn cẩn thận để đảm bảo sự thoải mái tuyệt đối khi mặc vào. Kiểu dáng áo dài thướt tha sẽ tôn lên vẻ đẹp sang trọng. Đặc biệt, hoa văn ren được điểm trên thân áo, may nổi trên nền vải sẽ tăng thêm vẻ nhã nhặn và quý phái cho chiếc áo.\r\n\r\nNhờ thiết kế tỉ mỉ đến từng đường may, hàng khuy đính kèm, đây sẽ là lựa chọn hoàn hảo cho các buổi tiệc, sự kiện hay những buổi gặp gỡ công việc hoặc cuộc hẹn cuối tuần.', 'a:5:{s:1:\"s\";s:1:\"1\";s:1:\"m\";i:0;s:1:\"l\";s:1:\"1\";s:2:\"xl\";s:1:\"0\";s:3:\"xxl\";s:1:\"0\";}', 2, '2024-04-24', '1'),
(139, 'N5132', 'ÁO THUN ÔM CÁCH ĐIỆU', 188, 31, 'upload/resize/atna1_thump.jpg upload/atna2.jpg upload/atna3.jpg upload/atna4.jpg upload/atna5.jpg', 'upload/resize/atna1_thump.jpg upload/resize/atna2_thump.jpg upload/resize/atna3_thump.jpg upload/resize/atna4_thump.jpg upload/resize/atna5_thump.jpg', 100000, 170000, 'Áo thun tay ngắn, cổ tròn, kiểu dáng ôm và độ dài thường. \r\n\r\nThiết kế tạo điểm nhấn nổi bật ở thân trước với phần tạo các đường gợn sóng ôm boby, tăng vẻ đẹp quyến rũ. \r\n\r\nCó thể thoải mái mix match mẫu áo kiểu này với nhiều món đồ thời trang khác nhau mà vẫn đẹp, sành điệu khi xuống phố. ', 'a:5:{s:1:\"s\";s:1:\"1\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-24', '1'),
(140, 'N6131', 'ÁO THUN ĐÍNH CHỮ BLINK', 188, 23, 'upload/resize/atnb1_thump.jpg upload/atnb2.jpg upload/atnb3.jpg upload/atnb4.jpg upload/atnb5.jpg', 'upload/resize/atnb1_thump.jpg upload/resize/atnb2_thump.jpg upload/resize/atnb3_thump.jpg upload/resize/atnb4_thump.jpg upload/resize/atnb5_thump.jpg', 100000, 145000, ' Thiết kế áo thun nổi bật với hàng chữ đính lấp lánh, tạo hiệu ứng bắt mắt. \r\n\r\n- Áo cổ tròn, dáng suông với gam  màu pastel sáng da.\r\n\r\n- Chất liệu cotton cao cấp, tạo cảm giác thoải mái khi mặc. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua màn hình máy tính/ điện thoại.', 'a:5:{s:1:\"s\";i:0;s:1:\"m\";s:1:\"1\";s:1:\"l\";s:1:\"1\";s:2:\"xl\";s:1:\"1\";s:3:\"xxl\";s:1:\"1\";}', 2, '2024-04-24', '1'),
(141, 'N2231', 'ÁO THUN CỔ V XẾP CHÉO', 188, 25, 'upload/resize/atnc1_thump.jpg upload/atnc2.jpg upload/atnc4.jpg upload/atnc5.jpg', 'upload/resize/atnc1_thump.jpg upload/resize/atnc2_thump.jpg upload/resize/atnc4_thump.jpg upload/resize/atnc5_thump.jpg', 100000, 145000, 'Áo thun cổ V cá tính, thiết kế xếp chéo tạo điểm nhấn thời trang và hiện đại.\r\n\r\nThiết kế ôm body, tôn lên vóc dáng người mặc. Sử dụng chất liệu thun cao cấp, tạo cảm giác thoải mái, thoáng mát trong thời tiết Xuân Hè. \r\n\r\nKết hợp áo với chân váy hoặc quần jeans để có set đồ xuống phố năng động. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:1:\"4\";s:1:\"m\";s:1:\"0\";s:1:\"l\";s:1:\"0\";s:2:\"xl\";s:1:\"0\";s:3:\"xxl\";s:1:\"0\";}', 0, '2024-04-24', '1'),
(142, 'N7757', 'ÁO THUN ÔM THIẾT KẾ DÂY', 188, 26, 'upload/resize/atnd1_thump.jpg upload/atnd2.jpg upload/atnd3.jpg upload/atnd4.jpg upload/atnd5.jpg', 'upload/resize/atnd1_thump.jpg upload/resize/atnd2_thump.jpg upload/resize/atnd3_thump.jpg upload/resize/atnd4_thump.jpg upload/resize/atnd5_thump.jpg', 100000, 157000, 'Làm mới tủ đồ thun hè với thiết kế áo kiểu thời trang dễ dàng kết hợp cùng quần Tây và chân váy để tạo nên set đồ xu hướng.\r\n\r\nThiết kế lựa chọn chất liệu thun đặc biệt thích hợp cho ngày hè oi nóng để mang đến trải nghiệm mặc thoáng mát, dễ chịu.\r\n\r\nÁo tạo kiểu ôm body với 1 bên sườn rút dây điều chỉnh. Tổng thể nhẹ nhàng nhưng vẫn quyến rũ, giúp nàng toát lên nét đẹp kiêu sa, thời thượng. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-24', '1'),
(143, 'N3228', 'ÁO THUN LEN ÔM TAY NGẮN', 188, 29, 'upload/resize/atne1_thump.jpg upload/atne2.jpg upload/atne3.jpg upload/atne4.jpg upload/atne5.jpg', 'upload/resize/atne1_thump.jpg upload/resize/atne2_thump.jpg upload/resize/atne3_thump.jpg upload/resize/atne4_thump.jpg upload/resize/atne5_thump.jpg', 100000, 145000, 'Sự kết hợp tinh tế giữa kiểu dáng và chất liệu đã tôn lên vẻ đẹp tinh tế cho người mặc. Áo len ngắn tay được thiết kế với chất liệu len chọn lọc cao cấp, tạo nên hình ảnh mềm mại và sang trọng.\r\n\r\nChiếc áo sẽ là lựa chọn hoàn hảo cho những buổi đi chơi, dạo phố hay hẹn hò cùng bạn bè, gia đình. Thiết kế đa năng này còn có thể kết hợp với quần suông, baggy hoặc chân váy để tạo nên nhiều phong cách thời trang khác nhau.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-24', '1'),
(144, 'N8915', 'ÁO THUN LEN ÔM TAY NGẮN', 188, 29, 'upload/resize/atnf1_thump.jpg upload/atnf2.jpg upload/atnf3.jpg upload/atnf4.jpg upload/atnf5.jpg', 'upload/resize/atnf1_thump.jpg upload/resize/atnf2_thump.jpg upload/resize/atnf3_thump.jpg upload/resize/atnf4_thump.jpg upload/resize/atnf5_thump.jpg', 100000, 147000, 'Sự kết hợp tinh tế giữa kiểu dáng và chất liệu đã tôn lên vẻ đẹp tinh tế cho người mặc. Áo len ngắn tay được thiết kế với chất liệu len chọn lọc cao cấp, tạo nên hình ảnh mềm mại và sang trọng.\r\n\r\nChiếc áo sẽ là lựa chọn hoàn hảo cho những buổi đi chơi, dạo phố hay hẹn hò cùng bạn bè, gia đình. Thiết kế đa năng này còn có thể kết hợp với quần suông, baggy hoặc chân váy để tạo nên nhiều phong cách thời trang khác nhau.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-24', '1'),
(145, 'N7727', 'ÁO CROPTOP YOUTHFUL SET', 189, 28, 'upload/resize/crna1_thump.jpg upload/crna2.jpg upload/crna3.jpg upload/crna4.jpg upload/crna5.jpg', 'upload/resize/crna1_thump.jpg upload/resize/crna2_thump.jpg upload/resize/crna3_thump.jpg upload/resize/crna4_thump.jpg upload/resize/crna5_thump.jpg', 100000, 149000, 'Youthful Set với thiết kế trẻ trung, hiện đại nhưng vẫn thời thượng và sang trọng dành cho nàng công sở thêm vào tủ đồ Xuân - Hè của mình. Set bộ gồm áo vest kiểu kết hợp cùng chân váy xếp ly. \r\n\r\nÁo cổ V, ngắn tay, kiểu dáng Croptop, được cài bằng khuy bọc. Thiết kế mix cùng MS 31M8688 để tạo set hoàn chỉnh. \r\n\r\nSản phẩm kết hợp từ 3 dòng chất liệu Rayon, Poly, Spandex cao cấp, mang đến kết cấu mịn, thoải mái, tạo cảm  giác mềm mại khi chạm vào. Ngoài ra, chất liệu có độ rủ tự nhiên và  khả năng chống thấm nước, thoáng khí mát mẻ dành cho mùa hè.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-24', '1'),
(146, 'N3183', 'ÁO CROPTOP YOUTHFUL SET', 189, 27, 'upload/resize/crnb1_thump.jpg upload/crnb2.jpg upload/crnb3.jpg upload/crnb4.jpg upload/crnb5.jpg', 'upload/resize/crnb1_thump.jpg upload/resize/crnb2_thump.jpg upload/resize/crnb3_thump.jpg upload/resize/crnb4_thump.jpg upload/resize/crnb5_thump.jpg', 110000, 145000, 'Youthful Set với thiết kế trẻ trung, hiện đại nhưng vẫn thời thượng và sang trọng dành cho nàng công sở thêm vào tủ đồ Xuân - Hè của mình. Set bộ gồm áo vest kiểu kết hợp cùng chân váy xếp ly. \r\n\r\nÁo cổ V, ngắn tay, kiểu dáng Croptop, được cài bằng khuy bọc. Thiết kế mix cùng MS 31M8688 để tạo set hoàn chỉnh. \r\n\r\nSản phẩm kết hợp từ 3 dòng chất liệu Rayon, Poly, Spandex cao cấp, mang đến kết cấu mịn, thoải mái, tạo cảm  giác mềm mại khi chạm vào. Ngoài ra, chất liệu có độ rủ tự nhiên và  khả năng chống thấm nước, thoáng khí mát mẻ dành cho mùa hè.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-24', '1'),
(147, 'N8054', 'ÁO CROPTOP YOUTHFUL SET', 189, 26, 'upload/resize/crnc1_thump.jpg upload/crnc2.jpg upload/crnc3.jpg upload/crnc4.jpg upload/crnc5.jpg', 'upload/resize/crnc1_thump.jpg upload/resize/crnc2_thump.jpg upload/resize/crnc3_thump.jpg upload/resize/crnc4_thump.jpg upload/resize/crnc5_thump.jpg', 115000, 160000, 'Youthful Set với thiết kế trẻ trung, hiện đại nhưng vẫn thời thượng và sang trọng dành cho nàng công sở thêm vào tủ đồ Xuân - Hè của mình. Set bộ gồm áo vest kiểu kết hợp cùng chân váy xếp ly. \r\n\r\nÁo cổ V, ngắn tay, kiểu dáng Croptop, được cài bằng khuy bọc. Thiết kế mix cùng MS 31M8688 để tạo set hoàn chỉnh. \r\n\r\nSản phẩm kết hợp từ 3 dòng chất liệu Rayon, Poly, Spandex cao cấp, mang đến kết cấu mịn, thoải mái, tạo cảm  giác mềm mại khi chạm vào. Ngoài ra, chất liệu có độ rủ tự nhiên và  khả năng chống thấm nước, thoáng khí mát mẻ dành cho mùa hè.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-24', '1'),
(148, 'N5429', 'ÁO CROPTOP BEIGE TENCEL', 189, 27, 'upload/resize/crnd1_thump.jpg upload/crnd2.jpg upload/crnd3.jpg upload/crnd4.jpg upload/crnd5.jpg', 'upload/resize/crnd1_thump.jpg upload/resize/crnd2_thump.jpg upload/resize/crnd3_thump.jpg upload/resize/crnd4_thump.jpg upload/resize/crnd5_thump.jpg', 113000, 149000, 'Tưởng chừng như đơn giản nhưng Beige Tencel Set đang làm được những điều mà ở nhiều thiết kế khác khó có thể làm được. Ưu tiên sự tinh giản mà vẫn đảm bảo các yếu tố sang trọng và thời thhượng khi set bộ đã lựa chọn mix từ áo croptop xuông bên cạnh chân váy A xòe nhẹ. \r\n\r\nÁo kiểu tay ngắn, cổ điểm thêm các chi tiết ren độc đáo. Tay áo xếp ly tạo kiểu bom nhẹ nhàng, bắt mắt. Lựa chọn mix cùng MS 31M8691 để có outfit hoàn hảo. \r\n\r\nThiết kế được may cắt từ 2 dòng chất liệu Tencel, Nylon cao cấp, hút ẩm tốt nên khi mặc vô cùng  thoải mái,  không hề cảm nhận sự bí bách. Bề mặt mịn màng, mềm mại, tạo cảm giác thoáng mát, dễ chịu trong thời tiết Xuân – Hè.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-24', '1'),
(149, 'N7953', 'ÁO CROPTOP BLACK TENCEL ', 189, 27, 'upload/resize/crne1_thump.jpg upload/crne2.jpg upload/crne3.jpg upload/crne4.jpg upload/crne5.jpg', 'upload/resize/crne1_thump.jpg upload/resize/crne2_thump.jpg upload/resize/crne3_thump.jpg upload/resize/crne4_thump.jpg upload/resize/crne5_thump.jpg', 100000, 130000, 'Tưởng chừng như đơn giản nhưng Black Tencel Set đang làm được những điều mà ở nhiều thiết kế khác khó có thể làm được. Ưu tiên sự tinh giản mà vẫn đảm bảo các yếu tố sang trọng và thời thhượng khi set bộ đã lựa chọn mix từ áo croptop xuông bên cạnh chân váy A xòe nhẹ. \r\n\r\nÁo kiểu tay ngắn, cổ điểm thêm các chi tiết ren độc đáo. Tay áo xếp ly tạo kiểu bom nhẹ nhàng, bắt mắt. Lựa chọn mix cùng MS 31M8691 để có outfit hoàn hảo. \r\n\r\nThiết kế được may cắt từ 2 dòng chất liệu Tencel, Nylon cao cấp, hút ẩm tốt nên khi mặc vô cùng  thoải mái,  không hề cảm nhận sự bí bách. Bề mặt mịn màng, mềm mại, tạo cảm giác thoáng mát, dễ chịu trong thời tiết Xuân – Hè.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-24', '1'),
(150, 'N9136', 'QUẦN SUÔNG CẠP PHỐI NƠ', 191, 25, 'upload/resize/qdna1_thump.jpg upload/qdna2.jpg upload/adna3.jpg upload/qdna4.jpg upload/qdna5.jpg', 'upload/resize/qdna1_thump.jpg upload/resize/qdna2_thump.jpg upload/resize/adna3_thump.jpg upload/resize/qdna4_thump.jpg upload/resize/qdna5_thump.jpg', 113000, 143000, 'Quần suông ống rộng, độ dài đến mắt cá chân tôn dáng. Thiết kế túi sườn cùng tạo ly trên thân trước.\r\n\r\nQuần cạp cao, có tạo điểm nhấn qua chi tiết thắt nơ điệu đà. \r\n\r\nVới mẫu quần ống suông các nàng có thể dễ dàng kết hợp với nhiều kiểu áo khác nhau để diện hàng ngày, đi làm, đi chơi đều phù hợp.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";i:9;s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 2, '2024-04-24', '1'),
(151, 'N5722', 'QUẦN SUÔNG CẠP PHỐI KHUY', 191, 24, 'upload/resize/qdnb1_thump.jpg upload/qdnb2.jpg upload/qdnb3.jpg upload/qdnb4.jpg upload/qdnb5.jpg', 'upload/resize/qdnb1_thump.jpg upload/resize/qdnb2_thump.jpg upload/resize/qdnb3_thump.jpg upload/resize/qdnb4_thump.jpg upload/resize/qdnb5_thump.jpg', 125000, 150000, 'Quần suông vải Tuysi mềm nhẹ, thoải mái, che khuyết điểm tốt giúp nàng tự tin mỗi khi xuất hiện.\r\n\r\nQuần có cạp cao, tạo ly trước, kèm đai kiểu phối hai khuy bọc cách điệu. Thiết kế hai túi sườn và độ dài ngang mắt cá chân. \r\n\r\nQuần có thể kết hợp với nhiều kiểu áo khác nhau để mang đến những bộ trang phục chỉn chu và lịch sự.  \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";i:9;s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 5, '2024-04-24', '1'),
(152, 'N4425', 'QUẦN SUÔNG ĐAI KIM LOẠI', 191, 31, 'upload/resize/qdnc1_thump.jpg upload/qdnc2.jpg upload/qdnc3.jpg upload/qdnc4.jpg upload/qdnc5.jpg', 'upload/resize/qdnc1_thump.jpg upload/resize/qdnc2_thump.jpg upload/resize/qdnc3_thump.jpg upload/resize/qdnc4_thump.jpg upload/resize/qdnc5_thump.jpg', 100000, 146000, 'Quần suông vải Tuysi mềm nhẹ, thoải mái, che khuyết điểm tốt giúp nàng tự tin mỗi khi xuất hiện.\r\n\r\nQuần có cạp cao, tạo ly cố định, kèm đai bản kim loại. Thiết kế hai túi sườn và độ dài ngang mắt cá chân. \r\n\r\nQuần có thể kết hợp với nhiều kiểu áo khác nhau để mang đến những bộ trang phục chỉn chu và lịch sự.  \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(153, 'N7536', 'QUẦN SUÔNG XẺ TRƯỚC', 191, 28, 'upload/resize/qdnd1_thump.jpg upload/qdnd2.jpg upload/qdnd3.jpg upload/qdnd4.jpg upload/qdnd5.jpg', 'upload/resize/qdnd1_thump.jpg upload/resize/qdnd2_thump.jpg upload/resize/qdnd3_thump.jpg upload/resize/qdnd4_thump.jpg upload/resize/qdnd5_thump.jpg', 112000, 132000, '- Quần dáng suông, ống rộng. Thiết kế xẻ thân trước tạo điểm nhấn cũng như tăng sự mềm mại và uyển chuyển.\r\n\r\n- Thiết kế  là câu trả lời hoàn hảo cho những ngày không biết biết măc gì. Những cô nàng yêu thích phối áo croptop hay cách mặc sơ vin chắc hẳn sẽ rất ưng ý item này. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 2, '2024-04-25', '1'),
(154, 'N768', 'QUẦN SUÔNG XẾP LY TRƯỚC', 191, 24, 'upload/resize/qdne1_thump.jpg upload/qdne2.jpg upload/qdne3.jpg upload/qdne4.jpg upload/qdne5.jpg', 'upload/resize/qdne1_thump.jpg upload/resize/qdne2_thump.jpg upload/resize/qdne3_thump.jpg upload/resize/qdne4_thump.jpg upload/resize/qdne5_thump.jpg', 100000, 129000, 'Nằm trong BST URBAN CHIC khởi đầu cho SPRING/SUMMER 2024 NEW COLLECTION, thiết kế mang sứ mệnh tạo nên sự biến chuyển linh hoạt của thời trang mới. Để xây dựng kết nối về cảm xúc, tâm trí thông qua những điểm chạm dịu dàng từ chất vải mềm mại, phom dáng tinh chỉnh vừa vặn và đem đến sự thoải mái êm dịu.\r\n\r\nSử dụng chất kiệu vải Tuysi mềm nhẹ, thoải mái, thiết kế che khuyết điểm tốt giúp nàng tự tin mỗi khi xuất hiện.\r\n\r\nQuần tạo ly cố định thân trước, cạp cao có phối khuy kim loại tạo điểm nhấn. Thiết kế kèm hai túi sườn và độ dài ngang mắt cá chân. Sản phẩm chỉn chu, tỉ mỉ. Nàng công sở có thể kết hợp với nhiều kiểu áo khác nhau để mang đến những bộ trang phục chỉn chu và lịch sự.  \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M ', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";i:9;s:3:\"xxl\";s:2:\"10\";}', 4, '2024-04-25', '1'),
(155, 'N9533', 'QUẦN TUYSI ỐNG LOE', 191, 29, 'upload/resize/qdnf1_thump.jpg upload/qdnf2.jpg upload/qdnf3.jpg upload/qdnf4.jpg upload/qdnf5.jpg', 'upload/resize/qdnf1_thump.jpg upload/resize/qdnf2_thump.jpg upload/resize/qdnf3_thump.jpg upload/resize/qdnf4_thump.jpg upload/resize/qdnf5_thump.jpg', 111000, 112000, 'Quần dài ống loe, cạp cao, độ dài ngang mắt cá chân. Gấu quần thiết kế xẻ sườn nhẹ và có phối khuy kim loại tạo điểm nhấn.\r\n\r\nChất liệu Tuysi giữ phom hiệu quả, không bám dính mồ hôi gây khó chịu nên nàng sẽ cảm thấy rất thoải mái khi mặc.\r\n\r\nThích hợp mix cùng các kiểu áo sơ mi, áo thun kiểu và phụ kiện tạo vẻ ngoài sang trọng nơi công sở hay sành điệu khi đi làm, họp hành hay những buổi gặp gỡ quan trọng.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(156, 'N5714', 'QUẦN SOOC BÒ GẬP GẤU', 192, 27, 'upload/resize/qjna1_thump.jpg upload/qjna2.jpg upload/qjna3.jpg upload/qjna4.jpg upload/qjna5.jpg', 'upload/resize/qjna1_thump.jpg upload/resize/qjna2_thump.jpg upload/resize/qjna3_thump.jpg upload/resize/qjna4_thump.jpg upload/resize/qjna5_thump.jpg', 110000, 129000, 'Quần mini short dáng suông, ống gấu gập tầm 3cm được may cố định. Phía trước có túi chéo, phía sau có túi hộp.\r\n\r\nThiết kế mini short luôn là lựa chọn hàng đầu cho những chuyến vui chơi ngày hè. Chỉ cần đơn giản mix với áo thun và một đôi giày bệt dễ chịu là nàng đã có thể thoải mái du lịch đến mọi nơi. Sắc xanh lơ nhạt màu trẻ trung góp phần khiến làn da nàng trở nên sáng hơn.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(157, 'N6660', 'QUẦN SOOC ỐNG SUÔNG', 192, 25, 'upload/resize/qjnb1_thump.jpg upload/qjnb2.jpg upload/qjnb3.jpg upload/qjnb4.jpg upload/qjnb5.jpg', 'upload/resize/qjnb1_thump.jpg upload/resize/qjnb2_thump.jpg upload/resize/qjnb3_thump.jpg upload/resize/qjnb4_thump.jpg upload/resize/qjnb5_thump.jpg', 112000, 132000, 'Quần soóc nữ là một item cơ bản, dễ dàng kết hợp với nhiều kiểu áo và phụ kiện khác nhau. Sự thoải mái cùng tính thời trang, quần thích hợp cho nhiều dịp khác nhau từ đi làm đến dạo phố hay các sự kiện casual.\r\n\r\nThiết kế quần cạp cao, ống suông che khuyết điểm tốt, giúp tôn lên vòng eo và làm dáng người trở nên thon gọn hơn.\r\n\r\nChất liệu denim chắc chắn và bền bỉ. Quần có độ co giãn nhất định, giúp ôm vừa cơ thể và thoải mái khi mặc.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(158, 'N1458', 'QUẦN JEANS TÚI VUÔNG', 192, 25, 'upload/resize/qjnc1_thump.jpg upload/qjnc2.jpg upload/qjnc3.jpg upload/qjnc4.jpg upload/qjnc5.jpg', 'upload/resize/qjnc1_thump.jpg upload/resize/qjnc2_thump.jpg upload/resize/qjnc3_thump.jpg upload/resize/qjnc4_thump.jpg upload/resize/qjnc5_thump.jpg', 100000, 119000, 'Hách dáng cùng mẫu quần jeans ống suông mới nhất. Nàng dễ dàng mix với nhiều kiểu áo khác nhau để thể hiện vẻ đẹp tự tin, cá tính của mình. \r\n\r\nMàu xám khói kết hợp thiết kế thời thượng, chỉ mới liếc nhìn đã đủ thấy vẻ đẹp ấn tượng mà items mang lại. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 163 cm\r\n\r\nCân nặng: 47 kg\r\n\r\nSố đo 3 vòng: 83-61-90 cm\r\n\r\nMẫu mặc size S ', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(159, 'N986', 'QUẦN JEANS BEIGE', 192, 24, 'upload/resize/qjnd1_thump.jpg upload/qjnd2.jpg upload/qjnd3.jpg upload/qjnd4.jpg upload/qjnd5.jpg', 'upload/resize/qjnd1_thump.jpg upload/resize/qjnd2_thump.jpg upload/resize/qjnd3_thump.jpg upload/resize/qjnd4_thump.jpg upload/resize/qjnd5_thump.jpg', 100000, 126000, 'Quần jeans nữ là một item cơ bản, dễ dàng kết hợp với nhiều kiểu áo và phụ kiện khác nhau. Sự thoải mái cùng tính thời trang, quần thích hợp cho nhiều dịp khác nhau từ đi làm đến dạo phố hay các sự kiện casual.\r\n\r\nThiết kế quần cạp cao, ống suông che khuyết điểm tốt, giúp tôn lên vòng eo và làm dáng người trở nên thon gọn hơn.\r\n\r\nChất liệu denim chắc chắn và bền bỉ. Quần có độ co giãn nhất định, giúp ôm vừa cơ thể và thoải mái khi mặc.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(160, 'N862', 'QUẦN JEANS SUÔNG CẮT GẤU', 192, 23, 'upload/resize/qjne1_thump.jpg upload/qjne2.jpg upload/qjne3.jpg upload/qjne4.jpg upload/qjne5.jpg', 'upload/resize/qjne1_thump.jpg upload/resize/qjne2_thump.jpg upload/resize/qjne3_thump.jpg upload/resize/qjne4_thump.jpg upload/resize/qjne5_thump.jpg', 100000, 136000, 'Quần jeans dáng suông che khuyết điểm phần đùi hiệu quả, độ dài ngang mắt cá chân, cạp sử dụng khóa và khuy kim loại. \r\n\r\nChất liệu denim có độ bền cực kỳ cao cùng màu sắc xanh lơ đậm đánh bạc dễ dàng phối với nhiều kiểu áo, mang lại dáng vẻ trẻ trung cho người mặc. \r\n\r\nMix quần cùng áo sơ mi, áo thun... để có set đồ đi làm, đi chơi năng động và không kém phần cá tính.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(161, 'N2442', 'QUẦN LỬNG JEANS GẬP GẤU', 192, 24, 'upload/resize/qjnf1_thump.jpg upload/qjnf2.jpg upload/qjnf3.jpg upload/qjnf4.jpg upload/qjnf5.jpg', 'upload/resize/qjnf1_thump.jpg upload/resize/qjnf2_thump.jpg upload/resize/qjnf3_thump.jpg upload/resize/qjnf4_thump.jpg upload/resize/qjnf5_thump.jpg', 100000, 130000, 'Quần jean dáng đứng, độ dài trên mắt cá chân. Thiết kế  cạp cao tôn dáng cùng màu xanh đậm phối chỉ nâu tinh tế, rất đẹp mắt. \r\n\r\nQuần tạo điểm nhấn gập gấu thời trang, mix được với nhiều kiểu áo khác nhau. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(162, 'N5741', 'JUMPSUIT HAI DÂY ', 194, 23, 'upload/resize/jna1_thump.jpg upload/jna2.jpg upload/jna3.jpg upload/jna4.jpg upload/jna5.jpg', 'upload/resize/jna1_thump.jpg upload/resize/jna2_thump.jpg upload/resize/jna3_thump.jpg upload/resize/jna4_thump.jpg upload/resize/jna5_thump.jpg', 119000, 132000, 'Được chế tác từ chất liệu vải thô tinh tế, sản phẩm đem lại cảm giác thoải mái và thoáng mát mỗi khi diện.\r\n\r\nJumpsuit được thiết kế với phần thân áo hai dây cúp ngực, tạo nên vẻ gợi cảm và nữ tính. Bên cạnh đó, thân áo của sản phẩm được may bằng 2 tầng bèo xếp tầng, mang đến một diện mạo phong cách và trẻ trung.\r\n\r\nThiết kế là một lựa chọn tuyệt vời cho các dịp, từ buổi dạo phố đến các sự kiện đặc biệt. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(163, 'N5602', 'JUMPSUIT HAI DÂY PHỐI BÈO', 194, 24, 'upload/resize/jnb1_thump.jpg upload/jnb2.jpg upload/jnb3.jpg upload/jnb4.jpg upload/jnb5.jpg', 'upload/resize/jnb1_thump.jpg upload/resize/jnb2_thump.jpg upload/resize/jnb3_thump.jpg upload/resize/jnb4_thump.jpg upload/resize/jnb5_thump.jpg', 110000, 130000, 'Được chế tác từ chất liệu vải thô tinh tế, sản phẩm đem lại cảm giác thoải mái và thoáng mát mỗi khi diện.\r\n\r\nJumpsuit được thiết kế với phần thân áo hai dây cúp ngực, tạo nên vẻ gợi cảm và nữ tính. Bên cạnh đó, thân áo của sản phẩm được may bằng 2 tầng bèo xếp tầng, mang đến một diện mạo phong cách và trẻ trung.\r\n\r\nThiết kế là một lựa chọn tuyệt vời cho các dịp, từ buổi dạo phố đến các sự kiện đặc biệt. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";i:9;s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-25', '1'),
(164, 'N4049', 'JUMPSUIT LỤA ỐNG RỘNG', 194, 26, 'upload/resize/jnc1_thump.jpg upload/jnc2.jpg upload/jnc3.jpg upload/jnc4.jpg upload/jnc5.jpg', 'upload/resize/jnc1_thump.jpg upload/resize/jnc2_thump.jpg upload/resize/jnc3_thump.jpg upload/resize/jnc4_thump.jpg upload/resize/jnc5_thump.jpg', 100000, 120000, 'Jumpsuit trơn dáng suông, cổ V. Dáng áo không tay, vạt áo may dáng xòe, lượn sóng nhẹ. Dáng quần ống đứng, rộng, độ dài chạm gót. 2 bên có 2 túi chéo. Chất liệu lụa mềm nhẹ.\r\n\r\nThiết kế Jumpsuit từ lụa mềm này sẽ là lựa chọn hoàn hảo cho chuyến du lịch của nàng. Chẳng cần mất công mix-match, chỉ với một thiết kế Jumpsuit, nàng đã có thể sẵn sàng xuống phố. Chất liệu lụa cao cấp cùng thiết kế tối giản nâng tầm phong cách của bộ trang phục. Nàng có thể thoải mái phối cùng những phụ kiện khác nhau.\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m66\r\nCân nặng: 48kg\r\nSố đo 3 vòng: 78-61-88', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-25', '1'),
(165, 'N627', 'SET JUMSUIT TAY BABY', 194, 27, 'upload/resize/jnd1_thump.jpg upload/jnd2.jpg upload/jnd3.jpg upload/jnd4.jpg upload/jnd5.jpg', 'upload/resize/jnd1_thump.jpg upload/resize/jnd2_thump.jpg upload/resize/jnd3_thump.jpg upload/resize/jnd4_thump.jpg upload/resize/jnd5_thump.jpg', 123000, 133000, 'Set jumpsuit không chỉ mang lại sự thoải mái mà còn tạo nên một phong cách thời trang năng động và trẻ trung. \r\n\r\nPhần trên của set là dáng áo cổ tròn cách điệu với phần tay baby bồng nhẹ kết hợp các đường xếp ly bắt mắt. Dưới là quần short ống rộng, tạo cảm giác thoải mái và phóng khoáng.\r\n\r\nThiết kế được may cắt từ 2 dòng chất liệu Tencel, Poly cao cấp, hút ẩm tốt nên khi mặc vô cùng  thoải mái,  không hề cảm nhận sự bí bách. Bề mặt mịn màng, mềm mại, tạo cảm giác thoáng mát, dễ chịu trong thời tiết Xuân – Hè.\r\n\r\nBạn có thể kết hợp set với giày sneakers, sandal hoặc giày cao gót tùy thuộc vào phong cách của mình. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(166, 'N3770', 'JUMPSUIT ÁO KIỂU PHỐI DÂY', 194, 25, 'upload/resize/jne1_thump.jpg upload/jne2.jpg upload/jne3.jpg upload/jne4.jpg upload/jne5.jpg', 'upload/resize/jne1_thump.jpg upload/resize/jne2_thump.jpg upload/resize/jne3_thump.jpg upload/resize/jne4_thump.jpg upload/resize/jne5_thump.jpg', 110000, 125000, 'Thiết kế jumpsuit là một lựa chọn phổ biến cho các dịp từ casual đến semi-formal. Với sự kết hợp giữa kiểu dáng thanh lịch và thoải mái, item giúp nàng tự tin và cuốn hút trong mọi tình huống.\r\n\r\nPhần áo của jumpsuit thường được thiết kế với kiểu dáng phối dây, tạo điểm nhấn về vai và thân trước, giúp làm nổi bật vẻ gợi cảm, nữ tính của người mặc.\r\n\r\nPhần quần dáng suông mang đến cảm giác thoải mái, che khuyết điểm tốt. Đặc biệt, giúp người mặc dễ dàng di chuyển mà không bị cảm giác chật chội.\r\n\r\nSản phẩm có sự kết hợp giữa 3 chất liệu vải Poly, Spandex và Viscose với kết cấu mịn, thoải mái, mềm mại khi chạm vào. Ngoài ra, chất liệu có độ rủ tự nhiên và khả năng chống thấm nước, thoáng khí mát mẻ dành cho mùa hè.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(167, 'N5344', 'JUMPSUIT LỤA ỐNG RỘNG', 194, 26, 'upload/resize/jnf1_thump.jpg upload/jnf2.jpg upload/jnf3.jpg upload/jnf4.jpg upload/jnf5.jpg', 'upload/resize/jnf1_thump.jpg upload/resize/jnf2_thump.jpg upload/resize/jnf3_thump.jpg upload/resize/jnf4_thump.jpg upload/resize/jnf5_thump.jpg', 120000, 130000, 'Jumpsuit trơn dáng suông, cổ V. Dáng áo không tay, vạt áo may dáng xòe, lượn sóng nhẹ. Dáng quần ống đứng, rộng, độ dài chạm gót. 2 bên có 2 túi chéo. Chất liệu lụa mềm nhẹ.\r\n\r\nThiết kế Jumpsuit từ lụa mềm này sẽ là lựa chọn hoàn hảo cho chuyến du lịch của nàng. Chẳng cần mất công mix-match, chỉ với một thiết kế Jumpsuit, nàng đã có thể sẵn sàng xuống phố. Chất liệu lụa cao cấp cùng thiết kế tối giản nâng tầm phong cách của bộ trang phục. Nàng có thể thoải mái phối cùng những phụ kiện khác nhau.\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m66\r\nCân nặng: 48kg\r\nSố đo 3 vòng: 78-61-88', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(168, 'N9170', 'CHÂN VÁY BÚT CHÌ XẺ LỆCH', 195, 28, 'upload/resize/vbca1_thump.jpg upload/vbca2.jpg upload/vbca3.jpg upload/vbca4.jpg upload/vbca5.jpg', 'upload/resize/vbca1_thump.jpg upload/resize/vbca2_thump.jpg upload/resize/vbca3_thump.jpg upload/resize/vbca4_thump.jpg upload/resize/vbca5_thump.jpg', 100000, 128000, 'Nếu nàng đang theo đuổi phong cách thời trang bền vững chắc chắn không thể thiếu thiết kế chân bút chì này trong tủ đồ của mình.\r\n\r\nThân trước xẻ lệch 1 bên, độ dài qua đầu gối và cài bằng khóa kéo. Chân váy kiểu dáng bút chì cơ bản dễ dàng mix&match với nhiều kiểu áo khác nhau.\r\n\r\nThiết kế hoàn hảo để nàng xuất hiện đủ chỉn chu và lịch sự. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(169, 'N2075', 'CHÂN VÁY BÚT CHÌ PHỐI TÚI', 195, 27, 'upload/resize/vbcb1_thump.jpg upload/vbcb2.jpg upload/vbcb3.jpg upload/vbcb4.jpg upload/vbcb5.jpg', 'upload/resize/vbcb1_thump.jpg upload/resize/vbcb2_thump.jpg upload/resize/vbcb3_thump.jpg upload/resize/vbcb4_thump.jpg upload/resize/vbcb5_thump.jpg', 100000, 125000, 'Chân váy kiểu dáng bút chì, ôm vừa phải, tôn lên vóc dáng quyến rũ cho người mặc.\r\n\r\nThiết kế xẻ trước làm tăng tính thoải mái và tạo điểm nhấn cho chiếc váy.\r\n\r\nChân váy mang gam màu trung tính, dễ dàng phối hợp với nhiều loại trang phục khác nhau.\r\n\r\nBên cạnh đó, chân váy được thiết kế với 2 túi sườn ở hai bên, nổi bật với các đường may nổi. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(170, 'N505', 'CHÂN VÁY BÚT CHÌ', 195, 23, 'upload/resize/vbcc1_thump.jpg upload/vbcc2.jpg upload/vbcc3.jpg upload/vbcc4.jpg upload/vbcc5.jpg', 'upload/resize/vbcc1_thump.jpg upload/resize/vbcc2_thump.jpg upload/resize/vbcc3_thump.jpg upload/resize/vbcc4_thump.jpg upload/resize/vbcc5_thump.jpg', 111000, 132000, '- Chân váy dáng bút chì, độ dài qua gối, một tín đồ không thể thiếu của quý cô công sở. Thiết kế dễ dàng mix&match cùng nhiều kiểu áo khác nhau để tạo nên Outfit sang trọng, thời thượng. \r\n\r\n- Chân váy được tạo điểm nhấn đường eo cách điệu với hiệu quả che khuyết điểm bụng dưới tốt. Bên cạnh đó, thiết kế hai lớp trên nền chất liệu Tuysi mang đến cảm giác mặc thoải mái, thích hợp diện trong thời tiết hiện tại. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(171, 'N6809', 'CHÂN VÁY BÚT CHÌ', 195, 30, 'upload/resize/vbcd1_thump.jpg upload/vbcd2.jpg upload/vbcd3.jpg upload/vbcd4.jpg upload/vbcd5.jpg', 'upload/resize/vbcd1_thump.jpg upload/resize/vbcd2_thump.jpg upload/resize/vbcd3_thump.jpg upload/resize/vbcd4_thump.jpg upload/resize/vbcd5_thump.jpg', 100000, 139000, '- Chân váy dáng bút chì, độ dài qua gối, một tín đồ không thể thiếu của quý cô công sở. Thiết kế dễ dàng mix&match cùng nhiều kiểu áo khác nhau để tạo nên Outfit sang trọng, thời thượng. \r\n\r\n- Chân váy được tạo điểm nhấn đường eo cách điệu với hiệu quả che khuyết điểm bụng dưới tốt. Bên cạnh đó, thiết kế hai lớp trên nền chất liệu Tuysi mang đến cảm giác mặc thoải mái, thích hợp diện trong thời tiết hiện tại. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(172, 'N1317', 'VÁY BÚT CHÌ PHỐI TÚI', 195, 29, 'upload/resize/vbce1_thump.jpg upload/vbce2.jpg upload/vbce3.jpg upload/vbce4.jpg upload/vbce5.jpg', 'upload/resize/vbce1_thump.jpg upload/resize/vbce2_thump.jpg upload/resize/vbce3_thump.jpg upload/resize/vbce4_thump.jpg upload/resize/vbce5_thump.jpg', 110000, 142000, 'Chân váy kiểu dáng bút chì, ôm vừa phải, tôn lên vóc dáng quyến rũ cho người mặc.\r\n\r\nThiết kế xẻ trước làm tăng tính thoải mái và tạo điểm nhấn cho chiếc váy.\r\n\r\nChân váy mang gam màu be sáng, dễ dàng phối hợp với nhiều loại trang phục khác nhau.\r\n\r\nBên cạnh đó, chân váy được thiết kế với 2 túi sườn ở hai bên, nổi bật với các đường may nổi. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-25', '1'),
(173, 'N8345', 'VÁY BÚT CHÌ XẾP VẠT CHÉO', 195, 27, 'upload/resize/vbcf1_thump.jpg upload/vbcf2.jpg upload/vbcf3.jpg upload/vbcf4.jpg upload/vbcf5.jpg', 'upload/resize/vbcf1_thump.jpg upload/resize/vbcf2_thump.jpg upload/resize/vbcf3_thump.jpg upload/resize/vbcf4_thump.jpg upload/resize/vbcf5_thump.jpg', 110000, 136000, 'Chân váy bút chì xếp vạt chéo tạo kiểu, độ dài qua đầu gối. Sự lựa chọn thanh lịch, nhẹ nhàng cho nàng công sở. \r\n\r\nThiết kế độ dài ngang gối phù hợp để nàng xuất hiện đủ chỉn chu và lịch sự.\r\n\r\nChi tiết gây chú ý nằm ở điểm nhấn xếp tà lệch mang đến nét mới lạ, giúp tôn dáng đôi chân cực kì. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(174, 'N5271', 'CHÂN VÁY A XẾP LY', 196, 25, 'upload/resize/vcaa1_thump.jpg upload/vcaa2.jpg upload/vcaa3.jpg upload/vcaa4.jpg', 'upload/resize/vcaa1_thump.jpg upload/resize/vcaa2_thump.jpg upload/resize/vcaa3_thump.jpg upload/resize/vcaa4_thump.jpg', 100000, 150000, 'Chân váy chữ A, cạp cao, dáng dài vừa che khuyết điểm tốt mà còn cực kỳ tôn dáng. \r\n\r\nThiết kế chân váy độc đáo với phần xếp ly một bên. Phần cạp đính kèm khuy nổi bật. \r\n\r\nChất liệu Tuysi thích hợp diện 4 mùa, trẻ trung, hiện đại. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-25', '1'),
(175, 'N3794', 'ZUÝP XÒE RÚT EO', 196, 25, 'upload/resize/vcab1_thump.jpg upload/vcab2.jpg upload/vcab3.jpg upload/vcab4.jpg upload/vcab5.jpg', 'upload/resize/vcab1_thump.jpg upload/resize/vcab2_thump.jpg upload/resize/vcab3_thump.jpg upload/resize/vcab4_thump.jpg upload/resize/vcab5_thump.jpg', 129000, 150000, 'Chân váy dáng xòe nhẹ, có xếp ly phía trước kết hợp cùng chi tiết rút eo cách điệu phần cạp. \r\n\r\nThiết kế thanh lịch mang vẻ sang trọng nhưng vẫn trẻ trung phù hợp diện trong nhiều dịp khác nhau. Kết hợp chân váy cùng áo sơ mi hoặc áo thun, áo kiểu là nàng đã có ngay outfit đến nơi công sở, cafe cùng bạn bè. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M ', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1');
INSERT INTO `tb_product` (`id_product`, `code_product`, `name_product`, `id_category`, `id_label`, `image`, `image_thump`, `price_product`, `saleprice_product`, `describe_product`, `size_product`, `view_product`, `date_product`, `status_product`) VALUES
(176, 'N6171', 'VÁY CHỮ A TÚI HỘP', 196, 27, 'upload/resize/vcac1_thump.jpg upload/vcac2.jpg upload/vcac3.jpg upload/vcac4.jpg upload/vcac5.jpg', 'upload/resize/vcac1_thump.jpg upload/resize/vcac2_thump.jpg upload/resize/vcac3_thump.jpg upload/resize/vcac4_thump.jpg upload/resize/vcac5_thump.jpg', 110000, 140000, '- Chân váy kiểu dáng chữ A, phù hợp với nhiều dáng vóc, tôn lên phần eo và che đi một cách nhẹ nhàng các khuyết điểm cơ thể. \r\n\r\n- Chiều dài của chân váy qua gối, giúp tạo nên vẻ nữ tính và thoải mái. Phù hợp cùng nàng trong nhiều dịp khác nhau, từ công sở đến những sự kiện nhẹ nhàng.\r\n\r\n- Chân váy được thiết kế với túi hộp hai bên, tạo điểm nhấn thời trang, cá tính, hiện đại. \r\n\r\n- Nàng có thể mix chân váy cùng giày cao gót, giày bệt hoặc sneakers tùy thuộc vào phong cách và sự thoải mái của mình. \r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";i:8;s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 3, '2024-04-25', '1'),
(177, 'N748', 'VÁY KAKI XÒE CÁCH ĐIỆU', 196, 27, 'upload/resize/vcad1_thump.jpg upload/vcad2.jpg upload/vcad3.jpg upload/vcad4.jpg upload/vcad5.jpg', 'upload/resize/vcad1_thump.jpg upload/resize/vcad2_thump.jpg upload/resize/vcad3_thump.jpg upload/resize/vcad4_thump.jpg upload/resize/vcad5_thump.jpg', 100000, 130000, 'Lên dáng chân váy cho nàng công sở với thiết kế A xòe cách điệu cùng độ dài ngang gối, tạo nên vẻ nữ tính và duyên dáng cho người mặc.\r\n\r\nThân chân váy có các lớp vải xếp lên nhau để tạo ra sự phồng, thoải dần từ trên xuống dưới. Chi tiết xếp ly mang đến sự thoải mái khi di chuyển và thêm tính thời trang, hiện đại cho thiết kế. \r\n\r\nSản phẩm sử dụng chất liệu Khaki bền bỉ, giữ phom tốt, giúp người mặc tự tin hơn. \r\n\r\nGợi ý nàng kết hợp chân váy với áo thun, áo sơ mi, hoặc áo len tùy theo dịp và phong cách của mình. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(178, 'N6264', 'VÁY A KHAKI XẾP LY', 196, 29, 'upload/resize/vcae1_thump.jpg upload/vcae2.jpg upload/vcae3.jpg upload/vcae4.jpg upload/vcae5.jpg', 'upload/resize/vcae1_thump.jpg upload/resize/vcae2_thump.jpg upload/resize/vcae3_thump.jpg upload/resize/vcae4_thump.jpg upload/resize/vcae5_thump.jpg', 100000, 130000, 'Chân váy xếp ly dáng xoè là một sản phẩm thời trang đẹp mắt và nữ tính, được thiết kế để tôn lên vẻ đẹp của người diện. Với sự kết hợp giữa chất liệu vải Khaki đứng dáng và độ rộng của ly xếp, chiếc váy này mang đến cảm giác thoải mái và nền nã khi mặc.\r\n\r\nThiết kế này cũng giúp tôn lên đôi chân thon dài và mang đến sự tự tin cho phái đẹp khi diện váy.\r\n\r\nVới màu sắc trang nhã và kiểu dáng đơn giản, chân váy xếp ly dáng xoè thích hợp để mặc trong nhiều dịp khác nhau, từ công sở đến dạo phố hay dự tiệc. Sản phẩm có thể kết hợp cùng áo sơ mi, áo thun và các phụ kiện đi kèm.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(179, 'N9895', 'ZUÝP CHỮ A KÈM ĐAI', 196, 26, 'upload/resize/vcaf1_thump.jpg upload/vcaf2.jpg upload/vcaf3.jpg upload/vcaf4.jpg upload/vcaf5.jpg', 'upload/resize/vcaf1_thump.jpg upload/resize/vcaf2_thump.jpg upload/resize/vcaf3_thump.jpg upload/resize/vcaf4_thump.jpg upload/resize/vcaf5_thump.jpg', 120000, 145000, 'Thiết kế chân váy dáng A, chiều dài qua gối, cạp cao. Phần cạp có điểm nhấn phối đai nhẹ nhàng. \r\n\r\nChân váy được làm từ chất liệu vải Tuysi mềm mại, sản phẩm mang đến cảm giác mặc thoải mái và linh hoạt trong mọi hoạt động. \r\n\r\nNàng có thể kết hợp chân váy cùng áo sơ mi kiểu, áo thun tay ngắn để tạo nên một bộ trang phục hàng ngày đơn giản và năng động. Hoặc kết hợp với áo blazer cùng giày cao gót để tạo nên phong cách thời trang và sang trọng hơn.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M\r\n', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(180, 'N7354', 'CHÂN VÁY JEANS', 197, 29, 'upload/resize/cvja1_thump.jpg upload/cvja2.jpg upload/cvja3.jpg upload/cvja4.jpg upload/cvja5.jpg', 'upload/resize/cvja1_thump.jpg upload/resize/cvja2_thump.jpg upload/resize/cvja3_thump.jpg upload/resize/cvja4_thump.jpg upload/resize/cvja5_thump.jpg', 100000, 123000, 'Mang đến kiểu dáng midi hiện đại trong chất liệu demin bền bỉ, chiếc chân váy mang lại tính linh hoạt trong việc phối đồ, giúp bạn dễ dàng thể hiện phong cách cá nhân.\r\n\r\nThiết kế tạo điểm nhấn qua hàng khuy nổi trên thân trước kết hợp túi kiểu và đường may nổi độc đáo.\r\n\r\nBạn dễ dàng kết hợp chân váy với nhiều loại trang phục khác nhau, từ áo sơ mi, áo thun, áo len đến áo khoác để biến tấu thành một Outfits phù hợp với phong cách cá nhân.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(181, 'N6091', 'ZUÝP BÒ CHLOE', 197, 23, 'upload/resize/cvjb1_thump.jpg upload/cvjb2.jpg upload/cvjb3.jpg upload/cvjb4.jpg upload/cvjb5.jpg', 'upload/resize/cvjb1_thump.jpg upload/resize/cvjb2_thump.jpg upload/resize/cvjb3_thump.jpg upload/resize/cvjb4_thump.jpg upload/resize/cvjb5_thump.jpg', 100000, 135000, 'Tủ đồ nàng năng động mùa hè này chắc chắn không thể thiếu chiếc Zuýp cân mọi phong cách thời trang. \r\n\r\nThiết kế chân váy dáng A nhẹ, độ dài trên gối, trẻ trung, cá tinh. Nàng có thể lựa chọn chân váy mix cùng nhiều kiểu áo khác nhau để tạo nét đẹp riêng mình. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(182, 'N9929', 'CHÂN VÁY JEANS DÁNG DÀI', 197, 24, 'upload/resize/cvjc1_thump.jpg upload/cvjc2.jpg upload/cvjc3.jpg upload/cvjc4.jpg upload/cvjc5.jpg', 'upload/resize/cvjc1_thump.jpg upload/resize/cvjc2_thump.jpg upload/resize/cvjc3_thump.jpg upload/resize/cvjc4_thump.jpg upload/resize/cvjc5_thump.jpg', 112000, 125000, 'Một chiếc chân váy jeans trong tủ quần áo sẽ mang lại tính linh hoạt trong việc phối đồ, giúp bạn dễ dàng thể hiện phong cách cá nhân.\r\n\r\nChân váy có kiểu dáng midi hiện đại, trên nền chất liệu demin cao cấp với đặc tính dày và bên. Thiết kế tạo điểm nhấn qua các chi tiết như túi, nút, khuy, và đường may nổi độc đáo.\r\n\r\nBạn dễ dàng kết hợp chân váy với nhiều loại trang phục khác nhau, từ áo sơ mi, áo thun, áo len đến áo khoác để biến tấu thành một Outfits phù hợp với phong cách cá nhân.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(183, 'N5991', 'ZUÝP BÒ XẺ TRƯỚC', 197, 26, 'upload/resize/cvjd1_thump.jpg upload/cvjd2.jpg upload/cvjd3.jpg upload/cvjd4.jpg upload/cvjd5.jpg', 'upload/resize/cvjd1_thump.jpg upload/resize/cvjd2_thump.jpg upload/resize/cvjd3_thump.jpg upload/resize/cvjd4_thump.jpg upload/resize/cvjd5_thump.jpg', 110000, 140000, 'Chân váy bò trẻ trung, năng động, thích hợp nàng yêu thích thời trang đường phố hiện đại. Chân váy cạp cao, độ dài qua gối, thân trước  có đính hàng khuy kim loại cố định và xẻ gấu. \r\n\r\nBạn có thể mix chân váy với nhiều kiểu áo khác nhau để tạo nên set bộ ấn tượng cho buổi đi chơi hay đi làm. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(184, 'N5313', 'ZUÝP BÒ LADIES', 197, 24, 'upload/resize/cvje1_thump.jpg upload/cvje2.jpg upload/cvje3.jpg upload/cvje4.jpg upload/cvje5.jpg', 'upload/resize/cvje1_thump.jpg upload/resize/cvje2_thump.jpg upload/resize/cvje3_thump.jpg upload/resize/cvje4_thump.jpg upload/resize/cvje5_thump.jpg', 112000, 130000, 'Tủ đồ nàng năng động mùa hè này chắc chắn không thể thiếu chiếc Zuýp cân mọi phong cách thời trang. \r\n\r\nThiết kế chân váy dáng A nhẹ, độ dài trên gối, trẻ trung, cá tinh. Nàng có thể lựa chọn chân váy mix cùng nhiều kiểu áo khác nhau để tạo nét đẹp riêng mình. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(185, 'N6498', 'CHÂN VÁY BÒ PHỐI KHUY TRƯỚC', 197, 23, 'upload/resize/cvjf1_thump.jpg upload/cvjf2.jpg upload/cvjf5.jpg', 'upload/resize/cvjf1_thump.jpg upload/resize/cvjf2_thump.jpg upload/resize/cvjf5_thump.jpg', 100000, 130000, '- Chân váy bò dáng chữ A, độ dài qua đầu gối, xẻ tà trước và sau.\r\n\r\n- Cài bằng hàng khuy phía trước. Có 2tuis chéo phía trước và 2 túi vuông phía sau\r\n\r\n- Mix cùng áo phông, áo kiểu. Phù hợp mặc hằng ngày\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng:83-65-93 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:1:\"1\";s:1:\"m\";s:1:\"1\";s:1:\"l\";s:1:\"1\";s:2:\"xl\";s:1:\"1\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-25', '1'),
(186, 'N8285', 'ÁO THUN TRƠN SLIM FIT', 174, 25, 'upload/resize/tna1_thump.jpg upload/tna2.jpg upload/tna3.jpg upload/tna4.jpg upload/tna5.jpg', 'upload/resize/tna1_thump.jpg upload/resize/tna2_thump.jpg upload/resize/tna3_thump.jpg upload/resize/tna4_thump.jpg upload/resize/tna5_thump.jpg', 100000, 130000, 'Áo thun nam cổ tròn, tay ngắn, kiểu dáng Slim fit, form cơ bản.\r\n\r\nChất liệu thun cao cấp, mang đến cho bạn nam sự trẻ trung, năng động nhưng cũng không kém phần hiện đại.\r\n\r\nBên cạnh đó, sản phẩm với 4 gam màu trung tính, giúp bạn quý anh dễ phối cùng các phụ kiện khác làm tăng thêm sự sành điệu trong phong cách thời trang của mình cũng như vừa đảm bảo phù hợp để phối cùng mọi set đồ năng động, trẻ trung. ', 'a:5:{s:1:\"s\";i:9;s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 2, '2024-04-25', '1'),
(187, 'N207', 'ÁO THUN TRƠN SLIM FIT', 174, 24, 'upload/resize/tnb1_thump.jpg upload/tnb2.jpg upload/tnb3.jpg upload/tnb4.jpg upload/tnb5.jpg', 'upload/resize/tnb1_thump.jpg upload/resize/tnb2_thump.jpg upload/resize/tnb3_thump.jpg upload/resize/tnb4_thump.jpg upload/resize/tnb5_thump.jpg', 129000, 150000, 'Áo thun nam cổ tròn, tay ngắn, kiểu dáng Slim fit, form cơ bản.\r\n\r\nChất liệu thun cao cấp, mang đến cho bạn nam sự trẻ trung, năng động nhưng cũng không kém phần hiện đại.\r\n\r\nBên cạnh đó, sản phẩm với 4 gam màu trung tính, giúp bạn quý anh dễ phối cùng các phụ kiện khác làm tăng thêm sự sành điệu trong phong cách thời trang của mình cũng như vừa đảm bảo phù hợp để phối cùng mọi set đồ năng động, trẻ trung. ', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 7, '2024-04-25', '1'),
(188, 'N70', 'ÁO THUN SYMPHONY', 174, 25, 'upload/resize/tnc1_thump.jpg upload/tnc2.jpg upload/tnc3.jpg upload/tnc4.jpg upload/tnc5.jpg', 'upload/resize/tnc1_thump.jpg upload/resize/tnc2_thump.jpg upload/resize/tnc3_thump.jpg upload/resize/tnc4_thump.jpg upload/resize/tnc5_thump.jpg', 100000, 145000, 'Áo phông chất thun, dáng Regular, độ dài thoải mái. Tay cộc, cổ tròn. Phía trước in lệch chữ Symphony. Phía sau in hình thiên nhiên khổ lớn.\r\n\r\nMột mẫu áo năng động, phối hình in sáng màu phù hợp cho chàng trẻ trung. Thiết kế có độ rộng thoải mái, cover tốt những khuyết điểm mà người mặc chưa tự tin.\r\n\r\nMàu sắc: Ghi khói - Đen\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(189, 'N8518', 'ÁO THUN SYMPHONY', 174, 23, 'upload/resize/tnd1_thump.jpg upload/tnd2.jpg upload/tnd4.jpg upload/tnd3.jpg upload/tnd5.jpg', 'upload/resize/tnd1_thump.jpg upload/resize/tnd2_thump.jpg upload/resize/tnd4_thump.jpg upload/resize/tnd3_thump.jpg upload/resize/tnd5_thump.jpg', 100000, 120000, 'Áo phông chất thun, dáng Regular, độ dài thoải mái. Tay cộc, cổ tròn. Phía trước in lệch chữ Symphony. Phía sau in hình thiên nhiên khổ lớn.\r\n\r\nMột mẫu áo năng động, phối hình in sáng màu phù hợp cho chàng trẻ trung. Thiết kế có độ rộng thoải mái, cover tốt những khuyết điểm mà người mặc chưa tự tin.\r\n\r\nMàu sắc: Ghi khói - Đen\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-25', '1'),
(190, 'N4140', 'ÁO THUN ANTI-HAVEN', 174, 25, 'upload/resize/tne1_thump.jpg upload/tne2.jpg upload/tne3.jpg upload/tne4.jpg upload/tne5.jpg', 'upload/resize/tne1_thump.jpg upload/resize/tne2_thump.jpg upload/resize/tne3_thump.jpg upload/resize/tne4_thump.jpg upload/resize/tne5_thump.jpg', 100000, 149000, 'Áo thun dáng Regular, độ dài vừa phải, tay cộc, cổ tròn. Phía trước in hình và chữ bắt mắt, trẻ trung.\r\n\r\nĐây là một chiếc áo thun cơ bản, năng động dành cho các chàng trai mùa hè. Gam đen dễ phối được kết hợp cùng hình in sáng màu trẻ trung. Dáng Regular vừa vặn giúp người mặc trông gọn gàng hơn.\r\n\r\nMàu sắc: Đen\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:1:\"0\";s:2:\"xl\";s:1:\"0\";s:3:\"xxl\";s:1:\"0\";}', 1, '2024-04-25', '1'),
(191, 'N5386', 'ÁO THUN NAM DÀI TAY', 174, 25, 'upload/resize/tnf1_thump.jpg upload/tnf2.jpg upload/tnf3.jpg upload/tnf5.jpg', 'upload/resize/tnf1_thump.jpg upload/resize/tnf2_thump.jpg upload/resize/tnf3_thump.jpg upload/resize/tnf5_thump.jpg', 100000, 150000, 'Áo thun cổ đức bằng chun co giãn, cài 3 khuy cài. Tay dài bo gấu. Dáng áo suông với màu đơn sắc dễ phối hợp.\r\n\r\nSử dụng chất liệu thun mềm mại, thông thoáng và co giãn tối ưu, tạo cảm giác thoải mái khi mặc. Mix cùng quần jean, quần short...để có set đồ năng động cho mùa này\r\n\r\nMàu sắc: Gold - Đỏ Ruby\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm\r\n\r\n', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(192, 'N4171', 'ÁO SƠ MI DENIM REGULAR', 175, 23, 'upload/sma1.jpg upload/sma2.jpg upload/sma3.jpg upload/sma4.jpg upload/sma5.jpg', 'upload/resize/sma1_thump.jpg upload/resize/sma2_thump.jpg upload/resize/sma3_thump.jpg upload/resize/sma4_thump.jpg upload/resize/sma5_thump.jpg', 100000, 130000, 'Áo sơ mi được làm từ chất liệu denim. Dáng ôm nhẹ, cộc tay. Cổ tay gấp gấu 2-3cm. Chiều dài vừa phải.\r\n\r\nMột thiết kế sơ mi từ chất liệu denim sáng màu sẽ giúp trẻ hóa phong cách của chàng. Không khó để nhận thấy những thiết kế có độ ôm nhẹ thường tôn dáng người mặc tốt hơn. Lựa chọn một chiếc áo Regular fit như thế này cũng giúp hình ảnh của chàng trông gọn gàng và chỉn chu hơn đó.\r\n\r\nMàu sắc: Xanh lơ\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm\r\n\r\n ', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 2, '2024-04-25', '1'),
(193, 'N3590', 'ÁO SƠ MI', 175, 27, 'upload/resize/smb1_thump.jpg upload/smb2.jpg upload/smb3.jpg upload/smb4.jpg upload/smb5.jpg', 'upload/resize/smb1_thump.jpg upload/resize/smb2_thump.jpg upload/resize/smb3_thump.jpg upload/resize/smb4_thump.jpg upload/resize/smb5_thump.jpg', 110000, 139000, 'Áo sơ mi IVY men thiết kế cổ đức, dáng suông, dài tay. Kết hợp hai mảng họa tiết khác nhau. Chất liệu Lụa cao cấp mềm, mỏng nhẹ. Kiểu dáng trẻ trung, họa tiết sang trọng phù hợp với thời trang đi chơi, đi làm, dạo phố, du lịch, event...', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(194, 'N9620', 'ÁO PHAO NAM SIÊU NHẸ', 176, 25, 'upload/resize/kn1_thump.jpg upload/kn2.jpg upload/kn3.jpg upload/kn4.jpg upload/kn5.jpg', 'upload/resize/kn1_thump.jpg upload/resize/kn2_thump.jpg upload/resize/kn3_thump.jpg upload/resize/kn4_thump.jpg upload/resize/kn5_thump.jpg', 119000, 130000, 'Áo phao chần bông dáng suông. Cổ mũ, dài tay. Có 2 túi khóa kéo phía trước. Cài bằng dây khóa kéo cùng màu phía trước. Vải chần bông cách đều.\r\n\r\nBên trong nhồi bông dày dặn với phom dáng chuẩn cùng đường may tỉ mỉ. Tính năng giữ nhiệt, chống nước, độ bền cao.\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(196, 'N7819', 'ÁO PHAO NAM SIÊU NHẸ', 176, 26, 'upload/resize/kn6_thump.jpg upload/kn7.jpg upload/kn8.jpg upload/kn9.jpg upload/kn10.jpg', 'upload/resize/kn6_thump.jpg upload/resize/kn7_thump.jpg upload/resize/kn8_thump.jpg upload/resize/kn9_thump.jpg upload/resize/kn10_thump.jpg', 100000, 120000, 'Áo phao chần bông dáng suông. Cổ mũ, dài tay. Có 2 túi khóa kéo phía trước. Cài bằng dây khóa kéo cùng màu phía trước. Vải chần bông cách đều.\r\n\r\nBên trong nhồi bông dày dặn với phom dáng chuẩn cùng đường may tỉ mỉ. Tính năng giữ nhiệt, chống nước, độ bền cao.\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(197, 'N103', 'ÁO PHAO NAM SIÊU NHẸ', 176, 25, 'upload/resize/kn11_thump.jpg upload/kn12.jpg upload/kn13.jpg upload/kn14.jpg upload/kn15.jpg', 'upload/resize/kn11_thump.jpg upload/resize/kn12_thump.jpg upload/resize/kn13_thump.jpg upload/resize/kn14_thump.jpg upload/resize/kn15_thump.jpg', 100000, 129000, 'Áo phao chần bông dáng suông. Cổ mũ, dài tay. Có 2 túi khóa kéo phía trước. Cài bằng dây khóa kéo cùng màu phía trước. Vải chần bông cách đều.\r\n\r\nBên trong nhồi bông dày dặn với phom dáng chuẩn cùng đường may tỉ mỉ. Tính năng giữ nhiệt, chống nước, độ bền cao.\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm\r\n\r\n', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(198, 'N2931', 'ÁO PHAO NAM SIÊU NHẸ', 176, 26, 'upload/resize/kn16_thump.jpg upload/kn17.jpg upload/kn18.jpg upload/kn19.jpg upload/kn20.jpg', 'upload/resize/kn16_thump.jpg upload/resize/kn17_thump.jpg upload/resize/kn18_thump.jpg upload/resize/kn19_thump.jpg upload/resize/kn20_thump.jpg', 110000, 130000, 'Áo phao chần bông dáng suông. Cổ mũ, dài tay. Có 2 túi khóa kéo phía trước. Cài bằng dây khóa kéo cùng màu phía trước. Vải chần bông cách đều.\r\n\r\nBên trong nhồi bông dày dặn với phom dáng chuẩn cùng đường may tỉ mỉ. Tính năng giữ nhiệt, chống nước, độ bền cao.\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(199, 'N7339', 'ÁO KHOÁC NAM', 176, 27, 'upload/resize/kn21_thump.jpg upload/kn22.jpg upload/kn23.jpg upload/kn24.jpg', 'upload/resize/kn21_thump.jpg upload/resize/kn22_thump.jpg upload/resize/kn23_thump.jpg upload/resize/kn24_thump.jpg', 110000, 129000, 'Áo phao chần bông dáng suông. Cổ mũ, dài tay. Có 2 túi khóa kéo phía trước. Cài bằng dây khóa kéo cùng màu phía trước. Vải chần bông cách đều.\r\n\r\nBên trong nhồi bông dày dặn với phom dáng chuẩn cùng đường may tỉ mỉ. Tính năng giữ nhiệt, chống nước, độ bền cao.\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-25', '1'),
(200, 'N7620', 'ÁO PHAO NAM SIÊU NHẸ', 176, 25, 'upload/resize/kn25_thump.jpg upload/kn26.jpg upload/kn27.jpg upload/kn28.jpg upload/kn29.jpg', 'upload/resize/kn25_thump.jpg upload/resize/kn26_thump.jpg upload/resize/kn27_thump.jpg upload/resize/kn28_thump.jpg upload/resize/kn29_thump.jpg', 100000, 129000, 'Áo phao chần bông dáng suông. Cổ mũ, dài tay. Có 2 túi khóa kéo phía trước. Cài bằng dây khóa kéo cùng màu phía trước. Vải chần bông cách đều.\r\n\r\nBên trong nhồi bông dày dặn với phom dáng chuẩn cùng đường may tỉ mỉ. Tính năng giữ nhiệt, chống nước, độ bền cao.\r\n\r\nMẫu mặc size L:\r\n\r\nChiều cao: 1m85\r\nCân nặng: 75kg\r\nSố đo 3 vòng: 100-78-95 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(201, 'N3347', 'ÁO VEST NAM', 177, 26, 'upload/resize/vna1_thump.jpg upload/vna2.jpg upload/vna3.jpg upload/vna4.jpg upload/vna5.jpg', 'upload/resize/vna1_thump.jpg upload/resize/vna2_thump.jpg upload/resize/vna3_thump.jpg upload/resize/vna4_thump.jpg upload/resize/vna5_thump.jpg', 110000, 129000, 'Áo vest cổ hai ve khoét chữ V. Tay dài có 4 khuy. Có 1 túi trước ngực, 2 vuông có nắp 2 bên, có 3 túi lót bên trong. Có 2 khuy cài mặt trước. Xẻ tà 2 bên phía sau.\r\n\r\nĐể tạo nên những bộ suit đẳng cấp, các nhà thiết kế tài ba của IVY Men tỉ mỉ trong từng đường chỉ, phom dáng cứng cáp từ cầu vai, vạt áo cho đến chiều dài chuẩn của ống tay đều được IVY Men chú trọng.\r\nĐi cùng là chất liệu cao cấp nhập khẩu từ Nhật Bản. Tất cả tạo nên những bộ Suit hoàn hảo - Chuẩn mực tối thượng của sự lịch lãm đầy nam tính.\r\n\r\nMàu sắc: Đen - Xanh Đậm - Xanh Tím Than - Ghi Khói', 'a:5:{s:1:\"s\";i:9;s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-25', '1'),
(203, 'N9947', 'ÁO VEST NAM', 177, 25, 'upload/resize/vnb1_thump.jpg upload/vnb2.jpg upload/vnb3.jpg upload/vnb4.jpg upload/vnb5.jpg', 'upload/resize/vnb1_thump.jpg upload/resize/vnb2_thump.jpg upload/resize/vnb3_thump.jpg upload/resize/vnb4_thump.jpg upload/resize/vnb5_thump.jpg', 100000, 150000, 'Áo vest cổ hai ve khoét chữ V. Tay dài có 4 khuy. Có 1 túi trước ngực, 2 vuông có nắp 2 bên, có 3 túi lót bên trong. Có 2 khuy cài mặt trước. Xẻ tà 2 bên phía sau.\r\n\r\nĐể tạo nên những bộ suit đẳng cấp, các nhà thiết kế tài ba của IVY Men tỉ mỉ trong từng đường chỉ, phom dáng cứng cáp từ cầu vai, vạt áo cho đến chiều dài chuẩn của ống tay đều được IVY Men chú trọng.\r\nĐi cùng là chất liệu cao cấp nhập khẩu từ Nhật Bản. Tất cả tạo nên những bộ Suit hoàn hảo - Chuẩn mực tối thượng của sự lịch lãm đầy nam tính.\r\n\r\nMàu sắc: Đen - Xanh Đậm - Xanh Tím Than - Ghi Khói', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(204, 'N5824', 'ÁO VEST XANH LƠ', 177, 24, 'upload/resize/vnc1_thump.jpg upload/vnc2.jpg upload/vnc3.jpg upload/vnc4.jpg upload/vnc4.jpg', 'upload/resize/vnc1_thump.jpg upload/resize/vnc2_thump.jpg upload/resize/vnc3_thump.jpg upload/resize/vnc4_thump.jpg upload/resize/vnc4_thump.jpg', 110000, 127000, 'Áo Vest nam kiểu dáng trẻ trung - lịch lãm - sang trọng, không chỉ giành riêng cho các quý ông thành đạt mà còn phù hợp với các chàng trai trẻ đang đi tìm cho mình 1 phong thái đĩnh đạc, nam tính.\r\n\r\nChất liệu vải co giãn nhẹ tạo cảm giác thoải mái, khỏe khoắn khi mặc. Thiết kế ôm dáng, tôn body, 2 túi trước có nắp túi, có 1 cúc cài. Các phụ kiện từ chỉ may đến khuy đều được chọn lựa tinh tế, phối màu hoàn hảo cho một bộ Vest đẳng cấp.', 'a:5:{s:1:\"s\";i:9;s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-25', '1'),
(205, 'N6870', 'ÁO VEST XANH DƯƠNG', 177, 27, 'upload/resize/vnd1_thump.jpg upload/vnd2.jpg upload/vnd4.jpg upload/vnd4.jpg', 'upload/resize/vnd1_thump.jpg upload/resize/vnd2_thump.jpg upload/resize/vnd4_thump.jpg upload/resize/vnd4_thump.jpg', 100000, 129000, 'Áo Vest nam kiểu dáng trẻ trung - lịch lãm - sang trọng, không chỉ giành riêng cho các quý ông thành đạt mà còn phù hợp với các chàng trai trẻ đang đi tìm cho mình 1 phong thái đĩnh đạc, nam tính.\r\n\r\nChất liệu vải co giãn nhẹ tạo cảm giác thoải mái, khỏe khoắn khi mặc. Thiết kế ôm dáng, tôn body, 2 túi trước có nắp túi, có 1 cúc cài. Các phụ kiện từ chỉ may đến khuy đều được chọn lựa tinh tế, phối màu hoàn hảo cho một bộ Vest đẳng cấp.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(206, 'N5542', 'ÁO VEST NAM', 177, 25, 'upload/resize/vne1_thump.jpg upload/vne2.jpg upload/vne3.jpg upload/vne4.jpg upload/vne5.jpg', 'upload/resize/vne1_thump.jpg upload/resize/vne2_thump.jpg upload/resize/vne3_thump.jpg upload/resize/vne4_thump.jpg upload/resize/vne5_thump.jpg', 100000, 149000, 'Áo vest cổ hai ve khoét chữ V. Tay dài có 4 khuy. Có 1 túi trước ngực, 2 vuông có nắp 2 bên, có 3 túi lót bên trong. Có 2 khuy cài mặt trước. Xẻ tà 2 bên phía sau.\r\n\r\nĐể tạo nên những bộ suit đẳng cấp, các nhà thiết kế tài ba của IVY Men tỉ mỉ trong từng đường chỉ, phom dáng cứng cáp từ cầu vai, vạt áo cho đến chiều dài chuẩn của ống tay đều được IVY Men chú trọng.\r\nĐi cùng là chất liệu cao cấp nhập khẩu từ Nhật Bản. Tất cả tạo nên những bộ Suit hoàn hảo - Chuẩn mực tối thượng của sự lịch lãm đầy nam tính.\r\n\r\nMàu sắc: Đen - Xanh Đậm - Xanh Tím Than - Ghi Khói', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(207, 'N8194', 'ÁO VEST NAM', 177, 24, 'upload/resize/vnf1_thump.jpg upload/vnf2.jpg upload/vnf3.jpg upload/vnf4.jpg upload/vnf5.jpg', 'upload/resize/vnf1_thump.jpg upload/resize/vnf2_thump.jpg upload/resize/vnf3_thump.jpg upload/resize/vnf4_thump.jpg upload/resize/vnf5_thump.jpg', 120000, 150000, 'Áo vest cổ hai ve khoét chữ V. Tay dài có 4 khuy. Có 1 túi trước ngực, 2 vuông có nắp 2 bên, có 3 túi lót bên trong. Có 2 khuy cài mặt trước. Xẻ tà 2 bên phía sau.\r\n\r\nĐể tạo nên những bộ suit đẳng cấp, các nhà thiết kế tài ba của IVY Men tỉ mỉ trong từng đường chỉ, phom dáng cứng cáp từ cầu vai, vạt áo cho đến chiều dài chuẩn của ống tay đều được IVY Men chú trọng.\r\nĐi cùng là chất liệu cao cấp nhập khẩu từ Nhật Bản. Tất cả tạo nên những bộ Suit hoàn hảo - Chuẩn mực tối thượng của sự lịch lãm đầy nam tính.\r\n\r\nMàu sắc: Đen - Xanh Đậm - Xanh Tím Than - Ghi Khói\r\n', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(208, 'N4572', 'Quần Regular Khaki Basic', 178, 27, 'upload/resize/qta1_thump.jpg upload/qta2.jpg upload/qta3.jpg upload/qta4.jpg upload/qta5.jpg upload/qta6.jpg', 'upload/resize/qta1_thump.jpg upload/resize/qta2_thump.jpg upload/resize/qta3_thump.jpg upload/resize/qta4_thump.jpg upload/resize/qta5_thump.jpg upload/resize/qta6_thump.jpg', 100000, 130000, '- Quần basic Khaki hiện đại\r\n\r\n- Độ dài ngang mắt cá chân\r\n\r\n- Cạp cài khuy kèm đỉa đeo thắt lưng\r\n\r\n- Thiết kế 4 túi tiện lợi\r\n\r\n- Họa tiết trơn\r\n\r\n- Kiểu dáng Regular\r\n\r\n- Chất liệu Khaki khỏe khoắn\r\n\r\n- Bền & chống nhăn\r\n\r\n- Sản phẩm giữ form tốt ngay cả khi giặt nhiều lần bằng máy giặt\r\n\r\n- Dễ dàng bảo quản, tuổi thọ cao\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 178 cm\r\n\r\nCân nặng: 67 kg\r\n\r\nSố đo 3 vòng: 97-76-97 cm\r\n\r\nMặc size: L', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(209, 'N9853', 'Quần Regular Tuysi Basic', 178, 25, 'upload/resize/qtb1_thump.jpg upload/qtb2.jpg upload/qtb3.jpg upload/qtb4.jpg upload/qtb5.jpg', 'upload/resize/qtb1_thump.jpg upload/resize/qtb2_thump.jpg upload/resize/qtb3_thump.jpg upload/resize/qtb4_thump.jpg upload/resize/qtb5_thump.jpg', 113000, 123000, '- Quần dài nam basic\r\n\r\n- Cạp khuy cài, kèm đỉa\r\n\r\n- Thiết kế 4 túi\r\n\r\n- Họa tiết trơn\r\n\r\n- Màu sắc trung tính, thời thượng\r\n\r\n- Kiểu dáng Regular\r\n\r\n- Chất liệu Tuysi\r\n\r\n- Chống nhăn/ nhàu hiệu quả\r\n\r\n- Thoáng mát, thoải mái khi mặc\r\n\r\n- Độ bền màu cao\r\n\r\n- Dể dàng mix&match với nhiều trang phục khác nhau\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 178 cm\r\n\r\nCân nặng: 67 kg\r\n\r\nSố đo 3 vòng: 97-76-97 cm\r\n\r\nMặc size: L', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 3, '2024-04-25', '1'),
(210, 'N2073', 'Slim Trouser', 178, 27, 'upload/resize/qtc1_thump.jpg upload/qtc2.jpg upload/qtc3.jpg upload/qtc4.jpg upload/qtc5.jpg', 'upload/resize/qtc1_thump.jpg upload/resize/qtc2_thump.jpg upload/resize/qtc3_thump.jpg upload/resize/qtc4_thump.jpg upload/resize/qtc5_thump.jpg', 119000, 149000, ' Quần tây dáng dài, phong cách lịch lãm và nhã nhặn phù hợp khi đi làm, tham dự sự kiện hoặc những cuộc hội họp. Chiều dài vừa vặn ngang mắt cá chân để phối cùng giày tây, tạo nên set đồ chỉn chu. \r\n\r\n- Form dáng Slim đơn giản, thiết kế trơn với màu đen dễ sử dụng, che đi một số khuyết điểm trên cơ thể như eo to, chân cong. Đai quần có khuy cài và đỉa để điều chình độ rộng. \r\n\r\n- Chất liệu cao cấp, mềm mát và chống nhăn, dễ dàng vệ sinh, bảo quản. Độ co giãn tốt giúp người mặc dễ dàng di chuyển hoặc vận động. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 175 cm\r\n\r\nCân nặng: 70 kg\r\n\r\nSố đo 3 vòng: 98-75-97 cm\r\n\r\nMẫu mặc size M', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(211, 'N4978', 'Quần Tây Regular', 178, 26, 'upload/resize/qtd1_thump.jpg upload/qtd2.jpg upload/qtd3.jpg upload/qtd4.jpg upload/qtd4.jpg', 'upload/resize/qtd1_thump.jpg upload/resize/qtd2_thump.jpg upload/resize/qtd3_thump.jpg upload/resize/qtd4_thump.jpg upload/resize/qtd4_thump.jpg', 100000, 145000, '- Quần âu dáng Regular dài ngang mắt cá chân lịch lãm, sang trọng giúp cơ thể trở lên cân đối hơn.\r\n\r\n- Form quần đơn giản dễ diện, dễ phối đồ và phù hợp cho nhiều sự kiện từ đi làm, đi họp, đi học đến đi chơi.\r\n\r\n- Chất liệu Tuysi co dãn tốt giúp người mặc thoải mái vận động.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 185 cm\r\n\r\nCân nặng: 70 kg\r\n\r\nSố đo 3 vòng: 92-78-98 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(212, 'N5865', 'Quần Tây Regular', 178, 24, 'upload/resize/qte1_thump.jpg upload/qte2.jpg upload/qte3.jpg upload/qte4.jpg upload/qte5.jpg', 'upload/resize/qte1_thump.jpg upload/resize/qte2_thump.jpg upload/resize/qte3_thump.jpg upload/resize/qte4_thump.jpg upload/resize/qte5_thump.jpg', 100000, 145000, '- Quần âu dáng Regular dài ngang mắt cá chân lịch lãm, sang trọng giúp cơ thể trở lên cân đối hơn.\r\n\r\n- Form quần đơn giản dễ diện, dễ phối đồ và phù hợp cho nhiều sự kiện từ đi làm, đi họp, đi học đến đi chơi.\r\n\r\n- Chất liệu Tuysi co dãn tốt giúp người mặc thoải mái vận động.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 185 cm\r\n\r\nCân nặng: 70 kg\r\n\r\nSố đo 3 vòng: 92-78-98 cm\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua màn hình máy tính/ điện thoại.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(213, 'N2311', 'Quần Tây Regular', 178, 23, 'upload/resize/qtf1_thump.jpg upload/qtf2.jpg upload/qtf3.jpg upload/qtf4.jpg upload/qtf4.jpg', 'upload/resize/qtf1_thump.jpg upload/resize/qtf2_thump.jpg upload/resize/qtf3_thump.jpg upload/resize/qtf4_thump.jpg upload/resize/qtf4_thump.jpg', 110000, 129000, '- Quần âu dáng Regular dài ngang mắt cá chân lịch lãm, sang trọng giúp cơ thể trở lên cân đối hơn.\r\n\r\n- Form quần đơn giản dễ diện, dễ phối đồ và phù hợp cho nhiều sự kiện từ đi làm, đi họp, đi học đến đi chơi.\r\n\r\n- Chất liệu Tuysi co dãn tốt giúp người mặc thoải mái vận động.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 185 cm\r\n\r\nCân nặng: 70 kg\r\n\r\nSố đo 3 vòng: 92-78-98 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(214, 'N3531', 'Jeans Slim', 179, 25, 'upload/jn1.jpg upload/jn2.jpg upload/jn3.jpg upload/jn4.jpg upload/jn5.jpg', 'upload/resize/jn1_thump.jpg upload/resize/jn2_thump.jpg upload/resize/jn3_thump.jpg upload/resize/jn4_thump.jpg upload/resize/jn5_thump.jpg', 110000, 145000, '- Quần shorts Jeans basic\r\n\r\n- Độ dài ngang đùi\r\n\r\n- Thiết kế 4 túi\r\n\r\n- Cạp cài khuy kèm đỉa đeo thắt lưng\r\n\r\n- Khóa YKK, cúc được sản xuất riêng\r\n\r\n- Họa tiết trơn\r\n\r\n- Chất liệu Demin tuyển chọn \r\n\r\n- Không sử dụng các chất làm màu, hóa chất độc\r\n\r\n- Độ bền bỉ cao, hạn chế phai, bạc màu. \r\n\r\n- Giữ form dáng tốt\r\n\r\n- Dễ dàng mix&match với nhiều kiểu trang phục khác nhau\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 178 cm\r\n\r\nCân nặng: 67 kg\r\n\r\nSố đo 3 vòng: 97-76-97 cm\r\n\r\nMặc size: L', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(215, 'N5655', 'Quần jeans Slim fit', 179, 25, 'upload/resize/jn6_thump.jpg upload/jn7.jpg upload/jn8.jpg upload/jn9.jpg upload/jn9.jpg', 'upload/resize/jn6_thump.jpg upload/resize/jn7_thump.jpg upload/resize/jn8_thump.jpg upload/resize/jn9_thump.jpg upload/resize/jn9_thump.jpg', 100000, 125000, '- Quần Jeans basic\r\n\r\n- Độ dài qua mắt cá chân\r\n\r\n- Tạo điểm nhấn qua các đường chỉ nổi khác màu\r\n\r\n- Thiết kế 4 túi\r\n\r\n- Cạp cài khuy kèm đỉa đeo thắt lưng\r\n\r\n- Khóa YKK, cúc được sản xuất riêng\r\n\r\n- Chất liệu Demin tuyển chọn \r\n\r\n- Không sử dụng các chất làm màu, hóa chất độc\r\n\r\n- Độ bền bỉ cao, hạn chế phai, bạc màu. \r\n\r\n- Giữ form dáng tốt\r\n\r\n- Dễ dàng mix&match với nhiều kiểu trang phục khác nhau\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 178 cm\r\n\r\nCân nặng: 67 kg\r\n\r\nSố đo 3 vòng: 97-76-97 cm\r\n\r\nMặc size: L', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(216, 'N6691', 'Quần Jeans slim fit', 179, 28, 'upload/resize/jn10_thump.jpg upload/jn11.jpg upload/jn12.jpg upload/jn13.jpg upload/jn14.jpg', 'upload/resize/jn10_thump.jpg upload/resize/jn11_thump.jpg upload/resize/jn12_thump.jpg upload/resize/jn13_thump.jpg upload/resize/jn14_thump.jpg', 111000, 120000, '- Quần Jeans basic\r\n\r\n- Độ dài qua mắt cá chân\r\n\r\n- Thiết kế 4 túi\r\n\r\n- Cạp cài khuy kèm đỉa đeo thắt lưng\r\n\r\n- Khóa YKK, cúc được sản xuất riêng\r\n\r\n- Chất liệu Demin tuyển chọn \r\n\r\n- Không sử dụng các chất làm màu, hóa chất độc\r\n\r\n- Độ bền bỉ cao, hạn chế phai, bạc màu. \r\n\r\n- Giữ form dáng tốt\r\n\r\n- Dễ dàng mix&match với nhiều kiểu trang phục khác nhau\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 178 cm\r\n\r\nCân nặng: 67 kg\r\n\r\nSố đo 3 vòng: 97-76-97 cm\r\n\r\nMặc size: L', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(217, 'N143', 'Quần Jeans Regular fit', 179, 26, 'upload/resize/jn15_thump.jpg upload/jn16.jpg upload/jn17.jpg upload/jn18.jpg upload/jn19.jpg', 'upload/resize/jn15_thump.jpg upload/resize/jn16_thump.jpg upload/resize/jn17_thump.jpg upload/resize/jn18_thump.jpg upload/resize/jn19_thump.jpg', 110000, 130000, '- Quần jeans dáng Regular Fit thoải mái, không quá ôm sát, tăng tính linh hoạt khi di chuyển. \r\n\r\n- Thiết kế lựa chọn gam màu xanh than, đậm chất nam tính, giúp quý anh khẳng định gu thời trang phong cách và thời thượng. \r\n\r\n- Túi quần giữ nguyên kiểu dáng truyền thống với hai túi phía trước và hai túi phía sau.\r\n\r\n- Đường may chắc chắn, giúp quần giữ form và bền bỉ theo thời gian. Đặc biệt quần đi kèm với chi tiết đường may đối contrast để tạo điểm nhấn.\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 185 cm\r\n\r\nCân nặng: 70 kg\r\n\r\nSố đo 3 vòng: 92-78-98 cm', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(218, 'N2755', 'Quần Jeans Slim', 179, 24, 'upload/resize/jn20_thump.jpg upload/jn21.jpg upload/jn22.jpg upload/jn23.jpg upload/jn24.jpg', 'upload/resize/jn20_thump.jpg upload/resize/jn21_thump.jpg upload/resize/jn22_thump.jpg upload/resize/jn23_thump.jpg upload/resize/jn24_thump.jpg', 110000, 129000, 'Quần jeans Slim là sản phẩm must-have trong tủ đồ của bạn vì tính ứng dụng rất cao. Phù hợp với mọi tỉ lệ cơ thể cũng như biến hóa với gần như tất cả outfit của bạn. \r\n\r\n- Quần sản xuất từ chất liệu Demin tuyển chọn: có độ thoải mái, an toàn cho da nhạy cảm nhất\r\n- Không sử dụng các chất làm màu, hóa chất độc. \r\n- Có độ bền cao, hạn chế phai, bạc màu: Khóa YKK, cúc được sản xuất riêng. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 186 cm\r\n\r\nCân nặng: 75  kg\r\n\r\nMẫu mặc size XXL', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(219, 'N5490', 'Quần jeans dáng regular', 179, 25, 'upload/resize/jn25_thump.jpg upload/jn26.jpg upload/jn27.jpg upload/jn28.jpg upload/jn29.jpg', 'upload/resize/jn25_thump.jpg upload/resize/jn26_thump.jpg upload/resize/jn27_thump.jpg upload/resize/jn28_thump.jpg upload/resize/jn29_thump.jpg', 100000, 145000, '- Dáng regular với form ôm vừa phải giúp cho người mặc cảm thấy thoải mái và tự tin khi di chuyển.\r\n\r\n- Chất liệu vải denim cao cấp được sử dụng mang lại sự bền chắc và độ bền cao cho quần bò, giúp sản phẩm đảm bảo sẽ luôn giữ form và màu sắc nguyên bản sau nhiều lần giặt và sử dụng.\r\n\r\n- Hoạ tiết trơn cổ điển cùng với màu xanh denim trang nhã và thanh lịch, dễ dàng kết hợp với nhiều kiểu áo và phụ kiện khác nhau để tạo nên những bộ trang phục đa dạng và phong phú.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(221, 'N4056', 'Quần short Regular cotton', 180, 24, 'upload/resize/snb1_thump.jpg upload/snb2.jpg upload/snb3.jpg upload/snb4.jpg upload/snb5.jpg', 'upload/resize/snb1_thump.jpg upload/resize/snb2_thump.jpg upload/resize/snb3_thump.jpg upload/resize/snb4_thump.jpg upload/resize/snb5_thump.jpg', 110000, 120000, '- Quần short ngang gối\r\n\r\n- Thiết kế túi tiện lợi\r\n\r\n- Cạp co giãn, đai điều chỉnh\r\n\r\n- Họa tiết trơn\r\n\r\n- Kiểu dáng Regular\r\n\r\n- Chất liệu thô Cotton\r\n\r\n- Thoái mái, dễ chịu cho mùa hè\r\n\r\n- Chống nhăn/ nhàu hiệu quả\r\n\r\n- Dể dàng mix&match với nhiều trang phục khác nhau\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 178 cm\r\n\r\nCân nặng: 67 kg\r\n\r\nSố đo 3 vòng: 97-76-97 cm\r\n\r\nMặc size: L', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(222, 'N7382', 'Quần short Regular cotton', 180, 26, 'upload/resize/snc1_thump.jpg upload/snc2.jpg upload/snc3.jpg upload/snc4.jpg upload/snc5.jpg', 'upload/resize/snc1_thump.jpg upload/resize/snc2_thump.jpg upload/resize/snc3_thump.jpg upload/resize/snc4_thump.jpg upload/resize/snc5_thump.jpg', 120000, 130000, '- Quần short ngang gối\r\n\r\n- Thiết kế túi tiện lợi\r\n\r\n- Cạp co giãn, đai điều chỉnh\r\n\r\n- Họa tiết trơn\r\n\r\n- Kiểu dáng Regular\r\n\r\n- Chất liệu thô Cotton\r\n\r\n- Thoái mái, dễ chịu cho mùa hè\r\n\r\n- Chống nhăn/ nhàu hiệu quả\r\n\r\n- Dể dàng mix&match với nhiều trang phục khác nhau\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 178 cm\r\n\r\nCân nặng: 67 kg\r\n\r\nSố đo 3 vòng: 97-76-97 cm\r\n\r\nMặc size: L', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(226, 'T3792', 'ÁO THUN BÉ TRAI NGẮN TAY', 207, 26, 'upload/resize/bta1_thump.jpg upload/bta2.jpg upload/bta3.jpg upload/bta4.jpg upload/bta5.jpg', 'upload/resize/bta1_thump.jpg upload/resize/bta2_thump.jpg upload/resize/bta3_thump.jpg upload/resize/bta4_thump.jpg upload/resize/bta5_thump.jpg', 100000, 129000, 'Áo thun được làm từ chất liệu thấm hút, không gây kích ứng cho da bé, giúp bé luôn cảm thấy thoải mái và khô ráo suốt cả ngày.\r\n\r\nBa mẹ có thể dễ dàng kết hợp áo với các loại quần, quần short hoặc jeans để tạo ra nhiều phong cách khác nhau cho bé. Ngoài ra, sản phẩm còn có nhiều màu sắc và họa tiết đa dạng để bạn lựa chọn phù hợp với sở thích và phong cách của bé trai.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(227, 'T3638', 'ÁO THUN THÊU CHỮ', 207, 26, 'upload/resize/btb1_thump.jpg upload/btb2.jpg upload/btb3.jpg upload/btb4.jpg upload/btb5.jpg', 'upload/resize/btb1_thump.jpg upload/resize/btb2_thump.jpg upload/resize/btb3_thump.jpg upload/resize/btb4_thump.jpg upload/resize/btb5_thump.jpg', 100000, 120000, 'Áo thun tay ngắn với chất liệu thông thoáng là một lựa chọn hoàn hảo cho những ngày hè nóng bức. Thiết kế cổ tròn đơn giản được đính kèm 3 khuy trang trí tạo nên điểm nhấn thú vị cho sản phẩm.\r\n\r\nVới thiết kế đơn giản và dễ phối đồ, chiếc áo thun này có thể được kết hợp với nhiều loại quần như jean, short. Nếu bé muốn tạo nên phong cách năng động, hãy chọn quần jean và giày sneakers. Trong khi đó, muốn tạo nên phong cách lịch sự cho bé, hãy kết hợp chiếc áo thun này với quần âu.\r\n\r\nKhông chỉ là một thiết kế thoải mái và dễ mặc, chiếc áo thun tay ngắn còn là một lựa chọn thời trang đa năng và phù hợp với nhiều phong cách khác nhau.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(228, 'T5542', 'ÁO POLO THÊU HÌNH', 207, 23, 'upload/resize/btc1_thump.jpg upload/btc2.jpg upload/btc3.jpg upload/btc4.jpg upload/btc5.jpg', 'upload/resize/btc1_thump.jpg upload/resize/btc2_thump.jpg upload/resize/btc3_thump.jpg upload/resize/btc4_thump.jpg upload/resize/btc5_thump.jpg', 100000, 130000, 'Sử dụng chất liệu vải thoáng mát, thông thoáng cho những hoạt động vui chơi học tập của bé. Áo có thêu hình trước ngực tạo nên điểm độc đáo và thu hút, hình ảnh được thêu nổi, tỉ mỉ tới từng chi tiết, không bị phai màu và bền bỉ theo thời gian.\r\n\r\nCó thể kết hợp với quần jean, sooc hay quần kaki để mang đến những bộ trang phục phong cách, thoải mái cho bé. Nếu muốn tạo nên phong cách lịch sự hơn cho những buổi đi chơi hay đi học, ba mẹ hãy phối áo polo với quần âu hoặc quần tây.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(229, 'T4897', 'SET THUN IN HÌNH TÚI', 209, 28, 'upload/resize/qbta1_thump.jpg upload/qbta2.jpg upload/qbta3.jpg upload/qbta4.jpg upload/qbta5.jpg', 'upload/resize/qbta1_thump.jpg upload/resize/qbta2_thump.jpg upload/resize/qbta3_thump.jpg upload/resize/qbta4_thump.jpg upload/resize/qbta5_thump.jpg', 100000, 150000, 'Bộ thun cho bé trai rộng rãi, thoáng mát. Hình in túi đeo chéo độc đáo khiến set đồ bắt mắt hơn. Bộ thun này phù hợp để bé diện đến lớp hoặc đi chơi cùng gia đình.\r\n\r\nMàu sắc: Cam - Xanh tím than\r\n\r\nMẫu nhí mặc size 8-9\r\n\r\nChiều cao: 1m15 - Cân nặng: 20kg', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(230, 'T1163', 'SET THUN TRƠN KHÔNG TAY', 209, 24, 'upload/resize/qbtc1_thump.jpg upload/qbtc2.jpg upload/qbtc3.jpg upload/qbtc4.jpg upload/qbtc5.jpg', 'upload/resize/qbtc1_thump.jpg upload/resize/qbtc2_thump.jpg upload/resize/qbtc3_thump.jpg upload/resize/qbtc4_thump.jpg upload/resize/qbtc5_thump.jpg', 100000, 200000, 'Bộ thun trơn với dáng áo không tay phù hợp với những bé hiếu động, ra mồ hôi nhiều. Thiết kế mát mẻ giúp bé hoạt động, vui chơi thoải mái ngay cả trong những ngày nắng nóng.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(231, 'T1909', 'QUẦN SOOC PHỐI TÚI NẮP', 209, 26, 'upload/resize/qbtb1_thump.jpg upload/qbtb2.jpg upload/qbtb3.jpg upload/qbtb4.jpg upload/qbtb5.jpg', 'upload/resize/qbtb1_thump.jpg upload/resize/qbtb2_thump.jpg upload/resize/qbtb3_thump.jpg upload/resize/qbtb4_thump.jpg upload/resize/qbtb5_thump.jpg', 100000, 150000, 'Quần sooc ngắn cho bé trai, năng động với túi hộp mix cùng vải kẻ lạ mắt. Dáng quần suông, rộng, độ dài ngang đầu gối. Chất liệu Khaki đứng dáng, không bị nhàu nát sau khi hoạt động mạnh.\r\n\r\nMàu sắc: Bạc - Vàng nghệ - Xanh dương đậm\r\n\r\nMẫu nhí mặc size 8-9\r\n\r\nChiều cao: 1m37 - Cân nặng: 39kg', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(232, 'T4179', 'SET 3 ĐÔI TẤT', 211, 23, 'upload/resize/pkbt1_thump.jpg upload/pkbt2.jpg upload/pkbt3.jpg upload/pkbt1.jpg upload/pkbt2.jpg', 'upload/resize/pkbt1_thump.jpg upload/resize/pkbt2_thump.jpg upload/resize/pkbt3_thump.jpg upload/resize/pkbt1_thump.jpg upload/resize/pkbt2_thump.jpg', 100000, 123000, 'Tất trơn cotton 3 chiếc 3 màu, hạn chế vi khuẩn: Hút ẩm - Giữ ấm - Thoải mái - Mềm mại. Thành phần cotton tự nhiên có khả năng giữ nhiệt cao tạo cảm giác thư giãn khi mang. Bảo vệ và cải thiện sức khỏe khi sử dụng.\r\n\r\nThành phần: 80% Cotton - 15% Spandex - 5% Latex\r\n\r\nMàu sắc: 3 màu', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(233, 'T1940', 'COMBO 2 KHẨU TRANG BẠC', 211, 27, 'upload/resize/pkbt4_thump.jpg upload/pkbt5.png upload/pkbt6.jpg upload/pkbt7.jpg upload/pkbt8.jpg', 'upload/resize/pkbt4_thump.jpg upload/resize/pkbt5_thump.png upload/resize/pkbt6_thump.jpg upload/resize/pkbt7_thump.jpg upload/resize/pkbt8_thump.jpg', 100000, 150000, 'chính thức cho ra mắt thiết kế tự tay sản xuất mang tên KHẨU TRANG NANO BẠC 3 LỚP KHÁNG KHUẨN:\r\n+ Lớp ngoài: Chất liệu vải sợi tre Bamboo & Infinity Nano mềm mịn, thấm hút cao và chống tia UV.\r\n+ Lớp giữa: Lưới nano phân tử bạc có khả năng tiêu diệt 99% vi khuẩn sau 120s tiếp xúc.\r\n+ Lớp trong cùng: Vải lưới cotton 100% mắt lưới siêu nhỏ - mềm mịn thoáng khí.\r\nCông dụng:\r\n- Lớp Nano diệt khuẩn có hiệu lực diệt 99% vi khuẩn trong thời gian 120s tiếp xúc, chống khói và bụi mịn hiệu quả.\r\n- Thiết kế thời trang và khoa học đảm bảo che phủ vừa khít vùng miệng mũi không gây khó thở; không gây mờ kính khi sử dụng.\r\n- Không chứa các loại kim loại nặng theo tiêu chuẩn quy định. \r\n- Thời gian sử dụng 2 tháng: Không giới hạn số lần sử dụng!!!', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(234, 'T6884', 'BỘ BẢO HỘ PHÒNG DỊCH', 211, 24, 'upload/resize/pkbt9_thump.jpg upload/pkbt10.jpg upload/pkbt11.jpg upload/pkbt12.jpg upload/pkbt10.jpg', 'upload/resize/pkbt9_thump.jpg upload/resize/pkbt10_thump.jpg upload/resize/pkbt11_thump.jpg upload/resize/pkbt12_thump.jpg upload/resize/pkbt10_thump.jpg', 100000, 112000, 'Trang phục phòng hộ do chính IVY sản xuất, sử dụng 1 lần bao gồm áo mũ liền quần, bao chân:\r\n- Chất liệu PP Sunboned 40gsm thoáng khí, chống giọt bắn, không thấm nước.\r\n- Được thiết kế bảo vệ an toàn toàn bộ cơ thể ( Đặc biệt các vị trí mắt, mũi, miệng, tay..)\r\n- Bảo vệ tuyệt đối khỏi các loại virus trong môi trường.\r\n- Dễ dàng phân hủy, không gây ô nhiễm , thân thiện môi trường.\r\n* Size: ĐỦ KÍCH THƯỚC CHO CẢ GIA ĐÌNH\r\n+ Kid S (1m20 -1m30)\r\n+ Kid M (1m30 – 1m40)\r\n+ S (1m50 -1m60)\r\n+ M (1m60 – 1m70)\r\n+ L (1m70 – 1m80)', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(235, 'T423', ' SƠ MI TRẮNG BÉ GÁI', 206, 25, 'upload/resize/bga1_thump.jpg upload/bga2.jpg upload/bga3.jpg upload/bga4.jpg upload/bga5.jpg', 'upload/resize/bga1_thump.jpg upload/resize/bga2_thump.jpg upload/resize/bga3_thump.jpg upload/resize/bga4_thump.jpg upload/resize/bga5_thump.jpg', 100000, 145000, 'Áo sơ mi cổ đức, dáng suông. Áo dài tay có phối bèo cách điệu. Chất liệu vải thô dày dặn, thoáng mát. Áo basic dễ dàng kết hợp với mọi items khác nhau. Một thiết kế xinh xắn, nữ tính phù hợp cho bé diện đến trường!\r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 128 cm\r\n\r\nCân nặng: 28 kg\r\n\r\nMẫu mặc size 8-9\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1');
INSERT INTO `tb_product` (`id_product`, `code_product`, `name_product`, `id_category`, `id_label`, `image`, `image_thump`, `price_product`, `saleprice_product`, `describe_product`, `size_product`, `view_product`, `date_product`, `status_product`) VALUES
(236, 'T2442', ' ÁO 2 DÂY PHỐI BÈO', 206, 24, 'upload/resize/bgb1_thump.jpg upload/bgb2.jpg upload/bgb3.jpg upload/bgb4.jpg upload/bgb5.jpg', 'upload/resize/bgb1_thump.jpg upload/resize/bgb2_thump.jpg upload/resize/bgb3_thump.jpg upload/resize/bgb4_thump.jpg upload/resize/bgb5_thump.jpg', 100000, 145000, 'Áo 2 dây vải thô, thiết kế phối bèo xếp tầng xòe rộng.\r\n\r\nQuần dài dáng lửng, eo chun co giãn.\r\n\r\nSet đồ màu sắc tươi tắn, chất liệu vải thô mềm nhẹ thấm hút mồ hôi tốt giúp bé có một mùa hè vui chơi thoải mái mà vẫn dễ chịu ngay cả khi thời tiết nóng bức nhất.', 'a:4:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(237, 'T8507', 'ÁO 2 DÂY PHỐI BÈO', 206, 27, 'upload/resize/bgc1_thump.jpg upload/bgc2.jpg upload/bgc3.jpg upload/bgc4.jpg upload/bgc5.jpg', 'upload/resize/bgc1_thump.jpg upload/resize/bgc2_thump.jpg upload/resize/bgc3_thump.jpg upload/resize/bgc4_thump.jpg upload/resize/bgc5_thump.jpg', 110000, 129000, 'Áo 2 dây vải thô, thiết kế phối bèo xếp tầng xòe rộng.\r\n\r\nQuần dài dáng lửng, eo chun co giãn.\r\n\r\nSet đồ màu sắc tươi tắn, chất liệu vải thô mềm nhẹ thấm hút mồ hôi tốt giúp bé có một mùa hè vui chơi thoải mái mà vẫn dễ chịu ngay cả khi thời tiết nóng bức nhất.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 2, '2024-04-25', '1'),
(238, 'T3461', 'SET ÁO THUN KÈM QUẦN', 208, 23, 'upload/resize/qbga1_thump.jpg upload/qbga2.jpg upload/qbga3.jpg upload/qbga4.jpg upload/qbga5.jpg', 'upload/resize/qbga1_thump.jpg upload/resize/qbga2_thump.jpg upload/resize/qbga3_thump.jpg upload/resize/qbga4_thump.jpg upload/resize/qbga5_thump.jpg', 110000, 140000, 'Áo thun dáng suông dài, phía trước in họa tiết hoa nổi bật. Áo được phối họa tiết bèo thêm phần đáng yêu.\r\n\r\nQuần chất liệu vải thun, dáng lửng ôm sát cá tính, eo chun co giãn thoải mái.\r\n\r\nChẳng cần suy nghĩ mix & match nhiều, set đồ mẹ chọn cho bé đi học hay đi chơi đều xinh xắn, thoải mái.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(239, 'T5877', 'SET 2 DÂY COOL', 208, 23, 'upload/resize/qbgb1_thump.jpg upload/qbgb2.jpg upload/qbgb3.jpg upload/qbgb4.jpg upload/qbgb5.jpg', 'upload/resize/qbgb1_thump.jpg upload/resize/qbgb2_thump.jpg upload/resize/qbgb3_thump.jpg upload/resize/qbgb4_thump.jpg upload/resize/qbgb5_thump.jpg', 100000, 130000, 'Set thun bao gồm áo 2 dây và quần ngắn. Dáng áo suông, quần ngắn và hơi ôm. Trên áo và quần có chữ in trang trí COOL. Màu sắc bắt mắt và đáng yêu.\r\n\r\nSet đồ này sẽ giúp quãng thời gian nghỉ ngơi và vui đùa ở nhà của bé trở nên dễ chịu hơn. Thiết kế ngắn và suông phù hợp cho những ngày hè nắng nóng. Chất liệu thun thoáng mát và thấm hút mồ hôi rất tốt.\r\n\r\nMàu sắc: Hồng san hô', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(241, 'T1816', 'BỘ ÁO THUN VÀ QUẦN GIẢ', 208, 25, 'upload/resize/qbgc2_thump.jpg upload/qbgc1.jpg upload/qbgc3.jpg upload/qbgc4.jpg upload/qbgc5.jpg', 'upload/resize/qbgc2_thump.jpg upload/resize/qbgc1_thump.jpg upload/resize/qbgc3_thump.jpg upload/resize/qbgc4_thump.jpg upload/resize/qbgc5_thump.jpg', 112000, 130000, 'Set áo thun được in hình logo mặt cười IVY Kids. Bộ bao gồm áo suông, tay phồng và quần giả váy vạt lệch. Thiết kế nữ tính nhưng vẫn rộng rãi và thoải mái, phù hợp để bé mặc đi học hoặc đi chơi. Hình in sắc nét, tươi sáng làm tăng thêm độ đáng yêu.\r\n\r\nMàu sắc: Nude - Hồng', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-25', '1'),
(242, 'T4954', 'ĐẦM XOÈ CỔ VUÔNG', 210, 25, 'upload/resize/vbga1_thump.jpg upload/vbga2.jpg upload/vbga3.jpg upload/vbga4.jpg upload/vbga1.jpg', 'upload/resize/vbga1_thump.jpg upload/resize/vbga2_thump.jpg upload/resize/vbga3_thump.jpg upload/resize/vbga4_thump.jpg upload/resize/vbga1_thump.jpg', 100000, 130000, 'Đầm dáng xoè, thiết kế cổ vuông cùng hoạ tiết in ngộ nghĩnh. Phần dây áo được chần chun co giãn, thoải mái. Đầm sử dụng chất liệu thun cotton cao cấp, mang đến cảm giác mặc thoải mái, bảo vệ làn da cho bé. \r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-26', '1'),
(243, 'T9723', 'ĐẦM XOÈ CỔ VUÔNG', 210, 25, 'upload/resize/vbgb1_thump.jpg upload/vbgb2.jpg upload/vbgb3.jpg upload/vbgb4.jpg upload/vbgb1.jpg', 'upload/resize/vbgb1_thump.jpg upload/resize/vbgb2_thump.jpg upload/resize/vbgb3_thump.jpg upload/resize/vbgb4_thump.jpg upload/resize/vbgb1_thump.jpg', 100000, 123000, 'Đầm dáng xoè, thiết kế cổ vuông cùng hoạ tiết in ngộ nghĩnh. Phần dây áo được chần chun co giãn, thoải mái. Đầm sử dụng chất liệu thun cotton cao cấp, mang đến cảm giác mặc thoải mái, bảo vệ làn da cho bé. \r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 1, '2024-04-26', '1'),
(244, 'T1939', 'ĐẦM THUN HOẠ TIẾT', 210, 24, 'upload/resize/vbgc1_thump.jpg upload/vbgc2.jpg upload/vbgc3.jpg upload/vbgc4.jpg upload/vbgc1.jpg', 'upload/resize/vbgc1_thump.jpg upload/resize/vbgc2_thump.jpg upload/resize/vbgc3_thump.jpg upload/resize/vbgc4_thump.jpg upload/resize/vbgc1_thump.jpg', 110000, 125000, 'Đầm thun cổ tròn, tay hến cá tinh. Dáng đầm xòe, độ dài ngang đầu gối. Chất liệu thun thoáng mát, thoải mái, mềm mịn trên làn da bé. Đầm in hoạ tiết hoa đáng yêu, màu sắc tươi sáng thích hợp cho bé diện đi chơi hay ở nhà.\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua mản hình máy tính/ điện thoại.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-26', '1'),
(245, 'G9660', 'Giày Boots nam ELEGANT Boots', 212, 23, 'upload/resize/gna1_thump.jpg upload/gna2.jpg upload/gna3.jpg upload/gna4.jpg upload/gna5.jpg', 'upload/resize/gna1_thump.jpg upload/resize/gna2_thump.jpg upload/resize/gna3_thump.jpg upload/resize/gna4_thump.jpg upload/resize/gna5_thump.jpg', 100000, 150000, 'Elegant Boots Đen là mẫu Boots có dây và khóa kéo bên sườn khác biệt so với phiên bản truyền thống, mang lại cảm giác tiện dụng cho người sở hữu. Mẫu giày phù hợp với những người đàn ông yêu thích sự cá tính, phóng khoáng nhưng vẫn giữ được nét lịch lãm và sang trọng. Phiên bản màu đen là một lựa chọn an toàn và linh hoạt cho mọi dịp.', 'a:5:{i:27;s:2:\"10\";i:28;s:2:\"10\";i:29;s:2:\"10\";i:30;s:2:\"10\";i:31;s:2:\"10\";}', 15, '2024-04-26', '1'),
(248, 'G8691', 'Giày Boots nam ELEGANT Boots', 212, 24, 'upload/resize/gnb1_thump.jpg upload/gnb2.jpg upload/gnb3.jpg upload/gnb4.jpg upload/gnb5.jpg', 'upload/resize/gnb1_thump.jpg upload/resize/gnb2_thump.jpg upload/resize/gnb3_thump.jpg upload/resize/gnb4_thump.jpg upload/resize/gnb5_thump.jpg', 100000, 150000, 'Elegant Boots là mẫu Boots có dây và khóa kéo bên sườn khác biệt so với phiên bản truyền thống, mang lại cảm giác tiện dụng cho người sở hữu. Mẫu giày phù hợp với những người đàn ông yêu thích sự cá tính, phóng khoáng nhưng vẫn giữ được nét lịch lãm và sang trọng. Phiên bản ELEGANT Boots – Nâu mang lại lựa chọn mới mẻ và thời thượng cho mọi dịp.\r\n\r\nTự hào thiết kế & sản xuất bởi DASH JK – Thương hiệu giày da nam của người Việt', 'a:5:{i:27;s:2:\"10\";i:28;s:2:\"10\";i:29;s:2:\"10\";i:30;s:2:\"10\";i:31;s:2:\"10\";}', 13, '2024-04-26', '1'),
(249, 'G7920', 'Giày Boots nam MATURE Chelsea', 212, 24, 'upload/resize/gnc1_thump.jpg upload/gnc2.jpg upload/gnc3.jpg upload/gnc4.jpg upload/gnc5.jpg', 'upload/resize/gnc1_thump.jpg upload/resize/gnc2_thump.jpg upload/resize/gnc3_thump.jpg upload/resize/gnc4_thump.jpg upload/resize/gnc5_thump.jpg', 100000, 130000, 'Mature Chelsea Boots là mẫu Chelsea Boots không dây đơn giản và linh hoạt, với thiết kế khoét 2 mặt bên đàn hồi, mang lại cảm giác thoải mái. Mẫu giày là biểu tượng của sự trưởng thành, vừa sang trọng, lịch sự, vừa đĩnh đạc, trầm ổn, vừa nam tính, mạnh mẽ. Phiên bản MATURE Chelsea Boots – Đen là một lựa chọn an toàn và linh hoạt cho mọi dịp.\r\n\r\nTự hào thiết kế & sản xuất bởi DASH JK – Thương hiệu giày da nam của người Việt', 'a:5:{i:40;s:2:\"10\";i:41;s:2:\"10\";i:42;i:9;i:43;s:2:\"10\";i:44;s:2:\"10\";}', 2, '2024-04-26', '1'),
(250, 'G2520', 'Giày Nike Air Jordan 1 Low', 213, 24, 'upload/resize/gnua1_thump.jpg upload/gna2.jpeg upload/gna3.jpeg upload/gna4.jpeg upload/gna5.jpeg', 'upload/resize/gnua1_thump.jpg upload/resize/gna2_thump.jpg upload/resize/gna3_thump.jpg upload/resize/gna4_thump.jpg upload/resize/gna5_thump.jpg', 100000, 145000, 'Giày Nike Air Jordan 1 Low ‘Aluminum’ Ice Blue với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.\r\n\r\nVà nếu bạn cũng là một người đam mê dòng sneaker dễ mang, dễ phố đồ thì không nên bỏ qua mẫu giày siêu phẩm này đâu nhé! Dưới đây là một số hình ảnh của đôi Giày Nike Air Jordan 1 Low ‘Aluminum’ Ice Blue Like Auth tại TyHi Sneaker (hàng chuẩn bản xịn nhất thị trường).', 'a:5:{i:27;s:2:\"10\";i:28;s:2:\"10\";i:29;s:2:\"10\";i:30;s:2:\"10\";i:31;s:2:\"10\";}', 0, '2024-04-26', '1'),
(251, 'G6204', 'Giày Nike Air Jordan 1 Low ', 213, 24, 'upload/resize/gnb1_thump.jpg upload/gnb2.jpg upload/gnb3.jpg upload/gnb4.jpg upload/gnb5.jpg', 'upload/resize/gnb1_thump.jpg upload/resize/gnb2_thump.jpg upload/resize/gnb3_thump.jpg upload/resize/gnb4_thump.jpg upload/resize/gnb5_thump.jpg', 100000, 130000, 'Giày Nike Air Jordan 1 Low Panda Like Auth với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.\r\n\r\nVà nếu bạn cũng là một người đam mê dòng sneaker dễ mang, dễ phố đồ thì không nên bỏ qua mẫu giày siêu phẩm này đâu nhé! Dưới đây là một số hình ảnh của đôi Giày Nike Air Jordan 1 Low Panda Like Auth tại TyHi Sneaker (hàng chuẩn likeuauth, bản xịn nhất thị trường, đế Air 100%).', 'a:5:{i:27;s:2:\"10\";i:28;s:2:\"10\";i:29;s:2:\"10\";i:30;s:2:\"10\";i:31;s:2:\"10\";}', 2, '2024-04-26', '1'),
(252, 'G4213', 'Giày Jd1 Paris Bản Trung', 213, 30, 'upload/resize/gnc1_thump.jpg upload/gnuc2.jpeg upload/gnuc3.jpeg upload/gnuc4.jpeg upload/gnuc5.jpeg', 'upload/resize/gnc1_thump.jpg upload/resize/gnuc2_thump.jpg upload/resize/gnuc3_thump.jpg upload/resize/gnuc4_thump.jpg upload/resize/gnuc5_thump.jpg', 100000, 130000, 'Giày Jd1 Paris Bản Trung Cực Nét 1:1 với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.  Và nếu bạn cũng là một người đam mê dòng sneaker dễ mang, dễ phố đồ thì không nên bỏ qua mẫu giày siêu phẩm này đâu nhé! Dưới đây là một số hình ảnh của đôi Giày Jd1 Paris Bản Trung Cực Nét 1:1 tại TyHi Sneaker (hàng chuẩn Trung, bản xịn nhất thị trường).', 'a:5:{i:27;s:2:\"10\";i:28;s:2:\"10\";i:29;s:2:\"10\";i:30;s:2:\"10\";i:31;s:2:\"10\";}', 0, '2024-04-26', '1'),
(253, 'P9324', 'TẤT TRƠN COTTON (1 ĐÔI)', 217, 27, 'upload/resize/pknua1_thump.jpg upload/pknua2.jpg upload/pknua3.jpg upload/pknua4.jpg upload/pknua1.jpg', 'upload/resize/pknua1_thump.jpg upload/resize/pknua2_thump.jpg upload/resize/pknua3_thump.jpg upload/resize/pknua4_thump.jpg upload/resize/pknua1_thump.jpg', 100000, 120000, 'Tất trơn cotton, hạn chế vi khuẩn: Hút ẩm - Giữ ấm - Thoải mái - Mềm mại. Thành phần cotton tự nhiên có khả năng giữ nhiệt cao tạo cảm giác thư giãn khi mang. Bảo vệ và cải thiện sức khỏe khi sử dụng.\r\n\r\nThành phần: 80% Cotton - 15% Spandex - 5% Latex\r\n\r\nMàu sắc: Trắng - Đen', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-26', '1'),
(254, 'P9019', 'KHĂN LỤA OMBRÉ', 217, 23, 'upload/resize/pknub1_thump.jpg upload/pknub2.jpg upload/pknub3.jpg upload/pknub1.jpg upload/pknub2.jpg', 'upload/resize/pknub1_thump.jpg upload/resize/pknub2_thump.jpg upload/resize/pknub3_thump.jpg upload/resize/pknub1_thump.jpg upload/resize/pknub2_thump.jpg', 100000, 150000, 'Khăn lụa vuông, phối màu Ombré hút mắt. Thiết kế khăn được làm từ chất liệu lụa mềm cao cấp, phù hợp để nàng diện như một chiếc áo yếm hay dùng làm phụ kiện cho quần áo, túi xác hằng ngày.', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-26', '1'),
(255, 'P1799', 'THẮT LƯNG DA NỮ', 217, 23, 'upload/resize/pknuc1_thump.jpg upload/pknuc2.jpg upload/pknuc3.jpg upload/pknuc4.jpg upload/pknuc1.jpg', 'upload/resize/pknuc1_thump.jpg upload/resize/pknuc2_thump.jpg upload/resize/pknuc3_thump.jpg upload/resize/pknuc4_thump.jpg upload/resize/pknuc1_thump.jpg', 100000, 150000, 'Thắt lưng bằng da tổng hợp. Có đai luồn dây bằng da và mặt khóa cài hình tròn bằng kim loại.\r\n\r\nMàu sắc: Đen - Nâu cà phê', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-26', '1'),
(256, 'P5446', '2 ĐÔI TẤT NAM CỔ CAO', 216, 26, 'upload/resize/pkna1_thump.jpg upload/pkna2.jpg upload/pkna3.jpg upload/pkna1.jpg upload/pkna2.jpg', 'upload/resize/pkna1_thump.jpg upload/resize/pkna2_thump.jpg upload/resize/pkna3_thump.jpg upload/resize/pkna1_thump.jpg upload/resize/pkna2_thump.jpg', 110000, 120000, 'Tất trơn cotton, hạn chế vi khuẩn: Hút ẩm - Giữ ấm - Thoải mái - Mềm mại. Thành phần cotton tự nhiên có khả năng giữ nhiệt cao tạo cảm giác thư giãn khi mang. Bảo vệ và cải thiện sức khỏe khi sử dụng.\r\n\r\nThành phần: 80% Cotton - 15% Spandex - 5% Latex\r\n\r\nMàu sắc: Ghi khói', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-04-26', '1'),
(257, 'P4347', 'KẸP CÀ VẠT IVY MEN', 216, 26, 'upload/resize/pknb1_thump.jpg upload/pknb2.jpg upload/pknb1.jpg upload/pknb2.jpg', 'upload/resize/pknb1_thump.jpg upload/resize/pknb2_thump.jpg upload/resize/pknb1_thump.jpg upload/resize/pknb2_thump.jpg', 100000, 129000, 'Kẹp cà vạt IVY men  được làm bằng hợp kim cao cấp, chống rỉ sét, mang lại sự sang trọng và đẳng cấp cho các quý ông. Mẫu thiết kế với các họa tiết độc đáo và tinh tế. Sản phẩm được chúng tôi nghiên cứu và lựa chọn phù hợp với nhiều loại cà vạt, áo vest, ghi lê, sơ mi…\r\n\r\nChiều dài: 4cm\r\n\r\nMàu sắc: Đen - Bạc\r\n\r\n', 'a:1:{s:1:\"s\";s:2:\"10\";}', 0, '2024-04-26', '1'),
(258, 'P9096', 'CÀ VẠT NAM', 216, 24, 'upload/resize/pknc1_thump.jpg upload/pknc2.jpg upload/pknc3.jpg upload/pknc4.jpg upload/pknc5.jpg', 'upload/resize/pknc1_thump.jpg upload/resize/pknc2_thump.jpg upload/resize/pknc3_thump.jpg upload/resize/pknc4_thump.jpg upload/resize/pknc5_thump.jpg', 100000, 120000, 'Họa tiết thanh lịch màu sắc đa dạng, Cà vạt đẹp sẽ là phụ kiện giúp các quý ông nổi bật đầy nam tính. Chất liệu lụa cao cấp mềm mịn tạo cảm giác thoải mái khi sử dụng.\r\n\r\nPhối hợp cùng với vest tạo nên một phong cách thời trang mới mẻ, lịch sự và trang trọng.\r\n\r\nMàu sắc: Bạc Hà - Xanh Cổ Vịt Đậm - Xanh Dương Đậm - Họa tiết Ghi Khói', 'a:1:{s:1:\"s\";s:2:\"10\";}', 0, '2024-04-26', '1'),
(276, 'N7915', 'ÁO VEST NAM 5', 177, 24, 'upload/resize/vna10_thump.jpg upload/vna11.jpg upload/vna12.jpg upload/vna13.jpg upload/vna14.jpg', 'upload/resize/vna10_thump.jpg upload/resize/vna11_thump.jpg upload/resize/vna12_thump.jpg upload/resize/vna13_thump.jpg upload/resize/vna14_thump.jpg', 110000, 150000, 'Áo vest cổ hai ve khoét chữ V. Tay dài có 4 khuy. Có 1 túi trước ngực, 2 vuông có nắp 2 bên, có 3 túi lót bên trong. Có 2 khuy cài mặt trước. Xẻ tà 2 bên phía sau. Để tạo nên những bộ suit đẳng cấp, các nhà thiết kế tài ba của IVY Men tỉ mỉ trong từng đường chỉ, phom dáng cứng cáp từ cầu vai, vạt áo cho đến chiều dài chuẩn của ống tay đều được IVY Men chú trọng. Đi cùng là chất liệu cao cấp nhập khẩu từ Nhật Bản. Tất cả tạo nên những bộ Suit hoàn hảo - Chuẩn mực tối thượng của sự lịch lãm đầy nam tính. Màu sắc: Đen - Xanh Đậm - Xanh Tím Than - Ghi Khói', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-05-01', '1'),
(277, 'N9109', 'Áo sơ Mi', 226, 33, 'upload/resize/z5409808204021_ac6c231e1b95d08c372665bba17cd4e5_thump.jpg upload/z5409808200191_a3fa48aa9ca8c68db6636e789afc6001.jpg upload/z5409808207133_0ca55b5e4d7a195299588e08ada62c57.jpg upload/z5409808208339_9c001a63fddb015edcc12dfd7ac87e3c.jpg', 'upload/resize/z5409808204021_ac6c231e1b95d08c372665bba17cd4e5_thump.jpg upload/resize/z5409808200191_a3fa48aa9ca8c68db6636e789afc6001_thump.jpg upload/resize/z5409808207133_0ca55b5e4d7a195299588e08ada62c57_thump.jpg upload/resize/z5409808208339_9c001a63fddb015edcc12dfd7ac87e3c_thump.jpg', 1000000000, 2000000000, 'nhanh tay kẻo hết', 'a:5:{s:1:\"s\";s:1:\"1\";s:1:\"m\";s:1:\"0\";s:1:\"l\";s:1:\"0\";s:2:\"xl\";s:1:\"0\";s:3:\"xxl\";s:1:\"0\";}', 3, '2024-05-04', '1'),
(278, 'N9970', 'Ngọ wibu', 226, 33, 'upload/resize/z5409810635775_3ec480d70ca515555f45c8b6eb5e097c_thump.jpg upload/z5409810641158_5a72f2bfb5d60d902a91ad093fedbdb9.jpg upload/z5409810635775_3ec480d70ca515555f45c8b6eb5e097c.jpg upload/z5409810641158_5a72f2bfb5d60d902a91ad093fedbdb9.jpg', 'upload/resize/z5409810635775_3ec480d70ca515555f45c8b6eb5e097c_thump.jpg upload/resize/z5409810641158_5a72f2bfb5d60d902a91ad093fedbdb9_thump.jpg upload/resize/z5409810635775_3ec480d70ca515555f45c8b6eb5e097c_thump.jpg upload/resize/z5409810641158_5a72f2bfb5d60d902a91ad093fedbdb9_thump.jpg', 2000000000, 2147483647, 'tên wibu thôi chứ t ko wibu ok', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-05-04', '1'),
(279, 'N4738', 'Sao lỡ làm thế', 226, 33, 'upload/resize/z5409810651223_5944e1fd07592ad7048b2a1c10d75d41_thump.jpg upload/z5409810650082_f30fa42492b83de18a6478504495e772.jpg upload/z5409810718126_e3a70938fa2795108ba5dd5abf310b4a.jpg upload/z5409810709013_5e1104c11cc5805c31a8c28f6675b11d.jpg upload/z5409810718021_203baf97b5c55e4af1eeda0f3bf28d8c.jpg upload/z5409811575437_dbc3bb3745fd16651e8b97d9a0c09129.jpg upload/z5409810701208_d7ef0c1a68bf3eb9db9979ab4beca424.jpg', 'upload/resize/z5409810651223_5944e1fd07592ad7048b2a1c10d75d41_thump.jpg upload/resize/z5409810650082_f30fa42492b83de18a6478504495e772_thump.jpg upload/resize/z5409810718126_e3a70938fa2795108ba5dd5abf310b4a_thump.jpg upload/resize/z5409810709013_5e1104c11cc5805c31a8c28f6675b11d_thump.jpg upload/resize/z5409810718021_203baf97b5c55e4af1eeda0f3bf28d8c_thump.jpg upload/resize/z5409811575437_dbc3bb3745fd16651e8b97d9a0c09129_thump.jpg upload/resize/z5409810701208_d7ef0c1a68bf3eb9db9979ab4beca424_thump.jpg', 2147483646, 2147483647, 'cuộc đời toàn người giả tạo ???? sau lớp mặt nạ ngây thơ vô số tội chính là bộ mặt thật vô số tôi????????. ', 'a:1:{s:3:\"xxl\";i:0;}', 9, '2024-05-04', '1'),
(280, 'N6834', 'Ông nội', 226, 33, 'upload/resize/z5409810694298_413116e7693151560669b78f4a49a650_thump.jpg upload/z5409810696581_f01d64d597102908df269844d1e7b78d.jpg', 'upload/resize/z5409810694298_413116e7693151560669b78f4a49a650_thump.jpg upload/resize/z5409810696581_f01d64d597102908df269844d1e7b78d_thump.jpg', 190000000, 195000000, 'Mừng thọ ông', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-05-04', '1'),
(281, 'N4235', 'Đêm tối', 226, 33, 'upload/resize/z5409810700332_bfc9da7b5f5f23afe8f7f181ee783211_thump.jpg upload/z5409810701208_d7ef0c1a68bf3eb9db9979ab4beca424.jpg', 'upload/resize/z5409810700332_bfc9da7b5f5f23afe8f7f181ee783211_thump.jpg upload/resize/z5409810701208_d7ef0c1a68bf3eb9db9979ab4beca424_thump.jpg', 129000000, 150000000, 'chân cầu vĩnh tuy', 'a:4:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";}', 1, '2024-05-04', '1'),
(282, 'N7479', 'đám cưới', 226, 33, 'upload/resize/z5409810702125_9a641f72dbc7657a8a2ce0e6a22174e5_thump.jpg upload/z5409810699925_954e2f09f7f902fecc4551cdbc3ac2ae.jpg', 'upload/resize/z5409810702125_9a641f72dbc7657a8a2ce0e6a22174e5_thump.jpg upload/resize/z5409810699925_954e2f09f7f902fecc4551cdbc3ac2ae_thump.jpg', 139000000, 146000000, 'đám cưới cj', 'a:5:{s:1:\"s\";s:2:\"10\";s:1:\"m\";s:2:\"10\";s:1:\"l\";s:2:\"10\";s:2:\"xl\";s:2:\"10\";s:3:\"xxl\";s:2:\"10\";}', 0, '2024-05-04', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_ship`
--

CREATE TABLE `tb_ship` (
  `id_ship` int(11) NOT NULL,
  `code_ship` char(10) NOT NULL,
  `id_bill` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `status_ship` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_ship`
--

INSERT INTO `tb_ship` (`id_ship`, `code_ship`, `id_bill`, `id_order`, `status_ship`) VALUES
(44, '6762354', 58, 122, '2'),
(45, '5955356', 59, 121, '2'),
(47, '8474569', 61, 125, '2'),
(48, '3531188', 62, 124, '2'),
(49, '9245060', 63, 123, '2'),
(50, '9687676', 64, 128, '1'),
(51, '7547657', 65, 127, '1'),
(52, '312716', 66, 126, '1'),
(53, '2331577', 69, 129, '1'),
(54, '132195', 67, 131, '2'),
(55, '138216', 68, 130, '2'),
(56, '9218109', 70, 135, '2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `account_user` char(20) NOT NULL,
  `pass_user` text NOT NULL,
  `name_user` varchar(100) NOT NULL,
  `birthday_user` date NOT NULL,
  `cmnd_user` char(13) NOT NULL,
  `address_user` text NOT NULL,
  `phonenumber_user` char(11) NOT NULL,
  `email_user` char(100) NOT NULL,
  `type_user` char(2) NOT NULL,
  `status_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `account_user`, `pass_user`, `name_user`, `birthday_user`, `cmnd_user`, `address_user`, `phonenumber_user`, `email_user`, `type_user`, `status_user`) VALUES
(17, 'ngo147665', '147665', 'Ngọ', '1997-10-18', '362489844', '188/48B Nguyễn Văn Cừ', '0787023467', 'lengoctienthanh@gmail.com', '0', 1),
(19, 'ngo2', '147665', 'ngọ 2', '2002-05-14', '037202001400', 'Ninh Bình', '0354146537', 'ngo147665@huce.edu.vn', '1', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tb_bill`
--
ALTER TABLE `tb_bill`
  ADD PRIMARY KEY (`id_bill`),
  ADD KEY `fk_order` (`id_order`);

--
-- Chỉ mục cho bảng `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Chỉ mục cho bảng `tb_city`
--
ALTER TABLE `tb_city`
  ADD PRIMARY KEY (`id_city`);

--
-- Chỉ mục cho bảng `tb_contact`
--
ALTER TABLE `tb_contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tb_district`
--
ALTER TABLE `tb_district`
  ADD PRIMARY KEY (`id_district`),
  ADD KEY `fk_city` (`id_city`);

--
-- Chỉ mục cho bảng `tb_information`
--
ALTER TABLE `tb_information`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tb_label`
--
ALTER TABLE `tb_label`
  ADD PRIMARY KEY (`id_label`);

--
-- Chỉ mục cho bảng `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `fk_product` (`id_product`),
  ADD KEY `fk_district_order` (`id_district`);

--
-- Chỉ mục cho bảng `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_label` (`id_label`),
  ADD KEY `fk_category` (`id_category`);

--
-- Chỉ mục cho bảng `tb_ship`
--
ALTER TABLE `tb_ship`
  ADD PRIMARY KEY (`id_ship`),
  ADD KEY `fk_bill_ship` (`id_bill`);

--
-- Chỉ mục cho bảng `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tb_bill`
--
ALTER TABLE `tb_bill`
  MODIFY `id_bill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT cho bảng `tb_city`
--
ALTER TABLE `tb_city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `tb_contact`
--
ALTER TABLE `tb_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `tb_district`
--
ALTER TABLE `tb_district`
  MODIFY `id_district` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

--
-- AUTO_INCREMENT cho bảng `tb_information`
--
ALTER TABLE `tb_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `tb_label`
--
ALTER TABLE `tb_label`
  MODIFY `id_label` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT cho bảng `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT cho bảng `tb_ship`
--
ALTER TABLE `tb_ship`
  MODIFY `id_ship` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tb_bill`
--
ALTER TABLE `tb_bill`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`id_order`) REFERENCES `tb_order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tb_district`
--
ALTER TABLE `tb_district`
  ADD CONSTRAINT `fk_city` FOREIGN KEY (`id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `fk_district_order` FOREIGN KEY (`id_district`) REFERENCES `tb_district` (`id_district`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`id_product`) REFERENCES `tb_product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tb_product`
--
ALTER TABLE `tb_product`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`id_category`) REFERENCES `tb_category` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_label` FOREIGN KEY (`id_label`) REFERENCES `tb_label` (`id_label`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tb_ship`
--
ALTER TABLE `tb_ship`
  ADD CONSTRAINT `fk_bill_ship` FOREIGN KEY (`id_bill`) REFERENCES `tb_bill` (`id_bill`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
