<?php
// get_statistics.php
require '../../config/db.php'; // Đường dẫn đến file db.php
require '../config/check_auth.php'; // Đường dẫn đến file check_auth.php
$start_date = $_GET['start_date'];
$end_date = $_GET['end_date'];
$payment_status = isset($_GET['payment_status']) ? $_GET['payment_status'] : null;

// SQL query to get violations data
$sql = "SELECT pv.ma, pv.diadiemvipham, pv.ngayvipham, pv.trangthaithanhtoan,
            ptng.biensoxe, nd.ten, lv.ten AS loivipham, lv.tienphat
        FROM phieuvipham pv
        JOIN phuongtiennguoidung ptng ON pv.phuongtiennguoidungID = ptng.ID
        JOIN nguoidung nd ON ptng.nguoidungID = nd.ID
        JOIN loivipham lv ON pv.loiviphamID = lv.ID
        WHERE pv.ngayvipham BETWEEN ? AND ?";

if (!is_null($payment_status)) {
    $sql .= " AND pv.trangthaithanhtoan = ?";
}

$stmt = $conn->prepare($sql);
if (!is_null($payment_status)) {
    $stmt->bind_param("ssi", $start_date, $end_date, $payment_status);
} else {
    $stmt->bind_param("ss", $start_date, $end_date);
}

$stmt->execute();
$result = $stmt->get_result();

$violations = [];
$total_fine = 0;
$unpaid_fine = 0;
$paid_fine = 0;
$total_violations = 0;
$violation_counts = [];

while ($row = $result->fetch_assoc()) {
    $violations[] = $row;
    $total_fine += $row['tienphat'];
    if ($row['trangthaithanhtoan'] == 0) {
        $unpaid_fine += $row['tienphat'];
    } else {
        $paid_fine += $row['tienphat'];
    }
    $total_violations++;

    // Count violation types
    $violation_type = $row['loivipham'];
    if (!isset($violation_counts[$violation_type])) {
        $violation_counts[$violation_type] = 0;
    }
    $violation_counts[$violation_type]++;
}

// Find most common violation
$most_common_violation = array_search(max($violation_counts), $violation_counts);

$summary = [
    'total_fine' => $total_fine,
    'unpaid_fine' => $unpaid_fine,
    'paid_fine' => $paid_fine,
    'total_violations' => $total_violations,
    'most_common_violation' => $most_common_violation
];

echo json_encode(['violations' => $violations, 'summary' => $summary]);

$conn->close();
?>
