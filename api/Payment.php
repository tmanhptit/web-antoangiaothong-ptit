<?php
header('Content-Type: application/json');

require '../config/db.php'; // Đường dẫn đến file kết nối database

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Kiểm tra xem có tham số 'ma' không
    if (isset($_POST['ma'])) {
        $maPhieuViPham = $_POST['ma'];

        // Chuẩn bị câu lệnh SQL để cập nhật trạng thái thanh toán
        $sql = "UPDATE phieuvipham SET trangthaithanhtoan = 1 WHERE ma = ?";

        // Chuẩn bị câu lệnh
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $maPhieuViPham); // Giả sử mã phiếu vi phạm là chuỗi

        // Thực thi câu lệnh và kiểm tra kết quả
        if ($stmt->execute()) {
            if ($stmt->affected_rows > 0) {
                echo json_encode(['success' => true, 'message' => 'Trạng thái thanh toán đã được cập nhật thành công']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Không tìm thấy phiếu vi phạm với mã này']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Lỗi khi thực hiện cập nhật']);
        }

        // Đóng câu lệnh
        $stmt->close();
    } else {
        echo json_encode(['error' => 'Thiếu tham số mã phiếu vi phạm']);
    }
} else {
    echo json_encode(['error' => 'Phương thức yêu cầu không hợp lệ']);
}

// Đóng kết nối
$conn->close();
?>
