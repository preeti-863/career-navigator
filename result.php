<?php
session_start();
include '../config.php';

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

/* =========================
   Fetch Career
=========================== */
$profile_query = $conn->prepare("SELECT target_career FROM user_profile WHERE user_id=?");
$profile_query->bind_param("i", $user_id);
$profile_query->execute();
$profile_res = $profile_query->get_result()->fetch_assoc();

$target_career_name = $profile_res['target_career'] ?? "";

if(!empty($target_career_name)){
    $career_stmt = $conn->prepare("SELECT career_id FROM careers WHERE career_name=?");
    $career_stmt->bind_param("s", $target_career_name);
    $career_stmt->execute();
    $career_res = $career_stmt->get_result()->fetch_assoc();
    $career_id = $career_res['career_id'] ?? 0;
    $career_name = $target_career_name;
} else {
    $career_id = 0;
    $career_name = "Explore Your Career Journey";
}

/* =========================
   Phase Scores
=========================== */
$max_questions = [1=>10,2=>10,3=>15];
$phase_scores = [];

for($phase=1;$phase<=3;$phase++){
    $cnt = $conn->query("SELECT COUNT(*) FROM user_answers WHERE user_id=$user_id AND phase=$phase AND correct=1")->fetch_row()[0] ?? 0;
    $max = $max_questions[$phase] ?? 1;
$phase_scores[$phase] = round(($cnt / $max) * 100);
}

/* =========================
   Skills + Skill Gaps
=========================== */
$skill_details = [];
$missing_skills = [];

$skill_sql = "
    SELECT s.skill_id, s.skill_name, 
           COUNT(ua.id) as total_q, 
           SUM(ua.correct) as correct_q
    FROM user_answers ua
    JOIN assessment_questions aq ON ua.question_id = aq.id
    JOIN skills s ON aq.skill_id = s.skill_id
    WHERE ua.user_id = ?
    GROUP BY s.skill_id";

$stmt_s = $conn->prepare($skill_sql);
$stmt_s->bind_param("i", $user_id);
$stmt_s->execute();
$res_s = $stmt_s->get_result();

while ($row = $res_s->fetch_assoc()) {

    $skill_id = $row['skill_id'];
    $skill_name = $row['skill_name'];

    $correct = (int)($row['correct_q'] ?? 0);
    $total = (int)($row['total_q'] ?? 0);

    $percent = ($total > 0) ? round(($correct / $total) * 100) : 0;

    if ($percent >= 80) $level = "Advanced";
    elseif ($percent >= 50) $level = "Intermediate";
    else $level = "Beginner";

    $skill_details[] = [
        'id' => $skill_id,
        'name' => $skill_name,
        'percent' => $percent,
        'level' => $level
    ];

    if ($percent < 80) {
        $missing_skills[] = [
            'name' => $skill_name,
            'percent' => $percent
        ];
    }

    $stmt_map = $conn->prepare("
        INSERT INTO user_skill_mapping (user_id, skill_id, proficiency_level) 
        VALUES (?, ?, ?) 
        ON DUPLICATE KEY UPDATE proficiency_level = VALUES(proficiency_level)
    ");
    $stmt_map->bind_param("iis", $user_id, $skill_id, $level);
    $stmt_map->execute();
}

/* =========================
   Career Match %
=========================== */
$total_skills_query = $conn->prepare("SELECT COUNT(*) as total FROM career_skills WHERE career_id = ?");
$total_skills_query->bind_param("i",$career_id);
$total_skills_query->execute();
$total_skills = $total_skills_query->get_result()->fetch_assoc()['total'] ?? 0;

$skills_mastered = count(array_filter($skill_details, fn($s)=>$s['percent']>=80));

$career_match = ($total_skills > 0) 
    ? round(($skills_mastered / $total_skills) * 100) 
    : 0;

if ($career_match < 5 && $skills_mastered > 0) {
    $career_match = 5;
}
$final_score = $career_match;
$stmt = $conn->prepare("
    INSERT INTO user_results (user_id, career_id, score)
    VALUES (?, ?, ?)
    ON DUPLICATE KEY UPDATE 
        career_id = VALUES(career_id),
        score = VALUES(score)
");
$stmt->bind_param("iii", $user_id, $career_id, $final_score);
$stmt->execute();
?>

<!DOCTYPE html>
<html>
<head>
<title>Assessment Result</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Poppins', sans-serif;
    padding-top: 40px;
    color: #1E293B;
    background: linear-gradient(-45deg, #f4f7fa, #e0f7f5, #e6f0ff, #fdf6e3);
    background-size: 400% 400%;
    animation: gradientMove 18s ease infinite;
}
@keyframes gradientMove {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}
.result-card {
    max-width: 1000px;
    margin: auto;
    padding: 40px;
    border-radius: 25px;
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(12px);
    border: 1px solid rgba(255,255,255,0.5);
    box-shadow: 0 20px 50px rgba(0,0,0,0.1);
}
.result-title {
    font-size: 2rem;
    font-weight: 700;
    color: #2AA9A1;
}
.match-badge {
    background: rgba(42,169,161,0.1);
    color: #2AA9A1;
    padding: 6px 16px;
    border-radius: 30px;
    font-weight: 600;
}
.section-title {
    font-weight: 600;
    margin-bottom: 12px;
    color: #334155;
}
.phase-box {
    background: rgba(42,169,161,0.08);
    padding: 12px;
    border-radius: 10px;
    margin-bottom: 10px;
}
.skill-box {
    background: rgba(255,255,255,0.85);
    padding: 15px;
    border-radius: 10px;
    margin-bottom: 10px;
    border-left: 4px solid #2AA9A1;
}
.missing-box {
    background: #fff5f5;
    padding: 15px;
    border-radius: 10px;
    border-left: 4px solid #dc3545;
}
.progress {
    height: 8px;
    border-radius: 10px;
    background: #e2e8f0;
}

.progress-bar {
    background: #2AA9A1;
    width: 0;
    transition: width 1.5s ease;
}
.insight-box {
    background: #f1f5f9;
    color: #334155;
    padding: 20px;
    border-radius: 12px;
    border-left: 4px solid #2AA9A1;
}
.btn-wrapper {
    text-align: center;
    margin-top: 30px;
}
.btn-primary {
    background: linear-gradient(135deg,#2AA9A1,#00c6ff);
    border: none;
    border-radius: 30px;
    padding: 10px 30px;
}
</style>
</head>

<body>

<div class="result-card">

    <div class="text-center mb-4">
        <h2 class="result-title" style="text-align: center;">🎯 <?php echo htmlspecialchars($career_name); ?></h2>
        <span class="match-badge">Match Score: <?php echo $career_match; ?>%</span>
    </div>

    <!-- Phase -->
    <div class="mb-4">
        <h5 class="section-title">📊 Performance Breakdown</h5>

        <div class="phase-box">Aptitude: <?php echo $phase_scores[1]; ?>%</div>
        <div class="phase-box">Psychometric: <?php echo $phase_scores[2]; ?>%</div>
        <div class="phase-box">Technical: <?php echo $phase_scores[3]; ?>%</div>
    </div>

    <div class="row">

        <!-- Strengths -->
        <div class="col-md-6">
            <h4 class="section-title">🚀 Your Strengths</h4>

            <?php foreach($skill_details as $skill): ?>
                <?php if($skill['percent'] >= 80): ?>
                    <div class="skill-box">
                        <strong><?php echo $skill['name']; ?></strong>

                        <div class="progress mt-2">
    <div class="progress-bar"
         data-width="<?php echo $skill['percent']; ?>">
    </div>
</div>

                        <small><?php echo $skill['percent']; ?>%</small>
                    </div>
                <?php endif; ?>
            <?php endforeach; ?>
        </div>

        <!-- Gaps -->
        <div class="col-md-6">
            <h4 class="section-title">⚠️ Improve These Skills</h4>

            <?php if(!empty($missing_skills)): ?>
                <div class="missing-box">

                    <?php foreach($missing_skills as $gap): ?>
                        <div class="mb-3">
                            <strong><?php echo $gap['name']; ?></strong>

                           <div class="progress mt-2">
<?php
$color = $gap['percent'] >= 80 ? '#2AA9A1' : ($gap['percent'] >= 50 ? '#E3B23C' : '#dc3545');
?>

<div class="progress-bar"
     data-width="<?php echo $gap['percent']; ?>"
     style="background: <?php echo $color; ?>">
</div>
</div>

<small><?php echo $gap['percent']; ?>% (Target: 80%+)</small>
                    <?php endforeach; ?>

                </div>
            <?php else: ?>
                <div class="alert alert-success text-center">
                    🎉 No skill gaps!
                </div>
            <?php endif; ?>
        </div>

    </div>
<br>

    <!-- Insight -->
    <div class="insight-box mt-4">
        <h5>📌 Insight</h5>

        <?php if($career_match >= 75): ?>
            <p>You are highly aligned with this career. Keep refining your advanced skills.</p>
        <?php elseif($career_match >= 50): ?>
            <p>You are on the right track. Focus on improving weaker areas.</p>
        <?php else: ?>
            <p>You need to strengthen core skills to match this career path.</p>
        <?php endif; ?>
    </div>

    <!-- Button -->
    <div class="btn-wrapper">
        <a href="dashboard.php" class="btn btn-primary">
            Go To Dashboard
        </a>
    </div>

</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.progress-bar').forEach(function(bar) {
        let value = bar.getAttribute('data-width') || 0;
        bar.style.width = "0%";
        setTimeout(() => {
            bar.style.width = value + "%";
        }, 200);
    });
});
</script>
</body>
</html>