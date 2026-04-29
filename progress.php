<?php
session_start();
include '../config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$full_name = $_SESSION['full_name'];

/* ============================
   Fetch Progress Data
============================ */
$progress_query = $conn->query("SELECT * FROM user_progress WHERE user_id = $user_id");
$progress = $progress_query->fetch_assoc();

/* Safety defaults */
$profile_completed = $progress['profile_completed'] ?? 0;
$skills_added = $progress['skills_added'] ?? 0;
$career_selected = 0;
$progress_score = $progress['progress_score'] ?? 0;

/* Check if user selected career */
$career_check = $conn->query("SELECT * FROM user_career WHERE user_id = $user_id");
if($career_check->num_rows > 0){
    $career_selected = 1;
    $selected_career = $career_check->fetch_assoc();
    $career_name = $conn->query("SELECT career_name FROM careers WHERE career_id=".$selected_career['career_id'])->fetch_assoc()['career_name'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Progress - Career Navigator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
    :root {
        --primary: #2AA9A1;
        --dark-blue: #1F3B5B;
        --accent: #E3B23C;
        --soft-bg: #F8FAFC;
    }

    body { font-family: 'Poppins', sans-serif; background: var(--soft-bg); }

    .sidebar {
        width: 260px;
        height: 100vh;
        background: var(--dark-blue);
        position: fixed;
        padding: 30px 20px;
        color: white;
    }
    .sidebar h4 { font-weight: 600; margin-bottom: 40px; }
    .sidebar a { display: block; color: #cbd5e1; text-decoration: none; padding: 12px 15px; border-radius: 8px; margin-bottom: 8px; font-weight: 500; }
    .sidebar a:hover, .sidebar a.active { background: var(--primary); color: white; }

    .main { margin-left: 260px; padding: 40px; }

    .topbar { background: white; padding: 20px 30px; border-radius: 15px; margin-bottom: 40px; box-shadow: 0 8px 25px rgba(0,0,0,0.04); }

    .card-custom {
        border: none;
        border-radius: 18px;
        padding: 30px;
        box-shadow: 0 10px 35px rgba(0,0,0,0.05);
        transition: 0.3s ease;
        background: white;
    }
    .card-custom:hover { transform: translateY(-6px); box-shadow: 0 15px 40px rgba(0,0,0,0.08); }

    .stat-box {
        width: 55px; height: 55px; border-radius: 15px; display: flex; align-items: center; justify-content: center; font-weight: bold; color: white;
    }
    .bg-primary-soft { background: var(--primary); }
    .bg-accent-soft { background: var(--accent); }
    .bg-dark-soft { background: var(--dark-blue); }

    .progress { height: 12px; border-radius: 50px; }
    .progress-bar { background: var(--primary); }

    .section-title { font-weight: 600; margin-bottom: 25px; }

    @media(max-width:768px){
        .sidebar { display:none; }
        .main { margin-left:0; padding:20px; }
    }

    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4>Career Navigator</h4>
    <a href="dashboard.php">Dashboard</a>
    <a href="profile.php">Profile</a>
    <a href="skills.php">Skills</a>
    <a href="careers.php">Careers</a>
    <a href="progress.php" class="active">Progress</a>
    <a href="recommendation.php">AI Recommendation</a>
    <a href="resume.php">Resume Analyzer</a>
    <a href="../logout.php" class="mt-4 text-warning">Logout</a>
</div>

<!-- Main -->
<div class="main">

    <!-- Topbar -->
    <div class="topbar d-flex justify-content-between align-items-center">
        <div>
            <h5 class="mb-1">Hello, <?= htmlspecialchars($full_name); ?> 👋</h5>
            <small class="text-muted">Here’s your current career progress</small>
        </div>
        <div class="text-muted"><?= date("l, d M Y"); ?></div>
    </div>

    <!-- Progress Stats -->
    <div class="row g-4 mb-5">

        <div class="col-md-3">
            <div class="card card-custom text-center">
                <div class="stat-box bg-primary-soft mb-3">👤</div>
                <p class="text-muted mb-1">Profile Completed</p>
                <h5 class="fw-semibold"><?= $profile_completed ? "Yes" : "No"; ?></h5>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card card-custom text-center">
                <div class="stat-box bg-accent-soft mb-3">🛠</div>
                <p class="text-muted mb-1">Skills Added</p>
                <h5 class="fw-semibold"><?= $skills_added ? "Yes" : "No"; ?></h5>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card card-custom text-center">
                <div class="stat-box bg-dark-soft mb-3">🎯</div>
                <p class="text-muted mb-1">Target Career</p>
                <h5 class="fw-semibold"><?= $career_selected ? $career_name : "Not Selected"; ?></h5>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card card-custom text-center">
                <div class="stat-box bg-primary-soft mb-3">📊</div>
                <p class="text-muted mb-1">Career Readiness</p>
                <h5 class="fw-semibold"><?= $progress_score; ?>%</h5>
                <div class="progress mt-2">
                    <div class="progress-bar" style="width: <?= $progress_score; ?>%;"></div>
                </div>
            </div>
        </div>

    </div>

    <!-- Growth Tools -->
    <?php if($profile_completed && $skills_added && $career_selected){ ?>
        <h5 class="section-title">Recommended Growth Tools</h5>
        <div class="row g-4">
            <div class="col-md-6">
                <div class="card card-custom">
                    <h5 class="fw-semibold mb-3">AI Career Recommendation</h5>
                    <p class="text-muted mb-4">Get AI-powered suggestions tailored to your profile and skills.</p>
                    <a href="recommendation.php" class="btn btn-primary w-100">Explore Recommendations</a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-custom">
                    <h5 class="fw-semibold mb-3">Resume Analyzer</h5>
                    <p class="text-muted mb-4">Upload your resume and receive actionable insights.</p>
                    <a href="resume.php" class="btn btn-primary w-100">Analyze Resume</a>
                </div>
            </div>
        </div>
    <?php } ?>

</div>

<script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
