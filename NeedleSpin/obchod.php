<?php
session_start();
header('Content-Type: application/json');

// PŘIPOJENÍ K IONOS DATABÁZI
$host = 'db5020657101.hosting-data.io';
$db   = 'dbs15771817';
$user = 'dbu1233490';
$pass = 'SkibidiSigma10@';

$apiToken = "vBKumlLqKmZWKMQgXXJCvAlKGCzxDHslVygvenxD"; 
$PACK_PRICE = 100;

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba databáze']);
    exit;
}

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Musíš být přihlášen!']);
    exit;
}
$userId = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT body FROM users WHERE user_id = ?");
$stmt->execute([$userId]);
$userPoints = $stmt->fetchColumn();

if (isset($_GET['action']) && $_GET['action'] === 'check') {
    echo json_encode(['success' => true, 'new_balance' => $userPoints]);
    exit; 
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Neplatný požadavek']);
    exit;
}

if ($userPoints < $PACK_PRICE) {
    echo json_encode(['success' => false, 'message' => 'Nemáš dost bodů! Potřebuješ ' . $PACK_PRICE]);
    exit;
}

// NASTAVENÍ PACKU
$packType = isset($_POST['genre']) ? $_POST['genre'] : 'Rock';
$apiParams = "";
$packId = 3; 

switch ($packType) {
    case 'Rap': $apiParams = "&genre=Hip+Hop"; $packId = 1; break;
    case 'Pop': $apiParams = "&genre=Pop"; $packId = 2; break;
    case 'Rock': $apiParams = "&genre=Rock"; $packId = 3; break;
    case 'Metal': $apiParams = "&genre=Rock&style=Heavy+Metal"; $packId = 4; break;
    case 'Jazz': $apiParams = "&genre=Jazz"; $packId = 5; break;
    default: $apiParams = "&genre=Rock"; $packId = 3;
}

$chance = rand(1, 100);
$sellPrice = 25; 

if ($chance <= 85) {
    $randomPage = rand(1, 10);
    $sellPrice = 25;
} else {
    $randomPage = rand(11, 50);
    $sellPrice = 50;
}

$url = "https://api.discogs.com/database/search?type=master" . $apiParams . "&format=album&sort=have&sort_order=desc&per_page=60&page=" . $randomPage . "&token=" . $apiToken;

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_USERAGENT, "NeedleSpinApp/1.0");
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
$response = curl_exec($ch);
$data = json_decode($response, true);

if (empty($data['results'])) {
    echo json_encode(['success' => false, 'message' => 'Discogs nenašel alba. Zkus to znovu.']);
    exit;
}

$winnerIndex = rand(0, count($data['results']) - 1);
$winner = $data['results'][$winnerIndex];

try {
    $pdo->beginTransaction();

    $pdo->prepare("UPDATE users SET body = body - ? WHERE user_id = ?")->execute([$PACK_PRICE, $userId]);

    $fullTitle = $winner['title'];
    if (strpos($fullTitle, ' - ') !== false) {
        $parts = explode(' - ', $fullTitle, 2);
        $metaArtist = $parts[0];
        $metaTitle = $parts[1];
    } else {
        $metaArtist = "Unknown Artist";
        $metaTitle = $fullTitle;
    }
    
    $cover = isset($winner['cover_image']) ? $winner['cover_image'] : '';
    $albumId = $winner['master_id'];

    $stmtArt = $pdo->prepare("SELECT Artist_id FROM artists WHERE jmeno = ?");
    $stmtArt->execute([$metaArtist]);
    $artistId = $stmtArt->fetchColumn();
    
    if (!$artistId) {
        $pdo->prepare("INSERT INTO artists (jmeno) VALUES (?)")->execute([$metaArtist]);
        $artistId = $pdo->lastInsertId();
    }

    $stmtAlb = $pdo->prepare("SELECT album_id FROM albums WHERE album_id = ?");
    $stmtAlb->execute([$albumId]);
    if (!$stmtAlb->fetch()) {
        $pdo->prepare("INSERT INTO albums (album_id, nazev, cover_url, Artists_Artist_id) VALUES (?, ?, ?, ?)")
            ->execute([$albumId, $metaTitle, $cover, $artistId]);
    }

    $stmtInv = $pdo->prepare("INSERT INTO user_albums (user_id, album_id, from_pack_id, sell_price) VALUES (?, ?, ?, ?)");
    $stmtInv->execute([$userId, $albumId, $packId, $sellPrice]);

    $pdo->commit();

    echo json_encode([
        'success' => true,
        'new_balance' => $userPoints - $PACK_PRICE,
        'items' => $data['results'],
        'winner_index' => $winnerIndex
    ]);

} catch (Exception $e) {
    $pdo->rollBack();
    echo json_encode(['success' => false, 'message' => 'Chyba DB: ' . $e->getMessage()]);
}
?>