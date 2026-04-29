<?php
session_start();
include '../config.php';

$user_id = (int)$_SESSION['user_id'];
$action = $_POST['action'] ?? '';

if($action == 'count'){
    $count_result = $conn->query("SELECT COUNT(*) as total FROM user_skill_mapping WHERE user_id=$user_id");
    $total_skills = $count_result->fetch_assoc()['total'] ?? 0;
    echo json_encode(['total_skills' => $total_skills]);
    exit();
}

if($action == 'add'){
    $skill_id = (int)($_POST['skill_id'] ?? 0);
    $proficiency = $conn->real_escape_string($_POST['proficiency'] ?? '');

    if($skill_id && $proficiency){
        // Check if already exists
        $check = $conn->query("SELECT * FROM user_skill_mapping WHERE user_id=$user_id AND skill_id=$skill_id");
        if($check->num_rows == 0){
            if(!$conn->query("INSERT INTO user_skill_mapping(user_id, skill_id, proficiency_level) 
                              VALUES($user_id, $skill_id, '$proficiency')")){
                echo json_encode([
                    'status' => 'error',
                    'message' => $conn->error
                ]);
                exit();
            }
        }

        // Update skill count
        $count_result = $conn->query("SELECT COUNT(*) as total FROM user_skill_mapping WHERE user_id=$user_id");
        $total_skills = $count_result->fetch_assoc()['total'] ?? 0;

        // Get skill details
        $skill = $conn->query("SELECT * FROM skills WHERE skill_id=$skill_id")->fetch_assoc();

        echo json_encode([
            'status' => 'success',
            'skill_id' => $skill_id,
            'skill_name' => $skill['skill_name'],
            'category' => $skill['category'],
            'proficiency' => $proficiency,
            'total_skills' => $total_skills
        ]);
    } else {
        echo json_encode(['status'=>'error','message'=>'Invalid data']);
    }
    exit();
}

if($action == 'remove'){
    $skill_id = (int)($_POST['skill_id'] ?? 0);
    $delete_result = $conn->query("DELETE FROM user_skill_mapping WHERE user_id=$user_id AND skill_id=$skill_id");

    $count_result = $conn->query("SELECT COUNT(*) as total FROM user_skill_mapping WHERE user_id=$user_id");
    $total_skills = $count_result->fetch_assoc()['total'] ?? 0;

    if($delete_result){
        echo json_encode([
            'status' => 'success',
            'total_skills' => $total_skills
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Failed to remove skill'
        ]);
    }
    exit();
}
?>