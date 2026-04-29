<?php
session_start();
include '../config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$user_id = (int)$_SESSION['user_id'];
$full_name = htmlspecialchars($_SESSION['full_name']);

/* ============================
   Fetch Existing Profile
============================ */
$profile_query = $conn->query("SELECT * FROM user_profile WHERE user_id = $user_id");
$profile_data = $profile_query->fetch_assoc() ?: [];

/* ============================
   Fetch All Skills & Careers
============================ */
$skills_result = $conn->query("SELECT * FROM skills");
$careers_result = $conn->query("SELECT career_id, career_name FROM careers");

/* ============================
   Handle Profile Save
============================ */
if(isset($_POST['save_profile'])) {
    $new_career_goal = (int)$_POST['career_goal'];
    $old_career_goal = (int)($profile_data['career_goal'] ?? 0);
    $education       = $conn->real_escape_string($_POST['education']);
    $stream          = $conn->real_escape_string($_POST['stream']);
    $experience      = $conn->real_escape_string($_POST['experience']);
    $career_goal     = (int)$_POST['career_goal'];
    $dob             = $conn->real_escape_string($_POST['dob']);
    $location        = $conn->real_escape_string($_POST['location']);
    $contact         = $conn->real_escape_string($_POST['contact_number']);
    $linkedin        = $conn->real_escape_string($_POST['linkedin_profile'] ?? '');
    $selected_skills = $_POST['skills'] ?? [];

    /* ===== Handle Profile Picture ===== */
    $profile_picture = $profile_data['profile_picture'] ?? '';
    if(isset($_FILES['profile_picture']) && $_FILES['profile_picture']['error']==0){
        $profile_picture = time().'_'.basename($_FILES['profile_picture']['name']);
        move_uploaded_file($_FILES['profile_picture']['tmp_name'], '../uploads/profile_pictures/'.$profile_picture);
    }

    /* ===== Handle Resume ===== */
    $resume_name = $profile_data['resume'] ?? '';
    if(isset($_FILES['resume']) && $_FILES['resume']['error']==0){
        $resume_name = time().'_'.basename($_FILES['resume']['name']);
        move_uploaded_file($_FILES['resume']['tmp_name'], '../uploads/resumes/'.$resume_name);
    }

    /* ===== Save or Update Profile ===== */
    if($profile_query->num_rows > 0){
        $conn->query("UPDATE user_profile SET
            education_level='$education',
            stream='$stream',
            experience_level='$experience',
            career_goal=$career_goal,
            dob='$dob',
            location='$location',
            contact_number='$contact',
            linkedin_profile='$linkedin',
            profile_picture='$profile_picture',
            resume='$resume_name',
            updated_at=NOW()
            WHERE user_id=$user_id");
    } else {
        $conn->query("INSERT INTO user_profile 
            (user_id, education_level, stream, experience_level, career_goal, dob, location, contact_number, linkedin_profile, profile_picture, resume, created_at)
            VALUES ($user_id,'$education','$stream','$experience',$career_goal,'$dob','$location','$contact','$linkedin','$profile_picture','$resume_name',NOW())");
    }

    /* ===== Update Skills ===== */
    // Remove old mapping
    $conn->query("DELETE FROM user_skill_mapping WHERE user_id=$user_id");
    // Insert new selections
    foreach($selected_skills as $skill_id => $level){
        $skill_id = (int)$skill_id;
        $level = $conn->real_escape_string($level);
        if(!empty($level)){
            $conn->query("INSERT INTO user_skill_mapping(user_id, skill_id, proficiency_level) VALUES($user_id,$skill_id,'$level')");
        }
    }

    /* ===== Update Progress / Readiness ===== */
    $profile_complete = !empty($education) && !empty($stream) && !empty($experience) && !empty($career_goal);
    $skills_added = !empty($selected_skills);
    $score = 0;
    $score += $profile_complete ? 40 : 0;
    $score += $skills_added ? 60 : 0;

    $check_progress = $conn->query("SELECT * FROM user_progress WHERE user_id=$user_id");
    if($check_progress->num_rows > 0){
        $conn->query("UPDATE user_progress SET
            profile_completed=".($profile_complete?1:0).",
            skills_added=".($skills_added?1:0).",
            progress_score=$score,
            updated_at=NOW()
            WHERE user_id=$user_id");
    } else {
        $conn->query("INSERT INTO user_progress(user_id, profile_completed, skills_added, progress_score, updated_at)
                     VALUES($user_id,".($profile_complete?1:0).",".($skills_added?1:0).",$score,NOW())");
    }
if ($new_career_goal !== $old_career_goal && $new_career_goal !== 0) {
    $conn->query("DELETE FROM user_skill_mapping WHERE user_id=$user_id");
    header("Location: assessment_start.php?career_id=$new_career_goal&msg=career_changed");
    exit();
}
    header("Location: dashboard.php");
    exit();
}
// Default score
$score = 0;

// Fetch existing progress if available
$progress_q = $conn->query("SELECT progress_score FROM user_progress WHERE user_id=$user_id");
if ($progress_q && $progress_q->num_rows > 0) {
    $score = $progress_q->fetch_assoc()['progress_score'];
}
$last_result = $conn->query("
    SELECT progress_percent, profile_completed, skills_added, updated_at
    FROM user_progress
    WHERE user_id = $user_id
    LIMIT 1
");

$last_data = ($last_result && $last_result->num_rows > 0)
    ? $last_result->fetch_assoc()
    : [];

$last_score = $last_data['progress_percent'] ?? 0;
$last_date  = $last_data['updated_at'] ?? null;
$profile_done = !empty($last_data['profile_completed']);
$skills_done  = !empty($last_data['skills_added']);

?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Profile - Career Navigator</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
:root {
    --primary: #2AA9A1;
    --dark-blue: #1F3B5B;
    --soft-bg: #F4F7FB;
}
body { background: var(--soft-bg); font-family: 'Poppins', sans-serif; }
.sidebar { width:260px; height:100vh; position:fixed; background: linear-gradient(180deg, #1F3B5B, #162c45); padding:30px 20px; color:white; }
.sidebar h4{font-weight:700;margin-bottom:40px;}
.sidebar a{display:block;color:#cbd5e1;text-decoration:none;padding:12px 15px;border-radius:10px;margin-bottom:8px;transition:0.3s ease;}
.sidebar a:hover, .sidebar a.active{background:var(--primary);color:white;}
.main{margin-left:260px;padding:40px;}
.card-custom{background:white;padding:35px;border-radius:20px;box-shadow:0 15px 40px rgba(0,0,0,0.05);}
.btn-primary{background:var(--primary);border:none;border-radius:50px;padding:10px 30px;}
.btn-primary:hover{background:#1e8f88;}
.skill-card{border:1px solid #e2e8f0;padding:15px;border-radius:12px;margin-bottom:12px;transition:0.3s;}
.skill-card:hover{border-color:var(--primary);background:#f8fcfb;}
@media(max-width:768px){.sidebar{display:none;}.main{margin-left:0;padding:20px;}}
.section-header {
    border-left: 4px solid var(--primary);
    padding-left: 15px;
    margin-bottom: 25px;
    color: var(--dark-blue);
}
.form-control, .form-select {
    border: 1px solid #e2e8f0;
    padding: 12px;
    border-radius: 10px;
    background: #fff;
}
.form-control:focus {
    box-shadow: 0 0 0 3px rgba(42, 169, 161, 0.1);
    border-color: var(--primary);
}
.verified-badge {
    background: #eef2ff;
    color: #4f46e5;
    font-size: 0.75rem;
    padding: 4px 10px;
    border-radius: 50px;
    font-weight: 600;
}
</style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
<h4>Career Navigator</h4>
<a href="dashboard.php">🏠 Dashboard</a>
<a href="profile.php" class="active">👤 Profile</a>
<a href="skills.php">🛠 Skills</a>
<a href="careers.php">🎯 Careers</a>
<a href="progress.php">📊 Progress</a>
<a href="recommendation.php">🤖 AI Recommendation</a>
<a href="resume.php">📄 Resume Analyzer</a>
<a href="../logout.php" class="text-warning mt-4">🚪 Logout</a>
</div>

<div class="main">
    <div class="card card-custom border-0">
        <div class="d-flex justify-content-between align-items-center mb-5">
            <div>
                <h3 class="fw-bold text-dark-blue">Professional Profile</h3>
                <p class="text-muted">Manage your identity and career trajectory</p>
            </div>
            <div class="text-end">
                <span class="badge bg-soft text-primary p-2 px-3" style="background: rgba(42,169,161,0.1);">
                    Profile Score: <?= $score ?>%
                </span>
            </div>
        </div>

        <form method="POST" enctype="multipart/form-data">
            <div class="section-header"><h5>1. Personal Identity</h5></div>
            <div class="row g-4 mb-5">
                <div class="col-md-4 text-center border-end">
                    <div class="position-relative d-inline-block">
                        <img src="<?= !empty($profile_data['profile_picture']) ? '../uploads/profile_pictures/'.$profile_data['profile_picture'] : '../assets/images/default_avatar.jpg' ?>" 
                             class="rounded-circle mb-3" style="width:130px; height:130px; object-fit:cover; border:3px solid var(--primary);">
                        <input type="file" name="profile_picture" class="form-control form-control-sm mt-2">
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="small fw-bold text-muted">Full Name</label>
                            <input type="text" class="form-control bg-light" value="<?= $full_name ?>" readonly>
                        </div>
                        <div class="col-md-6">
                            <label class="small fw-bold text-muted">Date of Birth</label>
                            <input type="date" name="dob" class="form-control" value="<?= $profile_data['dob'] ?? '' ?>">
                        </div>
                        <div class="col-md-6">
                            <label class="small fw-bold text-muted">Contact Number</label>
                            <input type="text" name="contact_number" class="form-control" value="<?= $profile_data['contact_number'] ?? '' ?>">
                        </div>
                        <div class="col-md-6">
                            <label class="small fw-bold text-muted">Location</label>
                            <input type="text" name="location" class="form-control" value="<?= $profile_data['location'] ?? '' ?>">
                        </div>
                    </div>
                </div>
            </div>

            <div class="section-header"><h5>2. Career Trajectory</h5></div>
            <div class="row g-4 mb-5">
                <div class="col-md-6">
                    <label class="small fw-bold text-muted">Current Goal (Triggers Assessment on Change)</label>
                    <select name="career_goal" class="form-select border-primary" required>
                        <?php
                        $careers_result->data_seek(0);
                        while($career=$careers_result->fetch_assoc()){ 
                            $selected = ($profile_data['career_goal']??0)==$career['career_id']?'selected':'';
                            echo "<option value='{$career['career_id']}' $selected>{$career['career_name']}</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="small fw-bold text-muted">Education Level</label>
                    <input type="text" name="education" class="form-control" value="<?= $profile_data['education_level'] ?? '' ?>" placeholder="e.g. B.Tech CS">
                </div>
            </div>

            <div class="section-header d-flex justify-content-between">
                <h5>3. Verified Tech Stack</h5>
                <a href="careers.php" class="small text-primary text-decoration-none">Retake Test ↻</a>
            </div>
            <div class="row g-3 mb-5">
                <?php
                // Fetch only skills they've actually passed in the test
                $skills_map = $conn->query("SELECT s.skill_name, usm.proficiency_level 
                                            FROM user_skill_mapping usm 
                                            JOIN skills s ON usm.skill_id = s.skill_id 
                                            WHERE usm.user_id=$user_id");
                if($skills_map->num_rows > 0):
                    while($us = $skills_map->fetch_assoc()):
                ?>
                <div class="col-md-4">
                    <div class="p-3 border rounded-3 bg-white shadow-sm d-flex justify-content-between align-items-center">
                        <div>
                            <span class="d-block fw-bold"><?= $us['skill_name'] ?></span>
                            <span class="verified-badge">✓ Verified</span>
                        </div>
                        <span class="badge bg-primary"><?= $us['proficiency_level'] ?></span>
                    </div>
                </div>
                <?php endwhile; else: ?>
                <div class="col-12 text-center py-4 bg-light rounded-3">
                    <p class="text-muted mb-0">No verified skills yet. Start an assessment to populate this list.</p>
                </div>
                <?php endif; ?>
            </div>
            <div class="section-header">
    <h5>4. Last Assessment Result</h5>
</div>

<div class="card p-4 mb-4 border-0 shadow-sm">
    <?php if ($last_data): ?>
        <div class="d-flex justify-content-between align-items-center flex-wrap">
            <div>
                <h4 class="fw-bold text-primary mb-1">
                    <?= $last_score ?>% Overall Score
                </h4>
                <p class="text-muted mb-0">
                    Last updated: <?= date("d M Y, h:i A", strtotime($last_date)) ?>
                </p>
            </div>

            <div class="text-end">
                <p class="mb-1">
                    Profile: 
                    <span class="<?= $profile_done ? 'text-success' : 'text-danger' ?>">
                        <?= $profile_done ? 'Completed' : 'Incomplete' ?>
                    </span>
                </p>
                <p class="mb-0">
                    Skills: 
                    <span class="<?= $skills_done ? 'text-success' : 'text-danger' ?>">
                        <?= $skills_done ? 'Added' : 'Not Added' ?>
                    </span>
                </p>
            </div>
        </div>

        <div class="progress mt-3" style="height:10px;">
            <div class="progress-bar bg-success"
                 style="width: <?= $last_score ?>%"></div>
        </div>

    <?php else: ?>
        <p class="text-muted mb-0">
            No assessment results found. Start your first evaluation.
        </p>
    <?php endif; ?>
</div>

            <div class="text-end">
                <button type="submit" name="save_profile" class="btn btn-primary px-5 py-2 fw-bold shadow-sm">Save & Synchronize</button>
            </div>
        </form>
    </div>
</div>

<script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>