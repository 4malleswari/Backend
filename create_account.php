<?php
header("Content-Type: application/json");

// DB connection
$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    echo json_encode(["status"=>"error","message"=>"DB connection failed"]);
    exit;
}

// --------------------
// READ INPUT (FORM OR RAW JSON)
// --------------------
$data = [];

$raw = file_get_contents("php://input");
$json = json_decode($raw, true);

if (is_array($json)) {
    $data = $json;          // raw JSON
} elseif (!empty($_POST)) {
    $data = $_POST;         // form-data
} else {
    echo json_encode(["status"=>"error","message"=>"No input received"]);
    exit;
}

// --------------------
// GET USER INPUT
// --------------------
$fullName = trim($data['full_name'] ?? "");
$email    = trim($data['email'] ?? "");
$password = $data['password'] ?? "";

// Validation
if ($fullName === "" || $email === "" || $password === "") {
    echo json_encode(["status"=>"error","message"=>"All fields are required"]);
    exit;
}

// --------------------
// CHECK EMAIL EXISTS
// --------------------
$check = $conn->prepare("SELECT id FROM create_account WHERE email = ?");
$check->bind_param("s", $email);
$check->execute();
$check->store_result();

if ($check->num_rows > 0) {
    echo json_encode(["status"=>"error","message"=>"Email already exists"]);
    exit;
}

// --------------------
// INSERT USER (PLAIN PASSWORD)
// --------------------
$stmt = $conn->prepare("
    INSERT INTO create_account (full_name, email, password)
    VALUES (?, ?, ?)
");

$stmt->bind_param("sss", $fullName, $email, $password);
$stmt->execute();

// --------------------
// RESPONSE
// --------------------
echo json_encode([
    "status" => "success",
    "message" => "Account created successfully"
    
]);