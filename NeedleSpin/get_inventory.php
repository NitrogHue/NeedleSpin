<?php
// get_inventory.php
session_start();
header('Content-Type: application/json');

ini_set('display_errors', 1);
error_reporting(E_ALL);

$host = 'localhost'; $db = 'needlespin'; $user = 'root'; $pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba připojení k DB: ' . $e->getMessage()]); 
    exit;
}

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Nepřihlášen']); 
    exit;
}

try {
    // Odstraněn neexistující sloupec 'streams' a rozšířen GROUP BY pro kompatibilitu s MySQL 8+
    $stmt = $pdo->prepare("
        SELECT 
            ua.user_album_id, 
            a.album_id, 
            a.nazev as title, 
            a.cover_url, 
            ar.jmeno as artist, 
            ua.sell_price,
            COALESCE(a.rok_vydani, 0) as rok_vydani, 
            COALESCE(AVG(r.hodnoceni), 0) as avg_rating
        FROM user_albums ua
        JOIN albums a ON ua.album_id = a.album_id
        LEFT JOIN artists ar ON a.Artists_Artist_id = ar.Artist_id
        LEFT JOIN ratings r ON a.album_id = r.Albums_album_id
        WHERE ua.user_id = ?
        GROUP BY 
            ua.user_album_id, 
            a.album_id, 
            a.nazev, 
            a.cover_url, 
            ar.jmeno, 
            ua.sell_price, 
            a.rok_vydani
        ORDER BY ua.user_album_id DESC
    ");
    
    $stmt->execute([$_SESSION['user_id']]);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Zaokrouhlení průměru na jedno desetinné místo rovnou na serveru
    foreach ($items as &$item) {
        $item['avg_rating'] = round((float)$item['avg_rating'], 1);
    }

    echo json_encode(['success' => true, 'items' => $items]);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'SQL Chyba: ' . $e->getMessage()]);
}
?>