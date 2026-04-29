<?php
session_start();
include "../includes/db.php";

$result = mysqli_query($conn, "SELECT skills.*, users.name FROM skills JOIN users ON skills.user_id = users.id");
while ($row = mysqli_fetch_assoc($result)) {
    echo $row['skill_name']." by ".$row['name']." ";
    echo "<a href='session.php?skill=".$row['id']."'>Request</a><br>";
}
?>
