<?php
header('Content-Type: application/json');

$apiToken = "vBKumlLqKmZWKMQgXXJCvAlKGCzxDHslVygvenxD"; 
$userAgent = "MujHudebniStoreApp/1.0";
$q = isset($_GET['q']) ? $_GET['q'] : '';
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$queryParams = [
    'type' => 'master',
    'per_page' => 12,     
    'page' => $page,      
    'token' => $apiToken
];

if (empty($q)) {
    $queryParams['genre'] = 'Rock';
    $queryParams['sort'] = 'want';
    $queryParams['sort_order'] = 'desc';
} else {
    $queryParams['q'] = $q;
}

$queryString = http_build_query($queryParams);
$url = "https://api.discogs.com/database/search?" . $queryString;

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_USERAGENT, $userAgent);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

$output = curl_exec($ch);

if ($output === false) {
    echo json_encode(['error' => curl_error($ch)]);
} else {
    echo $output;
}