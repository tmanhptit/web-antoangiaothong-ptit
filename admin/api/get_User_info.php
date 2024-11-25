<?php
// Kết nối MySQL
require '../../config/db.php'; // Đường dẫn đến file db.php
require '../config/check_auth.php'; // Đường dẫn đến file check_auth.php
// get_violation_info.php
$query = isset($_GET['query']) ? $_GET['query'] : '';

$sql = "SELECT * FROM nguoidung WHERE ten LIKE ? OR sochungminhnhandan LIKE ?";
$stmt = $conn->prepare($sql);
$searchTerm = "%$query%";
$stmt->bind_param('ss', $searchTerm, $searchTerm);
$stmt->execute();
$result = $stmt->get_result();

$violations = [];
while ($row = $result->fetch_assoc()) {
    $violations[] = $row;
}

echo json_encode($violations);

$conn->close();
?>
