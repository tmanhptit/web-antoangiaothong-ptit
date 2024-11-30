-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2024 at 08:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `citizen_type` enum('Người dân','Doanh nghiệp','Tổ chức','Cơ quan nhà nước') NOT NULL,
  `name` varchar(100) NOT NULL,
  `cccd` varchar(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `unit_receive` varchar(255) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Chưa xử lý','Đã xử lý') DEFAULT 'Chưa xử lý'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `citizen_type`, `name`, `cccd`, `address`, `phone`, `subject`, `content`, `unit_receive`, `attachment`, `created_at`, `status`) VALUES
(19, 'Người dân', 'Nguyễn Văn An', '1944123299', 'Nguyễn Trãi - Hà Đông - Hà Nội', '0377671031', 'Công an giao thông có hành vi không chuẩn mực', 'Lý do tôi viết đơn này là để khiếu nại về hành vi không chuẩn mực của Đồng chí Nguyễn Văn C công an giao thông trong quá trình làm nhiệm vụ tuần tra, xử lý vi phạm giao thông.\r\n\r\nCụ thể, vào lúc 19:00 20/2/2024 , tại khu vực Khu vực C, tôi đang di chuyển trên D thì bị yêu cầu dừng xe để kiểm tra. Trong quá trình kiểm tra, tôi đã gặp phải những hành vi không đúng chuẩn mực của đồng chí này\r\n\r\nHành vi thiếu tôn trọng và thiếu lịch sự.\r\nLạm dụng quyền lực trong xử lý vi phạm.', 'Bộ công an', 'atat673c9d7ff3fb7.png', '2024-11-19 14:15:28', 'Đã xử lý'),
(33, 'Người dân', 'Nguyễn Văn An', '1944123299', 'Nguyễn Trãi - Hà Đông - Hà Nội', '0377671031', 'Gây rối trật tự công cộng', 'Kính gửi cơ quan chức năng,\r\n\r\nTôi xin phản ánh về tình trạng gây rối trật tự công cộng tại khu vực [địa chỉ cụ thể] vào thời điểm [thời gian cụ thể]. Trong thời gian này, một số cá nhân đã liên tục [mô tả hành vi gây rối, ví dụ: gây ồn ào, sử dụng âm thanh lớn, tụ tập đánh nhau,...], gây ảnh hưởng nghiêm trọng đến sinh hoạt của cư dân xung quanh. Dù đã nhiều lần nhắc nhở, nhưng tình trạng này vẫn tiếp diễn, gây mất an ninh và trật tự tại địa phương.\r\n\r\nKính mong cơ quan chức năng sớm kiểm tra và có biện pháp xử lý để đảm bảo môi trường sống lành mạnh và an toàn cho cộng đồng.\r\n\r\nXin chân thành cảm ơn!\r\n\r\nNgười gửi: [Họ tên]\r\nLiên hệ: [Số điện thoại hoặc địa chỉ liên hệ]', 'Bộ công an', 'atat67416bd6cb97a.png', '2024-11-23 05:44:54', 'Đã xử lý'),
(34, 'Người dân', 'Nguyễn Văn A', '123456789012', 'Hà Nội, Quận Đống Đa, Phố Chùa Bộc', '0987654321', 'Vấn đề an ninh trật tự', 'Phản ánh về tình trạng mất trật tự tại khu phố vào buổi tối.', 'UBND Quận Đống Đa', 'an_ninh_1.jpg', '2024-11-25 15:24:00', 'Đã xử lý'),
(35, 'Người dân', 'Trần Thị B', '987654321098', 'Hồ Chí Minh, Quận 1, Phố Nguyễn Huệ', '0908765432', 'Yêu cầu sửa chữa đường', 'Đường trong ngõ bị xuống cấp nghiêm trọng, đề nghị sửa chữa.', 'Sở GTVT TP Hồ Chí Minh', 'duong_hcm_2.jpg', '2024-11-25 15:24:00', 'Đã xử lý'),
(36, 'Doanh nghiệp', 'Công ty TNHH Xây Dựng ABC', '123456789012', 'Đà Nẵng, Quận Hải Châu, Đường Bạch Đằng', '0236789012', 'Đề nghị cấp giấy phép xây dựng', 'Yêu cầu được cấp phép xây dựng tòa nhà văn phòng.', 'Sở Xây Dựng TP Đà Nẵng', 'gp_xd_3.pdf', '2024-11-25 15:24:00', 'Đã xử lý'),
(37, 'Doanh nghiệp', 'Công ty CP Thương Mại XYZ', '987654321098', 'Hải Phòng, Quận Ngô Quyền, Phố Lạch Tray', '0312345678', 'Phản ánh về thủ tục hành chính', 'Thủ tục cấp phép kinh doanh kéo dài quá lâu.', 'Sở Kế Hoạch và Đầu Tư Hải Phòng', NULL, '2024-11-25 15:24:00', 'Đã xử lý'),
(38, 'Tổ chức', 'Hội Nông dân Việt Nam', '123456789012', 'Bắc Ninh, Huyện Thuận Thành, Phố Nguyễn Trãi', '0228765432', 'Kiến nghị hỗ trợ nông nghiệp', 'Đề nghị hỗ trợ giống cây trồng và phân bón.', 'Sở NN&PTNT Bắc Ninh', NULL, '2024-11-25 15:24:00', 'Chưa xử lý'),
(39, 'Tổ chức', 'Đoàn Thanh niên tỉnh Nam Định', '987654321098', 'Nam Định, Thành phố Nam Định, Phố Trần Hưng Đạo', '0356789012', 'Đề nghị tổ chức sự kiện', 'Đề nghị hỗ trợ kinh phí tổ chức hội thảo thanh niên.', 'Sở Văn Hóa - Thể Thao Nam Định', NULL, '2024-11-25 15:24:00', 'Đã xử lý'),
(40, 'Cơ quan nhà nước', 'UBND Huyện Hoài Đức', '123456789012', 'Hà Nội, Huyện Hoài Đức, Phố Nhổn', '0243567890', 'Phản ánh về quy hoạch', 'Quy hoạch giao thông khu vực chưa rõ ràng, gây bức xúc cho người dân.', 'Sở Quy Hoạch Kiến Trúc Hà Nội', NULL, '2024-11-25 15:24:00', 'Chưa xử lý'),
(41, 'Cơ quan nhà nước', 'Phòng Tài Nguyên Môi Trường TP Vũng Tàu', '987654321098', 'Vũng Tàu, Thành phố Vũng Tàu, Phố Lê Hồng Phong', '0254789012', 'Đề nghị bảo vệ môi trường', 'Tình trạng xả thải trái phép ra biển ngày càng nghiêm trọng.', 'Sở TN&MT Bà Rịa - Vũng Tàu', NULL, '2024-11-25 15:24:00', 'Đã xử lý'),
(42, 'Người dân', 'Nguyễn Văn An', '1944123299', 'Nguyễn Trãi - Hà Đông - Hà Nội', '0377671031', 'Gây rối trật tự công cộng', 'jsdfahkjdsafh', 'Bộ công an', 'atat67483c4212578.jpg', '2024-11-28 09:47:46', 'Chưa xử lý');

-- --------------------------------------------------------

--
-- Table structure for table `loivipham`
--

CREATE TABLE `loivipham` (
  `ID` int(10) NOT NULL,
  `ma` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `tienphat` double DEFAULT NULL,
  `luatvipham` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loivipham`
--

INSERT INTO `loivipham` (`ID`, `ma`, `ten`, `tienphat`, `luatvipham`) VALUES
(27, 'L000', 'Vượt đèn đỏ', 300000, 'Điều 5, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(28, 'L001', 'Chạy quá tốc độ', 500000, 'Điều 6, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(29, 'L002', 'Đi sai làn đường', 300000, 'Điều 7, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(30, 'L003', 'Không đội mũ bảo hiểm', 300000, 'Điều 9, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(31, 'L004', 'Dừng đỗ sai quy định', 300000, 'Điều 11, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(32, 'L005', 'Sử dụng điện thoại khi lái xe', 400000, 'Điều 12, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(33, 'L006', 'Không có giấy phép lái xe', 5000000, 'Điều 21, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(34, 'L007', 'Chở quá số người quy định', 300000, 'Điều 22, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(35, 'L008', 'Điều khiển xe không có gương chiếu hậu', 400000, 'Điều 23, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(36, 'L009', 'Không có bảo hiểm trách nhiệm dân sự', 500000, 'Điều 24, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(37, 'L010', 'Vượt đèn đỏ gây tai nạn', 5000000, 'Điều 14, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(38, 'L011', 'Lái xe khi say rượu', 5000000, 'Điều 5, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(39, 'L012', 'Không có giấy tờ xe', 300000, 'Điều 6, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(40, 'L013', 'Chạy xe không có đèn chiếu sáng', 300000, 'Điều 8, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(41, 'L014', 'Điều khiển xe không đảm bảo an toàn kỹ thuật', 5000000, 'Điều 10, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(42, 'L015', 'Vi phạm quy định về tốc độ tối thiểu', 400000, 'Điều 7, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(43, 'L016', 'Chạy xe vào đường cấm', 500000, 'Điều 8, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(44, 'L017', 'Không có biển số xe', 5000000, 'Điều 9, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(45, 'L018', 'Vượt đèn đỏ gây tai nạn chết người', 5000000, 'Điều 10, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ'),
(46, 'L019', 'Lái xe khi không có giấy phép', 5000000, 'Điều 11, Nghị định 100/2019/NĐ-CP về xử lý vi phạm giao thông đường bộ');

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `ID` int(10) NOT NULL,
  `sochungminhnhandan` int(10) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `gioitinh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`ID`, `sochungminhnhandan`, `ten`, `ngaysinh`, `diachi`, `sdt`, `gioitinh`) VALUES
(66, 123456789, 'Nguyen Thi Lan', '1990-02-14', 'Hà Nội, Việt Nam', '0901234567', 'Nữ'),
(67, 987654321, 'Tran Minh Tu', '1985-07-22', 'Hồ Chí Minh, Việt Nam', '0912345678', 'Nam'),
(68, 456789123, 'Le Hoang Nam', '1993-11-05', 'Đà Nẵng, Việt Nam', '0987654321', 'Nam'),
(69, 789654123, 'Pham Thu Ha', '1991-03-30', 'Hải Phòng, Việt Nam', '0945678901', 'Nữ'),
(70, 321456987, 'Nguyen Quang Hieu', '1987-08-15', 'Cần Thơ, Việt Nam', '0932456789', 'Nam'),
(71, 654321789, 'Bui Minh Tuan', '1995-05-10', 'Nha Trang, Việt Nam', '0908765432', 'Nam'),
(72, 135792468, 'Vu Thi Thanh', '1989-01-25', 'Hà Nội, Việt Nam', '0976345678', 'Nữ'),
(73, 864209753, 'Doan Quoc Binh', '1980-12-10', 'Bình Dương, Việt Nam', '0912345679', 'Nam'),
(74, 112233445, 'Phan Thi Minh Anh', '1992-04-11', 'Vũng Tàu, Việt Nam', '0901234569', 'Nữ'),
(75, 556677889, 'Nguyen Hoang Nam', '1996-06-16', 'Thành phố Hồ Chí Minh, Việt Nam', '0918765430', 'Nam'),
(76, 234567890, 'Nguyen Thi Mai', '1984-01-20', 'Long An, Việt Nam', '0923456789', 'Nữ'),
(77, 345678901, 'Luu Minh Trung', '1992-12-14', 'Bình Phước, Việt Nam', '0903456789', 'Nam'),
(78, 456789012, 'Hoang Thi Lan', '1994-05-30', 'Ninh Bình, Việt Nam', '0914567890', 'Nữ'),
(79, 567890123, 'Phan Minh Thanh', '1988-07-09', 'Quảng Ninh, Việt Nam', '0905678901', 'Nam'),
(80, 678901234, 'Doan Thi Kim Anh', '1990-11-11', 'Quảng Bình, Việt Nam', '0922345678', 'Nữ'),
(81, 789012345, 'Trinh Thanh Son', '1995-09-14', 'Khánh Hòa, Việt Nam', '0932345678', 'Nam'),
(82, 890123456, 'Vinh Minh Tuấn', '1983-04-25', 'Lâm Đồng, Việt Nam', '0942345678', 'Nam'),
(83, 901234567, 'Nguyen Thi Lan', '1989-02-17', 'Hải Dương, Việt Nam', '0906543210', 'Nữ'),
(84, 102345678, 'Mai Thị Hương', '1994-06-21', 'Sóc Trăng, Việt Nam', '0932345678', 'Nữ'),
(85, 202345679, 'Truong Thi Lan', '1997-07-02', 'Thanh Hóa, Việt Nam', '0912345678', 'Nữ'),
(86, 303456780, 'Hoàng Minh Tuấn', '1991-03-13', 'Hà Giang, Việt Nam', '0913456789', 'Nam'),
(87, 404567891, 'Phạm Thi Lan', '1990-02-25', 'Cao Bằng, Việt Nam', '0914567890', 'Nữ'),
(88, 505678902, 'Lê Quang Hieu', '1993-08-19', 'Quảng Trị, Việt Nam', '0923456789', 'Nam'),
(89, 606789013, 'Bùi Thanh Vân', '1992-11-09', 'Yên Bái, Việt Nam', '0932345678', 'Nữ'),
(90, 707890124, 'Phạm Minh Chi', '1987-06-16', 'Bắc Giang, Việt Nam', '0912345678', 'Nữ'),
(91, 808901235, 'Đặng Minh Sơn', '1988-07-20', 'Tiền Giang, Việt Nam', '0909876543', 'Nam'),
(92, 909012346, 'Nguyễn Minh Đức', '1995-04-15', 'Hà Nam, Việt Nam', '0912345678', 'Nam'),
(93, 101234567, 'Lê Thị Thanh', '1989-03-17', 'Đắk Lắk, Việt Nam', '0908765432', 'Nữ'),
(94, 202345678, 'Phan Quang Tuấn', '1991-09-20', 'Thái Nguyên, Việt Nam', '0932345679', 'Nam'),
(95, 303456789, 'Mai Quang Sơn', '1990-12-05', 'Bến Tre, Việt Nam', '0923456789', 'Nam');

-- --------------------------------------------------------

--
-- Table structure for table `pakn`
--

CREATE TABLE `pakn` (
  `id` int(11) NOT NULL,
  `doi_tuong_phan_anh` enum('Người dân','Doanh nghiệp','Tổ chức','Cơ quan nhà nước') NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `cccd` varchar(20) NOT NULL,
  `dia_chi` text NOT NULL,
  `so_dien_thoai` varchar(15) NOT NULL,
  `pakn_ve_viec` varchar(255) NOT NULL,
  `noi_dung` text NOT NULL,
  `don_vi_tiep_nhan` varchar(255) NOT NULL,
  `tai_lieu_dinh_kem` varchar(255) DEFAULT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pakn`
--

INSERT INTO `pakn` (`id`, `doi_tuong_phan_anh`, `ho_ten`, `cccd`, `dia_chi`, `so_dien_thoai`, `pakn_ve_viec`, `noi_dung`, `don_vi_tiep_nhan`, `tai_lieu_dinh_kem`, `ngay_tao`) VALUES
(1, 'Người dân', 'Trần Trọng Mạnh', '199999999', 'Thạch Ngọc - Thạch Hà - Hà Tĩnh', '0377671031', 'Công an đẹp trai quá', 'sdfffffffffffffffffffffffffff', 'Bộ công an', '', '2024-11-19 07:02:17');

-- --------------------------------------------------------

--
-- Table structure for table `phieuvipham`
--

CREATE TABLE `phieuvipham` (
  `ID` int(10) NOT NULL,
  `ma` varchar(255) DEFAULT NULL,
  `trangthaithanhtoan` bit(1) DEFAULT NULL,
  `ngayvipham` date DEFAULT NULL,
  `diadiemvipham` varchar(255) DEFAULT NULL,
  `diadiemxuly` varchar(255) DEFAULT NULL,
  `loiviphamID` int(10) DEFAULT NULL,
  `phuongtiennguoidungID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phieuvipham`
--

INSERT INTO `phieuvipham` (`ID`, `ma`, `trangthaithanhtoan`, `ngayvipham`, `diadiemvipham`, `diadiemxuly`, `loiviphamID`, `phuongtiennguoidungID`) VALUES
(207, 'P0002', b'0', '2024-10-02', 'Hồ Chí Minh, Quận 1, Phố Nguyễn Huệ', 'Hồ Chí Minh, Quận 1, Phố Lê Lợi', 28, 35),
(209, 'P0004', b'0', '2024-10-04', 'Cần Thơ, Quận Ninh Kiều, Phố Mậu Thân', 'Cần Thơ, Quận Bình Thủy, Phố Lê Lợi', 30, 37),
(210, 'P0005', b'1', '2024-10-05', 'An Giang, Thành phố Long Xuyên, Phố Lý Thái Tổ', 'An Giang, Thành phố Châu Đốc, Phố Nguyễn Huệ', 31, 38),
(211, 'P0006', b'0', '2024-10-06', 'Nha Trang, Thành phố Nha Trang, Phố Nguyễn Tất Thành', 'Nha Trang, Thành phố Cam Ranh, Phố Trần Phú', 32, 39),
(212, 'P0007', b'1', '2024-10-07', 'Quảng Ninh, Thành phố Hạ Long, Phố Trần Hưng Đạo', 'Quảng Ninh, Thành phố Uông Bí, Phố Lý Thường Kiệt', 33, 40),
(213, 'P0008', b'0', '2024-10-08', 'Quảng Bình, Thành phố Đồng Hới, Phố Hùng Vương', 'Quảng Bình, Quận Ba Đồn, Phố Lê Lợi', 34, 41),
(214, 'P0009', b'1', '2024-10-09', 'Hải Phòng, Quận Ngô Quyền, Phố Trần Phú', 'Hải Phòng, Quận Lê Chân, Phố Quang Trung', 35, 42),
(215, 'P0010', b'0', '2024-10-10', 'Thanh Hóa, Thành phố Thanh Hóa, Phố Lê Hoàn', 'Thanh Hóa, Thành phố Sầm Sơn, Phố Trần Hưng Đạo', 36, 43),
(216, 'P0011', b'1', '2024-10-11', 'Bình Dương, Thành phố Thủ Dầu Một, Phố Lê Duẩn', 'Bình Dương, Thành phố Dĩ An, Phố Nguyễn Thị Minh Khai', 37, 44),
(217, 'P0012', b'0', '2024-10-12', 'Vũng Tàu, Thành phố Vũng Tàu, Phố Nguyễn An Ninh', 'Vũng Tàu, Thành phố Bà Rịa, Phố Nguyễn Trãi', 38, 45),
(218, 'P0013', b'1', '2024-10-13', 'Bến Tre, Thành phố Bến Tre, Phố Nguyễn Văn Cừ', 'Bến Tre, Huyện Châu Thành, Phố Lê Quý Đôn', 39, 46),
(219, 'P0014', b'0', '2024-10-14', 'Hưng Yên, Thành phố Hưng Yên, Phố Trần Hưng Đạo', 'Hưng Yên, Huyện Mỹ Hào, Phố Lê Lai', 40, 47),
(220, 'P0015', b'1', '2024-10-15', 'Sóc Trăng, Thành phố Sóc Trăng, Phố Lê Thị Hồng Gấm', 'Sóc Trăng, Huyện Kế Sách, Phố Nguyễn Tất Thành', 41, 48),
(221, 'P0016', b'0', '2024-10-16', 'Lào Cai, Thành phố Lào Cai, Phố Lý Thường Kiệt', 'Lào Cai, Huyện Bát Xát, Phố Nguyễn Huệ', 42, 49),
(222, 'P0017', b'1', '2024-10-17', 'Nam Định, Thành phố Nam Định, Phố Trần Phú', 'Nam Định, Thành phố Giao Thủy, Phố Hoàng Diệu', 43, 50),
(223, 'P0018', b'0', '2024-10-18', 'Phú Thọ, Thành phố Việt Trì, Phố Nguyễn Tất Thành', 'Phú Thọ, Huyện Phù Ninh, Phố Lê Hồng Phong', 44, 51),
(224, 'P0019', b'1', '2024-10-19', 'Bắc Ninh, Thành phố Bắc Ninh, Phố Nguyễn Trãi', 'Bắc Ninh, Huyện Gia Bình, Phố Lê Duẩn', 45, 52),
(225, 'P0020', b'0', '2024-10-20', 'Hà Giang, Thành phố Hà Giang, Phố Trần Phú', 'Hà Giang, Huyện Quang Bình, Phố Lý Thường Kiệt', 46, 53),
(226, 'P0021', b'1', '2024-10-21', 'Lạng Sơn, Thành phố Lạng Sơn, Phố Nguyễn Du', 'Lạng Sơn, Huyện Cao Lộc, Phố Lê Quý Đôn', 27, 54),
(227, 'P0022', b'0', '2024-10-22', 'Vĩnh Long, Thành phố Vĩnh Long, Phố Lê Văn Tám', 'Vĩnh Long, Huyện Long Hồ, Phố Nguyễn Hữu Cảnh', 28, 55),
(228, 'P0023', b'1', '2024-10-23', 'Yên Bái, Thành phố Yên Bái, Phố Nguyễn Thái Học', 'Yên Bái, Huyện Văn Yên, Phố Lý Thường Kiệt', 29, 56),
(230, 'P0025', b'1', '2024-10-25', 'Gia Lai, Thành phố Pleiku, Phố Lê Duẩn', 'Gia Lai, Huyện Ia Grai, Phố Trần Phú', 31, 58),
(231, 'P0026', b'0', '2024-10-26', 'Đắk Lắk, Thành phố Buôn Ma Thuột, Phố Nguyễn Tất Thành', 'Đắk Lắk, Hujdsifjsa', 33, 34),
(232, 'P0027', b'1', '2024-10-27', 'Kon Tum, Thành phố Kon Tum, Phố Trần Hưng Đạo', 'Kon Tum, Huyện Đăk Hà, Phố Nguyễn Văn Linh', 33, 35),
(233, 'P0028', b'0', '2024-10-28', 'Lâm Đồng, Thành phố Đà Lạt, Phố Phan Đình Phùng', 'Lâm Đồng, Huyện Đức Trọng, Phố Hoàng Văn Thụ', 34, 36),
(234, 'P0029', b'1', '2024-10-29', 'Bắc Kạn, Thành phố Bắc Kạn, Phố Lý Thường Kiệt', 'Bắc Kạn, Huyện Chợ Mới, Phố Phùng Chí Kiên', 35, 37),
(235, 'P0037', b'1', '2024-11-01', 'Hà Nội, Quận Ba Đình, Phố Đội Cấn', 'Hà Nội, Quận Hai Bà Trưng, Phố Bạch Mai', 33, 45),
(236, 'P0038', b'0', '2024-11-02', 'Hồ Chí Minh, Quận 7, Đường Nguyễn Văn Linh', 'Hồ Chí Minh, Quận Bình Thạnh, Phố Xô Viết Nghệ Tĩnh', 41, 50),
(237, 'P0039', b'1', '2024-11-03', 'Đà Nẵng, Quận Thanh Khê, Phố Điện Biên Phủ', 'Đà Nẵng, Quận Sơn Trà, Phố Ngô Quyền', 28, 34),
(238, 'P0040', b'0', '2024-11-04', 'Cần Thơ, Quận Bình Thủy, Phố Võ Văn Kiệt', 'Cần Thơ, Quận Ninh Kiều, Phố Đề Thám', 40, 56),
(239, 'P0041', b'1', '2024-11-05', 'Hải Phòng, Quận Hồng Bàng, Phố Quang Trung', 'Hải Phòng, Quận Lê Chân, Phố Trần Nguyên Hãn', 30, 38),
(240, 'P0042', b'0', '2024-11-06', 'Quảng Ninh, Thành phố Hạ Long, Phố Hoàng Quốc Việt', 'Quảng Ninh, Thành phố Uông Bí, Phố Lý Thường Kiệt', 35, 42),
(241, 'P0043', b'1', '2024-11-07', 'Bình Định, Thành phố Quy Nhơn, Đường An Dương Vương', 'Bình Định, Huyện Tuy Phước, Đường Quốc Lộ 1', 29, 47),
(242, 'P0044', b'0', '2024-11-08', 'Thanh Hóa, Thành phố Thanh Hóa, Phố Tô Hiến Thành', 'Thanh Hóa, Thành phố Sầm Sơn, Phố Nguyễn Du', 37, 39),
(243, 'P0045', b'1', '2024-11-09', 'Lào Cai, Thành phố Lào Cai, Phố Trần Phú', 'Lào Cai, Huyện Bắc Hà, Phố Nguyễn Văn Cừ', 31, 53),
(244, 'P0046', b'0', '2024-11-10', 'Ninh Thuận, Thành phố Phan Rang - Tháp Chàm, Đường 16/4', 'Ninh Thuận, Huyện Ninh Sơn, Đường Phạm Ngọc Thạch', 27, 44),
(245, 'P0047', b'1', '2024-11-11', 'Bắc Giang, Thành phố Bắc Giang, Phố Lê Lợi', 'Bắc Giang, Huyện Lạng Giang, Phố Trần Nhật Duật', 44, 36),
(246, 'P0048', b'0', '2024-11-12', 'Tây Ninh, Thành phố Tây Ninh, Đường Cách Mạng Tháng 8', 'Tây Ninh, Huyện Gò Dầu, Đường Nguyễn Trãi', 46, 55),
(247, 'P0049', b'1', '2024-11-13', 'Khánh Hòa, Thành phố Nha Trang, Phố Hùng Vương', 'Khánh Hòa, Thành phố Cam Ranh, Phố Trần Phú', 34, 40),
(248, 'P0050', b'0', '2024-11-14', 'Bình Phước, Thành phố Đồng Xoài, Phố Nguyễn Huệ', 'Bình Phước, Huyện Chơn Thành, Phố Lê Thị Hồng Gấm', 32, 54),
(249, 'P0051', b'1', '2024-11-15', 'Thừa Thiên Huế, Thành phố Huế, Đường Lê Lợi', 'Thừa Thiên Huế, Huyện Hương Thủy, Đường Nguyễn Công Trứ', 38, 48),
(250, 'P0052', b'0', '2024-11-16', 'Hà Tĩnh, Thành phố Hà Tĩnh, Phố Trần Phú', 'Hà Tĩnh, Huyện Cẩm Xuyên, Phố Nguyễn Văn Linh', 30, 46),
(251, 'P0053', b'1', '2024-11-17', 'Quảng Nam, Thành phố Tam Kỳ, Phố Nguyễn Du', 'Quảng Nam, Huyện Điện Bàn, Phố Trần Quý Cáp', 39, 52),
(252, 'P0054', b'0', '2024-11-18', 'An Giang, Thành phố Long Xuyên, Phố Nguyễn Trãi', 'An Giang, Thành phố Châu Đốc, Phố Phạm Ngọc Thạch', 42, 49),
(253, 'P0055', b'1', '2024-11-19', 'Hòa Bình, Thành phố Hòa Bình, Đường Cù Chính Lan', 'Hòa Bình, Huyện Lương Sơn, Đường Quốc Lộ 6', 43, 37),
(254, 'P0056', b'0', '2024-11-20', 'Quảng Ngãi, Thành phố Quảng Ngãi, Phố Quang Trung', 'Quảng Ngãi, Huyện Tư Nghĩa, Phố Trần Hưng Đạo', 41, 35),
(255, 'P0057', b'0', '2024-12-12', 'Nguyễn Trãi Hà Đông Hà Nội', 'Văn Phòng C Bộ công an quận Hà Đông', 42, 34);

-- --------------------------------------------------------

--
-- Table structure for table `phuongtien`
--

CREATE TABLE `phuongtien` (
  `ID` int(10) NOT NULL,
  `ma` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `hang` varchar(255) DEFAULT NULL,
  `ngaysanxuat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phuongtien`
--

INSERT INTO `phuongtien` (`ID`, `ma`, `ten`, `hang`, `ngaysanxuat`) VALUES
(124, 'A1234B', 'Toyota Camry', 'Toyota', '2020-05-15'),
(125, 'B5678C', 'Honda Civic', 'Honda', '2019-10-20'),
(126, 'C9876D', 'BMW X5', 'BMW', '2021-03-25'),
(127, 'D5432E', 'Ford Ranger', 'Ford', '2018-07-10'),
(128, 'E1357F', 'Mazda CX-5', 'Mazda', '2022-01-05'),
(129, 'F2468G', 'Kia Sorento', 'Kia', '2021-08-12'),
(130, 'G3642H', 'Nissan Altima', 'Nissan', '2020-02-19'),
(131, 'H1289J', 'Audi A4', 'Audi', '2019-11-30'),
(132, 'I4856K', 'Chevrolet Spark', 'Chevrolet', '2017-09-22'),
(133, 'J9753L', 'Hyundai Tucson', 'Hyundai', '2020-06-11'),
(134, 'K2345M', 'Mercedes-Benz A-Class', 'Mercedes-Benz', '2022-03-30'),
(135, 'L4321N', 'Toyota Corolla', 'Toyota', '2021-11-14'),
(136, 'M6543O', 'Hyundai Sonata', 'Hyundai', '2019-01-15'),
(137, 'N8765P', 'Volkswagen Passat', 'Volkswagen', '2021-09-22'),
(138, 'O5432Q', 'Porsche Cayenne', 'Porsche', '2020-04-02'),
(139, 'P8765R', 'Ford Focus', 'Ford', '2018-12-01'),
(140, 'Q2345S', 'Audi Q7', 'Audi', '2021-05-19'),
(141, 'R1234T', 'Nissan 350Z', 'Nissan', '2020-06-10'),
(142, 'S2345U', 'Chevrolet Malibu', 'Chevrolet', '2019-07-05'),
(143, 'T5432V', 'BMW 3 Series', 'BMW', '2022-07-07'),
(144, 'U8765W', 'Kia Sportage', 'Kia', '2021-02-28'),
(145, 'V2345X', 'Mazda 6', 'Mazda', '2021-10-13'),
(146, 'W9876Y', 'Honda Accord', 'Honda', '2020-11-23'),
(147, 'X5432Z', 'Toyota Hilux', 'Toyota', '2022-04-10'),
(148, 'Y4321A', 'Chevrolet Camaro', 'Chevrolet', '2021-12-25'),
(149, 'Z6543B', 'Lexus RX 350', 'Lexus', '2020-05-14'),
(150, 'A9876C', 'BMW 5 Series', 'BMW', '2021-09-03'),
(151, 'B8765D', 'Tesla Model 3', 'Tesla', '2021-11-10'),
(152, 'C5432E', 'Ford Mustang', 'Ford', '2022-01-18'),
(153, 'D2345F', 'Mercedes-Benz GLC', 'Mercedes-Benz', '2022-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `phuongtiennguoidung`
--

CREATE TABLE `phuongtiennguoidung` (
  `ID` int(10) NOT NULL,
  `biensoxe` varchar(255) DEFAULT NULL,
  `ngaylanbanh` date DEFAULT NULL,
  `diachidangkiem` varchar(255) DEFAULT NULL,
  `phuongtienID` int(10) DEFAULT NULL,
  `nguoidungID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phuongtiennguoidung`
--

INSERT INTO `phuongtiennguoidung` (`ID`, `biensoxe`, `ngaylanbanh`, `diachidangkiem`, `phuongtienID`, `nguoidungID`) VALUES
(34, '30A-12345', '2023-06-01', 'Số 10, Nguyễn Trãi, Hà Nội', 124, 66),
(35, '51F-67890', '2023-07-15', 'Số 21, Lê Lợi, TP.HCM', 125, 67),
(36, '29B-13579', '2023-05-20', 'Số 15, Nguyễn Văn Cừ, Đà Nẵng', 126, 68),
(37, '30C-24680', '2023-08-25', 'Số 5, Nguyễn Thái Học, Hải Phòng', 127, 69),
(38, '51G-35791', '2022-12-12', 'Số 2, Lý Thường Kiệt, Cần Thơ', 128, 70),
(39, '29H-46813', '2023-01-30', 'Số 8, Lê Quang Đạo, Nha Trang', 129, 71),
(40, '30A-57924', '2023-04-18', 'Số 3, Lê Đại Hành, Hà Nội', 130, 72),
(41, '51D-68035', '2023-03-10', 'Số 4, Bùi Thị Xuân, Bình Dương', 131, 73),
(42, '29F-79146', '2023-09-05', 'Số 12, Nguyễn Huệ, Vũng Tàu', 132, 74),
(43, '30B-80257', '2023-02-23', 'Số 6, Võ Văn Kiệt, TP.HCM', 133, 75),
(44, '29C-91367', '2023-06-05', 'Số 11, Trần Hưng Đạo, Hà Nội', 134, 76),
(45, '51E-12458', '2023-07-22', 'Số 9, Nguyễn Minh Hoàng, TP.HCM', 135, 77),
(46, '30D-24679', '2023-01-29', 'Số 18, Lý Thường Kiệt, Đà Nẵng', 136, 78),
(47, '51B-35720', '2023-05-15', 'Số 17, Lê Đại Hành, Hải Phòng', 137, 79),
(48, '29A-46814', '2023-02-25', 'Số 22, Nguyễn Tất Thành, Cần Thơ', 138, 80),
(49, '30E-57925', '2023-09-14', 'Số 1, Phan Đình Phùng, Nha Trang', 139, 81),
(50, '51F-68036', '2023-04-05', 'Số 3, Nguyễn Thái Bình, Bình Dương', 140, 82),
(51, '29G-79147', '2023-08-30', 'Số 12, Trương Định, Vũng Tàu', 141, 83),
(52, '30F-80258', '2023-05-19', 'Số 8, Nguyễn Lương Bằng, TP.HCM', 142, 84),
(53, '29H-91368', '2023-06-18', 'Số 23, Tân Phú, Hà Nội', 143, 85),
(54, '51G-12459', '2023-03-15', 'Số 25, Nguyễn Du, Đà Nẵng', 144, 86),
(55, '30C-24681', '2023-01-03', 'Số 4, Phạm Văn Đồng, TP.HCM', 145, 87),
(56, '51B-35721', '2023-04-17', 'Số 7, Nguyễn Tất Thành, Cần Thơ', 146, 88),
(57, '29E-46815', '2023-08-10', 'Số 9, Đinh Tiên Hoàng, Vũng Tàu', 147, 89),
(58, '30A-57926', '2023-05-12', 'Số 14, Bình Thới, Nha Trang', 148, 90),
(59, '51D-68037', '2023-07-01', 'Số 5, Ngô Quyền, Bình Dương', 149, 91),
(60, '29B-79148', '2023-09-02', 'Số 6, Nguyễn Văn Cừ, Hải Phòng', 150, 92),
(61, '30D-80259', '2023-03-08', 'Số 8, Hùng Vương, TP.HCM', 151, 93),
(62, '51A-91369', '2023-02-10', 'Số 12, Lê Quang Đạo, Hà Nội', 152, 94),
(63, '30B-12460', '2023-04-25', 'Số 19, Trường Chinh, Đà Nẵng', 153, 95);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(10) NOT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`) VALUES
(1, 'manhadmin', '$2y$10$lUmbh6H1BYXfZQEmu3VCA.pAcBFrFbPYvvB3E.Bm2EE44Tek8ErbC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loivipham`
--
ALTER TABLE `loivipham`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ma` (`ma`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sochungminhnhandan` (`sochungminhnhandan`);

--
-- Indexes for table `pakn`
--
ALTER TABLE `pakn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phieuvipham`
--
ALTER TABLE `phieuvipham`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ma` (`ma`),
  ADD KEY `loiviphamID` (`loiviphamID`),
  ADD KEY `phuongtiennguoidungID` (`phuongtiennguoidungID`);

--
-- Indexes for table `phuongtien`
--
ALTER TABLE `phuongtien`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ma` (`ma`);

--
-- Indexes for table `phuongtiennguoidung`
--
ALTER TABLE `phuongtiennguoidung`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `biensoxe` (`biensoxe`),
  ADD KEY `phuongtienID` (`phuongtienID`),
  ADD KEY `nguoidungID` (`nguoidungID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `loivipham`
--
ALTER TABLE `loivipham`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `pakn`
--
ALTER TABLE `pakn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phieuvipham`
--
ALTER TABLE `phieuvipham`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `phuongtien`
--
ALTER TABLE `phuongtien`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `phuongtiennguoidung`
--
ALTER TABLE `phuongtiennguoidung`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `phieuvipham`
--
ALTER TABLE `phieuvipham`
  ADD CONSTRAINT `phieuvipham_ibfk_1` FOREIGN KEY (`loiviphamID`) REFERENCES `loivipham` (`ID`),
  ADD CONSTRAINT `phieuvipham_ibfk_2` FOREIGN KEY (`phuongtiennguoidungID`) REFERENCES `phuongtiennguoidung` (`ID`);

--
-- Constraints for table `phuongtiennguoidung`
--
ALTER TABLE `phuongtiennguoidung`
  ADD CONSTRAINT `phuongtiennguoidung_ibfk_1` FOREIGN KEY (`phuongtienID`) REFERENCES `phuongtien` (`ID`),
  ADD CONSTRAINT `phuongtiennguoidung_ibfk_2` FOREIGN KEY (`nguoidungID`) REFERENCES `nguoidung` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
