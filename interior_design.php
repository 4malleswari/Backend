<?php
header("Content-Type: application/json");
error_reporting(E_ALL);
ini_set("display_errors", 1);

/* ================= DATABASE ================= */
$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    die(json_encode([
        "status" => "error",
        "message" => "DB connection failed",
        "sql_error" => $conn->connect_error
    ]));
}

/* ================= CHECK TABLE EXISTS ================= */
$check = $conn->query("SHOW TABLES LIKE 'interior_requests'");
if ($check->num_rows === 0) {
    die(json_encode([
        "status" => "error",
        "message" => "Table interior_requests does not exist"
    ]));
}

/* ================= FETCH LATEST REQUEST ================= */
$sql = "
    SELECT 
        id,
        room_type,
        style_preference,
        created_at
    FROM interior_requests
    ORDER BY id DESC
    LIMIT 1
";

$q = $conn->query($sql);

if (!$q) {
    die(json_encode([
        "status" => "error",
        "message" => "SQL query failed",
        "sql_error" => $conn->error
    ]));
}

if ($q->num_rows === 0) {
    die(json_encode([
        "status" => "error",
        "message" => "No interior request found",
        "hint" => "interior_requests table is empty"
    ]));
}

$req = $q->fetch_assoc();

/* ================= NORMALIZE INPUT ================= */
$roomInput  = strtolower(trim($req['room_type']));
$styleInput = strtolower(trim($req['style_preference']));

$room  = str_replace(" ", "_", $roomInput);
$style = str_replace(" ", "_", $styleInput);

/* ================= BASE PATHS ================= */
$baseDir = "/Applications/XAMPP/htdocs/smartroom/interior_designs";
$baseUrl = "http://localhost/smartroom/interior_designs";

/* ================= ROOM FOLDER ================= */
$roomDir = "$baseDir/$room";
if (!is_dir($roomDir)) {
    die(json_encode([
        "status" => "error",
        "message" => "Room folder not found",
        "room_received" => $req['room_type'],
        "expected_path" => $roomDir
    ]));
}

/* ================= STYLE FOLDER ================= */
$styleDir = "$roomDir/$style";
$styleUrl = "$baseUrl/$room/$style";

if (!is_dir($styleDir)) {
    die(json_encode([
        "status" => "error",
        "message" => "Style folder not found",
        "style_received" => $req['style_preference'],
        "expected_path" => $styleDir
    ]));
}

/* ================= READ IMAGES ================= */
$images = array_values(array_filter(scandir($styleDir), function ($file) {
    return preg_match('/\.(jpg|jpeg|png|webp)$/i', $file);
}));

if (count($images) === 0) {
    die(json_encode([
        "status" => "error",
        "message" => "No images found in style folder"
    ]));
}

/* ================= PICK 5 ================= */
shuffle($images);
$selected = array_slice($images, 0, 5);

/* ================= RESPONSE ================= */
$designs = [];
$id = 1;
foreach ($selected as $img) {
    $designs[] = [
        "id" => $id++,
        "title" => ucwords(str_replace("_", " ", $style)) . " Interior",
        "room_type" => ucwords(str_replace("_", " ", $room)),
        "style" => ucwords(str_replace("_", " ", $style)),
        "image_url" => "$styleUrl/$img"
    ];
}

echo json_encode([
    "status" => "success",
    "latest_request" => [
        "id" => $req['id'],
        "room_type" => $req['room_type'],
        "style_preference" => $req['style_preference'],
        "created_at" => $req['created_at'] ?? null
    ],
    "count" => count($designs),
    "designs" => $designs
], JSON_PRETTY_PRINT);
