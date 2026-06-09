<?php
session_start();
ini_set('display_errors', 1);
error_reporting(E_ALL);
header('Content-Type: application/json');

try {
    require_once 'db.php';
    
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    if (empty($username) || empty($password)) {
        echo json_encode(['success' => false, 'message' => 'Vyplň username a heslo!']);
        exit;
    }

    $stmt = $pdo->prepare("SELECT user_id, uzivatelskeJmeno, Heslo_hash, email, body FROM users WHERE uzivatelskeJmeno = ?");
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($user && password_verify($password, $user['Heslo_hash'])) {
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['username'] = $user['uzivatelskeJmeno'];
        $_SESSION['email'] = $user['email'];
        $_SESSION['points'] = $user['body'];
        
        echo json_encode([
            'success' => true, 
            'message' => 'Přihlášení úspěšné!',
            'user' => [
            'username' => $user['uzivatelskeJmeno'],
            'points' => $user['body']
            ]
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Špatné uživatelské jméno nebo heslo!']);
    }
    
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba: ' . $e->getMessage()]);
}
?>