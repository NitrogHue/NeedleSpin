<?php
$host = 'localhost';        
$dbname = 'needlespin';
$username = 'root';          
$password = '';              

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    header('Content-Type: application/json');
    echo json_encode(['success' => false, 'message' => 'Chyba připojení k databázi: ' . $e->getMessage()]);
    exit;
}
?>