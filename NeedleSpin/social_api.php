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

    $action = $_POST['action'] ?? '';
    $my_id = $_SESSION['user_id'];

    if ($action === 'search_users') {
        $query = $_POST['query'] ?? '';
        if (empty($query)) { echo json_encode(['success' => true, 'users' => []]); exit; }
        $stmt = $pdo->prepare("
            SELECT user_id, uzivatelskeJmeno 
            FROM users 
            WHERE uzivatelskeJmeno LIKE ? 
              AND user_id != ? 
              AND user_id NOT IN (
                  SELECT friend_id FROM friends WHERE user_id = ?
                  UNION
                  SELECT user_id FROM friends WHERE friend_id = ?
              )
            LIMIT 5
        ");
        $stmt->execute(["%$query%", $my_id, $my_id, $my_id]);
        $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode(['success' => true, 'users' => $users]);
    }

    if ($action === 'send_request') {
        $friend_id = $_POST['friend_id'] ?? null;
        if (!$friend_id) { echo json_encode(['success' => false, 'message' => 'Chybí ID']); exit; }

        $stmt = $pdo->prepare("INSERT IGNORE INTO friends (user_id, friend_id, status) VALUES (?, ?, 'pending')");
        $stmt->execute([$my_id, $friend_id]);

        echo json_encode(['success' => true, 'message' => 'Žádost o přátelství byla odeslána!']);
    }

    if ($action === 'respond_request') {
        $request_id = $_POST['request_id'] ?? null;
        $response = $_POST['response'] ?? null; // 'accept' nebo 'decline'

        if ($response === 'accept') {
            $stmt = $pdo->prepare("UPDATE friends SET status = 'accepted' WHERE id = ? AND friend_id = ?");
            $stmt->execute([$request_id, $my_id]);
            $msg = "Žádost byla přijata. Jste přátelé!";
        } else {
            $stmt = $pdo->prepare("DELETE FROM friends WHERE id = ? AND friend_id = ?");
            $stmt->execute([$request_id, $my_id]);
            $msg = "Žádost byla odmítnuta.";
        }

        echo json_encode(['success' => true, 'message' => $msg]);
    }

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
if (isset($_POST['action']) && $_POST['action'] === 'remove_friend') {
    $friend_id = (int)$_POST['friend_id'];
    $stmt = $pdo->prepare("DELETE FROM friends WHERE (user_id = ? AND friend_id = ?) OR (user_id = ? AND friend_id = ?)");
    $stmt->execute([$_SESSION['user_id'], $friend_id, $friend_id, $_SESSION['user_id']]);
    echo json_encode(['success' => true]);
    exit;
}
if (isset($_POST['action']) && $_POST['action'] === 'toggle_follow') {
    $target_id = (int)$_POST['target_id'];
    $my_id = $_SESSION['user_id'];
    $stmt = $pdo->prepare("SELECT 1 FROM follows WHERE follower_id = ? AND following_id = ?");
    $stmt->execute([$my_id, $target_id]);
    
    if ($stmt->fetch()) {
        $pdo->prepare("DELETE FROM follows WHERE follower_id = ? AND following_id = ?")->execute([$my_id, $target_id]);
        echo json_encode(['success' => true, 'is_following' => false]);
    } else {
        $pdo->prepare("INSERT INTO follows (follower_id, following_id) VALUES (?, ?)")->execute([$my_id, $target_id]);
        echo json_encode(['success' => true, 'is_following' => true]);
    }
    exit;
}
?>