<?php
session_start();

// Kiểm tra nếu người dùng chưa đăng nhập
if (!isset($_SESSION['username'])) {
    // Nếu chưa đăng nhập, trả về lỗi 403 hoặc chuyển hướng đến trang login
    http_response_code(403); // Lỗi 403: Không có quyền truy cập
    echo "Bạn không đủ quyền truy cập vào khu vực này. Vui lòng đăng nhập.";
    exit();
}

// Nếu người dùng đã đăng nhập, cho phép truy cập
?>



