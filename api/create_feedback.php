<?php
require '../config/db.php'; // Đường dẫn đến file db.php

// Kiểm tra nếu có tệp được tải lên
$attachment = null;
if (isset($_FILES['attachment']) && $_FILES['attachment']['error'] == 0) {
    // Kiểm tra loại tệp (chỉ chấp nhận ảnh, PDF, và Word)
    $allowedTypes = ['image/jpeg', 'image/png', 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'];
    $fileType = $_FILES['attachment']['type'];

    if (in_array($fileType, $allowedTypes)) {
        // Đường dẫn lưu tệp
        $uploadDir = '../admin/uploads/'; // Đảm bảo rằng thư mục uploads tồn tại
        if (!file_exists($uploadDir)) {
            mkdir($uploadDir, 0775, true); // Tạo thư mục nếu chưa tồn tại
        }

        // Lấy đuôi tệp (ví dụ: .jpg, .pdf)
        $fileExtension = pathinfo($_FILES['attachment']['name'], PATHINFO_EXTENSION);

        // Lấy mã khiếu nại (ở đây giả sử bạn đã có ID phản ánh hoặc mã phản ánh)
        // Bạn có thể thay đổi phần này theo cách lấy mã phiếu từ cơ sở dữ liệu hoặc form
        $feedbackId = uniqid('at'); // Tạo mã ID ngẫu nhiên cho phiếu (có thể thay bằng ID từ CSDL)

        // Tạo tên tệp duy nhất: at{feedbackId}.{fileExtension}
        $newFileName = 'at' . $feedbackId . '.' . $fileExtension;

        // Đường dẫn lưu tệp với tên mới
        $uploadFile = $uploadDir . $newFileName;
        
        // Di chuyển tệp từ thư mục tạm đến thư mục uploads
        if (move_uploaded_file($_FILES['attachment']['tmp_name'], $uploadFile)) {
            $attachment = $newFileName; // Lưu tên tệp mới vào cơ sở dữ liệu
        } else {
            echo "Có lỗi xảy ra khi tải lên tệp. Vui lòng thử lại.";
        }
    } else {
        echo "Chỉ chấp nhận các tệp ảnh, PDF và Word.";
    }
}

// Lấy các dữ liệu từ form gửi lên
$citizen_type = $_POST['citizen_type'];
$name = $_POST['name'];
$cccd = $_POST['cccd'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$subject = $_POST['subject'];
$content = $_POST['content'];
$unit_receive = $_POST['unit_receive'];

// Câu lệnh SQL để thêm dữ liệu vào cơ sở dữ liệu
$sql = "INSERT INTO feedbacks (citizen_type, name, cccd, address, phone, subject, content, unit_receive, attachment)
        VALUES ('$citizen_type', '$name', '$cccd', '$address', '$phone', '$subject', '$content', '$unit_receive', '$attachment')";

// Thực thi câu lệnh SQL
if ($conn->query($sql) === TRUE) {
    echo "Phản ánh đã được gửi thành công!";
} else {
    echo "Lỗi: " . $conn->error;
}

// Đóng kết nối
$conn->close();
?>
