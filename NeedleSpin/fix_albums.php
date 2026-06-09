<?php
// ============================================================
// fix_albums.php — Automatická oprava "Unknown Album" v DB
// Nahraj na server, otevři v prohlížeči, pak smaž.
// ============================================================

$host = 'db5020657101.hosting-data.io';
$db   = 'dbs15771817';
$user = 'dbu1233490';
$pass = 'SkibidiSigma10@';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    die("DB chyba: " . $e->getMessage());
}

// Najdi všechna alba bez coveru nebo s Unknown Album
$stmt = $pdo->query("
    SELECT album_id FROM albums
    WHERE (cover_url = '' OR cover_url IS NULL OR nazev = 'Unknown Album')
");
$albums = $stmt->fetchAll(PDO::FETCH_COLUMN);

if (empty($albums)) {
    echo "<p style='color:green'>✅ Žádná alba k opravě!</p>";
    exit;
}

echo "<h2>Opravuji " . count($albums) . " alb...</h2><ul>";
flush();

foreach ($albums as $album_id) {
    // Discogs API — album_id je přímo Discogs Release ID
    $url = "https://api.discogs.com/releases/{$album_id}";
    
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_USERAGENT, 'NeedleSpin/1.0 +https://needlespin.cz');
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200 || !$response) {
        echo "<li style='color:red'>❌ album_id <b>{$album_id}</b> — Discogs API chyba (HTTP {$httpCode})</li>";
        continue;
    }

    $data = json_decode($response, true);

    $nazev     = $data['title'] ?? null;
    $cover_url = $data['images'][0]['uri'] ?? ($data['thumb'] ?? null);
    $rok       = isset($data['year']) && $data['year'] > 0 ? $data['year'] : null;

    if (!$nazev && !$cover_url) {
        echo "<li style='color:orange'>⚠ album_id <b>{$album_id}</b> — Discogs nevrátil žádná data</li>";
        continue;
    }

    // Update DB
    $fields = [];
    $values = [];

    if ($nazev) {
        $fields[] = 'nazev = ?';
        $values[] = $nazev;
    }
    if ($cover_url) {
        $fields[] = 'cover_url = ?';
        $values[] = $cover_url;
    }
    if ($rok) {
        $fields[] = 'rok_vydani = ?';
        $values[] = $rok;
    }

    $values[] = $album_id;
    $upd = $pdo->prepare("UPDATE albums SET " . implode(', ', $fields) . " WHERE album_id = ?");
    $upd->execute($values);

    echo "<li style='color:green'>✅ album_id <b>{$album_id}</b> — opraveno: <b>" . htmlspecialchars($nazev ?? '?') . "</b>";
    if ($cover_url) {
        echo " <img src='" . htmlspecialchars($cover_url) . "' style='width:40px;height:40px;object-fit:cover;border-radius:4px;vertical-align:middle;margin-left:8px'>";
    }
    echo "</li>";
    flush();

    // Pauza aby Discogs neblokoval (max 60 req/min)
    usleep(200000); // 0.2s
}

echo "</ul><p style='color:green'><b>✅ Hotovo!</b> Teď tento soubor smaž ze serveru.</p>";
?>