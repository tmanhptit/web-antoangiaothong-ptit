<?php
require '../../config/db.php'; // Đường dẫn đến file db.php
require '../config/check_auth.php'; // Đường dẫn đến file check_auth.php
// Kiểm tra phương thức HTTP
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action'])) {
        $action = $_POST['action'];

        switch ($action) {
            case 'update':
                handleUpdateRequest($conn);
                break;
            case 'delete':
                handleDeleteRequest($conn);
                break;
            default:
                echo json_encode(['status' => 'error', 'message' => 'Hành động không hợp lệ']);
                break;
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Thiếu tham số action']);
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
    handleGetRequest($conn);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Phương thức không hợp lệ']);
}

// Hàm xử lý GET request (lấy dữ liệu phản ánh)
function handleGetRequest($conn) {
    if (isset($_GET['id'])) {
        // Nếu có tham số 'id', trả về phản ánh theo ID
        $feedback_id = $_GET['id'];

        // Sử dụng Prepared Statement để tránh SQL Injection
        $sql = "SELECT * FROM feedbacks WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $feedback_id);
        $stmt->execute();
        $result = $stmt->get_result();

        // Lưu dữ liệu vào mảng nếu có phản ánh
        $feedback = [];
        if ($result->num_rows > 0) {
            $feedback = $result->fetch_assoc();
        }

        echo json_encode($feedback); // Trả về phản ánh dưới dạng JSON
    } else {
        // Nếu không có 'id', trả về tất cả phản ánh
        $sql = "SELECT * FROM feedbacks";
        $result = $conn->query($sql);

        $feedbacks = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $feedbacks[] = $row;
            }
        }

        echo json_encode($feedbacks); // Trả về tất cả phản ánh
    }

    $conn->close();
}

// Hàm xử lý POST request (cập nhật trạng thái phản ánh)
function handleUpdateRequest($conn) {
    if (isset($_POST['feedback_id'])) {
        $feedback_id = $_POST['feedback_id'];

        // Kiểm tra xem feedback_id có hợp lệ không
        if (is_numeric($feedback_id)) {
            $feedback_id = (int) $feedback_id; // Chuyển feedback_id sang kiểu int

            // Sử dụng Prepared Statement để tránh SQL Injection
            $sql = "UPDATE feedbacks SET status = 'Đã xử lý' WHERE id = ?";

            if ($stmt = $conn->prepare($sql)) {
                $stmt->bind_param("i", $feedback_id);  // Liên kết tham số với truy vấn

                if ($stmt->execute()) {
                    echo json_encode(['status' => 'success', 'message' => 'Đơn khiếu nại đã được bàn giao và xử lý']);
                } else {
                    echo json_encode(['status' => 'error', 'message' => 'Lỗi khi cập nhật trạng thái']);
                }

                $stmt->close();
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Lỗi cơ sở dữ liệu']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'ID phản ánh không hợp lệ']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'ID phản ánh thiếu']);
    }

    $conn->close();
}

// Hàm xử lý POST request (xóa phản ánh)
function handleDeleteRequest($conn) {
    if (isset($_POST['feedback_id'])) {
        $feedback_id = $_POST['feedback_id'];

        if (!empty($feedback_id)) {
            // SQL để xóa bản ghi phản ánh
            $sql = "DELETE FROM feedbacks WHERE id = ?";

            if ($stmt = $conn->prepare($sql)) {
                $stmt->bind_param("i", $feedback_id);

                if ($stmt->execute()) {
                    echo json_encode(['status' => 'success', 'message' => 'Đơn phản ánh đã được xóa thành công']);
                } else {
                    echo json_encode(['status' => 'error', 'message' => 'Không thể xóa đơn phản ánh']);
                }

                $stmt->close();
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Lỗi cơ sở dữ liệu']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'ID phản ánh thiếu']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Feedback ID thiếu']);
    }

    $conn->close();
}
?>
