<?php
// Bắt đầu session để có thể thao tác với session
session_start();

// Xóa tất cả các biến session
session_unset();

// Hủy session
session_destroy();

// Xóa cookies liên quan đến session (nếu có)
if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time() - 3600, '/');
}

// Chuyển hướng về trang đăng nhập
header("Location: ../../public/login.html");
exit;
?>
