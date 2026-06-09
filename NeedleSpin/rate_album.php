<?php
session_start();
header('Content-Type: application/json');
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Musíš být přihlášený pro hodnocení.']);
    exit;
}

$user_id = $_SESSION['user_id'];
$album_id = $_POST['album_id'] ?? null;
$rating = $_POST['rating'] ?? null;

if (!$album_id || !$rating) {
    echo json_encode(['success' => false, 'message' => 'Chybí data.']);
    exit;
}
$host = 'localhost';
$db   = 'needlespin';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->prepare("SELECT rating_id FROM ratings WHERE Users_user_id = ? AND Albums_album_id = ?");
    $stmt->execute([$user_id, $album_id]);
    $existing = $stmt->fetch();

    if ($existing) {
        $stmt = $pdo->prepare("UPDATE ratings SET hodnoceni = ?, hodnoceni_Datum = NOW() WHERE rating_id = ?");
        $stmt->execute([$rating, $existing['rating_id']]);
        $msg = 'Hodnocení bylo upraveno!';
    } else {
        $stmt = $pdo->prepare("INSERT INTO ratings (hodnoceni, hodnoceni_Datum, Users_user_id, Albums_album_id) VALUES (?, NOW(), ?, ?)");
        $stmt->execute([$rating, $user_id, $album_id]);
        $msg = 'Hodnocení bylo přidáno!';
    }

    echo json_encode(['success' => true, 'message' => $msg]);

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba DB: ' . $e->getMessage()]);
}

?>