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
   FETCH ALL SKILLS
============================ */
$all_skills = $conn->query("SELECT * FROM skills");

/* ============================
   FETCH USER SKILLS
============================ */
$user_skills = $conn->query("
    SELECT skills.skill_id, skills.skill_name, skills.category, 
           user_skill_mapping.proficiency_level
    FROM user_skill_mapping
    JOIN skills ON skills.skill_id = user_skill_mapping.skill_id
    WHERE user_skill_mapping.user_id = $user_id
");

/* ============================
   Count Skills Added
============================ */
$skill_count_result = $conn->query("SELECT COUNT(*) as total 
                                    FROM user_skill_mapping 
                                    WHERE user_id=$user_id");
$skill_count = $skill_count_result->fetch_assoc()['total'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Manage Skills - Career Navigator</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
:root {
    --primary: #2AA9A1;
    --dark-blue: #1F3B5B;
    --soft-bg: #F4F7FB;
}

body {
    background: var(--soft-bg);
    font-family: 'Poppins', sans-serif;
}

/* Sidebar */
.sidebar {
    width: 260px;
    height: 100vh;
    background: linear-gradient(180deg, #1F3B5B, #162c45);
    position: fixed;
    padding: 30px 20px;
    color: white;
}

.sidebar h4 {
    font-weight: 700;
    margin-bottom: 40px;
}

.sidebar a {
    display: block;
    color: #cbd5e1;
    text-decoration: none;
    padding: 12px 15px;
    border-radius: 10px;
    margin-bottom: 8px;
    transition: 0.3s ease;
}

.sidebar a:hover,
.sidebar a.active {
    background: var(--primary);
    color: white;
}

/* Main */
.main {
    margin-left: 260px;
    padding: 40px;
}

/* Card */
.card-custom {
    border: none;
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.05);
    background: white;
}

/* Buttons */
.btn-primary {
    background: var(--primary);
    border: none;
    border-radius: 50px;
    padding: 8px 20px;
    transition: 0.3s;
}
.btn-primary:hover {
    background: #1e8f88;
}

.btn-danger {
    border-radius: 50px;
    padding: 6px 15px;
}

.table thead {
    background: var(--dark-blue);
    color: white;
}

.skill-badge {
    font-weight: 500;
    font-size: 0.9rem;
    padding: 0.35rem 0.6rem;
}

/* Toast */
.toast-container {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 9999;
}

@media(max-width:768px){
    .sidebar{display:none;}
    .main{margin-left:0;padding:20px;}
}
</style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4>Career Navigator</h4>
    <a href="dashboard.php">🏠 Dashboard</a>
    <a href="profile.php">👤 Profile</a>
    <a href="skills.php" class="active">🛠 Skills</a>
    <a href="careers.php">🎯 Careers</a>
    <a href="progress.php">📊 Progress</a>
    <a href="recommendation.php">🤖 AI Recommendation</a>
    <a href="resume.php">📄 Resume Analyzer</a>
    <a href="../logout.php" class="text-warning mt-4">🚪 Logout</a>
</div>

<div class="main">

    <!-- Page Title -->
    <div class="mb-4 d-flex justify-content-between align-items-center">
        <div>
            <h4 class="fw-semibold">Manage Your Skills</h4>
            <p class="text-muted mb-0">Add and manage your technical expertise</p>
        </div>
        <div>
            <span class="badge bg-primary p-2">Total Skills Added: <span id="skill-count"><?= $skill_count ?></span></span>
        </div>
    </div>

    <!-- Add Skill Card -->
    <div class="card card-custom mb-4">
        <h5 class="mb-3 fw-semibold">Add New Skill</h5>

        <form id="add-skill-form">
            <div class="row g-3 align-items-end">

                <div class="col-md-5">
                    <label class="form-label">Select Skill</label>
                    <select name="skill_id" id="skill_id" class="form-select" required>
                        <option value="">Choose Skill</option>
                        <?php 
                        $all_skills->data_seek(0);
                        while($skill = $all_skills->fetch_assoc()) { ?>
                            <option value="<?= $skill['skill_id']; ?>">
                                <?= $skill['skill_name']; ?> (<?= $skill['category']; ?>)
                            </option>
                        <?php } ?>
                    </select>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Proficiency Level</label>
                    <select name="proficiency" id="proficiency" class="form-select" required>
                        <option value="">Select Level</option>
                        <option value="Beginner">Beginner</option>
                        <option value="Intermediate">Intermediate</option>
                        <option value="Advanced">Advanced</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary w-100">
                        Add Skill
                    </button>
                </div>

            </div>
        </form>
    </div>

    <!-- User Skills Card -->
    <div class="card card-custom">
        <h5 class="mb-3 fw-semibold">Your Added Skills</h5>

        <div class="table-responsive">
            <table class="table table-bordered align-middle text-center" id="skills-table">
                <thead>
                    <tr>
                        <th>Skill Name</th>
                        <th>Category</th>
                        <th>Proficiency</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <?php 
                $user_skills->data_seek(0);
                if ($user_skills->num_rows > 0) { 
                    while($row = $user_skills->fetch_assoc()) { ?>
                        <tr id="skill-<?= $row['skill_id'] ?>">
                            <td><?= $row['skill_name']; ?></td>
                            <td><?= $row['category']; ?></td>
                            <td>
                                <span class="badge bg-info skill-badge">
                                    <?= $row['proficiency_level']; ?>
                                </span>
                            </td>
                            <td>
                                <button class="btn btn-danger btn-sm remove-skill" data-id="<?= $row['skill_id'] ?>">Remove</button>
                            </td>
                        </tr>
                    <?php } 
                } else { ?>
                    <tr id="no-skills">
                        <td colspan="4" class="text-muted">No skills added yet.</td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- Toast Container -->
<div class="toast-container"></div>

<script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function(){

    // Show Toast
    function showToast(message, bg='bg-success'){
        let toastHTML = `
            <div class="toast ${bg} text-white align-items-center border-0 mb-2" role="alert" aria-live="assertive" aria-atomic="true">
              <div class="d-flex">
                <div class="toast-body">${message}</div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
              </div>
            </div>
        `;
        let $toast = $(toastHTML);
        $('.toast-container').append($toast);
        let toast = new bootstrap.Toast($toast[0], { delay: 2500 });
        toast.show();
    }

    // Add Skill
    $('#add-skill-form').submit(function(e){
        e.preventDefault();
        let skill_id = $('#skill_id').val();
        let proficiency = $('#proficiency').val();

        if(skill_id && proficiency){
            $.post('ajax_skills.php', { action: 'add', skill_id: skill_id, proficiency: proficiency }, function(response){
                let data = JSON.parse(response);

                if(data.status === 'success'){
                    let newRow = `<tr id="skill-${data.skill_id}">
                        <td>${data.skill_name}</td>
                        <td>${data.category}</td>
                        <td><span class="badge bg-info skill-badge">${data.proficiency}</span></td>
                        <td><button class="btn btn-danger btn-sm remove-skill" data-id="${data.skill_id}">Remove</button></td>
                    </tr>`;

                    if($('#no-skills').length) $('#no-skills').remove();
                    $('#skills-table tbody').append(newRow);

                    // Update skill count dynamically
                    $('#skill-count').text(data.total_skills);

                    // Reset form
                    $('#skill_id').val('');
                    $('#proficiency').val('');

                    showToast('Skill added successfully!');
                } else {
                    showToast('Error: '+data.message, 'bg-danger');
                }
            });
        }
    });

    // Remove Skill
    $(document).on('click', '.remove-skill', function(){
        let skill_id = $(this).data('id');
        if(confirm('Are you sure you want to remove this skill?')){
            $.post('ajax_skills.php', { action: 'remove', skill_id: skill_id }, function(response){
                let data = JSON.parse(response);

                if(data.status === 'success'){
                    $('#skill-'+skill_id).remove();
                    $('#skill-count').text(data.total_skills);

                    if(data.total_skills === 0){
                        $('#skills-table tbody').html('<tr id="no-skills"><td colspan="4" class="text-muted">No skills added yet.</td></tr>');
                    }
                    showToast('Skill removed successfully!');
                } else {
                    showToast('Error removing skill', 'bg-danger');
                }
            });
        }
    });

});
</script>
</body>
</html>