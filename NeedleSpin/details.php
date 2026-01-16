<?php

header('Content-Type: application/json');

ini_set('display_errors', 0); 
error_reporting(E_ALL);

if (!isset($_GET['id'])) {
    echo json_encode(['error' => 'Chybí ID alba']);
    exit;
}

$id = $_GET['id'];
$apiToken = "vBKumlLqKmZWKMQgXXJCvAlKGCzxDHslVygvenxD"; 
$userAgent = "MujHudebniStoreApp/1.0";


function callDiscogs($url, $userAgent) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($ch, CURLOPT_USERAGENT, $userAgent);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    
    $output = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    
    
    return ['code' => $httpCode, 'data' => $output];
}


$urlMaster = "https://api.discogs.com/masters/{$id}?token={$apiToken}";
$result = callDiscogs($urlMaster, $userAgent);

if ($result['code'] === 200) {
    echo $result['data'];
} else {
 
    $urlRelease = "https://api.discogs.com/releases/{$id}?token={$apiToken}";
    $resultRelease = callDiscogs($urlRelease, $userAgent);
    
    if ($resultRelease['code'] === 200) {
        echo $resultRelease['data'];
    } else {

        echo json_encode([
            'error' => 'Album nebylo nalezeno (ani jako Master, ani jako Release).',
            'details' => json_decode($result['data'])
        ]);
    }
}
?>