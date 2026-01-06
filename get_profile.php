<?php
session_start();
header("Content-Type: application/json");

if (!isset($_SESSION['user_id'])) {
    echo json_encode(["status"=>"error"]);
    exit;
}

$conn = new mysqli("localhost","root","","app");
$id = $_SESSION['user_id'];

$stmt = $conn->prepare(
    "SELECT full_name, email FROM create_account WHERE id=?"
);
$stmt->bind_param("i",$id);
$stmt->execute();
$user = $stmt->get_result()->fetch_assoc();

echo json_encode([
    "status"=>"success",
    "user"=>$user
]);
