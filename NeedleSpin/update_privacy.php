<?php
session_start();
header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Nepřihlášen']);
    exit;
}

$host = 'localhost'; $db = 'needlespin'; $user = 'root'; $pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $hide = (isset($_POST['hide_stats']) && $_POST['hide_stats'] == '1') ? 1 : 0;

    $stmt = $pdo->prepare("UPDATE users SET hide_stats = ? WHERE user_id = ?");
    $stmt->execute([$hide, $_SESSION['user_id']]);

    echo json_encode(['success' => true]);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba DB']);
}
?>