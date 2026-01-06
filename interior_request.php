<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
header("Content-Type: application/json");

/* ================= DATABASE ================= */
$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    die(json_encode([
        "status" => "error",
        "message" => "DB connection failed"
    ]));
}

/* ================= UPLOAD FOLDER (AUTO CREATE) ================= */
$uploadDir = __DIR__ . "/uploads/interior_requests";

// Create folder if missing
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true);
}

// Check writable
if (!is_writable($uploadDir)) {
    chmod($uploadDir, 0777);
}

// Final safety check
if (!is_writable($uploadDir)) {
    die(json_encode([
        "status" => "error",
        "message" => "Upload folder is not writable",
        "path" => $uploadDir
    ]));
}

/* ================= INPUTS ================= */
$roomLength = (int)($_POST['room_length'] ?? 0);
$roomWidth  = (int)($_POST['room_width'] ?? 0);
$roomType   = trim($_POST['room_type'] ?? "");
$stylePref  = trim($_POST['style_preference'] ?? "");
$matchFurniture = (int)($_POST['match_furniture'] ?? 0);
$otherDetails   = trim($_POST['other_details'] ?? "");

/* ================= VALIDATION ================= */
if ($roomLength <= 0 || $roomWidth <= 0 || $roomType === "" || $stylePref === "") {
    die(json_encode([
        "status" => "error",
        "message" => "room_length, room_width, room_type and style_preference are required",
        "debug" => $_POST
    ]));
}

/* ================= ROOM IMAGE (OPTIONAL) ================= */
$roomImage = null;
if (isset($_FILES['room_image']) && $_FILES['room_image']['error'] === 0) {
    $ext = pathinfo($_FILES['room_image']['name'], PATHINFO_EXTENSION);
    $roomImage = time() . "_room." . $ext;
    move_uploaded_file(
        $_FILES['room_image']['tmp_name'],
        $uploadDir . "/" . $roomImage
    );
}

/* ================= FURNITURE IMAGES (OPTIONAL) ================= */
$furnitureFiles = [];
if (isset($_FILES['furniture_images'])) {
    foreach ($_FILES['furniture_images']['name'] as $i => $name) {
        if ($_FILES['furniture_images']['error'][$i] === 0) {
            $ext = pathinfo($name, PATHINFO_EXTENSION);
            $file = time() . "_furniture_" . $i . "." . $ext;
            move_uploaded_file(
                $_FILES['furniture_images']['tmp_name'][$i],
                $uploadDir . "/" . $file
            );
            $furnitureFiles[] = $file;
        }
    }
}
$furnitureImages = implode(",", $furnitureFiles);

/* ================= INSERT ================= */
$stmt = $conn->prepare("
    INSERT INTO interior_requests (
        room_image,
        furniture_images,
        room_length,
        room_width,
        room_type,
        style_preference,
        match_furniture,
        other_details
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
");

if (!$stmt) {
    die(json_encode([
        "status" => "error",
        "message" => "SQL prepare failed",
        "sql_error" => $conn->error
    ]));
}

/* 
   Types:
   s = string
   i = integer
*/
$stmt->bind_param(
    "ssiissis",
    $roomImage,
    $furnitureImages,
    $roomLength,
    $roomWidth,
    $roomType,
    $stylePref,
    $matchFurniture,
    $otherDetails
);

$stmt->execute();

/* ================= RESPONSE ================= */
echo json_encode([
    "status" => "success",
    "message" => "Interior request saved successfully"
]);
