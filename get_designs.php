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
   FETCH LATEST PAINT REQUEST
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

$style = $styleMap[$styleInput] ?? "";

if ($style === "") {
    die(json_encode([
        "status" => "error",
        "message" => "Invalid style selected",
        "style_received" => $styleInput
    ]));
}

/* =====================================================
   PATHS (MATCH YOUR SYSTEM EXACTLY)
===================================================== */
$baseDir = "/Applications/XAMPP/htdocs/smartroom/paint_designs";
$baseUrl = "http://localhost/smartroom/paint_designs";

$styleDir = "$baseDir/$room/$style";
$styleUrl = "$baseUrl/$room/$style";

/* =====================================================
   VALIDATE FOLDER
===================================================== */
if (!is_dir($styleDir)) {
    die(json_encode([
        "status" => "error",
        "message" => "Design folder not found",
        "expected_path" => $styleDir
    ]));
}

/* =====================================================
   READ IMAGE FILES
===================================================== */
$images = array_values(array_filter(scandir($styleDir), function ($file) {
    return preg_match('/\.(jpg|jpeg|png|webp)$/i', $file);
}));

if (count($images) === 0) {
    die(json_encode([
        "status" => "error",
        "message" => "No designs available"
    ]));
}

/* =====================================================
   PICK 5 DESIGNS
===================================================== */
shuffle($images);
$images = array_slice($images, 0, 5);

/* =====================================================
   BUILD RESPONSE
===================================================== */
$designs = [];
$id = 1;

foreach ($images as $img) {
    $designs[] = [
        "id" => $id++,
        "title" => ucwords(str_replace("_", " ", $style)) . " Design",
        "room_type" => ucwords(str_replace("_", " ", $room)),
        "style" => ucwords(str_replace("_", " ", $style)),
        "sunlight_match" => "Any",
        "image_url" => $styleUrl . "/" . rawurlencode($img)
    ];
}

/* =====================================================
   FINAL JSON RESPONSE
===================================================== */
echo json_encode([
    "status" => "success",
    "designs" => $designs
], JSON_PRETTY_PRINT);
