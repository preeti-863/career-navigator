<?php
session_start();
include '../config.php';

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$is_correct = isset($_GET['last_correct']) ? (int)$_GET['last_correct'] : null;
/* =========================
   START NEW ATTEMPT
=========================== */
if(isset($_GET['start']) && $_GET['start'] == 1){
    $_SESSION['attempt_id'] = uniqid();
    $_SESSION['phase_questions'] = [];
    $_SESSION['answered_questions'] = [];
    $_SESSION['difficulty'] = 'difficult';
    $_SESSION['phase_start_time'] = time();
    $_SESSION['current_phase'] = 1;
    // $_SESSION['phase3_correct'] = 0;
    // $_SESSION['phase3_wrong'] = 0;
    header("Location: assessment.php?phase=1");
    exit();
}

/* =========================
   Ensure attempt exists
=========================== */
if(!isset($_SESSION['attempt_id'])){
    header("Location: assessment.php?start=1");
    exit();
}

$attempt_id = $_SESSION['attempt_id'];

/* =========================
   Determine Phase
=========================== */
$phase = isset($_GET['phase']) ? intval($_GET['phase']) : 1;

/* =========================
   Phase settings
=========================== */
$phase_names = [
    1 => "Aptitude Test",
    2 => "Psychometric Test",
    3 => "Career-Focused Test"
];

$phase_durations = [
    1 => 4*60,
    2 => 3*60,
    3 => 6*60
];

$max_questions_per_phase = [
    1 => 10,
    2 => 10,
    3 => 15
];

$max_questions = $max_questions_per_phase[$phase];
$phase_name = $phase_names[$phase];

/* =========================
   Initialize session variables
=========================== */
if(!isset($_SESSION['phase_questions'])) $_SESSION['phase_questions'] = [];
if(!isset($_SESSION['phase_questions'][$phase])) $_SESSION['phase_questions'][$phase] = 0;

if(!isset($_SESSION['answered_questions'])) $_SESSION['answered_questions'] = [];
if(!isset($_SESSION['difficulty'])) $_SESSION['difficulty'] = 'difficult';

$current_difficulty = $_SESSION['difficulty'];
$answered_ids = !empty($_SESSION['answered_questions']) ? implode(",", $_SESSION['answered_questions']) : '0';

/* =========================
   Fetch user career
=========================== */
$profile_query = mysqli_query($conn, "SELECT target_career FROM user_profile WHERE user_id='$user_id'");
if(mysqli_num_rows($profile_query) == 0){
    header("Location: user_details.php");
    exit();
}
$profile = mysqli_fetch_assoc($profile_query);
$career = $profile['target_career'];

/* =========================
   Phase timer
=========================== */
if(!isset($_SESSION['phase_start_time']) || !isset($_SESSION['current_phase']) || $_SESSION['current_phase'] != $phase){
    $_SESSION['phase_start_time'] = time();
    $_SESSION['current_phase'] = $phase;
}
$phase_duration = $phase_durations[$phase];
$time_elapsed = time() - $_SESSION['phase_start_time'];
$time_left = $phase_duration - $time_elapsed;

/* =========================
   Phase complete? Move to next
=========================== */
if($_SESSION['phase_questions'][$phase] >= $max_questions || $time_left <= 0){
    // Only reset for Phase 1 and 2
    if($phase < 3){
        unset($_SESSION['answered_questions']);
        $_SESSION['difficulty'] = 'medium'; // reset difficulty
    }

    if($phase < 3){
        header("Location: assessment.php?phase=".($phase+1));
    } else {
        header("Location: result.php");
    }
    exit();
}
/* =========================
   Fetch next question
=========================== */
$query = "SELECT * FROM assessment_questions
          WHERE phase='$phase'
          AND (career='$career' OR career IS NULL)
          AND difficulty='$current_difficulty'
          AND id NOT IN ($answered_ids)
          ORDER BY id ASC LIMIT 1";

$result = mysqli_query($conn, $query);
$question = mysqli_fetch_assoc($result);

/* Fallback to other difficulties */
$levels = ['easy','medium','difficult'];
if(!$question){

    foreach($levels as $diff){
        if($diff == $current_difficulty) continue;

        $query = "SELECT * FROM assessment_questions
                  WHERE phase='$phase'
                  AND (career='$career' OR career IS NULL)
                  AND difficulty='$diff'
                  AND id NOT IN ($answered_ids)
                  ORDER BY RAND() LIMIT 1";

        $result = mysqli_query($conn, $query);
        $question = mysqli_fetch_assoc($result);
        if($question) break;
    }
}
$_SESSION['question_start_time'] = time();

/* =========================
   Increment question number for display
=========================== */
$display_question_number = $_SESSION['phase_questions'][$phase] + 1;

/* =========================
   Last question of last phase?
=========================== */
$last_phase = 3;
$last_question_count = $max_questions_per_phase[$last_phase];
$is_last_question = ($phase == $last_phase && $display_question_number == $last_question_count);
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $phase_name; ?> - Question <?php echo $display_question_number; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family:'Poppins',sans-serif; color:#1E293B; background: linear-gradient(-45deg, #f4f7fa, #e0f7f5, #e6f0ff, #fdf6e3); background-size:400% 400%; animation:gradientMove 15s ease infinite; min-height:100vh;}
        @keyframes gradientMove{0%{background-position:0% 50%;}50%{background-position:100% 50%;}100%{background-position:0% 50%;}}
        .background-logo {position:absolute; top:50%; left:50%; transform:translate(-50%,-50%); opacity:0.2; width:300px; height:300px; border-radius:50%; z-index:0; pointer-events:none; object-fit:cover;}
        .test-card {max-width:900px;margin:auto;background:rgba(255,255,255,0.9);backdrop-filter:blur(15px);border-radius:20px;padding:35px;box-shadow:0 25px 60px rgba(0,0,0,0.15);border:1px solid rgba(255,255,255,0.5);position:relative;}
        .assessment-header{text-align:center;margin-top:20px;margin-bottom:30px;}
        .assessment-title{font-weight:700;font-size:32px;background:linear-gradient(90deg,#1F3B5B,#2AA9A1,#00c6ff);-webkit-background-clip:text;-webkit-text-fill-color:transparent;}
        .phase-badge{display:inline-block;margin-top:10px;padding:6px 18px;border-radius:30px;background:rgba(4, 70, 66, 0.15);color:#2AA9A1;font-weight:600;font-size:14px;border:1px solid rgba(42,169,161,0.3);}
        .question-block p{font-weight:600;font-size:18px;color:#1F3B5B;}
        .question-block label{display:block;background:white;padding:12px 15px;border-radius:10px;border:1px solid #e2e8f0;margin-bottom:10px;cursor:pointer;transition:0.25s;}
        .question-block label:hover{background:#f0fdfa;border-color:#2AA9A1;}
        .btn-primary{background:linear-gradient(135deg,#2AA9A1,#00c6ff);border:none;border-radius:40px;padding:10px 28px;font-weight:600;transition:0.3s;}
        .btn-primary:hover{transform:translateY(-3px);box-shadow:0 10px 25px rgba(0,198,255,0.3);}
    </style>
</head>
<body>
<div style="position:absolute; top:20px; right:30px; font-weight:bold;">
⏱ Time Left: <span id="timer"></span>
</div>

<div class="assessment-header">
    <h2 class="assessment-title"><?php echo $phase_name; ?></h2>
    <div class="phase-badge">
        Phase <?php echo $phase; ?> — Question <?php echo $display_question_number; ?> of <?php echo $max_questions; ?>
    </div>
</div>

<div class="test-card">
    <div style="background:#e6fffa;padding:8px 15px;border-radius:8px;margin-bottom:15px;font-weight:600;">
Difficulty Level: <?php echo strtoupper($_SESSION['difficulty']); ?>
    </div>

<form action="submit_assessment.php" method="POST" onsubmit="<?php echo $is_last_question ? 'return confirmSubmit()' : ''; ?>">
    <input type="hidden" name="question_id" value="<?php echo $question['id']; ?>">
    <input type="hidden" name="phase" value="<?php echo $phase; ?>">

    <img src="../images/logo.jpeg" alt="Logo" class="background-logo">
    <div class="question-block">
        <h5 class="mb-3"><strong>Question:</strong></h5>
        <p class="mb-4"><strong><?php echo $question['question']; ?></strong></p>
        <?php foreach(['option_a','option_b','option_c','option_d'] as $opt): ?>
            <label class="d-block mb-2">
                <input type="radio" name="answer" value="<?php echo strtoupper(substr($opt,-1)); ?>" required>
                <?php echo $question[$opt]; ?>
            </label>
        <?php endforeach; ?>
        <div class="text-end mt-4">
            <button type="submit" class="btn btn-primary">
                <?php echo $is_last_question ? 'Submit & Finish' : 'Submit & Next'; ?>
            </button>
        </div>
        <br>
        <?php if($is_correct !== null): ?>
    <div class="alert <?php echo $is_correct ? 'alert-success' : 'alert-danger'; ?>">
        <?php echo $is_correct ? 'Correct Answer!' : 'Wrong Answer!'; ?>
    </div>
<?php endif; ?>
    </div>

</form>

<script>
let time = <?php echo $time_left; ?>;
let timer = setInterval(function(){
    time--;
    let minutes = Math.floor(time/60);
    let seconds = time % 60;
    document.getElementById("timer").innerHTML = minutes + ":" + (seconds<10?"0"+seconds:seconds);
    if(time <= 0){
        clearInterval(timer);
        alert("Time is up for this phase!");
        window.location.href = "assessment.php?phase=<?php echo $phase; ?>&timeout=1";
    }
},1000);

function confirmSubmit() {
    return confirm("Are you sure you want to submit the test? Once submitted, you cannot go back.");
}
</script>
</body>
</html>