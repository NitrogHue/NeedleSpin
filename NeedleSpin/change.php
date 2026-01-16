<?php
session_start();
header('Content-Type: application/json');

try {
    require_once 'db.php';
    
    if (!isset($_SESSION['user_id'])) {
        echo json_encode(['success' => false, 'message' => 'Nejsi přihlášený!']);
        exit;
    }
    
    $userId = $_SESSION['user_id'];
    $action = $_POST['action'] ?? '';
    
    if ($action === 'change_username') {
        $newUsername = $_POST['new_username'] ?? '';
        $password = $_POST['password'] ?? '';
        
        if (empty($newUsername) || empty($password)) {
            echo json_encode(['success' => false, 'message' => 'Vyplň všechna pole!']);
            exit;
        }
        
        // Ověř heslo
        $stmt = $pdo->prepare("SELECT Heslo_hash FROM users WHERE user_id = ?");
        $stmt->execute([$userId]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$user || !password_verify($password, $user['Heslo_hash'])) {
            echo json_encode(['success' => false, 'message' => 'Špatné heslo!']);
            exit;
        }

        $stmt = $pdo->prepare("SELECT user_id FROM users WHERE uzivatelskeJmeno = ? AND user_id != ?");
        $stmt->execute([$newUsername, $userId]);
        if ($stmt->fetch()) {
            echo json_encode(['success' => false, 'message' => 'Toto uživatelské jméno už někdo používá!']);
            exit;
        }
 
        $stmt = $pdo->prepare("UPDATE users SET uzivatelskeJmeno = ? WHERE user_id = ?");
        $stmt->execute([$newUsername, $userId]);
        
        $_SESSION['username'] = $newUsername;
        
        echo json_encode(['success' => true, 'message' => 'Username úspěšně změněn!']);
        exit;
    }

    if ($action === 'change_password') {
        $oldPassword = $_POST['old_password'] ?? '';
        $newPassword = $_POST['new_password'] ?? '';
        
        if (empty($oldPassword) || empty($newPassword)) {
            echo json_encode(['success' => false, 'message' => 'Vyplň všechna pole!']);
            exit;
        }
  
        $stmt = $pdo->prepare("SELECT Heslo_hash FROM users WHERE user_id = ?");
        $stmt->execute([$userId]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$user || !password_verify($oldPassword, $user['Heslo_hash'])) {
            echo json_encode(['success' => false, 'message' => 'Špatné staré heslo!']);
            exit;
        }
 
        $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
        $stmt = $pdo->prepare("UPDATE users SET Heslo_hash = ? WHERE user_id = ?");
        $stmt->execute([$hashedPassword, $userId]);
        
        echo json_encode(['success' => true, 'message' => 'Heslo úspěšně změněno!']);
        exit;
    }
    
} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => 'Chyba: ' . $e->getMessage()]);
}
?>