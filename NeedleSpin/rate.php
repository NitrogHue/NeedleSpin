<?php
session_start();
header('Content-Type: application/json');

// KONTROLA PŘIHLÁŠENÍ
if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['success' => false, 'message' => 'Pro hlasování musíte být přihlášen.']);
    exit;
}

$currentUserId = $_SESSION['user_id'];

$host = 'localhost';
$dbname = 'needlespin';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'DB Error: ' . $e->getMessage()]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $input = json_decode(file_get_contents('php://input'), true);

    $albumId = $input['album_id'] ?? null; 
    $songId  = $input['song_id'] ?? null;
    $rating  = $input['rating'] ?? null;
    $comment = $input['comment'] ?? ''; 
    
    $metaTitle  = $input['meta_title'] ?? 'Unknown Album';
    $metaArtist = $input['meta_artist'] ?? 'Unknown Artist';
    $metaCover  = $input['meta_cover'] ?? '';
    $metaYear   = $input['meta_year'] ?? null;

    if (!$rating || !$albumId) {
        echo json_encode(['success' => false, 'message' => 'Chybí data (ID alba nebo hodnocení).']);
        exit;
    }

    try {
        $pdo->beginTransaction();
        $stmtArt = $pdo->prepare("SELECT Artist_id FROM artists WHERE jmeno = ?");
        $stmtArt->execute([$metaArtist]);
        $artistId = $stmtArt->fetchColumn();

        if (!$artistId) {
            $stmtInsArt = $pdo->prepare("INSERT INTO artists (jmeno) VALUES (?)");
            $stmtInsArt->execute([$metaArtist]);
            $artistId = $pdo->lastInsertId();
        }

        $stmtAlb = $pdo->prepare("SELECT album_id FROM albums WHERE album_id = ?");
        $stmtAlb->execute([$albumId]);
        
        if (!$stmtAlb->fetch()) {
            $sqlInsAlb = "INSERT INTO albums (album_id, nazev, rok_vydani, cover_url, Artists_Artist_id) 
                          VALUES (?, ?, ?, ?, ?)";
            $stmtInsAlb = $pdo->prepare($sqlInsAlb);
            $stmtInsAlb->execute([
                $albumId, 
                $metaTitle, 
                $metaYear, 
                $metaCover, 
                $artistId
            ]);
        }

        $sqlRating = "INSERT INTO ratings (hodnoceni, komentar, hodnoceni_Datum, Users_user_id, Albums_album_id, Songs_song_id) 
                      VALUES (:hodnoceni, :komentar, NOW(), :user_id, :album_id, :song_id)";
        
        $stmtRating = $pdo->prepare($sqlRating);
        $stmtRating->execute([
            ':hodnoceni' => $rating,
            ':komentar'  => $comment,
            ':user_id'   => $currentUserId,
            ':album_id'  => $albumId,
            ':song_id'   => $songId
        ]);

        $sqlPoints = "UPDATE users SET body = body + 10 WHERE user_id = :user_id";
        $stmtPoints = $pdo->prepare($sqlPoints);
        $stmtPoints->execute([':user_id' => $currentUserId]);

        $pdo->commit();

        $typ = $songId ? "Písnička" : "Album";
        echo json_encode(['success' => true, 'message' => "$typ ohodnocen/a (+10 bodů)!"]);

    } catch (PDOException $e) {
        $pdo->rollBack();
        echo json_encode(['success' => false, 'message' => 'SQL Chyba: ' . $e->getMessage()]);
    }

} else {
    echo json_encode(['success' => false, 'message' => 'Pouze POST request.']);
}
?>