<?php
session_start();
header('Content-Type: application/json');
ini_set('display_errors', 0); 

// PŘIPOJENÍ K IONOS DATABÁZI
$host = 'db5020657101.hosting-data.io'; 
$db   = 'dbs15771817'; 
$user = 'dbu1233490'; 
$pass = 'SkibidiSigma10@';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Vybere top 50 hráčů
    $stmt = $pdo->query("SELECT uzivatelskeJmeno as username, body FROM users ORDER BY body DESC LIMIT 50");
    $leaderboard = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'leaderboard' => $leaderboard]);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba databáze: ' . $e->getMessage()]);
}
?>