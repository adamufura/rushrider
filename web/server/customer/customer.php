<?php 

header('Content-Type: application/json');
// header("Access-Control-Allow-Origin: *");

require '../rider/user_init.php';

$method = $_SERVER['REQUEST_METHOD'];


if ($method == 'POST' && isset($_POST['startTrackingOrder'])) {
    // echo json_encode(['status' => 'success']);
    $email = mysqli_real_escape_string($connection, sanitizeInput($_POST['email']));
    $tracking_code = mysqli_real_escape_string($connection, sanitizeInput($_POST['tracking_code']));

    return startTrackingOrder($email, $tracking_code);
}


function startTrackingOrder($email, $tracking_code){
        if (empty($email)) {
        echo json_encode([
            'error' => "Email cannot be empty"
            ]);
            return; 
    } 
   
    // password validation
    if (empty($tracking_code)) {
        echo json_encode([
            'error' => "Tracking code cannot be empty"
            ]);
            return; 
    } 

     // email/password validation
        if (orderExists($email, $tracking_code)) {
            echo json_encode([
            'status' => true, 'email' => $email, 'tracking_code'=>  $tracking_code
            ]);
            return;
        }else{
            echo json_encode([
            'error' => "Incorrect Email/Code"
            ]);
            return; 
        }
}

?>