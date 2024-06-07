<?php 

header('Content-Type: application/json');
// header("Access-Control-Allow-Origin: *");

require 'user_init.php';

$method = $_SERVER['REQUEST_METHOD'];


if ($method == 'GET' && isset($_GET['getAllRiderOrders'])) {
    $email = mysqli_real_escape_string($connection, sanitizeInput($_GET['email']));
    return getAllRiderOrders($email);
}

if ($method == 'GET' && isset($_GET['getAllRiderPENDINGOrders'])) {
    $email = mysqli_real_escape_string($connection, sanitizeInput($_GET['email']));
    return getAllRiderPENDINGOrders($email);
}

if ($method == 'GET' && isset($_GET['getRiderOrderInfo'])) {
    $id = mysqli_real_escape_string($connection, sanitizeInput($_GET['id']));
    return getRiderOrderInfo($id);
}

if ($method == 'POST' && isset($_POST['setOrderStatus'])) {
    // echo json_encode(['status' => 'success']);
    $id = mysqli_real_escape_string($connection, sanitizeInput($_POST['id']));
    $status = mysqli_real_escape_string($connection, sanitizeInput($_POST['status']));

    return setOrderStatus($id, $status);
}

if ($method == 'POST' && isset($_POST['setOrderLocation'])) {
    // echo json_encode(['status' => 'success']);
    $id = mysqli_real_escape_string($connection, sanitizeInput($_POST['id']));
    $location = mysqli_real_escape_string($connection, sanitizeInput($_POST['location']));

    return setOrderLocation($id, $location);
}

?>