<?php
// Centrální připojovací údaje z IONOSu pro NeedleSpin
$host = 'db5020657101.hosting-data.io';
$dbname = 'dbs15771817';
$username = 'dbu1233490';
$password = 'SkibidiSigma10@';

try {
    // Vytvoření PDO připojení s nastavením znakové sady utf8mb4
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    
    // Nastavení vyhazování výjimek při chybách v SQL
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Nastavení výchozího režimu získávání dat na asociativní pole
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    // Pokud se připojení nezdaří, skript se zastaví a vypíše chybu
    die("Chyba připojení k databázi: " . $e->getMessage());
}
?>