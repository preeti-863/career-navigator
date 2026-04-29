<?php
session_start();
include '../config.php';

// 1. Security Check
if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$user_id = (int)$_SESSION['user_id'];
$full_name = htmlspecialchars($_SESSION['full_name']);

/* ============================================================
   FETCH DATA FROM USER_PROFILE
   We fetch the target_career string directly from your profile table.
============================================================ */
$target_career = null;

$profile_query = $conn->query("
    SELECT target_career 
    FROM user_profile 
    WHERE user_id = $user_id 
    LIMIT 1
");

if ($profile_query && $profile_query->num_rows > 0) {
    $row = $profile_query->fetch_assoc();
    $target_career = $row['target_career'];
}

/* ============================================================
   FETCH USER SKILLS
============================================================ */
$skills_query = $conn->query("
    SELECT s.skill_name 
    FROM user_skill_mapping usm
    JOIN skills s ON s.skill_id = usm.skill_id 
    WHERE usm.user_id = $user_id
");

$user_skills_array = [];
while ($row = $skills_query->fetch_assoc()) {
    $user_skills_array[] = $row['skill_name'];
}

/* ============================================================
   API COMMUNICATION (FLASK)
============================================================ */
$free_courses = [];
$paid_courses = [];

if (!empty($target_career)) {
    // Prepare the JSON data
    $payload = [
        "aimed_career" => $target_career,
        "skills" => !empty($user_skills_array) ? $user_skills_array : ["Beginner"]
    ];
    $json_payload = json_encode($payload);

    // Initialize cURL to talk to Python
    $ch = curl_init("http://127.0.0.1:5000/recommend");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json_payload);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Content-Type: application/json",
        "Accept: application/json"
    ]);
    
    // Connection stability settings
    curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
    curl_setopt($ch, CURLOPT_TIMEOUT, 20);

    $response = curl_exec($ch);

    if ($response !== false) {
        $data = json_decode($response, true);
        $free_courses = $data['free_courses'] ?? [];
        $paid_courses = $data['paid_courses'] ?? [];
    }
    curl_close($ch);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Career Navigator | AI Recommendations</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <style>
        body { background: #f8f9fa; font-family: 'Segoe UI', sans-serif; }
        .main-container { padding: 50px 0; }
        .course-card { 
            background: #fff; border-radius: 15px; padding: 20px; 
            margin-bottom: 20px; border: none; box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        .badge-career { background: #6366f1; color: white; padding: 8px 15px; border-radius: 50px; }
    </style>
</head>
<body>

<div class="container main-container">
    <?php if ($target_career): ?>
        <div class="mb-5 text-center">
            <h2 class="fw-bold">AI Course Recommendations</h2>
            <p class="text-muted">Personalized learning paths for <span class="badge-career"><?= htmlspecialchars($target_career); ?></span></p>
        </div>

        <div class="row">
            <div class="col-md-6">
                <h4 class="mb-4 text-success">Free Learning Path</h4>
                <?php if (!empty($free_courses)): ?>
                    <?php foreach ($free_courses as $course): ?>
                        <div class="course-card">
                            <h6><?= htmlspecialchars($course['course_name']); ?></h6>
                            <small class="text-muted"><?= htmlspecialchars($course['platform']); ?></small><br>
                            <a href="<?= htmlspecialchars($course['url']); ?>" target="_blank" class="btn btn-sm btn-outline-success mt-2">Start Learning</a>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <div class="alert alert-light border">No free courses found.</div>
                <?php endif; ?>
            </div>

            <div class="col-md-6">
                <h4 class="mb-4 text-primary">Professional Certifications</h4>
                <?php if (!empty($paid_courses)): ?>
                    <?php foreach ($paid_courses as $course): ?>
                        <div class="course-card">
                            <h6><?= htmlspecialchars($course['course_name']); ?></h6>
                            <small class="text-muted"><?= htmlspecialchars($course['platform']); ?></small><br>
                            <a href="<?= htmlspecialchars($course['url']); ?>" target="_blank" class="btn btn-sm btn-outline-primary mt-2">Start Learning</a>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <div class="alert alert-light border">No paid courses found.</div>
                <?php endif; ?>
            </div>
        </div>

    <?php else: ?>
        <div class="text-center py-5 mt-5">
            <div class="display-1 text-muted mb-4">🚀</div>
            <h3>Your Roadmap is Ready to Begin</h3>
            <p class="text-muted">We couldn't find a career selected in your profile yet.</p>
            <a href="profile_setup.php" class="btn btn-primary px-4 py-2 mt-2">Set Your Target Career</a>
        </div>
    <?php endif; ?>
</div>

</body>
</html>