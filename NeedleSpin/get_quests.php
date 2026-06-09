<?php
session_start();
header('Content-Type: application/json');
ini_set('display_errors', 0);

$host = 'localhost'; $db = 'needlespin'; $user = 'root'; $pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if (!isset($_SESSION['user_id'])) { echo json_encode(['success' => false, 'message' => 'Nepřihlášen']); exit; }
    $userId = $_SESSION['user_id'];
    
    $today = date('Y-m-d');
    $currentMonth = date('Y-m');

    $quests = $pdo->query("SELECT id, typ_trvani FROM quests")->fetchAll(PDO::FETCH_ASSOC);
    foreach ($quests as $q) {
        $qid = $q['id'];
        $type = $q['typ_trvani'];
        
        $condition = "";
        if ($type === 'denni') $condition = "DATE(prideleno_dne) = '$today'";
        elseif ($type === 'tydenni') $condition = "YEARWEEK(prideleno_dne, 1) = YEARWEEK('$today', 1)";
        elseif ($type === 'mesicni') $condition = "DATE_FORMAT(prideleno_dne, '%Y-%m') = '$currentMonth'";

        $stmt = $pdo->prepare("SELECT id FROM user_quests WHERE user_id = ? AND quest_id = ? AND $condition");
        $stmt->execute([$userId, $qid]);
        if (!$stmt->fetch()) {
            $pdo->prepare("INSERT INTO user_quests (user_id, quest_id, prideleno_dne) VALUES (?, ?, ?)")->execute([$userId, $qid, $today]);
        }
    }

    $stmt = $pdo->prepare("
        SELECT q.nazev, q.odmena, q.cil_pocet, q.typ_trvani, uq.progres, uq.dokonceno
        FROM user_quests uq
        JOIN quests q ON uq.quest_id = q.id
        WHERE uq.user_id = ? 
        AND (
            (q.typ_trvani = 'denni' AND DATE(uq.prideleno_dne) = ?) OR
            (q.typ_trvani = 'tydenni' AND YEARWEEK(uq.prideleno_dne, 1) = YEARWEEK(?, 1)) OR
            (q.typ_trvani = 'mesicni' AND DATE_FORMAT(uq.prideleno_dne, '%Y-%m') = ?)
        )
        ORDER BY FIELD(q.typ_trvani, 'denni', 'tydenni', 'mesicni'), q.odmena ASC
    ");
    $stmt->execute([$userId, $today, $today, $currentMonth]);
    
    echo json_encode(['success' => true, 'quests' => $stmt->fetchAll(PDO::FETCH_ASSOC)]);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba DB']);
}
?>