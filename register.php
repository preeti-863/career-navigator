<?php
session_start();
require_once 'db.php';

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $full_name = trim($_POST['fullname']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    $education = $_POST['education'];
    $experience = $_POST['experience'];

    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email format!";
    } else {

        // Check if email already exists
        $check = $conn->prepare("SELECT user_id FROM users WHERE email=?");
        $check->bind_param("s", $email);
        $check->execute();
        $check->store_result();

        if ($check->num_rows > 0) {
            $error = "Email already registered!";
        } else {

            // Hash password
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);

            // Insert user
            $stmt = $conn->prepare("INSERT INTO users (full_name, email, password, education, experience) VALUES (?, ?, ?, ?, ?)");
            $stmt->bind_param("sssss", $full_name, $email, $hashed_password, $education, $experience);

            if ($stmt->execute()) {
                header("Location: login.php?registered=1");
                exit();
            } else {
                $error = "Something went wrong. Try again.";
            }

            $stmt->close();
        }

        $check->close();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register | Career Navigator</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
/* ================= GLOBAL ================= */
body {
    font-family: 'Poppins', sans-serif;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(-45deg, #f4f7fa, #e0f7f5, #e6f0ff, #fdf6e3);
    background-size: 400% 400%;
    animation: gradientMove 15s ease infinite;
    color: #1E293B;
}

@keyframes gradientMove {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* ================= REGISTER CARD ================= */
.register-card {
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(15px);
    border-radius: 25px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.2);
    padding: 50px;
    width: 100%;
    max-width: 500px;
    position: relative;
    overflow: hidden;
    transition: transform 0.4s, box-shadow 0.4s;
}

.register-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 25px 60px rgba(0,0,0,0.3);
}

/* Floating glow circles */
.register-card::before,
.register-card::after {
    content: "";
    position: absolute;
    border-radius: 50%;
    background: rgba(42,169,161,0.2);
    animation: float 8s infinite ease-in-out;
}

.register-card::before {
    width: 200px;
    height: 200px;
    top: -50px;
    left: -50px;
}

.register-card::after {
    width: 300px;
    height: 300px;
    bottom: -100px;
    right: -100px;
}

@keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(20px); }
}

/* ================= HEADER ================= */
.card-header {
    text-align: center;
    margin-bottom: 30px;
}
.card-header h2 {
    font-weight: 700;
    color: #1F3B5B;
    text-shadow: 0 3px 10px rgba(0,0,0,0.2);
}
.card-header p {
    color: #6c757d;
    font-size: 14px;
}

/* ================= FORM ================= */
.form-control, .form-select {
    border-radius: 15px;
    padding: 15px 15px;
    font-size: 14px;
    border: 1px solid rgba(0,0,0,0.1);
    transition: 0.3s;
}

.form-control:focus, .form-select:focus {
    border-color: #2AA9A1;
    box-shadow: 0 0 10px rgba(42,169,161,0.2);
    outline: none;
}

.position-relative { position: relative; }
.form-icon {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 16px;
    color: #6c757d;
}

/* ================= BUTTON ================= */
.btn-register {
    background: linear-gradient(135deg, #2AA9A1, #00c6ff);
    border: none;
    border-radius: 50px;
    padding: 12px;
    font-weight: 600;
    color: white;
    width: 100%;
    font-size: 16px;
    transition: transform 0.3s, box-shadow 0.3s;
}
.btn-register:hover {
    transform: translateY(-4px);
    box-shadow: 0 15px 30px rgba(0,198,255,0.4);
}

/* ================= LINKS ================= */
.back-link {
    text-decoration: none;
    color: #1F3B5B;
    font-weight: 500;
}
.back-link:hover { text-decoration: underline; }

/* ================= ALERT ================= */
.alert {
    margin-bottom: 20px;
    text-align: center;
    border-radius: 15px;
}

/* ================= RESPONSIVE ================= */
@media (max-width: 576px) {
    .register-card {
        padding: 30px 20px;
    }
}
</style>
</head>
<body>

<div class="register-card">
    <div class="card-header">
        <h2>Create Your Account</h2>
        <p>Join Career Navigator and plan your career with AI</p>
    </div>

    <!-- Display error if registration failed -->
    <?php if (!empty($error)): ?>
        <div class="alert alert-danger"><?php echo $error; ?></div>
    <?php endif; ?>

    <form method="POST" action="">
        <div class="mb-3 position-relative">
            <input type="text" name="fullname" class="form-control" placeholder="Full Name" required>
            <span class="form-icon">&#128100;</span>
        </div>

        <div class="mb-3 position-relative">
            <input type="email" name="email" class="form-control" placeholder="Email Address" required>
            <span class="form-icon">&#9993;</span>
        </div>

        <div class="mb-3 position-relative">
            <input type="password" name="password" class="form-control" placeholder="Password" required>
            <span class="form-icon">&#128274;</span>
        </div>

        <div class="mb-3 position-relative">
            <select name="education" class="form-select" required>
                <option value="">Select Education Level</option>
                <option>Diploma</option>
                <option>Graduate</option>
                <option>Postgraduate</option>
            </select>
            <span class="form-icon">&#127891;</span>
        </div>

        <div class="mb-3 position-relative">
            <select name="experience" class="form-select" required>
                <option value="">Select Experience</option>
                <option>No Experience</option>
                <option>1-2 Years</option>
                <option>3-5 Years</option>
                <option>5+ Years</option>
            </select>
            <span class="form-icon">&#128188;</span>
        </div>

        <div class="d-grid mt-4">
            <button type="submit" class="btn btn-register">Register</button>
        </div>
    </form>

    <div class="text-center mt-3">
        <a href="home_page.php" class="back-link">← Back to Home</a>
    </div>
</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>