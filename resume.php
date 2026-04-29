<?php
session_start();
include '../config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$user_id = (int)$_SESSION['user_id'];

/* ===== Fetch Career ===== */
$res = $conn->query("SELECT target_career FROM user_profile WHERE user_id = $user_id");
$row = $res->fetch_assoc();
$career = $row['target_career'] ?? "Not Selected";

/* ===== Career Mapping ===== */
function mapCareer($career) {
    $map = [
        "software engineer"=>"software_engineer",
        "data scientist"=>"data_scientist",
        "web developer"=>"web_developer",
        "ui/ux designer"=>"ui_ux_designer",
        "project manager"=>"project_manager",
        "ai engineer"=>"ai_engineer",
        "cybersecurity analyst"=>"cybersecurity_analyst",
        "cloud engineer"=>"cloud_engineer",
        "devops engineer"=>"devops_engineer",
        "mobile app developer"=>"mobile_app_developer",
        "network engineer"=>"network_engineer"
    ];
    return $map[strtolower($career)] ?? "";
}

$resultHTML = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $career_api = mapCareer($career);

    if ($career_api == "") {
        $resultHTML = "<p class='text-danger'>❌ Career not supported</p>";
    } else {

        $file = $_FILES['resume'];

        $ch = curl_init("http://127.0.0.1:5001/resume-analyze");

        $postData = [
            "career" => $career_api,
            "resume" => new CURLFile($file['tmp_name'], $file['type'], $file['name'])
        ];

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);

        $response = curl_exec($ch);
        curl_close($ch);

        $data = json_decode($response, true);

        if (!$data || isset($data['error'])) {
            $resultHTML = "<p class='text-danger'>❌ " . ($data['error'] ?? "API Error") . "</p>";
        } else {

            $score = $data['score'];
            $missing = implode(", ", $data['missing_skills']);

            // Top careers UI
            $topHTML = "";
            foreach ($data['top_careers'] as $c) {
                $name = ucwords(str_replace("_"," ",$c[0]));
                $val = $c[1];

                $topHTML .= "
                    <div class='mb-3'>
                        <div class='d-flex justify-content-between'>
                            <small>$name</small>
                            <small>$val%</small>
                        </div>
                        <div class='progress'>
                            <div class='progress-bar' style='width: {$val}%'></div>
                        </div>
                    </div>
                ";
            }

            $resultHTML = "
                <div class='card-glass mt-4'>
                    <h5>🤖 AI Resume Analysis</h5>

                    <p><b>Target Career:</b> $career</p>

                    <div class='progress mb-2'>
                        <div class='progress-bar bg-success' style='width: {$score}%'></div>
                    </div>
                    <p><b>Match Score:</b> $score%</p>

                    <h6 class='mt-3'>⚠️ Missing Skills</h6>
                    <p>$missing</p>

                    <h6 class='mt-3'>🎯 Top Career Matches</h6>
                    $topHTML
                </div>
            ";
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resume Analyzer</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

<style>
:root {
    --primary: #1F3B5B;
    --accent: #2AA9A1;
    --bg-soft: #F7F9FC;
}

body {
    font-family: 'Poppins', sans-serif;
    background: var(--bg-soft);
}

/* Sidebar same as dashboard */
.sidebar {
    width: 260px;
    height: 100vh;
    background: var(--primary);
    position: fixed;
    padding: 30px;
    color:white;
}
.sidebar a {
    display:block;
    color:#cbd5e1;
    padding:10px;
    text-decoration:none;
    border-radius:10px;
}
.sidebar a.active, .sidebar a:hover {
    background: var(--accent);
    color:white;
}

/* Main */
.main {
    margin-left:260px;
    padding:40px;
}

/* Glass card */
.card-glass {
    background: rgba(255,255,255,0.85);
    padding:25px;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

/* Upload box */
.upload-box {
    border:2px dashed #ccc;
    padding:30px;
    text-align:center;
    border-radius:15px;
    cursor:pointer;
    transition:0.3s;
}
.upload-box:hover {
    border-color: var(--accent);
    background:#f9f9f9;
}

/* Progress */
.progress {
    height:12px;
    border-radius:10px;
}
.progress-bar {
    background: var(--accent);
}
</style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
<h4>Career Navigator</h4>
<a href="dashboard.php">🏠 Dashboard</a>
<a href="profile.php">👤 Profile</a>
<a href="skills.php">🛠 Skills</a>
<a href="careers.php">🎯 Careers</a>
<a href="progress.php">📊 Progress</a>
<a href="recommendation.php">🤖 AI Recommendation</a>
<a href="resume.php" class="active">📄 Resume Analyzer</a>
<a href="../logout.php">🚪 Logout</a>
</div>

<!-- Main -->
<div class="main">

<div class="card-glass">
    <h4 class="mb-3">📄 Resume Analyzer</h4>
    <p class="text-muted">Upload your resume and get AI-powered insights based on your career goal.</p>

    <p><b>🎯 Target Career:</b> <?= htmlspecialchars($career) ?></p>

    <form method="post" enctype="multipart/form-data">
        <div class="upload-box mb-3">
            <input type="file" name="resume" required style="border:none;">
            <p class="mt-2 text-muted">Upload PDF or TXT resume</p>
        </div>

        <button class="btn btn-primary w-100">Analyze Resume</button>
    </form>

    <?= $resultHTML ?>
</div>

</div>

</body>
</html>