
<?php
header('Content-Type: application/json');

require '../config/db.php'; // Đường dẫn đến file db.php

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Kiểm tra xem có tham số 'biensoxe' không
    if (isset($_GET['biensoxe'])) {
        $biensoxe = $_GET['biensoxe'];

        // Chuẩn bị câu lệnh SQL
$sql = "
SELECT pv.*, png.biensoxe, pt.ten AS ten_phuongtien, lv.ten AS ten_loivipham, lv.tienphat
FROM phieuvipham pv
JOIN phuongtiennguoidung png ON pv.phuongtiennguoidungID = png.ID
JOIN phuongtien pt ON png.phuongtienID = pt.ID
JOIN loivipham lv ON pv.loiviphamID = lv.ID
WHERE png.biensoxe = ?
";

        // Chuẩn bị câu lệnh
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $biensoxe); // Giả sử biensoxe là chuỗi
        $stmt->execute();
        $result = $stmt->get_result();

        // Lấy tất cả kết quả
        $violations = $result->fetch_all(MYSQLI_ASSOC);

        // Trả về kết quả dưới dạng JSON
        echo json_encode($violations);
    } else {
        echo json_encode(['error' => 'Thiếu tham số biensoxe']);
    }
} else {
    echo json_encode(['error' => 'Phương thức yêu cầu không hợp lệ']);
}

// Đóng kết nối
$conn->close();
?>