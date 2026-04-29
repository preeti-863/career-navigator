<?php
session_start();
require_once 'db.php'; // your DB connection
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

$success = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Please enter a valid email address.";
    } else {
        // Check if user exists
        $stmt = $conn->prepare("SELECT user_id, full_name FROM users WHERE email=?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $user = $result->fetch_assoc();
            $user_id = $user['user_id'];
            $full_name = $user['full_name'];

            // Generate token
            $token = bin2hex(random_bytes(50));
            $expires_at = date("Y-m-d H:i:s", strtotime("+1 hour"));

            // Insert token in password_resets table
            $stmt2 = $conn->prepare("INSERT INTO password_resets (user_id, token, expires_at) VALUES (?, ?, ?)");
            $stmt2->bind_param("iss", $user_id, $token, $expires_at);
            $stmt2->execute();
            $stmt2->close();

            // Reset link
            $reset_link = "http://yourdomain.com/reset_password.php?token=$token";

            // Send email via PHPMailer
            $mail = new PHPMailer(true);
            try {
                $mail->isSMTP();
                $mail->Host       = 'smtp.gmail.com';   // use your SMTP
                $mail->SMTPAuth   = true;
                $mail->Username   = 'yourgmail@gmail.com'; // your email
                $mail->Password   = 'your_app_password';   // Gmail app password
                $mail->SMTPSecure = 'tls';
                $mail->Port       = 587;

                $mail->setFrom('yourgmail@gmail.com', 'Career Navigator');
                $mail->addAddress($email, $full_name);

                $mail->isHTML(true);
                $mail->Subject = 'Password Reset Request';
                $mail->Body    = "
                    <p>Hi $full_name,</p>
                    <p>Click the link below to reset your password (valid for 1 hour):</p>
                    <p><a href='$reset_link'>$reset_link</a></p>
                    <p>If you did not request this, ignore this email.</p>
                ";

                $mail->send();
                $success = "A password reset link has been sent to your email.";

            } catch (Exception $e) {
                $error = "Mailer Error: " . $mail->ErrorInfo;
            }

        } else {
            $error = "No account found with that email.";
        }
        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Forgot Password | Career Navigator</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<style>
body {
    font-family: 'Poppins', sans-serif;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgba(255,255,255,0.85);
}
.login-card {
    background: rgba(255,255,255,0.85);
    backdrop-filter: blur(15px);
    border-radius: 25px;
    box-shadow: 0 25px 60px rgba(0,0,0,0.2);
    padding: 50px;
    width: 100%;
    max-width: 450px;
    position: relative;
}
</style>
</head>
<body>

<div class="login-card">
    <h2 class="text-center mb-3">Forgot Password</h2>
    <p class="text-center text-muted mb-4">Enter your email to receive reset instructions.</p>

    <?php if($success): ?>
        <div class="alert alert-success"><?php echo $success; ?></div>
    <?php endif; ?>
    <?php if($error): ?>
        <div class="alert alert-danger"><?php echo $error; ?></div>
    <?php endif; ?>

    <form method="POST" action="">
        <input type="email" name="email" class="form-control mb-3" placeholder="Email Address" required>
        <button type="submit" class="btn btn-primary w-100">Send Reset Link</button>
    </form>

    <div class="text-center mt-3">
        <a href="login.php">Back to Login</a>
    </div>
</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>