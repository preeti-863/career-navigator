<?php
session_start();
require_once 'db.php';

$token = $_GET['token'] ?? '';
$error = '';
$success = '';

if (!$token) {
    die("Invalid password reset link.");
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $password = $_POST['password'];
    $confirm = $_POST['confirm'];

    if ($password !== $confirm) {
        $error = "Passwords do not match!";
    } else {
        // Verify token
        $stmt = $conn->prepare("SELECT user_id, expires_at FROM password_resets WHERE token=?");
        $stmt->bind_param("s", $token);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $row = $result->fetch_assoc();
            if (strtotime($row['expires_at']) < time()) {
                $error = "This reset link has expired.";
            } else {
                $user_id = $row['user_id'];
                $hashed = password_hash($password, PASSWORD_DEFAULT);

                // Update password
                $stmt2 = $conn->prepare("UPDATE users SET password=? WHERE user_id=?");
                $stmt2->bind_param("si", $hashed, $user_id);
                $stmt2->execute();
                $stmt2->close();

                // Delete used token
                $stmt3 = $conn->prepare("DELETE FROM password_resets WHERE token=?");
                $stmt3->bind_param("s", $token);
                $stmt3->execute();
                $stmt3->close();

                $success = "Password reset successfully. <a href='login.php'>Login now</a>";
            }
        } else {
            $error = "Invalid token.";
        }
        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Reset Password | Career Navigator</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<style>
body {font-family:'Poppins',sans-serif; min-height:100vh; display:flex; justify-content:center; align-items:center; background: rgba(255,255,255,0.85);}
.login-card {background: rgba(255,255,255,0.85); backdrop-filter: blur(15px); border-radius:25px; box-shadow:0 25px 60px rgba(0,0,0,0.2); padding:50px; width:100%; max-width:450px;}
</style>
</head>
<body>

<div class="login-card">
    <h2 class="text-center mb-3">Reset Password</h2>

    <?php if($success): ?>
        <div class="alert alert-success"><?php echo $success; ?></div>
    <?php endif; ?>
    <?php if($error): ?>
        <div class="alert alert-danger"><?php echo $error; ?></div>
    <?php endif; ?>

    <?php if(!$success): ?>
    <form method="POST">
        <input type="password" name="password" class="form-control mb-3" placeholder="New Password" required>
        <input type="password" name="confirm" class="form-control mb-3" placeholder="Confirm Password" required>
        <button type="submit" class="btn btn-primary w-100">Reset Password</button>
    </form>
    <?php endif; ?>

</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>