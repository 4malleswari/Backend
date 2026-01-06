<?php
header("Content-Type: application/json");
error_reporting(E_ALL);
ini_set("display_errors", 1);

/* =====================================================
   DATABASE CONNECTION
===================================================== */
$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    die(json_encode([
        "status" => "error",
        "message" => "DB connection failed"
    ]));
}

/* =====================================================
   FETCH MOST RECENT INTERIOR REQUEST
===================================================== */
$q = $conn->query("
    SELECT room_type, style
    FROM interior_requests
    ORDER BY id DESC
    LIMIT 1
");

if (!$q || $q->num_rows === 0) {
    die(json_encode([
        "status" => "error",
        "message" => "No interior request found"
    ]));
}

$req = $q->fetch_assoc();

/* =====================================================
   NORMALIZE INPUT
===================================================== */
$roomInput  = strtolower(trim($req['room_type']));
$styleInput = strtolower(trim($req['style']));

$room  = str_replace(" ", "_", $roomInput);
$style = str_replace(" ", "_", $styleInput);

/* =====================================================
   BASE PATHS (CONFIRMED FROM YOUR SETUP ✅)
===================================================== */
$baseDir = "/Applications/XAMPP/htdocs/smartroom/interior_designs";
$baseUrl = "http://localhost/smartroom/interior_designs";

/* =====================================================
   CHECK ROOM FOLDER
===================================================== */
$roomDir = "$baseDir/$room";

if (!is_dir($roomDir)) {
    die(json_encode([
        "status" => "error",
        "message" => "Room folder not found",
        "room_received" => $roomInput,
        "expected_path" => $roomDir
    ], JSON_PRETTY_PRINT));
}

/* =====================================================
   CHECK STYLE FOLDER
===================================================== */
$styleDir = "$roomDir/$style";
$styleUrl = "$baseUrl/$room/$style";

if (!is_dir($styleDir)) {
    die(json_encode([
        "status" => "error",
        "message" => "Style folder not found",
        "style_received" => $styleInput,
        "expected_path" => $styleDir
    ], JSON_PRETTY_PRINT));
}

/* =====================================================
   READ IMAGES
===================================================== */
$images = array_values(array_filter(scandir($styleDir), function ($file) {
    return preg_match('/\.(jpg|jpeg|png|webp)$/i', $file);
}));

if (count($images) === 0) {
    die(json_encode([
        "status" => "error",
        "message" => "No images found in style folder",
        "style_path" => $styleDir
    ], JSON_PRETTY_PRINT));
}

/* =====================================================
   PICK 5 RANDOM DESIGNS
===================================================== */
shuffle($images);
$selected = array_slice($images, 0, 5);

/* =====================================================
   BUILD RESPONSE
===================================================== */
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

/* =====================================================
   FINAL RESPONSE
===================================================== */
echo json_encode([
    "status"  => "success",
    "message" => "Interior designs generated successfully",
    "count"   => count($designs),
    "designs" => $designs
], JSON_PRETTY_PRINT);
