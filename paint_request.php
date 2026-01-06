<?php
header("Content-Type: application/json");
error_reporting(E_ALL);

$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    echo json_encode(["status"=>"error","message"=>"DB error"]);
    exit;
}

$uploadDir = "uploads/";
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true);
}

/* ---------- ROOM IMAGE ---------- */
if (!isset($_FILES['room_image'])) {
    echo json_encode(["status"=>"error","message"=>"Room image required"]);
    exit;
}

$roomName = time()."_room.jpg";
move_uploaded_file($_FILES['room_image']['tmp_name'], $uploadDir.$roomName);

/* ---------- OPTIONAL FURNITURE ---------- */
$furniturePaths = [];

if (!empty($_FILES['furniture_images']['tmp_name'])) {
    foreach ($_FILES['furniture_images']['tmp_name'] as $i => $tmp) {
        $name = time()."_furn_".$i.".jpg";
        move_uploaded_file($tmp, $uploadDir.$name);
        $furniturePaths[] = $uploadDir.$name;
    }
}

/* ---------- FORM DATA ---------- */
$sunlight  = $_POST['sunlight_direction'] ?? "";
$length    = (int)($_POST['length_ft'] ?? 0);
$width     = (int)($_POST['width_ft'] ?? 0);
$style     = $_POST['style_pattern'] ?? "";
$match     = (int)($_POST['match_furniture'] ?? 0);
$roomType  = $_POST['room_type'] ?? "";
$colours   = $_POST['preferred_colours'] ?? "";
$details   = $_POST['other_details'] ?? "";

$furnitureJson = json_encode($furniturePaths);

/* ---------- INSERT ---------- */
$stmt = $conn->prepare("
    INSERT INTO paint_requests
    (room_image, sunlight_direction, length_ft, width_ft, style_pattern,
     match_furniture, furniture_images, room_type, preferred_colours, other_details)
    VALUES (?,?,?,?,?,?,?,?,?,?)
");

$stmt->bind_param(
    "ssiisissss",
    $roomName,
    $sunlight,
    $length,
    $width,
    $style,
    $match,
    $furnitureJson,
    $roomType,
    $colours,
    $details
);

$stmt->execute();

echo json_encode([
    "status" => "success",
    "message" => "Paint request submitted"
]);
