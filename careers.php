<?php
session_start();
include '../config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$user_id = (int)$_SESSION['user_id'];
$full_name = htmlspecialchars($_SESSION['full_name']);

// Fetch all careers
$careers = $conn->query("SELECT * FROM careers");

// Fetch user's selected career
$current = $conn->query("
    SELECT career_id 
    FROM user_career
    WHERE user_id = $user_id
");
$current_career_id = $current->num_rows > 0 ? $current->fetch_assoc()['career_id'] : null;
$limit = 6; // careers per page
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $limit;

$careers = $conn->query("SELECT * FROM careers WHERE category='Technical' ORDER BY career_name ASC LIMIT $limit OFFSET $offset");

// Count total for pagination
$total_result = $conn->query("SELECT COUNT(*) as total FROM careers WHERE category='Technical'");
$total_careers = $total_result->fetch_assoc()['total'];
$total_pages = ceil($total_careers / $limit);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Careers - Career Navigator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
    :root {
        --primary: #2AA9A1;
        --dark-blue: #1F3B5B;
        --soft-bg: #F4F7FB;
    }

    body { font-family: 'Poppins', sans-serif; background: var(--soft-bg); }

    .sidebar {
        width: 260px;
        height: 100vh;
        background: linear-gradient(180deg, #1F3B5B, #162c45);
        position: fixed;
        padding: 30px 20px;
        color: white;
    }

    .sidebar h4 { font-weight:700; margin-bottom:40px; }
    .sidebar a { display:block; color:#cbd5e1; text-decoration:none; padding:12px 15px; border-radius:10px; margin-bottom:8px; }
    .sidebar a:hover, .sidebar a.active { background: var(--primary); color:white; }

    .main { margin-left: 260px; padding: 40px; }

    .career-card {
        background: white;
        border-radius: 20px;
        padding: 25px;
        box-shadow: 0 12px 35px rgba(0,0,0,0.06);
        transition: all 0.3s ease;
        border: 1px solid transparent;
    }

    .career-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 18px 45px rgba(0,0,0,0.08);
    }

    .selected {
        border: 2px solid var(--primary);
        background: linear-gradient(145deg, #ffffff, #f4fbfa);
    }

    .btn-primary {
        background: var(--primary);
        border: none;
        border-radius: 50px;
        padding: 8px 20px;
        font-weight: 500;
    }

    .btn-primary:hover {
        background: #1e8f88;
    }
    
    .btn-outline-success {
        border-radius: 50px;
    }
    @media(max-width:768px){ .sidebar{display:none;} .main{margin-left:0;padding:20px;} }
    </style>
</head>

<body>

<div class="sidebar">
    <h4>Career Navigator</h4>
    <a href="dashboard.php">🏠 Dashboard</a>
    <a href="profile.php">👤 Profile</a>
    <a href="skills.php">🛠 Skills</a>
    <a href="careers.php" class="active">🎯 Careers</a>
    <a href="progress.php">📊 Progress</a>
    <a href="recommendation.php">🤖 AI Recommendation</a>
    <a href="resume.php">📄 Resume Analyzer</a>
    <a href="../logout.php" class="text-warning mt-4">🚪 Logout</a>
</div>

<div class="main">

    <!-- Page Header -->
    <div class="mb-5">
        <h3 class="fw-bold mb-2">🎯 Explore Career Paths</h3>
        <p class="text-muted">
            Discover high-demand career opportunities aligned with your skills and ambitions.
            Select a target career to unlock personalized recommendations and growth insights.
        </p>
    </div>

    <!-- Search + Filter Row -->
    <div class="card mb-4 p-3 shadow-sm border-0 rounded-4">
        <div class="row g-3 align-items-center">
            <div class="col-md-8">
                <input type="text" class="form-control rounded-pill px-4" 
                       placeholder="Search careers (e.g., Software Developer, Data Analyst)">
            </div>
            <div class="col-md-4 text-end">
                <span class="text-muted small">
                    <?= $careers->num_rows ?> Career Paths Available
                </span>
            </div>
        </div>
    </div>

    <!-- Career Cards -->
    <div class="row g-4">
        <?php while($career = $careers->fetch_assoc()) { ?>
            <div class="col-lg-4 col-md-6">
                <div class="career-card p-4 
                    <?= ($career['career_id']==$current_career_id)?'selected shadow-lg':'' ?>">

                    <!-- Title -->
                    <h5 class="fw-semibold mb-2">
                        <?= $career['career_name']; ?>
                    </h5>

                    <!-- Category -->
                    <span class="badge bg-light text-dark mb-3">
                        <?= $career['category']; ?>
                    </span>

                    <!-- Description -->
                    <p class="text-muted small mb-3">
                        <?= substr($career['description'],0,120) ?>...
                    </p>

                    <!-- Extra Info Row -->
                    <div class="d-flex justify-content-between small mb-3">
                        <span class="text-muted">
                            💰 Avg Salary:
                            <strong><?= $career['avg_salary'] ?? 'N/A' ?></strong>
                        </span>
                        <span class="text-muted">
                            📈 Demand:
                            <strong><?= $career['demand_level'] ?? 'High' ?></strong>
                        </span>
                    </div>

                    <!-- Action Button -->
                    <?php if($career['career_id']==$current_career_id) { ?>
                        <div class="text-success fw-semibold text-center py-2">
                            ✔ Currently Selected
                        </div>
                        <a href="career_details.php?id=<?= $career['career_id']; ?>" 
                           class="btn btn-outline-success w-100 rounded-pill">
                           View Details
                        </a>
                    <?php } else { ?>
                        <a href="career_details.php?id=<?= $career['career_id']; ?>" 
                           class="btn btn-primary w-100 rounded-pill">
                           View Career Path
                        </a>
                    <?php } ?>

                </div>
            </div>
        <?php } ?>
    </div>

</div>
<nav aria-label="Career pagination">
  <ul class="pagination justify-content-center mt-4">
    <?php for($i=1; $i<=$total_pages; $i++) { ?>
      <li class="page-item <?= ($i==$page)?'active':'' ?>">
        <a class="page-link" href="careers.php?page=<?= $i ?>"><?= $i ?></a>
      </li>
    <?php } ?>
  </ul>
</nav>
<script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
