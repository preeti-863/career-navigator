<?php
session_start();
include "../includes/db.php";

$skill_id = $_GET['skill'];
$seeker = $_SESSION['user_id'];

$skill = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM skills WHERE id=$skill_id"));
$provider = $skill['user_id'];

mysqli_query($conn, "INSERT INTO sessions(provider_id,seeker_id,skill_id,status)
VALUES($provider,$seeker,$skill_id,'requested')");

echo "Session requested successfully";
?>
