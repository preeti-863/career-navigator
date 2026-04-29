<?php
session_start();
include '../config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$user_id = (int)$_SESSION['user_id'];

/* =========================
   Fetch Profile Info
========================= */
$user_query = $conn->query("SELECT full_name FROM users WHERE user_id = $user_id");

if($user_query && $user_query->num_rows > 0){
    $user = $user_query->fetch_assoc();
    $full_name = htmlspecialchars($user['full_name']);
} else {
    $full_name = "User"; // fallback
}

$profile_query = $conn->query("SELECT * FROM user_profile WHERE user_id = $user_id");

if(!$profile_query){
    die("Query Failed: " . $conn->error);
}
$profile = $profile_query->fetch_assoc();

// $full_name       = htmlspecialchars($profile['full_name'] ?? 'User');
$education       = htmlspecialchars($profile['education_level'] ?? '');
$experience      = htmlspecialchars($profile['experience_level'] ?? '');
$profile_picture = !empty($profile['profile_picture']) 
                   ? '../uploads/profile_pictures/'.$profile['profile_picture'] 
                   : '../assets/images/default_avtaar.jpg';

/* =========================
   Count Skills Added
========================= */
$skills_query = $conn->query("SELECT COUNT(*) AS skill_count FROM user_skill_mapping WHERE user_id = $user_id");
$skill_count = $skills_query->fetch_assoc()['skill_count'] ?? 0;

/* =========================
   Fetch Selected Career
========================= */
$career_name_query = $conn->query("
    SELECT target_career
    FROM user_profile
    WHERE user_id = $user_id
");

if(!$career_name_query){
    die("Career Query Failed: " . $conn->error);
}

$row = $career_name_query->fetch_assoc();
$selected_career = $row['target_career'] ?? 'Not Selected';

/* =============================================
   Count Recommended Courses & Completed
============================================= */

// 1. Recommended Count
$recommended_query = $conn->query("SELECT COUNT(*) AS rec_count FROM user_recommendations WHERE user_id = $user_id");
$recommended_data = $recommended_query ? $recommended_query->fetch_assoc() : null;
$recommended_count = $recommended_data['rec_count'] ?? 0;

// 2. Completed Count
$completed_query = $conn->query("SELECT COUNT(*) AS completed_count FROM user_recommendations WHERE user_id = $user_id AND status = 'completed'");
$completed_data = $completed_query ? $completed_query->fetch_assoc() : null;
$completed_count = $completed_data['completed_count'] ?? 0;

/* =========================
   Progress & Readiness
========================= */
$profile_complete = (!empty($education) && !empty($experience) && $skill_count > 0);
$career_selected  = !empty($selected_career);
$readiness_score  = $recommended_count > 0 ? round(($completed_count / $recommended_count) * 100) : 0;

// Optional: boost readiness if career selected
if ($career_selected) {
    $readiness_score = min(100, $readiness_score + 20);
}
/* =========================
   Roadmap Logic
========================= */
// Step 1: Basic Skills (Mastered in result.php)
$step1_complete = ($skill_count > 0);

// Step 2: Skill Gaps (Checking your skill_gap table)
$gap_query = $conn->query("SELECT COUNT(*) as gaps FROM skill_gap WHERE user_id = $user_id");
$has_gaps = $gap_query->fetch_assoc()['gaps'] > 0;
$step2_complete = ($step1_complete && !$has_gaps);

// Step 3: Resume Readiness
$step3_complete = !empty($profile['resume']) && file_exists('../uploads/resumes/'.$profile['resume']);

?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Dashboard - Career Navigator</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
:root {
    --primary: #1F3B5B;  /* Deep Navy */
    --accent: #2AA9A1;   /* Teal */
    --bg-soft: #F7F9FC;  /* Light Grey Background */
    --card-glass: rgba(255,255,255,0.85);
    --card-border: rgba(200,200,200,0.3);
}

/* ================= GLOBAL ================= */
body {
    font-family: 'Poppins', sans-serif;
    margin:0;
    background: var(--bg-soft);
    color: #1E293B;
}

/* ================= SIDEBAR ================= */
.sidebar {
    width: 260px;
    height: 100vh;
    background: var(--primary);
    position: fixed;
    padding: 30px 20px;
    color:white;
}
.sidebar h4 { font-weight:700; margin-bottom:40px; letter-spacing:1px; }
.sidebar a { display:block; color:#cbd5e1; text-decoration:none; padding:12px 15px; border-radius:12px; margin-bottom:10px; transition:0.3s; font-weight:500; }
.sidebar a:hover, .sidebar a.active { background: var(--accent); color:white; box-shadow:0 6px 20px rgba(42,169,161,0.3); }

/* ================= MAIN ================= */
.main { margin-left:260px; padding:40px; }
.main::before {
    content: url('../assets/images/logo_light.png'); /* lighter logo */
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 250px;
    height: 250px;
    opacity: 0.05;
    pointer-events: none;
}
.main { position: relative; }

/* ================= TOPBAR ================= */
.topbar {
    background: var(--card-glass);
    backdrop-filter: blur(8px);
    padding:25px 30px;
    border-radius:20px;
    margin-bottom:30px;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
    display:flex; justify-content:space-between; align-items:center;
}

/* ================= GLASS CARDS ================= */
.card-glass {
    background: var(--card-glass);
    border-radius:20px;
    padding:25px;
    color: #1F3B5B;
    border:1px solid var(--card-border);
    transition:all 0.3s ease;
    box-shadow:0 10px 25px rgba(0,0,0,0.06);
}
.card-glass:hover {
    transform: translateY(-8px);
    box-shadow:0 15px 40px rgba(0,0,0,0.12);
}

/* ================= STAT BOX ================= */
.stat-box {
    width:60px; height:60px; border-radius:15px;
    display:flex; align-items:center; justify-content:center;
    font-weight:bold; font-size:22px; background: var(--accent);
    color:white; transition:0.3s;
}
.stat-box:hover { transform: scale(1.1); }

/* ================= PROGRESS ================= */
.progress { height:16px; border-radius:50px; background:#e2e8f0; }
.progress-bar {
    background: var(--accent);
    transition:width 1.5s ease;
}

/* ================= BUTTON ================= */
.btn-primary {
    background: linear-gradient(135deg,var(--accent), var(--primary));
    border:none; border-radius:50px; padding:10px 25px; font-weight:600; transition:0.4s;
}
.btn-primary:hover { transform: translateY(-3px); box-shadow:0 10px 25px rgba(42,169,161,0.35); }

/* ================= HEADINGS ================= */
h5 { font-weight:700; letter-spacing:0.5px; }

/* ================= RESPONSIVE ================= */
@media(max-width:768px){ .sidebar{display:none;} .main{margin-left:0; padding:20px;} }
</style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
<h4>Career Navigator</h4>
<a href="dashboard.php" class="active">🏠 Dashboard</a>
<a href="profile.php">👤 Profile</a>
<a href="skills.php">🛠 Skills</a>
<a href="careers.php">🎯 Careers</a>
<a href="progress.php">📊 Progress</a>
<a href="recommendation.php">🤖 AI Recommendation</a>
<a href="resume.php">📄 Resume Analyzer</a>
<a href="career_insights.php">💡 Career Insights</a>
<a href="../logout.php" class="mt-4 text-warning">🚪 Logout</a>
</div>

<!-- Main -->
<div class="main">
<div class="topbar d-flex justify-content-between align-items-center mb-4">
    <div class="d-flex align-items-center">
        <!-- Profile Picture -->
        <img src="<?= $profile_picture ?>" 
             alt="Profile Picture" 
             class="rounded-circle me-3"
             style="width:60px; height:60px; object-fit:cover; border:2px solid #2AA9A1;">

        <div>
            <h5>Welcome back, <?= $full_name; ?> 👋</h5>
            <small>Here's your career progress overview</small>
        </div>
    </div>

    <div><?= date("l, d M Y"); ?></div>
</div>

<!-- Profile Completion -->
<?php if(!$profile_complete): ?>
<div class="card-glass mb-4 d-flex justify-content-between align-items-center flex-wrap">
    <div>
        <h5>Complete Your Profile 🚀</h5>
        <p>Add education, experience, and skills to unlock AI recommendations and career insights.</p>
    </div>
    <a href="profile.php" class="btn btn-primary mt-3 mt-md-0">Complete Profile</a>
</div>
<?php endif; ?>

<!-- Stats -->
<div class="row g-4 mb-5">
<div class="col-md-4">
    <div class="card-glass d-flex justify-content-between align-items-center">
        <div>
            <p class="mb-1">Skills Added</p>
            <h5><span id="skill-count"><?= $skill_count ?></span> Skill(s)</h5>
        </div>
        <div class="stat-box">🛠</div>
    </div>
</div>

<div class="col-md-4">
    <div class="card-glass d-flex justify-content-between align-items-center p-3">
        <div>
            <p class="mb-1">Target Career</p>
            <h5><?= $selected_career ?? 'Not Selected' ?></h5>
        </div>
        <div class="stat-box" style="font-size:28px;">🎯</div>
    </div>
</div>

<div class="col-md-4">
    <div class="card-glass p-3">
        <p class="mb-2">Career Readiness</p>
        <h4 class="fw-bold mb-3"><?= $readiness_score ?>%</h4>

        <!-- Progress Bar -->
        <div class="progress mb-2" style="height: 12px; border-radius: 10px;">
            <div class="progress-bar bg-success" role="progressbar" 
                 style="width: <?= $readiness_score ?>%;" 
                 aria-valuenow="<?= $readiness_score ?>" 
                 aria-valuemin="0" 
                 aria-valuemax="100">
            </div>
        </div>

        <!-- Profile & Skills Status -->
        <p class="mb-0">
            Profile: <span class="<?= $profile_complete ? 'text-success' : 'text-danger' ?>">
                <?= $profile_complete ? 'Completed' : 'Incomplete' ?>
            </span> |
            Skills: <span class="<?= $skill_count > 0 ? 'text-success' : 'text-danger' ?>">
                <?= $skill_count > 0 ? 'Added' : 'Not Added' ?>
            </span>
        </p>
    </div>
</div>

<!-- Growth Tools -->
<h5 class="fw-bold mb-4">Growth Tools</h5>
<div class="row g-4 mb-5">
<div class="col-md-6">
    <div class="card-glass text-center p-4">
        <h5 class="mb-3">AI Career Recommendation</h5>
        <p>Get intelligent, personalized course suggestions aligned with your skills.</p>
        <a href="recommendation.php" class="btn btn-primary">Explore Recommendations</a>
    </div>
</div>
<div class="col-md-6">
    <div class="card-glass text-center p-4">
        <h5 class="mb-3">Resume Analyzer</h5>
        <p>Upload your resume to receive actionable insights and improve your profile.</p>
        <a href="resume.php" class="btn btn-primary">Analyze Resume</a>
    </div>
</div>
</div>

<h5 class="fw-bold mb-4">Your Career Roadmap 🗺️</h5>
<div class="card-glass p-4 mb-5 border-0 shadow-sm" style="background: linear-gradient(135deg, #ffffff, #f8fafc);">
    <div class="row align-items-center">
        <div class="col-md-4 border-end">
            <h6 class="text-muted text-uppercase small fw-bold mb-2">Current Goal</h6>
            <h4 class="text-primary fw-bold mb-3"><?= htmlspecialchars($selected_career) ?></h4>
            <div class="d-flex align-items-center mb-4">
                <div class="me-3">
                    <h2 class="mb-0 fw-bold text-accent"><?= $readiness_score ?>%</h2>
                </div>
                <div class="text-muted small">Overall<br>Readiness</div>
            </div>
            <a href="roadmap_details.php" class="btn btn-primary w-100">View Full Roadmap</a>
        </div>

        <div class="col-md-8 ps-md-5">
            <div class="roadmap-timeline">
                <div class="d-flex mb-4">
                    <div class="roadmap-icon me-3 <?= $step1_complete ? 'bg-success' : 'bg-primary' ?>">
                        <?= $step1_complete ? '✓' : '1' ?>
                    </div>
                    <div>
                        <h6 class="mb-0 fw-bold">Skill Validation</h6>
                        <p class="small text-muted mb-0">Core technical assessment based on industry standards.</p>
                    </div>
                </div>

                <div class="d-flex mb-4">
                    <div class="roadmap-icon me-3 <?= $step2_complete ? 'bg-success' : 'bg-secondary' ?>">2</div>
                    <div>
                        <h6 class="mb-0 fw-bold">Bridge the Skill Gap</h6>
                        <p class="small text-muted mb-0">Master the missing keywords required for <?= htmlspecialchars($selected_career) ?>.</p>
                    </div>
                </div>

                <div class="d-flex">
                    <div class="roadmap-icon me-3 <?= $step3_complete ? 'bg-success' : 'bg-secondary' ?>">3</div>
                    <div>
                        <h6 class="mb-0 fw-bold">Professional Presence</h6>
                        <p class="small text-muted mb-0">ATS-optimized resume and technical profile deployment.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.roadmap-icon {
    width: 35px;
    height: 35px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: bold;
    flex-shrink: 0;
    position: relative;
}
/* This creates the vertical line connecting icons */
.roadmap-icon:not(:last-child):after {
    content: '';
    position: absolute;
    top: 35px;
    left: 50%;
    width: 2px;
    height: 25px;
    background: #e2e8f0;
}
</style>
<script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
<script>
function updateSkillCount() {
    fetch('ajax_skills.php', {
        method: 'POST',
        headers: {'Content-Type':'application/x-www-form-urlencoded'},
        body: 'action=count'
    })
    .then(res => res.json())
    .then(data => {
        document.getElementById('skill-count').innerText = data.total_skills;
    })
}

// Optional: call periodically or after skill updates
// setInterval(updateSkillCount, 60000); // every minute
</script>
</html>