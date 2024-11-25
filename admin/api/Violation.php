<?php
require '../../config/db.php'; // Đường dẫn đến file db.php
require '../config/check_auth.php'; // Đường dẫn đến file check_auth.php
// Kiểm tra có action trong request không
if (isset($_POST['action'])) {
    $action = $_POST['action'];
} elseif (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    echo json_encode(['success' => false, 'error' => 'Thiếu action']);
    exit();
}

// Xử lý các action
switch ($action) {
    case 'delete': // Xóa phiếu vi phạm
        if (isset($_POST['ma'])) {
            $ma = $_POST['ma'];

            // Truy vấn xóa phiếu vi phạm theo mã
            $query = "DELETE FROM phieuvipham WHERE ma = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("s", $ma); // Đổi kiểu tham số thành "s" (string) vì ma là chuỗi

            if ($stmt->execute()) {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'error' => 'Không thể xóa']);
            }

            $stmt->close();
        } else {
            echo json_encode(['success' => false, 'error' => 'Thiếu mã phiếu vi phạm']);
        }
        break;

    case 'get': // Lấy lịch sử vi phạm của một user
        // Lấy user_id từ request
        $user_id = isset($_GET['user_id']) ? $_GET['user_id'] : 0;

        // Nếu không có user_id trong request, trả về lỗi
        if ($user_id == 0) {
            echo json_encode(["error" => "Missing user_id"]);
            exit();
        }

        // Truy vấn lấy thông tin người vi phạm và lịch sử vi phạm
        $sql = "
            SELECT nguoidung.ten, 
                   DATEDIFF(CURDATE(), nguoidung.ngaysinh) DIV 365 AS tuoi,
                   phuongtien.ten AS phuongtien,
                   phuongtiennguoidung.biensoxe,
                   phuongtiennguoidung.ID AS phuongtiennguoidungID,
                   phieuvipham.ma AS ma_vi_pham,
                   loivipham.ma AS ma_loi_vi_pham,
                   loivipham.ten AS ten_loi_vi_pham,
                   loivipham.tienphat,
                   phieuvipham.ngayvipham,
                   phieuvipham.diadiemvipham,
                   phieuvipham.diadiemxuly,
                   phieuvipham.trangthaithanhtoan
            FROM phieuvipham
            JOIN loivipham ON phieuvipham.loiviphamID = loivipham.ID
            JOIN phuongtiennguoidung ON phieuvipham.phuongtiennguoidungID = phuongtiennguoidung.ID
            JOIN phuongtien ON phuongtiennguoidung.phuongtienID = phuongtien.ID
            JOIN nguoidung ON phuongtiennguoidung.nguoidungID = nguoidung.ID
            WHERE nguoidung.ID = ?
        ";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $user_id); // Bind user_id vào query
        $stmt->execute();
        $result = $stmt->get_result();

        // Lấy dữ liệu
        $history = [];
        while ($row = $result->fetch_assoc()) {
            $history[] = $row;
        }

        // Nếu không có dữ liệu, trả về thông báo không tìm thấy
        if (empty($history)) {
            echo json_encode(["error" => "Người dùng không có lịch sử vi phạm"]);
            exit();
        }

        // Trả về kết quả dưới dạng JSON
        echo json_encode($history);
        break;

    case 'submit': // Thêm phiếu vi phạm mới
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $biensoxe = $conn->real_escape_string($_POST['biensoxe']);
            $ngayvipham = $conn->real_escape_string($_POST['ngayvipham']);
            $diadiemvipham = $conn->real_escape_string($_POST['diadiemvipham']);
            $diadiemxuly = $conn->real_escape_string($_POST['diadiemxuly']);
            $maLoiVipham = $conn->real_escape_string($_POST['loiviphamID']); // Đây là mã lỗi vi phạm mà người dùng nhập vào

            // Lấy ID từ mã lỗi vi phạm
            $loiViphamQuery = "SELECT ID FROM loivipham WHERE ma = '$maLoiVipham'";
            $loiViphamResult = $conn->query($loiViphamQuery);

            if ($loiViphamResult->num_rows > 0) {
                $loiViphamRow = $loiViphamResult->fetch_assoc();
                $loiviphamID = $loiViphamRow['ID'];

                // Lấy ID của phuongtiennguoidung từ biển số xe
                $query = "SELECT ID FROM phuongtiennguoidung WHERE biensoxe = '$biensoxe'";
                $result = $conn->query($query);

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $phuongtiennguoidungID = $row['ID'];

                    // Tạo mã phiếu vi phạm
                    $maQuery = "SELECT LPAD(CAST(SUBSTRING(MAX(ma), 2) AS UNSIGNED) + 1, 4, '0') AS nextID FROM phieuvipham";
                    $maResult = $conn->query($maQuery);

                    if ($maResult) {
                        $maRow = $maResult->fetch_assoc();
                        // Nếu bảng rỗng, khởi tạo ID đầu tiên là P0001
                        $ma = 'P' . ($maRow['nextID'] ? $maRow['nextID'] : '0001');
                    } else {
                        // Xử lý lỗi nếu câu truy vấn thất bại
                        echo "Lỗi khi truy vấn dữ liệu.";
                    }

                    // Thêm phiếu vi phạm vào cơ sở dữ liệu
                    $insertQuery = "INSERT INTO phieuvipham (ma, trangthaithanhtoan, ngayvipham, diadiemvipham, diadiemxuly, loiviphamID, phuongtiennguoidungID)
                                    VALUES ('$ma', 0, '$ngayvipham', '$diadiemvipham', '$diadiemxuly', $loiviphamID, $phuongtiennguoidungID)";

                    if ($conn->query($insertQuery) === TRUE) {
                        echo json_encode(['success' => true, 'message' => 'Phiếu vi phạm đã được thêm thành công!']);
                    } else {
                        echo json_encode(['success' => false, 'error' => 'Lỗi: ' . $conn->error]);
                    }
                } else {
                    echo json_encode(['success' => false, 'error' => 'Không tìm thấy phương tiện với biển số này.']);
                }
            } else {
                echo json_encode(['success' => false, 'error' => 'Không tìm thấy mã lỗi vi phạm này.']);
            }
        }
        break;

    case 'edit': // Sửa phiếu vi phạm
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $violationId = $conn->real_escape_string($_POST['violationId']);
            $ngayvipham = $conn->real_escape_string($_POST['ngayvipham']);
            $diadiemvipham = $conn->real_escape_string($_POST['diadiemvipham']);
            $diadiemxuly = $conn->real_escape_string($_POST['diadiemxuly']);
            $trangthaithanhtoan = $conn->real_escape_string($_POST['trangthaithanhtoan']);
            $maLoiVipham = $conn->real_escape_string($_POST['loiviphamID']); // mã lỗi vi phạm
            

            // Tìm ID của lỗi vi phạm từ mã lỗi vi phạm
            $getLoiViphamQuery = "SELECT ID FROM loivipham WHERE ma = ?";
            $stmt = $conn->prepare($getLoiViphamQuery);
            $stmt->bind_param('s', $maLoiVipham);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $loiviphamID = $row['ID']; // Lấy ID của lỗi vi phạm

                // Cập nhật thông tin phiếu vi phạm
                $updateQuery = "UPDATE phieuvipham 
                SET ngayvipham = ?, diadiemvipham = ?, diadiemxuly = ?, loiviphamID = ? , trangthaithanhtoan = ?
                WHERE ma = ?";
                $stmt = $conn->prepare($updateQuery);
                $stmt->bind_param('sssdis', $ngayvipham, $diadiemvipham, $diadiemxuly, $loiviphamID,$trangthaithanhtoan, $violationId);

                if ($stmt->execute()) {
                    echo json_encode(['success' => true, 'message' => 'Phiếu vi phạm đã được chỉnh sửa thành công!']);
                } else {
                    echo json_encode(['success' => false, 'error' => 'Lỗi: ' . $conn->error]);
                }

                $stmt->close();
            } else {
                echo json_encode(['success' => false, 'error' => 'Không tìm thấy mã lỗi vi phạm']);
            }
        }
        break;

}

$conn->close();
?>