<?php
session_start();
include '../config.php';

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

if($_SERVER["REQUEST_METHOD"]=="POST"){
    $age = $_POST['age'];
    $gender = $_POST['gender'];
    $education_level = $_POST['education_level'];
    $experience_level = $_POST['experience_level'];
    $target_career = $_POST['target_career'];
    $skills = isset($_POST['skills']) ? implode(",", $_POST['skills']) : "";

    $check = $conn->prepare("SELECT profile_id FROM user_profile WHERE user_id=?");
    $check->bind_param("i",$user_id);
    $check->execute();
    $result = $check->get_result();

    if($result->num_rows > 0){
        $stmt = $conn->prepare("UPDATE user_profile 
        SET age=?, gender=?, education_level=?, experience_level=?, skills=?, target_career=? 
        WHERE user_id=?");
        $stmt->bind_param("isssssi",$age,$gender,$education_level,$experience_level,$skills,$target_career,$user_id);
    }else{
        $stmt = $conn->prepare("INSERT INTO user_profile
        (user_id, age, gender, education_level, experience_level, skills, target_career)
        VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("iisssss",$user_id,$age,$gender,$education_level,$experience_level,$skills,$target_career);
    }

    if(!$stmt->execute()){
        die("Database Error: " . $stmt->error);
    }

// Check if assessment already completed
$checkAssessment = $conn->prepare("SELECT assessment_completed FROM user_profile WHERE user_id=?");
$checkAssessment->bind_param("i", $user_id);
$checkAssessment->execute();
$res = $checkAssessment->get_result();
$row = $res->fetch_assoc();

if($row && $row['assessment_completed'] == 1){
    header("Location: /career_navigator/user/dashboard.php");
} else {
    header("Location: /career_navigator/user/assessment.php?start=1");
}
exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Career Navigator | Profile Setup</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
/* === GLOBAL === */
body {
  font-family: 'Poppins', sans-serif;
  background: linear-gradient(135deg, #e0f7f5, #f0f4ff, #d9f0f8);
  min-height: 100vh;
  margin: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px 20px;
  color: #1F3B5B;
}

/* === GLASS CARD CONTAINER === */
.profile-card {
  background: rgba(255,255,255,0.8);
  backdrop-filter: blur(15px);
  border-radius: 25px;
  padding: 40px 50px;
  max-width: 700px;
  width: 100%;
  box-shadow: 0 15px 40px rgba(0,0,0,0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.profile-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 25px 60px rgba(0,0,0,0.15);
}

/* === HEADINGS === */
.profile-card h2 {
  font-weight: 700;
  text-align: center;
  margin-bottom: 30px;
  color: #1F3B5B;
}

/* === FORM ELEMENTS === */
.form-group {
  margin-bottom: 20px;
}

label {
  font-weight: 600;
  margin-bottom: 6px;
  display: block;
}

input[type="number"],
select {
  width: 100%;
  padding: 12px 15px;
  font-size: 1rem;
  border-radius: 12px;
  border: 2px solid #cbd5e1;
  background: #f9fafb;
  color: #1F3B5B;
  transition: 0.3s;
}

input[type="number"]:focus,
select:focus {
  border-color: #2AA9A1;
  box-shadow: 0 0 10px #2AA9A1aa;
  outline: none;
  background: #e0f7f5;
}

/* === SKILLS PILL === */
.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
  gap: 10px;
}
.skill-pill {
  padding: 10px 18px;
  border-radius: 50px;
  background: #f0f4ff;
  text-align: center;
  font-weight: 500;
  cursor: pointer;
  transition: 0.3s;
  user-select: none;
  border: 1px solid #cbd5e1;
}
.skill-pill.selected {
  background: #2AA9A1;
  color: white;
  border-color: #2AA9A1;
}

/* === BUTTONS === */
.btn-submit {
  background: linear-gradient(135deg, #2AA9A1, #00c6ff);
  color: white;
  font-weight: 600;
  border-radius: 50px;
  padding: 12px 35px;
  width: 100%;
  border: none;
  transition: 0.3s;
}
.btn-submit:hover {
  box-shadow: 0 0 20px #00c6ff77;
  transform: translateY(-2px);
}

/* === RESPONSIVE === */
@media(max-width:768px){
  .profile-card {
    padding: 30px 25px;
  }
}
/* Wizard Card Background */
.wizard-card {
  position: relative; 
  flex: 1.2;
  padding: 50px 45px;
  border-radius: 30px 0 0 30px;
  box-shadow: 0 0 30px #00f0ff55;
  overflow: hidden; 
}
.wizard-card h3 {
    text-align: center;
    font-weight: 700;
    font-size: 1.8rem;    /* Bigger text */
    color: #1F3B5B;
    margin-bottom: 15px;
}
/* Background Image */
.card-bg {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 70%;   /* fixed size */
  height: auto; 
  opacity: 0.3; 
  z-index: 0;
  pointer-events: none; 
}

/* Floating SVGs */
.floating-svg {
  position: absolute;
  width: 70px;
  height: 70px;
  opacity: 0.95;
  z-index: 0;
  pointer-events: none;
}

/* Individual positions */
.svg1 { top: -20px; left: -50px; animation: float1 5s ease-in-out infinite; }
.svg2 { top: 80px; right: -20px; animation: float2 6s ease-in-out infinite; }
.svg3 { top: 280px; left: -220px; animation: float3 4.5s ease-in-out infinite; }
.svg4 { top: 220px; right: -250px; transform: translateY(-50%); animation: float4 5.5s ease-in-out infinite; }
.svg5 { bottom: 545px; right: -20%; animation: float5 6.5s ease-in-out infinite; }
.svg6 { bottom: 120px; right: 120%; animation: float6 4.8s ease-in-out infinite; }
.svg7 { top: 620px; right: 620px; transform: translateY(-50%); animation: float7 5.5s ease-in-out infinite; }
.svg8 { bottom: 405px; right: -520%; animation: float8 6.5s ease-in-out infinite; }
.svg9 { bottom: 180px; left: 115%; animation: float9 4.8s ease-in-out infinite; }
.svg10 { bottom: 880px; right: 125%; animation: float10 4.8s ease-in-out infinite; }

/* Floating animations with slight variations */
@keyframes float1 { 0%,100%{transform: translateY(0);} 50%{transform: translateY(-12px);} }
@keyframes float2 { 0%,100%{transform: translateY(0);} 50%{transform: translateY(-18px);} }
@keyframes float3 { 0%,100%{transform: translateY(0);} 50%{transform: translateY(-10px);} }
@keyframes float4 { 0%,100%{transform: translateY(-50%);} 50%{transform: translateY(-65%);} }
@keyframes float5 { 0%,100%{transform: translateY(0);} 50%{transform: translateY(-20px);} }
@keyframes float6 { 0%,100%{transform: translateY(0);} 50%{transform: translateY(-15px);} }
@keyframes float7 { 0%,100%{transform: translateY(-50%);} 50%{transform: translateY(-65%);} }
@keyframes float8 { 0%,100%{transform: translateY(0);} 50%{transform: translateY(-20px);} }
@keyframes float9 { 0%,100%{transform: translateY(50);} 80%{transform: translateY(-15px);} }
@keyframes float10 { 0%,100%{transform: translateY(50);} 80%{transform: translateY(-15px);} }

</style>
</head>
<body>

<div class="profile-card">
  
    <!-- Decorative floating SVGs -->
    <img src="../images/compass.svg" class="floating-svg svg1" alt="Compass Icon">
    <img src="../images/light_bulb.png" class="floating-svg svg2" alt="Lightbulb Icon">
    <img src="../images/chart.png" class="floating-svg svg3" alt="Chart Icon">
    <img src="../images/python.svg" class="floating-svg svg4" alt="Star Icon">
    <img src="../images/cap.png" class="floating-svg svg5" alt="Rocket Icon">
    <img src="../images/html.png" class="floating-svg svg6" alt="Cup Icon">
    <img src="../images/machine_learning.png" class="floating-svg svg7" alt="Star Icon">
    <img src="../images/rocket.png" class="floating-svg svg8" alt="Rocket Icon">
    <img src="../images/career-growth.png" class="floating-svg svg9" alt="Cup Icon">
    <img src="../images/certificate.png" class="floating-svg svg10" alt="Cup Icon">

    <div class="wizard-card">
        <!-- Decorative background image -->
    <img src="../images/navigating.png" alt="Background" class="card-bg" />


    <h3>Set Up Your Career Profile</h3>
    <p>Help us understand your background to recommend the best career path.</p>
  

  <form method="POST" id="profileForm">

    <div class="form-group">
      <label for="age">Age</label>
      <input id="age" name="age" type="number" min="10" max="120" placeholder="Enter your age" required>
    </div>

    <div class="form-group">
      <label for="gender">Gender</label>
      <select id="gender" name="gender" required>
        <option value="">Select Gender</option>
        <option>Male</option>
        <option>Female</option>
        <option>Other</option>
      </select>
    </div>

    <div class="form-group">
      <label for="education_level">Education Level</label>
      <select id="education_level" name="education_level" required>
        <option value="">Select Your Qualification</option>
        <option>12th / Higher Secondary</option>
        <option>Diploma</option>
        <option>Bachelor's Degree (BCA, BTech, BSc, BCom, BA)</option>
        <option>Master's Degree (MCA, MTech, MSc, MBA)</option>
        <option>Doctorate (PhD)</option>
        <option>Other</option>
      </select>
    </div>

    <div class="form-group">
      <label for="experience_level">Experience Level</label>
      <select id="experience_level" name="experience_level">
        <option value="">Select Experience Level</option>
        <option>No Professional Experience</option>
        <option>Internship / Training Experience</option>
        <option>Entry-Level Professional (0–2 Years)</option>
        <option>Mid-Level Professional (2–5 Years)</option>
        <option>Senior Professional (5+ Years)</option>
      </select>
    </div>

    <div class="form-group">
      <label>Select Your Skills</label>
      <div class="skills-grid">
        <?php
        $skills_list = ["HTML","CSS","JavaScript","Python","Java","Machine Learning","Cloud","SQL"];
        foreach($skills_list as $skill){
          echo '<label class="skill-pill"><input type="checkbox" name="skills[]" value="'.$skill.'" style="display:none;">'.$skill.'</label>';
        }
        ?>
      </div>
    </div>

    <div class="form-group">
      <label for="target_career">Target Career</label>
      <select id="target_career" name="target_career" required>
        <option value="">Select Career</option>
        <option>Software Developer</option>
        <option>Web Developer</option>
        <option>Data Scientist</option>
        <option>AI Engineer</option>
        <option>Cybersecurity Analyst</option>
        <option>Cloud Engineer</option>
        <option>DevOps Engineer</option>
        <option>Mobile App Developer</option>
        <option>UI/UX Designer</option>
        <option>Network Engineer</option>
      </select>
    </div>

    <button type="submit" class="btn-submit">Start Assessment</button>
  </form>
</div>

<script>
  // Skills selection
  const skillPills = document.querySelectorAll('.skill-pill');
skillPills.forEach(pill=>{
  pill.addEventListener('click', ()=>{
    const checkbox = pill.querySelector('input');
    checkbox.checked = !checkbox.checked;
    pill.classList.toggle('selected', checkbox.checked);
  });
});
</script>

</body>
</html>