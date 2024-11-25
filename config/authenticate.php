<?php
session_start();
include('db.php'); // Kết nối đến cơ sở dữ liệu

// Lấy thông tin từ form
$username = $_POST['username'];
$password = $_POST['password'];

// Truy vấn để lấy mật khẩu mã hóa từ cơ sở dữ liệu
$stmt = $conn->prepare("SELECT password FROM users WHERE username = ?");
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $hashed_password = $row['password'];

    // Sử dụng password_verify để kiểm tra mật khẩu
    if (password_verify($password, $hashed_password)) {
        // Sau khi xác thực thành công
        session_start();
        $_SESSION['username'] = $username; // Lưu tên người dùng vào session
        header("Location: ../admin/src/index.html"); // Chuyển hướng đến trang quản lý
        exit();
    } else {
        echo "Mật khẩu sai!";
    }
} else {
    echo "Tên người dùng không tồn tại!";
}

$stmt->close();
$conn->close();
?>