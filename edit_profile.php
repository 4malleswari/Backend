<?php
session_start();
header("Content-Type: application/json");

// 🔐 Check login session
if (!isset($_SESSION['user_id'])) {
    echo json_encode([
        "status" => "error",
        "message" => "Session expired. Please login again."
    ]);
    exit;
}

$userId = $_SESSION['user_id'];

// 🔌 Database connection
$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    echo json_encode([
        "status" => "error",
        "message" => "Database connection failed"
    ]);
    exit;
}

// 📥 Read FORM-DATA
$fullName = trim($_POST['full_name'] ?? "");
$email    = trim($_POST['email'] ?? "");

// 🚫 Nothing to update
if ($fullName === "" && $email === "") {
    echo json_encode([
        "status" => "error",
        "message" => "Nothing to update"
    ]);
    exit;
}

// 🔧 Build update query dynamically
$fields = [];
$params = [];
$types  = "";

if ($fullName !== "") {
    $fields[] = "full_name = ?";
    $params[] = $fullName;
    $types   .= "s";
}

if ($email !== "") {
    $fields[] = "email = ?";
    $params[] = $email;
    $types   .= "s";
}

// WHERE condition
$params[] = $userId;
$types   .= "i";

$sql = "UPDATE create_account SET " . implode(", ", $fields) . " WHERE id = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param($types, ...$params);

if ($stmt->execute()) {
    echo json_encode([
        "status" => "success",
        "message" => "Profile updated successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Update failed"
    ]);
}

$stmt->close();
$conn->close();
