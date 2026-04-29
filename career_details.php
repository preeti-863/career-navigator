<?php
session_start();
include '../config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$user_id = (int)$_SESSION['user_id'];

// Check if career_id is set
if (!isset($_GET['id'])) {
    header("Location: careers.php");
    exit();
}

$career_id = (int)$_GET['id'];

// Fetch career details
$sql = "SELECT * FROM careers WHERE career_id = $career_id";
$result = $conn->query($sql);
if ($result->num_rows == 0) {
    header("Location: careers.php");
    exit();
}
$career = $result->fetch_assoc();

// Handle career selection
if(isset($_POST['select_career'])) {
    // Remove old selection
    $conn->query("DELETE FROM user_career WHERE user_id=$user_id");
    // Insert new selection
    $conn->query("INSERT INTO user_career (user_id, career_id) VALUES ($user_id, $career_id)");
    // Update progress_score
    $progress = $conn->query("SELECT progress_score FROM user_progress WHERE user_id=$user_id");
    if($progress->num_rows>0){
        $row = $progress->fetch_assoc();
        $new_score = min(100, $row['progress_score'] + 20);
        $conn->query("UPDATE user_progress SET progress_score=$new_score, updated_at=NOW() WHERE user_id=$user_id");
    }
    header("Location: dashboard.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title><?= $career['career_name']; ?> - Career Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
:root {
    --primary:#2AA9A1;
    --soft-bg:#F4F7FB;
    --dark:#1F3B5B;
}

body {
    font-family:'Poppins',sans-serif;
    background: var(--soft-bg);
}

.main {
    margin-left:260px;
    padding:40px;
}

.card-custom {
    background:white;
    border-radius:20px;
    padding:30px;
    box-shadow:0 15px 40px rgba(0,0,0,0.05);
    transition:0.3s ease;
}

.card-custom:hover {
    transform:translateY(-6px);
}

.badge-skill {
    background:var(--primary);
    color:white;
    padding:6px 14px;
    border-radius:50px;
    font-size:13px;
    margin:5px;
    display:inline-block;
}

.timeline {
    list-style:none;
    padding-left:0;
}

.timeline li {
    padding-left:20px;
    position:relative;
    margin-bottom:10px;
}

.timeline li:before {
    content:"•";
    color:var(--primary);
    font-weight:bold;
    position:absolute;
    left:0;
}

.btn-primary {
    background:var(--primary);
    border:none;
}

.btn-primary:hover {
    background:#1e8f88;
}

@media(max-width:768px){
    .main{margin-left:0;padding:20px;}
}
</style>
</head>

<body>
<div class="main">

    <!-- Hero Section -->
    <div class="mb-4">
        <h2 class="fw-bold mb-2"><?= $career['career_name']; ?></h2>
        <p class="text-muted">
            Explore detailed insights, required skills, growth outlook, and roadmap for becoming a successful <?= $career['career_name']; ?>.
        </p>
    </div>

    <div class="row g-4">

        <!-- LEFT SIDE -->
        <div class="col-lg-8">

            <!-- About Career -->
            <div class="card-custom mb-4">
                <h5 class="fw-semibold mb-3">📘 About This Career</h5>
                <p class="text-muted"><?= $career['description']; ?></p>
            </div>

            <!-- Required Skills -->
            <div class="card-custom mb-4">
                <h5 class="fw-semibold mb-3">🛠 Required Skills</h5>
                <div>
                    <?php if(!empty($career['required_skills'])) { ?>
                    <?php foreach(explode(",", $career['required_skills']) as $skill){ ?>
                    <span class="badge-skill"><?= trim($skill); ?></span>
                    <?php } ?>
                    <?php } else { ?>
                    <p class="text-muted">No skills specified for this career yet.</p>
                    <?php } ?>
                </div>
            </div>

            <!-- Career Roadmap -->
            <div class="card-custom mb-4">
                <h5 class="fw-semibold mb-3">🚀 Career Roadmap</h5>
                <ul class="timeline">
                    <li>Build foundational knowledge in core subjects.</li>
                    <li>Develop practical skills through projects.</li>
                    <li>Complete internships or certifications.</li>
                    <li>Build portfolio & optimize resume.</li>
                    <li>Apply for entry-level roles and grow professionally.</li>
                </ul>
            </div>

        </div>

        <!-- RIGHT SIDE -->
        <div class="col-lg-4">

            <!-- Career Stats -->
            <div class="card-custom mb-4 text-center">
                <h6 class="text-muted">💰 Average Salary</h6>
                <h4 class="fw-bold"><?= $career['avg_salary']; ?></h4>
                <hr>
                <h6 class="text-muted">📈 Growth Rate</h6>
                <h5 class="fw-semibold"><?= $career['growth_rate']; ?></h5>
            </div>

            <!-- Industry Demand -->
            <div class="card-custom mb-4 text-center">
                <h6 class="text-muted">📊 Industry Demand</h6>
                <div class="progress mt-3" style="height:10px;border-radius:10px;">
                    <div class="progress-bar bg-success" style="width:85%"></div>
                </div>
                <small class="text-muted">High Demand Career</small>
            </div>

            <!-- Select Career -->
            <div class="card-custom text-center">
                <form method="POST">
                    <button type="submit" name="select_career" 
                            class="btn btn-primary w-100 rounded-pill mb-2">
                        🎯 Select This Career
                    </button>
                </form>

                <a href="careers.php" 
                   class="btn btn-outline-secondary w-100 rounded-pill">
                   ← Back to Careers
                </a>
            </div>

        </div>

    </div>
</div>
<script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
