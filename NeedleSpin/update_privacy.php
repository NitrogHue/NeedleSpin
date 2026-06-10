<?php
session_start();
header('Content-Type: application/json');
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Nepřihlášen']);
    exit;
}

$host = 'db5020657101.hosting-data.io'; 
$db   = 'dbs15771817'; 
$user = 'dbu1233490'; 
$pass = 'SkibidiSigma10@';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $my_id = (int)$_SESSION['user_id'];
    $hide_stats = isset($_POST['hide_stats']) && $_POST['hide_stats'] == '1' ? 1 : 0;
    $stmt = $pdo->prepare("UPDATE users SET hide_stats = ? WHERE user_id = ?");
    $stmt->execute([$hide_stats, $my_id]);

    echo json_encode(['success' => true, 'message' => 'Soukromí uloženo!']);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba DB: ' . $e->getMessage()]);
}
?>