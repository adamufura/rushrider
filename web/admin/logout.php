<?php
if (!isset($_SESSION)) {
    session_start();
}

$s_username = $_SESSION['email'];

$s_username = null;

unset($s_username);

session_destroy();
header("Location: signin.php");
