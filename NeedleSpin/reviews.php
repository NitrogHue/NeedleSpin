<?php
session_start();

// PŘIPOJENÍ K IONOS DATABÁZI
$host = 'db5020657101.hosting-data.io';
$dbname = 'dbs15771817';
$username = 'dbu1233490';
$password = 'SkibidiSigma10@';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // SQL dotaz sjednocený na tvé tabulky a sloupce (uzivatelskeJmeno, nazev, tracks)
    $sql = "SELECT 
                r.hodnoceni, 
                r.komentar, 
                r.hodnoceni_Datum, 
                u.uzivatelskeJmeno AS uzivatel, 
                a.nazev AS nazev_alba,
                s.nazev AS nazev_songu
            FROM ratings r
            JOIN users u ON r.Users_user_id = u.user_id
            LEFT JOIN albums a ON r.Albums_album_id = a.album_id
            LEFT JOIN tracks s ON r.Songs_song_id = s.Track_id
            ORDER BY r.hodnoceni_Datum DESC";
            
    $stmt = $pdo->query($sql);
    $reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch(PDOException $e) {
    die("Chyba databáze: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Přehled hodnocení</title>
    <style>
        body { font-family: sans-serif; background: #1a1a1a; color: #fff; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: #2a2a2a; }
        th, td { padding: 12px; border: 1px solid #444; text-align: left; }
        th { background-color: #333; }
        .star { color: gold; }
        .type-tag { font-size: 0.8em; padding: 2px 6px; border-radius: 4px; margin-right: 5px; }
        .tag-album { background: #007bff; }
        .tag-song { background: #28a745; }
    </style>
</head>
<body>

    <h1>Poslední hodnocení</h1>

    <?php if (count($reviews) > 0): ?>
        <table>
            <thead>
                <tr>
                    <th>Co bylo hodnoceno</th>
                    <th>Uživatel</th>
                    <th>Hodnocení</th>
                    <th>Komentář</th>
                    <th>Datum</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($reviews as $review): ?>
                    <tr>
                        <td>
                            <?php if (!empty($review['nazev_songu'])): ?>
                                <span class="type-tag tag-song">Song</span> 
                                <?= htmlspecialchars($review['nazev_songu']) ?>
                            <?php else: ?>
                                <span class="type-tag tag-album">Album</span>
                                <?= htmlspecialchars($review['nazev_alba']) ?>
                            <?php endif; ?>
                        </td>
                        <td><?= htmlspecialchars($review['uzivatel']) ?></td>
                        <td>
                            <?= htmlspecialchars($review['hodnoceni']) ?>/5 <span class="star">★</span>
                        </td>
                        <td><?= htmlspecialchars($review['komentar'] ?? '') ?></td>
                        <td><?= date('d.m.Y H:i', strtotime($review['hodnoceni_Datum'])) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>Zatím zde nejsou žádná hodnocení.</p>
    <?php endif; ?>

</body>
</html>