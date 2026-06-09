<?php
session_start();
header('Content-Type: application/json');

ini_set('display_errors', 0);
error_reporting(E_ALL);

$host = 'localhost'; $db = 'needlespin'; $user = 'root'; $pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'DB Error']); exit;
}

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Musíš být přihlášen!']); exit;
}
$userId = $_SESSION['user_id'];
$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';

try {
    if ($action === 'load') {
        $sqlMarket = "SELECT m.id, m.type, m.price, u.uzivatelskeJmeno as seller, m.seller_id,
                      a.nazev as title, a.cover_url, ar.jmeno as artist
                      FROM market_listings m
                      JOIN user_albums ua ON m.user_album_id = ua.user_album_id
                      JOIN albums a ON ua.album_id = a.album_id
                      LEFT JOIN artists ar ON a.Artists_Artist_id = ar.Artist_id
                      JOIN users u ON m.seller_id = u.user_id
                      WHERE m.status = 'active' ORDER BY m.created_at DESC";
        $marketItems = $pdo->query($sqlMarket)->fetchAll(PDO::FETCH_ASSOC);

        $sqlOffers = "SELECT t.offer_id, t.listing_id, u.uzivatelskeJmeno as buyer_name,
                      ma.nazev as my_album, ma.cover_url as my_cover, 
                      oa.nazev as offered_album, oa.cover_url as offered_cover
                      FROM trade_offers t
                      JOIN market_listings m ON t.listing_id = m.id
                      JOIN users u ON t.buyer_id = u.user_id
                      JOIN user_albums mua ON m.user_album_id = mua.user_album_id
                      JOIN albums ma ON mua.album_id = ma.album_id
                      JOIN user_albums oua ON t.offered_user_album_id = oua.user_album_id
                      JOIN albums oa ON oua.album_id = oa.album_id
                      WHERE m.seller_id = ? AND t.status = 'pending'";
        $stmt = $pdo->prepare($sqlOffers);
        $stmt->execute([$userId]);
        $myOffers = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode(['success' => true, 'market' => $marketItems, 'offers' => $myOffers, 'current_user' => $userId]);
        exit;
    }

    if ($action === 'create_listing') {
        $userAlbumId = $_POST['user_album_id'];
        $type = $_POST['type']; // 'sell' nebo 'trade'
        $price = isset($_POST['price']) ? (int)$_POST['price'] : 0;

        $stmt = $pdo->prepare("SELECT id FROM market_listings WHERE user_album_id = ? AND status = 'active'");
        $stmt->execute([$userAlbumId]);
        if ($stmt->fetch()) { echo json_encode(['success'=>false, 'message'=>'Už je na trhu!']); exit; }

        $pdo->prepare("INSERT INTO market_listings (user_album_id, seller_id, type, price) VALUES (?, ?, ?, ?)")
            ->execute([$userAlbumId, $userId, $type, $price]);
        
        echo json_encode(['success' => true, 'message' => 'Úspěšně přidáno na trh.']); exit;
    }

    if ($action === 'buy') {
        $marketId = $_POST['market_id'];
        $pdo->beginTransaction();

        $stmt = $pdo->prepare("SELECT * FROM market_listings WHERE id = ? AND type = 'sell' AND status = 'active' FOR UPDATE");
        $stmt->execute([$marketId]);
        $listing = $stmt->fetch();

        if (!$listing) { $pdo->rollBack(); echo json_encode(['success'=>false, 'message'=>'Nedostupné.']); exit; }
        
        $buyerPoints = $pdo->query("SELECT body FROM users WHERE user_id = $userId")->fetchColumn();
        if ($buyerPoints < $listing['price']) { $pdo->rollBack(); echo json_encode(['success'=>false, 'message'=>'Málo bodů!']); exit; }

        $pdo->prepare("UPDATE users SET body = body - ? WHERE user_id = ?")->execute([$listing['price'], $userId]);
        $pdo->prepare("UPDATE users SET body = body + ? WHERE user_id = ?")->execute([$listing['price'], $listing['seller_id']]);
        $pdo->prepare("UPDATE user_albums SET user_id = ? WHERE user_album_id = ?")->execute([$userId, $listing['user_album_id']]);
        $pdo->prepare("UPDATE market_listings SET status = 'completed' WHERE id = ?")->execute([$marketId]);

        $pdo->commit();
        echo json_encode(['success' => true, 'message' => 'Koupeno!']); exit;
    }
    if ($action === 'make_offer') {
        $listingId = $_POST['listing_id'];
        $offeredUserAlbumId = $_POST['offered_user_album_id'];

        $stmt = $pdo->prepare("SELECT user_id FROM user_albums WHERE user_album_id = ?");
        $stmt->execute([$offeredUserAlbumId]);
        if ($stmt->fetchColumn() != $userId) { echo json_encode(['success'=>false, 'message'=>'Toto album nemáš!']); exit; }

        $pdo->prepare("INSERT INTO trade_offers (listing_id, buyer_id, offered_user_album_id) VALUES (?, ?, ?)")
            ->execute([$listingId, $userId, $offeredUserAlbumId]);
            
        echo json_encode(['success' => true, 'message' => 'Nabídka na výměnu odeslána!']); exit;
    }

    if ($action === 'accept_offer') {
        $offerId = $_POST['offer_id'];
        $pdo->beginTransaction();

        $stmt = $pdo->prepare("SELECT t.*, m.user_album_id as my_album_id FROM trade_offers t JOIN market_listings m ON t.listing_id = m.id WHERE t.offer_id = ? AND m.seller_id = ? AND t.status = 'pending'");
        $stmt->execute([$offerId, $userId]);
        $offer = $stmt->fetch();

        if (!$offer) { $pdo->rollBack(); echo json_encode(['success'=>false, 'message'=>'Nabídka nenalezena.']); exit; }

        $pdo->prepare("UPDATE user_albums SET user_id = ? WHERE user_album_id = ?")->execute([$offer['buyer_id'], $offer['my_album_id']]);
        $pdo->prepare("UPDATE user_albums SET user_id = ? WHERE user_album_id = ?")->execute([$userId, $offer['offered_user_album_id']]);

        $pdo->prepare("UPDATE market_listings SET status = 'completed' WHERE id = ?")->execute([$offer['listing_id']]);
        $pdo->prepare("UPDATE trade_offers SET status = 'accepted' WHERE offer_id = ?")->execute([$offerId]);
        $pdo->prepare("UPDATE trade_offers SET status = 'rejected' WHERE listing_id = ? AND offer_id != ?")->execute([$offer['listing_id'], $offerId]);

        $pdo->commit();
        echo json_encode(['success' => true, 'message' => 'Výměna úspěšná!']); exit;
    }
    if ($action === 'quick_sell') {
        $userAlbumId = $_POST['user_album_id'];
        $pdo->beginTransaction();

        $stmt = $pdo->prepare("SELECT sell_price FROM user_albums WHERE user_album_id = ? AND user_id = ? FOR UPDATE");
        $stmt->execute([$userAlbumId, $userId]);
        $album = $stmt->fetch();

        if (!$album) { 
            $pdo->rollBack(); echo json_encode(['success'=>false, 'message'=>'Toto album nemůžeš prodat!']); exit; 
        }
        $price = $album['sell_price'];

        $pdo->prepare("DELETE FROM market_listings WHERE user_album_id = ?")->execute([$userAlbumId]);
        $pdo->prepare("DELETE FROM trade_offers WHERE offered_user_album_id = ?")->execute([$userAlbumId]);
        $pdo->prepare("DELETE FROM user_albums WHERE user_album_id = ?")->execute([$userAlbumId]);
        
        $pdo->prepare("UPDATE users SET body = body + ? WHERE user_id = ?")->execute([$price, $userId]);

        $pdo->commit();
        echo json_encode(['success' => true, 'message' => "Album prodáno systému za $price bodů!"]); exit;
    }

} catch (Exception $e) {
    if ($pdo->inTransaction()) $pdo->rollBack();
    echo json_encode(['success' => false, 'message' => 'Chyba: ' . $e->getMessage()]);
    
}
?>