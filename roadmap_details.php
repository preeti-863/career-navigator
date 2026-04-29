<?php
session_start();
include '../config.php';

$user_id = $_SESSION['user_id'] ?? 1;

// 1. SECURE DATA FETCHING
$career_stmt = $conn->prepare("SELECT target_career FROM user_profile WHERE user_id = ?");
$career_stmt->bind_param("i", $user_id);
$career_stmt->execute();
$career_name = $career_stmt->get_result()->fetch_assoc()['target_career'] ?? 'AI Engineer';

$roadmap_query = $conn->prepare("
    SELECT r.*, 
    (SELECT COUNT(*) FROM roadmap_progress p WHERE p.roadmap_id = r.id AND p.user_id = ?) as is_done
    FROM career_roadmap r 
    INNER JOIN careers c ON r.career_id = c.career_id
    WHERE c.career_name = ?
    ORDER BY r.step_order ASC");
$roadmap_query->bind_param("is", $user_id, $career_name);
$roadmap_query->execute();
$steps = $roadmap_query->get_result()->fetch_all(MYSQLI_ASSOC);
$first_incomplete = null;

foreach ($steps as $step) {
    if (!$step['is_done']) {
        $first_incomplete = $step;
        break;
    }
}

// If all steps are completed, just use the last step OR show nothing
if (!$first_incomplete && count($steps) > 0) {
    $first_incomplete = end($steps);
}

// SAFE fallback (no hardcoded "python")
$video_topic = $first_incomplete['step_title'] ?? '';

// 2. TOGGLE PROGRESS LOGIC (AJAX)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['step_id'])) {
    $sid = (int)$_POST['step_id'];
    $action = $_POST['action'];

    if ($action === 'complete') {
        $stmt = $conn->prepare("INSERT IGNORE INTO roadmap_progress (user_id, roadmap_id) VALUES (?, ?)");
    } else {
        $stmt = $conn->prepare("DELETE FROM roadmap_progress WHERE user_id = ? AND roadmap_id = ?");
    }
    
    $stmt->bind_param("ii", $user_id, $sid);
    $stmt->execute();
    echo json_encode(['status' => 'success']);
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Journey to <?= $career_name ?></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --bg-soft: #f8fafc;
            --accent-teal: #2AA9A1;
            --text-dark: #1e293b;
        }

        body { background: var(--bg-soft); font-family: 'Poppins', sans-serif; overflow: hidden; }

        .dashboard-container { display: flex; height: 100vh; }

        /* SIDEBAR */
        .sidebar { width: 240px; background: white; border-right: 1px solid #e2e8f0; padding: 2rem; z-index: 100; }
        .nav-brand { color: var(--accent-teal); font-weight: 800; font-size: 1.4rem; margin-bottom: 2rem; }

        /* CANVAS AREA */
        .roadmap-area { flex-grow: 1; padding: 2rem; position: relative; }
        
        .canvas {
            position: relative; width: 100%; height: 90vh;
            background: #ffffff; border-radius: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.03);
            background-image: radial-gradient(#e2e8f0 1px, transparent 1px);
            background-size: 30px 30px;
        }

        .path-svg { position: absolute; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 1; }

        /* COMPACT NODES */
        .node {
            position: absolute; z-index: 10; cursor: pointer;
            width: 160px; /* Smaller size */
            opacity: 0;
            animation: fadeInScale 0.6s ease forwards;
        }

        @keyframes fadeInScale {
            from { opacity: 0; transform: scale(0.8) translateY(20px); }
            to { opacity: 1; transform: scale(1) translateY(0); }
        }

        .node-card {
            background: white; padding: 10px; border-radius: 12px;
            border: 1px solid #e2e8f0; display: flex; align-items: center; gap: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative; overflow: hidden;
        }

        /* HOVER EFFECT: Expansion */
        .node:hover .node-card {
            width: 240px; /* Expands on hover */
            z-index: 20;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            border-color: var(--accent-teal);
        }

        .node-icon {
            width: 35px; height: 35px; border-radius: 8px;
            display: flex; align-items: center; justify-content: center;
            color: white; font-size: 0.9rem; flex-shrink: 0;
            transition: transform 0.3s;
        }

        .node:hover .node-icon { transform: rotate(10deg) scale(1.1); }

        /* Hidden Description revealed on hover */
        .hover-info {
            max-height: 0; opacity: 0;
            transition: all 0.3s ease;
            font-size: 0.7rem; color: #64748b;
            overflow: hidden;
        }

        .node:hover .hover-info {
            max-height: 50px; opacity: 1; margin-top: 5px;
        }

        /* CHECKMARK */
        .check-badge {
            position: absolute; top: -6px; right: -6px;
            background: #10b981; color: white;
            width: 20px; height: 20px; border-radius: 50%;
            display: none; align-items: center; justify-content: center;
            font-size: 0.6rem; border: 2px solid white; z-index: 15;
        }

        .is-complete .check-badge { display: flex; }
        .is-complete .node-card { border-color: #10b981; background: #f0fdf4; }

        /* SOFT COLORS */
        .c1 { background: #bae6fd; color: #0369a1; } .c2 { background: #bbf7d0; color: #15803d; } 
        .c3 { background: #fef08a; color: #a16207; } .c4 { background: #fecaca; color: #b91c1c; } 
        .c5 { background: #ddd6fe; color: #6d28d9; } .c6 { background: #99f6e4; color: #0f766e; }

        /* COORDINATES */
        .pos-1 { bottom: 12%; left: 15%; animation-delay: 0.1s; }
        .pos-2 { bottom: 25%; left: 50%; animation-delay: 0.2s; }
        .pos-3 { bottom: 45%; left: 20%; animation-delay: 0.3s; }
        .pos-4 { bottom: 62%; left: 55%; animation-delay: 0.4s; }
        .pos-5 { bottom: 78%; left: 82%; animation-delay: 0.5s; }
        .pos-6 { bottom: 86%; left: 30%; animation-delay: 0.6s; }

        /* MODAL */
        .modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(15, 23, 42, 0.4); backdrop-filter: blur(4px);
            display: none; justify-content: center; align-items: center; z-index: 1000;
        }
        .modal-box { background: white; padding: 2rem; border-radius: 20px; width: 340px; text-align: center; border: 1px solid #e2e8f0; }
.video-sidebar {
    width: 100%;
    max-height: calc(100vh - 140px);
    overflow-y: auto;
    padding-right: 6px;
}

/* Smooth scrollbar (optional but nice) */
.video-sidebar::-webkit-scrollbar {
    width: 6px;
}

.video-sidebar::-webkit-scrollbar-thumb {
    background: #cbd5e1;
    border-radius: 10px;
}

.video-sidebar::-webkit-scrollbar-thumb:hover {
    background: #94a3b8;
}
.video-item {
    display: flex;
    gap: 10px;
    margin-bottom: 12px;
    padding: 8px;
    border-radius: 10px;
    transition: 0.2s;
    cursor: pointer;
}

.video-item:hover {
    background: #f1f5f9;
}

.video-thumb {
    width: 120px;
    height: 70px;
    border-radius: 8px;
    object-fit: cover;
    flex-shrink: 0;
}

.video-title {
    font-size: 12px;
    font-weight: 500;
    color: #1e293b;
    line-height: 1.3;
}
.sidebar-wrapper {
    display: flex;
    height: 100vh;
}

.sidebar {
    width: 320px; /* default width */
    min-width: 220px;
    max-width: 500px;
    background: white;
    border-right: 1px solid #e2e8f0;
    padding: 2rem;
    overflow: hidden;
}

.sidebar-resizer {
    width: 5px;
    cursor: ew-resize;
    background: transparent;
    transition: background 0.2s;
}

.sidebar-resizer:hover {
    background: #cbd5e1;
}
    </style>
</head>
<body>

<div class="dashboard-container">
<div class="sidebar-wrapper">
    <div class="sidebar" id="sidebar">
        <div class="nav-brand">Career Navigator</div>

        <div class="small text-muted mb-1">Your Journey</div>
        <div class="fw-bold text-dark"><?= $career_name ?></div><br><br>

        <div class="video-sidebar">
            <h5 class="fw-bold mb-3">Recommended Videos</h5>
            <div id="videoList">Loading...</div>
        </div>
    </div>

    <div class="sidebar-resizer" id="resizer"></div>
</div>
    

    <div class="roadmap-area">
        <h3 class="fw-bold mb-4">Journey to <?= $career_name ?></h3>
        <div class="canvas">
            <svg class="path-svg" viewBox="0 0 1000 800">
                <path d="M 220 680 Q 500 680 550 600 T 300 450 T 600 300 T 880 180 T 400 100" 
                      fill="none" stroke="#e2e8f0" stroke-width="2" stroke-dasharray="10,5" />
            </svg>

            <?php foreach($steps as $index => $row): 
                $num = $index + 1;
                $isDone = (bool)$row['is_done'];
            ?>
                <div class="node pos-<?= $num ?> <?= $isDone ? 'is-complete' : '' ?>" 
                     onclick="toggleStep(<?= $row['id'] ?>, '<?= htmlspecialchars($row['step_title']) ?>', <?= $isDone ? 'true' : 'false' ?>)">
                    
                    <div class="check-badge"><i class="fas fa-check"></i></div>
                    
                    <div class="node-card">
                        <div class="node-icon c<?= ($index % 6) + 1 ?>">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <div>
                            <div class="fw-bold" style="font-size: 0.8rem; color: var(--text-dark);"><?= htmlspecialchars($row['step_title']) ?></div>
                            <div class="hover-info"><?= htmlspecialchars($row['step_description']) ?></div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>

<div class="modal-overlay" id="tModal">
    <div class="modal-box shadow-lg">
        <h6 class="fw-bold mb-2" id="mTitle">Stage Name</h6>
        <p class="text-muted small mb-4" id="mDesc"></p>
        <div class="d-flex gap-2">
            <button class="btn btn-sm btn-light flex-grow-1" onclick="closeModal()">Cancel</button>
            <button class="btn btn-sm btn-primary flex-grow-1" id="actionBtn" onclick="processStatus()">Confirm</button>
        </div>
    </div>
</div>

<script>
    let currentId = null;
    let currentStatus = false;

    function toggleStep(id, title, isDone) {
        currentId = id;
        currentStatus = isDone;
        document.getElementById('mTitle').innerText = title;
        document.getElementById('mDesc').innerText = isDone ? "Mark this step as incomplete?" : "Have you completed this step?";
        
        const btn = document.getElementById('actionBtn');
        btn.innerText = isDone ? "Incomplete" : "Complete";
        btn.className = isDone ? "btn btn-sm btn-danger flex-grow-1" : "btn btn-sm btn-success flex-grow-1";
        
        document.getElementById('tModal').style.display = 'flex';
    }

    function closeModal() { document.getElementById('tModal').style.display = 'none'; }

    async function processStatus() {
        const action = currentStatus ? 'incomplete' : 'complete';
        const data = new FormData();
        data.append('step_id', currentId);
        data.append('action', action);

        await fetch('', { method: 'POST', body: data });
        location.reload();
    }
   async function loadVideos() {
    const topic = "<?= urlencode($video_topic) ?>";

    const res = await fetch("fetch_videos.php?skill=" + topic);
    const data = await res.json();

    let html = "";

    data.forEach(video => {
        html += `
            <div class="video-item" onclick="openVideo('${video.videoId}')">
                <img class="video-thumb" 
                     src="https://img.youtube.com/vi/${video.videoId}/mqdefault.jpg" />

                <div class="video-title">
                    ${video.title}
                </div>
            </div>
        `;
    });

    document.getElementById("videoList").innerHTML = html;
}

function openVideo(id) {
    window.open("https://www.youtube.com/watch?v=" + id, "_blank");
}

loadVideos();
</script>
<script>
const sidebar = document.getElementById("sidebar");
const resizer = document.getElementById("resizer");

let isResizing = false;

resizer.addEventListener("mousedown", function (e) {
    isResizing = true;
    document.body.style.cursor = "ew-resize";
});

document.addEventListener("mousemove", function (e) {
    if (!isResizing) return;

    let newWidth = e.clientX;

    // limits
    if (newWidth < 220) newWidth = 220;
    if (newWidth > 500) newWidth = 500;

    sidebar.style.width = newWidth + "px";
});

document.addEventListener("mouseup", function () {
    isResizing = false;
    document.body.style.cursor = "default";
});
</script>
</body>
</html>