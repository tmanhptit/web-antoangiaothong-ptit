<?php
require '../../config/db.php'; // Đường dẫn đến file db.php
require '../config/check_auth.php'; // Đường dẫn đến file check_auth.php
$search = isset($_GET['search']) ? $conn->real_escape_string($_GET['search']) : '';

$query = "SELECT * FROM loivipham";
if ($search) {
    $query .= " WHERE ten LIKE '%$search%'";
}

$result = $conn->query($query);
if ($result->num_rows > 0) {
    echo "<table border='1'>
            <tr>
                <th>Mã</th>
                <th>Tên</th>
                <th>Tiền phạt</th>
                <th>Luật vi phạm</th>
            </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row['ma'] . "</td>
                <td>" . $row['ten'] . "</td>
                <td>" . $row['tienphat'] . "</td>
                <td>" . $row['luatvipham'] . "</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "Không tìm thấy lỗi vi phạm nào.";
}

$conn->close();
?>
