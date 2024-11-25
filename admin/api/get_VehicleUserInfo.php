<?php
require '../../config/db.php'; // Đường dẫn đến file db.php
require '../config/check_auth.php'; // Đường dẫn đến file check_auth.php
// getVehicleUserInfo.php
if (isset($_POST['biensoxe'])) {
    $biensoxe = $conn->real_escape_string($_POST['biensoxe']);
    $query = "SELECT nguoidung.ten, nguoidung.ngaysinh, nguoidung.diachi, nguoidung.sdt, nguoidung.gioitinh,
                     phuongtien.ten AS tenphuongtien, phuongtien.hang, phuongtien.ngaysanxuat
              FROM phuongtiennguoidung
              JOIN nguoidung ON phuongtiennguoidung.nguoidungID = nguoidung.ID
              JOIN phuongtien ON phuongtiennguoidung.phuongtienID = phuongtien.ID
              WHERE phuongtiennguoidung.biensoxe = '$biensoxe'";

    $result = $conn->query($query);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<p>Họ và tên: " . $row['ten'] . "</p>";
            echo "<p>Ngày sinh: " . $row['ngaysinh'] . "</p>";
            echo "<p>Địa chỉ: " . $row['diachi'] . "</p>";
            echo "<p>Số điện thoại: " . $row['sdt'] . "</p>";
            echo "<p>Giới tính: " . $row['gioitinh'] . "</p>";
            echo "<p>Tên phương tiện: " . $row['tenphuongtien'] . "</p>";
            echo "<p>Hãng: " . $row['hang'] . "</p>";
            echo "<p>Ngày sản xuất: " . $row['ngaysanxuat'] . "</p>";
        }
    } else {
        echo "Không tìm thấy thông tin!";
    }
}
$conn->close();
?>
