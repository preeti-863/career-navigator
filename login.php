<?php
session_set_cookie_params([
    'lifetime' => 0,
    'path' => '/',
    'httponly' => true
]);
session_start();
require_once 'db.php';

$error = "";
$registered = isset($_GET['registered']);
$logout = isset($_GET['logout']);

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $email = trim($_POST['email']);
    $password = $_POST['password'];

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email or password!";
    } else {

        $sql = "SELECT user_id, full_name, password FROM users WHERE email=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s",$email);
        $stmt->execute();
        $result = $stmt->get_result();

        if($result->num_rows === 1){

            $user = $result->fetch_assoc();

            if(password_verify($password,$user['password'])){

                session_regenerate_id(true);

                $_SESSION['user_id'] = $user['user_id'];
                $_SESSION['full_name'] = $user['full_name'];

                // --- ✅ Check if user already completed all assessment phases
                $user_id = $user['user_id'];
                $max_questions = 10;

                $phase1_count = (int) mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM user_answers WHERE user_id='$user_id' AND phase=1"))[0];
                $phase2_count = (int) mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM user_answers WHERE user_id='$user_id' AND phase=2"))[0];
                $phase3_count = (int) mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM user_answers WHERE user_id='$user_id' AND phase=3"))[0];

                if($phase1_count >= $max_questions && $phase2_count >= $max_questions && $phase3_count >= $max_questions){
                    // Already completed → redirect to dashboard
                    header("Location: /career_navigator/user/dashboard.php");
                    exit();
                }

                // --- Check if user profile exists, else redirect to user_details
                $profile_query = mysqli_query($conn, "SELECT target_career FROM user_profile WHERE user_id='$user_id'");
                if(mysqli_num_rows($profile_query) == 0){
                    header("Location: /career_navigator/user/user_details.php");
                    exit();
                }

                // --- Otherwise, redirect to assessment phase 1
                header("Location: /career_navigator/user/assessment.php?start=1");
                exit();
            }
        }

        $error = "Invalid email or password!";
        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Login | Career Navigator</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

/* GLOBAL */

body{
margin:0;
font-family:'Poppins',sans-serif;

background:linear-gradient(-45deg,#f4f7fa,#e0f7f5,#e6f0ff,#fdf6e3);
background-size:400% 400%;
animation:gradientMove 15s ease infinite;
}

/* WRAPPER */

.login-wrapper{
display:flex;
min-height:100vh;
}


/* LEFT SIDE */

.login-image{
flex:1;
display:flex;
align-items:center;
justify-content:flex-end;
padding-right:40px;
padding-bottom:60px;
}

/* IMAGE */

.login-illustration{
width:105%;
height:auto;
opacity:0.75; /* fade effect */
}

/* IMAGE */

.login-image img{
max-width:95%;
height:auto;
}

/* TEXT */

.login-image h2{
margin-top:25px;
font-weight:700;
color:#1F3B5B;
}

.login-image p{
color:#6c757d;
}

/* RIGHT SIDE */

.login-form-container{
flex:1;
display:flex;
align-items:center;
justify-content:flex-start;
padding-left:40px;
}

/* GRADIENT ANIMATION */

@keyframes gradientMove{

0%{background-position:0% 50%;}
50%{background-position:100% 50%;}
100%{background-position:0% 50%;}

}

/* LOGIN CARD */

.login-card{

background:rgba(255,255,255,0.9);
backdrop-filter:blur(12px);

border-radius:20px;

padding:45px;

width:100%;
max-width:420px;

box-shadow:0 25px 60px rgba(0,0,0,0.15);

position:relative;   /* IMPORTANT */
overflow:hidden;     /* keeps circles inside */

}
/* Floating glow circles */

.login-card::before,
.login-card::after{

content:"";
position:absolute;

border-radius:50%;

background:rgba(42,169,161,0.15);

animation:float 8s infinite ease-in-out;

}

/* top circle */

.login-card::before{

width:150px;
height:150px;

top:-50px;
left:-50px;

}

/* bottom circle */

.login-card::after{

width:250px;
height:250px;

bottom:-100px;
right:-100px;

}

/* animation */

@keyframes float{

0%,100%{
transform:translateY(0);
}

50%{
transform:translateY(20px);
}

}

/* HEADER */

.card-header{
text-align:center;
margin-bottom:25px;
}

.card-header h2{
font-weight:700;
color:#1F3B5B;
}

.card-header p{
color:#6c757d;
font-size:14px;
}

/* INPUT */

.form-control{

border-radius:14px;
padding:14px;
border:1px solid rgba(0,0,0,0.1);

}

.form-control:focus{

border-color:#2AA9A1;
box-shadow:0 0 8px rgba(42,169,161,0.3);

}

/* LOGIN BUTTON */

.btn-login{

background:linear-gradient(135deg,#2AA9A1,#00c6ff);
border:none;
border-radius:50px;
padding:12px;
font-weight:600;
color:white;
transition:0.3s;

}

.btn-login:hover{

transform:translateY(-3px);
box-shadow:0 10px 25px rgba(0,198,255,0.4);

}

/* LINKS */

.back-link{
text-decoration:none;
color:#1F3B5B;
font-weight:500;
}

.back-link:hover{
text-decoration:underline;
}

.forgot-link{

font-size:13px;
text-decoration:none;
color:#2AA9A1;

}

.forgot-link:hover{
text-decoration:underline;
}

/* ALERT */

.alert{
border-radius:12px;
font-size:14px;
}

/* RESPONSIVE */

@media(max-width:992px){

.login-wrapper{
flex-direction:column;
}

.login-image{
padding:40px;
}

.login-image img{
max-width:70%;
}

}

</style>

</head>

<body>

<div class="login-wrapper">

<!-- LEFT PANEL -->

<div class="login-image">

    <img src="images/login_page.png" 
         alt="Career Growth Illustration" 
         class="login-illustration">

</div>


<!-- RIGHT PANEL -->

<div class="login-form-container">

<div class="login-card">

<div class="card-header">

<h2>Welcome Back</h2>

<p>Login to your Career Navigator account</p>

</div>


<?php if($registered): ?>

<div class="alert alert-success alert-dismissible fade show">

🎉 Registration successful! Please login.

<button type="button" class="btn-close" data-bs-dismiss="alert"></button>

</div>

<?php endif; ?>


<?php if($logout): ?>

<div class="alert alert-info alert-dismissible fade show">

✅ You have been logged out successfully.

<button type="button" class="btn-close" data-bs-dismiss="alert"></button>

</div>

<?php endif; ?>


<?php if(!empty($error)): ?>

<div class="alert alert-danger alert-dismissible fade show">

<?php echo $error; ?>

<button type="button" class="btn-close" data-bs-dismiss="alert"></button>

</div>

<?php endif; ?>


<form method="POST">


<div class="mb-3">

<input type="email"
name="email"
class="form-control"
placeholder="Email Address"
required>

</div>


<div class="mb-2">

<input type="password"
name="password"
class="form-control"
placeholder="Password"
required>

</div>


<div class="text-end mb-3">

<a href="forgot_password.php" class="forgot-link">

Forgot Password?

</a>

</div>


<div class="d-grid">

<button type="submit" class="btn btn-login">

Login

</button>

</div>

</form>


<div class="text-center mt-4">

<a href="register.php" class="back-link">

Don't have an account? Register

</a>

</div>


</div>

</div>

</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>