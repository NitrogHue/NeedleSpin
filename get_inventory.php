<?php
// get_inventory.php - FINÁLNÍ VERZE (Opraveno řazení podle user_album_id)
session_start();
header('Content-Type: application/json');

// Vypneme vypisování chyb do výstupu, aby to nerozbilo JSON
ini_set('display_errors', 0);
error_reporting(E_ALL);

$host = 'localhost';
$db   = 'needlespin';
$user = 'root';
$pass = '';

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Uživatel není přihlášen', 'items' => []]);
    exit;
}

$userId = $_SESSION['user_id'];

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // SQL DOTAZ
    // 1. Vybíráme sloupce a přejmenováváme je pro JS (nazev -> title, jmeno -> artist)
    // 2. Řadíme podle 'ua.user_album_id' (to je ten správný název sloupce v tvé DB)
    $sql = "SELECT 
                ua.user_album_id, 
                ua.album_id, 
                a.nazev AS title, 
                a.cover_url, 
                IFNULL(ar.jmeno, 'Neznámý autor') AS artist
            FROM user_albums ua
            JOIN albums a ON ua.album_id = a.album_id
            LEFT JOIN artists ar ON a.Artists_Artist_id = ar.Artist_id
            WHERE ua.user_id = ?
            ORDER BY ua.user_album_id DESC"; // TADY BYLA CHYBA (id vs user_album_id)

    $stmt = $pdo->prepare($sql);
    $stmt->execute([$userId]);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'items' => $items]);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba databáze: ' . $e->getMessage()]);
}
?>