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
   FETCH MOST RECENT PAINT REQUEST
===================================================== */
$q = $conn->query("
    SELECT room_type, style_pattern
    FROM paint_requests
    ORDER BY id DESC
    LIMIT 1
");

if (!$q || $q->num_rows === 0) {
    die(json_encode([
        "status" => "error",
        "message" => "No paint request found"
    ]));
}

$req = $q->fetch_assoc();

/* =====================================================
   NORMALIZE INPUT
===================================================== */
$roomInput  = strtolower(trim($req['room_type']));
$styleInput = strtolower(trim($req['style_pattern']));

$room = str_replace(" ", "_", $roomInput);

/* =====================================================
   STYLE → FOLDER MAP
===================================================== */
$styleMap = [
    "calm & fresh" => "calm_fresh",
    "designer"    => "designer",
    "formal"      => "formal",
    "patterns"    => "patterns",
    "traditional" => "traditional"
];

$expectedStyle = $styleMap[$styleInput] ?? "";

if ($expectedStyle === "") {
    die(json_encode([
        "status" => "error",
        "message" => "Invalid style selected",
        "style_received" => $styleInput
    ]));
}

/* =====================================================
   BASE PATHS (UPDATED ✅)
===================================================== */
$baseDir = "/Applications/XAMPP/htdocs/smartroom/paint_designs";
$baseUrl = "http://localhost/smartroom/paint_designs";

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
   FIND MATCHING STYLE FOLDER (ROBUST)
===================================================== */
$styleDir = "";
$styleUrl = "";
$availableFolders = [];

$folders = scandir($roomDir);

foreach ($folders as $f) {
    if ($f === "." || $f === "..") continue;
    if (!is_dir("$roomDir/$f")) continue;

    $availableFolders[] = $f;

    if (strtolower(trim($f)) === $expectedStyle) {
        $styleDir = "$roomDir/$f";
        $styleUrl = "$baseUrl/$room/$f";
        break;
    }
}

if ($styleDir === "") {
    die(json_encode([
        "status" => "error",
        "message" => "Style folder not found",
        "style_received" => $styleInput,
        "expected_style_folder" => $expectedStyle,
        "available_folders" => $availableFolders
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
   PICK 5 DESIGNS
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
        "title" => ucwords(str_replace("_", " ", $expectedStyle)) . " Design",
        "room_type" => ucwords(str_replace("_", " ", $room)),
        "style" => ucwords(str_replace("_", " ", $expectedStyle)),
        "image_url" => "$styleUrl/$img"
    ];
}

/* =====================================================
   FINAL JSON
===================================================== */
echo json_encode([
    "status"  => "success",
    "message" => "Paint designs generated successfully"
], JSON_PRETTY_PRINT);

