<?php
header("Content-Type: application/json");

// --------------------
// DB CONNECTION
// --------------------
$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    echo json_encode([
        "status" => "error",
        "message" => "DB connection failed"
    ]);
    exit;
}

// --------------------
// READ INPUT (FORM-DATA OR JSON)
// --------------------
$data = [];

$raw = file_get_contents("php://input");
$json = json_decode($raw, true);

if (is_array($json)) {
    $data = $json;
} elseif (!empty($_POST)) {
    $data = $_POST;
} else {
    echo json_encode([
        "status" => "error",
        "message" => "No input received"
    ]);
    exit;
}

// --------------------
// GET BUDGET
// --------------------
$budget = intval($data['budget'] ?? 0);

if ($budget <= 0) {
    echo json_encode([
        "status" => "error",
        "message" => "Budget is required"
    ]);
    exit;
}

// --------------------
// FETCH LATEST ROOM TYPE (FROM interior_requests)
// --------------------
$roomQuery = $conn->query("
    SELECT room_type
    FROM interior_requests
    WHERE room_type IS NOT NULL
    ORDER BY id DESC
    LIMIT 1
");

if (!$roomQuery || $roomQuery->num_rows === 0) {
    echo json_encode([
        "status" => "error",
        "message" => "No interior request with room_type found"
    ]);
    exit;
}

$row = $roomQuery->fetch_assoc();
$roomType = trim($row['room_type']); // example: living_room

// --------------------
// FETCH PRODUCTS (NORMALIZED ROOM TYPE MATCH)
// --------------------
$sql = "
    SELECT 
        id,
        product_name,
        category,
        price,
        product_url,
        image_url
    FROM room_products
    WHERE 
        REPLACE(LOWER(TRIM(room_type)), ' ', '_')
        =
        REPLACE(LOWER(?), ' ', '_')
        AND price <= ?
    ORDER BY price ASC
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $roomType, $budget);
$stmt->execute();

$result = $stmt->get_result();
$products = [];

while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

// --------------------
// RESPONSE
// --------------------
echo json_encode([
    "status" => "success",
    "room_type" => $roomType,
    "user_budget" => $budget,
    "total_products" => count($products),
    "products" => $products
]);

$stmt->close();
$conn->close();
