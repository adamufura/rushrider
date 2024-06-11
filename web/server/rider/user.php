<?php 

header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

require 'user_init.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'POST' && isset($_POST['getUser'])) {
	echo json_encode(getUserByEmail($_POST['email']));
	return;
}

?>