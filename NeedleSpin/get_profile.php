<?php
session_start();
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Pragma: no-cache");
header('Content-Type: application/json');

ini_set('display_errors', 1);
error_reporting(E_ALL);

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Nepřihlášen']);
    exit;
}

$host = 'localhost'; $db = 'needlespin'; $user = 'root'; $pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $my_id = (int)$_SESSION['user_id'];
    $target_id = isset($_GET['id']) ? (int)$_GET['id'] : $my_id;
    $is_own_profile = ($my_id === $target_id);

    $stmt = $pdo->prepare("SELECT uzivatelskeJmeno, body, hide_stats FROM users WHERE user_id = ?");
    $stmt->execute([$target_id]);
    $userData = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$userData) {
        echo json_encode(['success' => false, 'message' => 'Uživatel nenalezen.']);
        exit;
    }

    $is_hidden = ($userData['hide_stats'] == 1);
    $stats_hidden_from_viewer = (!$is_own_profile && $is_hidden);

    $relation = ['friend_status' => 'none', 'is_following' => false];
    if (!$is_own_profile) {
        $stmt = $pdo->prepare("SELECT status, user_id FROM friends WHERE (user_id = ? AND friend_id = ?) OR (user_id = ? AND friend_id = ?)");
        $stmt->execute([$my_id, $target_id, $target_id, $my_id]);
        $rel = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($rel) {
            if ($rel['status'] === 'accepted') $relation['friend_status'] = 'accepted';
            else if ($rel['user_id'] == $my_id) $relation['friend_status'] = 'pending_sent';
            else $relation['friend_status'] = 'pending_received';
        }

        $stmt = $pdo->prepare("SELECT 1 FROM follows WHERE follower_id = ? AND following_id = ?");
        $stmt->execute([$my_id, $target_id]);
        if ($stmt->fetch()) $relation['is_following'] = true;
    }
    $stmt = $pdo->prepare("SELECT u.user_id, u.uzivatelskeJmeno FROM friends f JOIN users u ON (u.user_id = f.friend_id OR u.user_id = f.user_id) WHERE (f.user_id = ? OR f.friend_id = ?) AND f.status = 'accepted' AND u.user_id != ?");
    $stmt->execute([$target_id, $target_id, $target_id]);
    $friends = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $requests = [];
    if ($is_own_profile) {
        $stmt = $pdo->prepare("SELECT f.id as request_id, u.user_id, u.uzivatelskeJmeno FROM friends f JOIN users u ON u.user_id = f.user_id WHERE f.friend_id = ? AND f.status = 'pending'");
        $stmt->execute([$my_id]);
        $requests = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    $stmt = $pdo->prepare("SELECT COUNT(*) as pocet FROM follows WHERE following_id = ?");
    $stmt->execute([$target_id]);
    $followers_count = $stmt->fetch(PDO::FETCH_ASSOC)['pocet'];

    $ratingChartData = [];
    $averageRating = 0;
    $valuableAlbums = [];
    $recentRatings = [];

    if ($stats_hidden_from_viewer) {
        $userData['body'] = 'Skryto';
    } else {
        $stmt = $pdo->prepare("SELECT hodnoceni, COUNT(*) as pocet FROM ratings WHERE Users_user_id = ? GROUP BY hodnoceni");
        $stmt->execute([$target_id]);
        $ratingsData = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $ratingCounts = [1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0];
        $totalRatings = 0; $sumRatings = 0;

        foreach ($ratingsData as $row) {
            $star = (int) round((float)$row['hodnoceni']); 
            if ($star >= 1 && $star <= 5) {
                $ratingCounts[$star] += (int)$row['pocet'];
                $totalRatings += (int)$row['pocet'];
                $sumRatings += ($star * (int)$row['pocet']);
            }
        }
        $averageRating = $totalRatings > 0 ? round($sumRatings / $totalRatings, 1) : 0;
        $ratingChartData = array_values($ratingCounts);

        // --- ZRUŠENÝ FILTR: Nejhodnotnější alba (ukáže vše) ---
        $stmt = $pdo->prepare("
            SELECT COALESCE(a.nazev, 'Neznámé album') as nazev, a.cover_url, ua.sell_price 
            FROM user_albums ua 
            JOIN albums a ON a.album_id = ua.album_id 
            WHERE ua.user_id = ? 
            ORDER BY ua.sell_price DESC 
            LIMIT 4
        ");
        $stmt->execute([$target_id]);
        $valuableAlbums = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $stmt = $pdo->prepare("
            SELECT COALESCE(a.nazev, 'Neznámé album') as nazev, a.cover_url, r.hodnoceni, DATE_FORMAT(r.hodnoceni_Datum, '%d.%m.%Y') as datum 
            FROM ratings r 
            JOIN albums a ON a.album_id = r.Albums_album_id 
            WHERE r.Users_user_id = ? 
            ORDER BY r.hodnoceni_Datum DESC 
            LIMIT 4
        ");
        $stmt->execute([$target_id]);
        $recentRatings = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    echo json_encode([
        'success' => true,
        'is_own_profile' => $is_own_profile,
        'hide_stats_enabled' => $is_hidden,
        'stats_hidden_from_viewer' => $stats_hidden_from_viewer,
        'relation' => $relation,
        'username' => $userData['uzivatelskeJmeno'],
        'body' => $userData['body'],
        'friends' => $friends,
        'requests' => $requests,
        'ratingData' => $ratingChartData,
        'averageRating' => $averageRating,
        'followers_count' => $followers_count,
        'valuableAlbums' => $valuableAlbums,
        'recentRatings' => $recentRatings
    ]);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba DB: ' . $e->getMessage()]);
}
?>