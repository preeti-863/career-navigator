<?php
session_start();
include '../config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

/* =========================
   Ensure attempt exists
=========================== */
if (!isset($_SESSION['attempt_id'])) {
    header("Location: assessment.php?start=1");
    exit();
}

$attempt_id = $_SESSION['attempt_id'];

/* =========================
   Get submitted data
=========================== */
$question_id = intval($_POST['question_id']);
$phase = intval($_POST['phase']);
$answer = $_POST['answer'];
$category = $_POST['category'] ?? null;
$submit_time = time();

/* =========================
   Initialize session variables
=========================== */
if (!isset($_SESSION['phase_questions'][$phase])) $_SESSION['phase_questions'][$phase] = 0;
if (!isset($_SESSION['answered_questions'])) $_SESSION['answered_questions'] = [];
if (!isset($_SESSION['difficulty'])) $_SESSION['difficulty'] = 'medium';
if (!isset($_SESSION['phase_start_time'])) $_SESSION['phase_start_time'] = $submit_time;

$current_difficulty = $_SESSION['difficulty'];

/* =========================
   Fetch correct answer
=========================== */
$stmt = $conn->prepare("SELECT correct_option FROM assessment_questions WHERE id=?");
$stmt->bind_param("i", $question_id);
$stmt->execute();
$res = $stmt->get_result();
if (!$res) die("Error fetching question: " . $conn->error);

$row = $res->fetch_assoc();
$correct_option = $row['correct_option'] ?? '';
$is_correct = ($answer == $correct_option) ? 1 : 0;

/* =========================
   Track response time
=========================== */
$response_time = isset($_SESSION['question_start_time']) 
    ? (time() - $_SESSION['question_start_time']) 
    : 0;

/* =========================
   Save user's answer
=========================== */
$stmt2 = $conn->prepare("
    INSERT INTO user_answers
    (user_id, question_id, phase, selected_option, correct, difficulty, category, response_time)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
");
$stmt2->bind_param("iiisissi", $user_id, $question_id, $phase, $answer, $is_correct, $current_difficulty, $category, $response_time);
$stmt2->execute();

/* =========================
   Update session
=========================== */
$_SESSION['answered_questions'][] = $question_id;
$_SESSION['phase_questions'][$phase]++;

/* =========================
   Adaptive difficulty logic
=========================== */
$max_questions_per_phase = [1 => 10, 2 => 10, 3 => 15];
$last_phase = 3;

if ($phase < 3) {
    if ($is_correct) {
        if ($current_difficulty == "easy") $new_difficulty = "medium";
        elseif ($current_difficulty == "medium") $new_difficulty = "difficult";
        else $new_difficulty = "difficult";
    } else {
        if ($current_difficulty == "difficult") $new_difficulty = "medium";
        elseif ($current_difficulty == "medium") $new_difficulty = "easy";
        else $new_difficulty = "easy";
    }
    $_SESSION['difficulty'] = $new_difficulty;
}

/* =========================
   Phase 3 adaptive difficulty
=========================== */
if ($phase == 3) {
    if (!isset($_SESSION['difficulty_set'])) {
        $phase1_correct = (int) mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM user_answers WHERE user_id='$user_id' AND phase=1 AND correct=1"))[0];
        $phase2_correct = (int) mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM user_answers WHERE user_id='$user_id' AND phase=2 AND correct=1"))[0];

        $python = "D:\\Python312\\python.exe";
        $script = "D:\\career_navigator_project\\ml_files\\predict_skills.py";
        $command = "\"$python\" \"$script\" $phase1_correct $phase2_correct 0 2>&1";

        $output = [];
        $return_var = null;
        exec($command, $output, $return_var);

        $predicted_level = "Intermediate";
        if ($return_var === 0 && !empty($output)) {
            foreach(array_reverse($output) as $line){
                $line = trim($line);
                if(in_array($line, ["Beginner","Intermediate","Advanced"])){
                    $predicted_level = $line;
                    break;
                }
            }
        }

        switch($predicted_level){
            case "Beginner": $_SESSION['difficulty'] = "easy"; break;
            case "Intermediate": $_SESSION['difficulty'] = "medium"; break;
            case "Advanced": $_SESSION['difficulty'] = "difficult"; break;
        }

        $_SESSION['difficulty_set'] = true;
    }

    $current_difficulty = $_SESSION['difficulty'];

    if ($is_correct === 1) {
        if ($current_difficulty == "easy") $new_difficulty = "medium";
        elseif ($current_difficulty == "medium") $new_difficulty = "difficult";
        else $new_difficulty = "difficult";
    } elseif ($is_correct === 0) {
        if ($current_difficulty == "difficult") $new_difficulty = "medium";
        elseif ($current_difficulty == "medium") $new_difficulty = "easy";
        else $new_difficulty = "easy";
    }

    if (isset($new_difficulty)) $_SESSION['difficulty'] = $new_difficulty;
}

/* =========================
   Phase completion check
=========================== */
if ($_SESSION['phase_questions'][$phase] >= $max_questions_per_phase[$phase]) {
    $_SESSION['phase_start_time'] = time();

    if ($phase < $last_phase) {
        header("Location: assessment.php?phase=".($phase+1));
        exit();
    }

    /* =========================
       FINAL PHASE COMPLETE - CALCULATE SKILLS
    ============================ */

    // Fetch user's target career and career_id
    $profile_query = $conn->prepare("SELECT target_career FROM user_profile WHERE user_id=?");
    $profile_query->bind_param("i", $user_id);
    $profile_query->execute();
    $profile_res = $profile_query->get_result();
    $profile = $profile_res->fetch_assoc();
    if (!$profile) die("Profile not found.");

    $career_name = $profile['target_career'];

    $career_query = $conn->prepare("SELECT career_id FROM careers WHERE career_name=?");
    $career_query->bind_param("s", $career_name);
    $career_query->execute();
    $career_res = $career_query->get_result();
    $career_row = $career_res->fetch_assoc();
    $career_id = $career_row['career_id'] ?? 0;
    if ($career_id == 0) die("Career ID not found.");

    // Fetch all Phase 3 skills and user answers
    $skills_query = $conn->prepare("
    SELECT s.skill_id, s.skill_name, COUNT(aq.id) AS total_questions,
           IFNULL(SUM(ua.correct),0) AS correct_answers
    FROM skills s
    JOIN career_skills cs ON cs.skill_id = s.skill_id
    LEFT JOIN assessment_questions aq 
        ON aq.skill_id = s.skill_id AND aq.phase=3
    LEFT JOIN user_answers ua 
        ON ua.question_id = aq.id AND ua.user_id = ?
    WHERE cs.career_id = ?
    GROUP BY s.skill_id
");
$skills_query->bind_param("ii", $user_id, $career_id);
    $skills_query->execute();
    $res_skills = $skills_query->get_result();

    $user_skills = [];
    $strengths = [];
    $weak_skills = [];

    while($row = $res_skills->fetch_assoc()){
        $skill_name = $row['skill_name'];
        $total = (int)$row['total_questions'];
        $correct = (int)$row['correct_answers'];
        if($total == 0) continue;

        $percent = round(($correct / $total) * 100);
        $user_skills[$skill_name] = $percent;

        if($percent >= 70) $strengths[] = $skill_name;
        else $weak_skills[] = $skill_name;
    }

    // Fetch missing skills user did not attempt at all
    $missing_skills = [];
    $gap_query = $conn->prepare("
        SELECT s.skill_name
        FROM career_skills cs
        JOIN skills s ON cs.skill_id = s.skill_id
        WHERE cs.career_id = ?
        AND s.skill_id NOT IN (
            SELECT DISTINCT aq.skill_id
            FROM user_answers ua
            JOIN assessment_questions aq ON ua.question_id = aq.id
            WHERE ua.user_id = ?
        )
    ");
    $gap_query->bind_param("si", $career_id, $user_id);
    $gap_query->execute();
    $gap_res = $gap_query->get_result();
    while ($row = $gap_res->fetch_assoc()) $missing_skills[] = $row['skill_name'];

    // Merge weak skills into missing skills
    $missing_skills = array_values(array_unique(array_merge($missing_skills, $weak_skills)));

    // Save to session
    $_SESSION['user_skills'] = $user_skills;
    $_SESSION['strengths'] = $strengths;
    $_SESSION['weak_skills'] = $weak_skills;
    $_SESSION['missing_skills'] = $missing_skills;

    // Mark assessment complete
    $update = $conn->prepare("UPDATE user_profile SET assessment_completed = 1 WHERE user_id=?");
    $update->bind_param("i", $user_id);
    $update->execute();

    // Clear session variables
    unset($_SESSION['difficulty'], $_SESSION['answered_questions'], $_SESSION['phase_start_time'], $_SESSION['phase_questions'], $_SESSION['attempt_id'], $_SESSION['difficulty_set']);

    // Update skill_gap table
    $stmt_del = $conn->prepare("DELETE FROM skill_gap WHERE user_id=? AND career_id=?");
    $stmt_del->bind_param("ii", $user_id, $career_id);
    $stmt_del->execute();

    foreach ($missing_skills as $skill_name) {
        $stmt_skill = $conn->prepare("SELECT skill_id FROM skills WHERE skill_name = ?");
        $stmt_skill->bind_param("s", $skill_name);
        $stmt_skill->execute();
        $skill_res = $stmt_skill->get_result();
        if ($row = $skill_res->fetch_assoc()) {
            $skill_id = $row['skill_id'];
            $stmt_insert = $conn->prepare("
                INSERT INTO skill_gap (user_id, career_id, missing_skill_id)
                VALUES (?, ?, ?)
                ON DUPLICATE KEY UPDATE created_at = CURRENT_TIMESTAMP
            ");
            $stmt_insert->bind_param("iii", $user_id, $career_id, $skill_id);
            $stmt_insert->execute();
        }
    }

    header("Location: result.php");
    exit();
}

// Continue same phase
header("Location: assessment.php?phase=$phase&last_correct=$is_correct");
exit();
?>   