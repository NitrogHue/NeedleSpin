<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
header('Content-Type: application/json');

try {
    require_once 'db.php';
    
    $email = $_POST['email'] ?? '';
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    
    if (empty($email) || empty($username) || empty($password)) {
        echo json_encode(['success' => false, 'message' => 'Všechna pole musí být vyplněna!']);
        exit;
    }
    if (strlen($password) < 8) {
        echo json_encode(['success' => false, 'message' => 'Heslo musí mít alespoň 8 znaků!']);
        exit;
    }
    if (!preg_match('/[A-Z]/', $password)) {
        echo json_encode(['success' => false, 'message' => 'Heslo musí obsahovat alespoň jedno velké písmeno!']);
        exit;
    }
    if (!preg_match('/[0-9]/', $password)) {
        echo json_encode(['success' => false, 'message' => 'Heslo musí obsahovat alespoň jednu číslici!']);
        exit;
    }
    if (!preg_match('/[^A-Za-z0-9]/', $password)) {
        echo json_encode(['success' => false, 'message' => 'Heslo musí obsahovat alespoň jeden speciální znak (např. !, ?, @, #, atd.)!']);
        exit;
    }
    
    $stmt = $pdo->prepare("SELECT user_id FROM users WHERE uzivatelskeJmeno = ?");
    $stmt->execute([$username]);
    if ($stmt->fetch()) {
        echo json_encode(['success' => false, 'message' => 'Uživatelské jméno už existuje!']);
        exit;
    }

    $stmt = $pdo->prepare("SELECT user_id FROM users WHERE email = ?");
    $stmt->execute([$email]);
    if ($stmt->fetch()) {
        echo json_encode(['success' => false, 'message' => 'Email už je registrovaný!']);
        exit;
    }

    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    
    $currentTime = date('Y-m-d H:i:s');
    
    $stmt = $pdo->prepare("INSERT INTO users (uzivatelskeJmeno, email, Heslo_hash, body, ucet_vytvoren) VALUES (?, ?, ?, 0, ?)");
    $stmt->execute([$username, $email, $hashedPassword, $currentTime]);
    
    echo json_encode(['success' => true, 'message' => 'Registrace úspěšná!']);
    
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba: ' . $e->getMessage()]);
}
?>