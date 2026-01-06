<?php
header("Content-Type: application/json");

// ---------- DB ----------
$conn = new mysqli("localhost", "root", "", "app");
if ($conn->connect_error) {
    echo json_encode(["status"=>"error","message"=>"DB failed"]);
    exit;
}

// ---------- ZIP ----------
if (!isset($_FILES['zip_file'])) {
    echo json_encode(["status"=>"error","message"=>"ZIP missing"]);
    exit;
}

$tmpZip = $_FILES['zip_file']['tmp_name'];
$zipPath = "uploads/upload_" . time() . ".zip";
move_uploaded_file($tmpZip, $zipPath);

// ---------- OPEN ZIP ----------
$zip = new ZipArchive;
if ($zip->open($zipPath) !== TRUE) {
    echo json_encode(["status"=>"error","message"=>"ZIP open failed"]);
    exit;
}

$inserted = 0;

for ($i = 0; $i < $zip->numFiles; $i++) {

    $entry = $zip->getNameIndex($i);

    // Skip folders
    if (substr($entry, -1) === '/') continue;

    $ext = strtolower(pathinfo($entry, PATHINFO_EXTENSION));
    if (!in_array($ext, ["jpg","jpeg","png","webp"])) continue;

    /*
        Expected path:
        RoomType/Style/ImageName.jpg
    */
    $parts = explode('/', $entry);

    if (count($parts) < 3) continue;

    $roomType = $parts[0];
    $style    = $parts[1];
    $fileName = basename($entry);

    // Create folder
    $targetDir = "uploads/images/$roomType/$style/";
    if (!is_dir($targetDir)) mkdir($targetDir, 0777, true);

    // Extract file
    $zip->extractTo($targetDir, [$entry]);

    $imagePath = $targetDir . $fileName;

    // Insert into DB
    $stmt = $conn->prepare("
        INSERT INTO paint_images (room_type, style, image_path)
        VALUES (?, ?, ?)
    ");
    $stmt->bind_param("sss", $roomType, $style, $imagePath);
    $stmt->execute();

    $inserted++;
}

$zip->close();
unlink($zipPath);

echo json_encode([
    "status" => "success",
    "images_inserted" => $inserted
]);
