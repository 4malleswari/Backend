<?php
session_start();

// after successful login
$_SESSION['user_id'] = $user['id'];

header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    echo json_encode(["status"=>"error","message"=>"DB failed"]);
    exit;
}

/* --------------------
   READ INPUT (JSON OR FORM-DATA)
-------------------- */
$data = [];

$raw = file_get_contents("php://input");
$json = json_decode($raw, true);

if (is_array($json)) {
    $data = $json;          // JSON input
} elseif (!empty($_POST)) {
    $data = $_POST;        // form-data input
} else {
    echo json_encode(["status"=>"error","message"=>"No input received"]);
    exit;
}

/* --------------------
   GET USER INPUT
-------------------- */
$email    = trim($data['email'] ?? "");
$password = trim($data['password'] ?? "");

if ($email === "" || $password === "") {
    echo json_encode(["status"=>"error","message"=>"Email & password required"]);
    exit;
}

/* --------------------
   LOGIN QUERY
-------------------- */
$stmt = $conn->prepare("
    SELECT id, full_name, email
    FROM create_account
    WHERE email = ? AND password = ?
");
$stmt->bind_param("ss", $email, $password);
$stmt->execute();
$res = $stmt->get_result();

if ($res->num_rows !== 1) {
    echo json_encode(["status"=>"error","message"=>"Invalid credentials"]);
    exit;
}

$user = $res->fetch_assoc();

/* --------------------
   STORE SESSION
-------------------- */
$_SESSION['user_id'] = $user['id'];

echo json_encode([
    "status"=>"success",
    "message"=>"Login successful"
]);
