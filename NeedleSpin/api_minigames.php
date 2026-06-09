<?php
session_start();
header('Content-Type: application/json');

// PŘIPOJENÍ K IONOS DATABÁZI
$host = 'db5020657101.hosting-data.io';
$db   = 'dbs15771817';
$user = 'dbu1233490';
$pass = 'SkibidiSigma10@';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'DB Error: ' . $e->getMessage()]); exit;
}

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Nepřihlášen!']); exit;
}
$userId = $_SESSION['user_id'];
$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';

function updateQuest($userId, $actionType, $amount, $pdo) {
    $today = date('Y-m-d');
    $currentMonth = date('Y-m');
    
    $questsAll = $pdo->query("SELECT id, typ_trvani FROM quests")->fetchAll(PDO::FETCH_ASSOC);
    foreach($questsAll as $q) {
        $qid = $q['id'];
        $type = $q['typ_trvani'];
        $condition = "";
        if ($type === 'denni') $condition = "DATE(prideleno_dne) = '$today'";
        elseif ($type === 'tydenni') $condition = "YEARWEEK(prideleno_dne, 1) = YEARWEEK('$today', 1)";
        elseif ($type === 'mesicni') $condition = "DATE_FORMAT(prideleno_dne, '%Y-%m') = '$currentMonth'";

        $stmtCheck = $pdo->prepare("SELECT id FROM user_quests WHERE user_id = ? AND quest_id = ? AND $condition");
        $stmtCheck->execute([$userId, $qid]);
        if (!$stmtCheck->fetch()) {
            $pdo->prepare("INSERT INTO user_quests (user_id, quest_id, prideleno_dne) VALUES (?, ?, ?)")->execute([$userId, $qid, $today]);
        }
    }

    $stmt = $pdo->prepare("
        SELECT uq.id, uq.progres, q.cil_pocet, q.odmena 
        FROM user_quests uq 
        JOIN quests q ON uq.quest_id = q.id 
        WHERE uq.user_id = ? AND q.typ_akce = ? AND uq.dokonceno = 0 
        AND (
            (q.typ_trvani = 'denni' AND DATE(uq.prideleno_dne) = ?) OR
            (q.typ_trvani = 'tydenni' AND YEARWEEK(uq.prideleno_dne, 1) = YEARWEEK(?, 1)) OR
            (q.typ_trvani = 'mesicni' AND DATE_FORMAT(uq.prideleno_dne, '%Y-%m') = ?)
        )
    ");
    $stmt->execute([$userId, $actionType, $today, $today, $currentMonth]);
    $activeQuests = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($activeQuests as $quest) {
        $newProgres = $quest['progres'] + $amount;
        if ($newProgres >= $quest['cil_pocet']) {
            $pdo->prepare("UPDATE user_quests SET progres = ?, dokonceno = 1 WHERE id = ?")->execute([$quest['cil_pocet'], $quest['id']]);
            $pdo->prepare("UPDATE users SET body = body + ? WHERE user_id = ?")->execute([$quest['odmena'], $userId]);
        } else {
            $pdo->prepare("UPDATE user_quests SET progres = ? WHERE id = ?")->execute([$newProgres, $quest['id']]);
        }
    }
}

try {
    if ($action === 'play_shells') {
        $guess = (int)$_POST['guess'];
        if ($guess < 1 || $guess > 3) {
            echo json_encode(['success' => false, 'message' => 'Neplatný výběr!']); exit;
        }

        $winningCup = rand(1, 3);
        $winAmount = 0;

        if ($guess === $winningCup) {
            $winAmount = 15;
            $pdo->prepare("UPDATE users SET body = body + ? WHERE user_id = ?")->execute([$winAmount, $userId]);
            updateQuest($userId, 'win_points', $winAmount, $pdo);
        }

        $pdo->prepare("INSERT INTO game_history (user_id, game_name, bet, payout) VALUES (?, 'shells', 0, ?)")->execute([$userId, $winAmount]);
        updateQuest($userId, 'play_minigame', 1, $pdo);

        if ($winAmount > 0) {
            echo json_encode(['success' => true, 'is_win' => true, 'winning_cup' => $winningCup, 'message' => "Našel jsi desku! Vyhráváš 15 bodů."]);
        } else {
            echo json_encode(['success' => true, 'is_win' => false, 'winning_cup' => $winningCup, 'message' => "Vedle! Deska byla v bedně č. $winningCup."]);
        }
        exit;
    }

    if ($action === 'start_mines') {
        $bet = (int)$_POST['bet'];
        $mineCount = (int)$_POST['mines'];

        if ($bet <= 0 || $mineCount < 1 || $mineCount > 24) {
            echo json_encode(['success' => false, 'message' => 'Neplatné hodnoty!']); exit;
        }

        $points = $pdo->query("SELECT body FROM users WHERE user_id = $userId")->fetchColumn();
        if ($points < $bet) {
            echo json_encode(['success' => false, 'message' => 'Nemáš dost bodů!']); exit;
        }

        $pdo->prepare("UPDATE users SET body = body - ? WHERE user_id = ?")->execute([$bet, $userId]);

        $grid = array_fill(0, 25, 0);
        for ($i = 0; $i < $mineCount; $i++) { $grid[$i] = 1; }
        shuffle($grid);

        $_SESSION['mines_game'] = [
            'bet' => $bet,
            'mineCount' => $mineCount,
            'grid' => $grid,
            'opened' => [],
            'active' => true
        ];

        updateQuest($userId, 'play_minigame', 1, $pdo);
        echo json_encode(['success' => true, 'message' => 'Hra začala!']); exit;
    }
    
    if ($action === 'click_mine') {
        if (!isset($_SESSION['mines_game']) || !$_SESSION['mines_game']['active']) {
            echo json_encode(['success' => false, 'message' => 'Hra neběží!']); exit;
        }

        $tile = (int)$_POST['tile'];
        $game = &$_SESSION['mines_game'];

        if (in_array($tile, $game['opened'])) {
            echo json_encode(['success' => false, 'message' => 'Už jsi na to klikl!']); exit;
        }

        if ($game['grid'][$tile] === 1) {
            $game['active'] = false;
            $pdo->prepare("INSERT INTO game_history (user_id, game_name, bet, payout) VALUES (?, 'mines', ?, 0)")->execute([$userId, $game['bet']]);
            echo json_encode(['success' => true, 'state' => 'bomb', 'grid' => $game['grid']]); 
            unset($_SESSION['mines_game']);
            exit;
        }

        $game['opened'][] = $tile;
        $safeHits = count($game['opened']);
        
        $multiplier = 1.0;
        for ($i = 0; $i < $safeHits; $i++) {
            $multiplier *= (25 - $i) / (25 - $game['mineCount'] - $i);
        }
        $multiplier *= 0.95; 
        $currentWin = floor($game['bet'] * $multiplier);

        echo json_encode(['success' => true, 'state' => 'safe', 'current_win' => $currentWin, 'multiplier' => number_format($multiplier, 2)]); exit;
    }
    
    if ($action === 'cashout_mines') {
        if (!isset($_SESSION['mines_game']) || !$_SESSION['mines_game']['active']) {
            echo json_encode(['success' => false, 'message' => 'Není co vybrat!']); exit;
        }

        $game = $_SESSION['mines_game'];
        $safeHits = count($game['opened']);
        
        if ($safeHits === 0) {
            echo json_encode(['success' => false, 'message' => 'Musíš otevřít aspoň jedno pole!']); exit;
        }

        $multiplier = 1.0;
        for ($i = 0; $i < $safeHits; $i++) {
            $multiplier *= (25 - $i) / (25 - $game['mineCount'] - $i);
        }
        $multiplier *= 0.95;
        $win = floor($game['bet'] * $multiplier);

        $pdo->prepare("UPDATE users SET body = body + ? WHERE user_id = ?")->execute([$win, $userId]);
        $pdo->prepare("INSERT INTO game_history (user_id, game_name, bet, payout) VALUES (?, 'mines', ?, ?)")->execute([$userId, $game['bet'], $win]);
        
        updateQuest($userId, 'win_points', $win, $pdo);

        $grid = $game['grid'];
        unset($_SESSION['mines_game']);

        echo json_encode(['success' => true, 'win' => $win, 'grid' => $grid]); exit;
    }

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba: ' . $e->getMessage()]);
}
?>