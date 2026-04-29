<?php
session_start();

/* Unset all session variables */
$_SESSION = [];

/* Delete session cookie (important for security) */
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(
        session_name(),
        '',
        time() - 42000,
        $params["path"],
        $params["domain"],
        $params["secure"],
        $params["httponly"]
    );
}

/* Destroy the session */
session_destroy();

/* Regenerate session ID */
session_regenerate_id(true);

/* Redirect to homepage */
header("Location: home_page.php?logout=success");
exit();
?>
