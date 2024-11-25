<?php
// Kết nối cơ sở dữ liệu
$conn = new mysqli("localhost", "root", "", "web");

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Thông tin người dùng
$username = "manhadmin";
$password = "manhadmin";

// Mã hóa mật khẩu
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Lưu người dùng vào cơ sở dữ liệu
$stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
$stmt->bind_param("ss", $username, $hashed_password);

if ($stmt->execute()) {
    echo "Tạo tài khoản thành công!";
} else {
    echo "Lỗi: " . $stmt->error;
}

$stmt->close();
$conn->close();
