<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
header("Content-Type: application/json");

session_start();

/* 🔐 CHECK LOGIN SESSION */
if (!isset($_SESSION['user_id'])) {
    echo json_encode([
        "status" => "error",
        "message" => "Session expired. Please login again."
    ]);
    exit;
}

$userId = $_SESSION['user_id'];

/* 🔌 DATABASE CONNECTION */
$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    echo json_encode([
        "status" => "error",
        "message" => "Database connection failed"
    ]);
    exit;
}

/* 📥 READ FORM-DATA */
$currentPassword = trim($_POST['current_password'] ?? "");
$newPassword     = trim($_POST['new_password'] ?? "");
$confirmPassword = trim($_POST['confirm_password'] ?? "");

/* 🚫 VALIDATION */
if ($currentPassword === "" || $newPassword === "" || $confirmPassword === "") {
    echo json_encode([
        "status" => "error",
        "message" => "All fields are required"
    ]);
    exit;
}

if ($newPassword !== $confirmPassword) {
    echo json_encode([
        "status" => "error",
        "message" => "Passwords do not match"
    ]);
    exit;
}

/* 🔍 FETCH CURRENT PASSWORD USING SESSION USER */
$stmt = $conn->prepare(
    "SELECT password FROM create_account WHERE id = ?"
);
$stmt->bind_param("i", $userId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode([
        "status" => "error",
        "message" => "User not found"
    ]);
    exit;
}

$user = $result->fetch_assoc();

/* ❗ PASSWORD CHECK (PLAIN TEXT AS REQUESTED) */
if ($currentPassword !== $user['password']) {
    echo json_encode([
        "status" => "error",
        "message" => "Current password is incorrect"
    ]);
    exit;
}

/* 🔄 UPDATE PASSWORD */
$update = $conn->prepare(
    "UPDATE create_account SET password = ? WHERE id = ?"
);
$update->bind_param("si", $newPassword, $userId);

if ($update->execute()) {
    echo json_encode([
        "status" => "success",
        "message" => "Password updated successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to update password"
    ]);
}

$stmt->close();
$update->close();
$conn->close();
