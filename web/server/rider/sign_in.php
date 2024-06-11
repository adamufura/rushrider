<?php

header('Content-Type: application/json');

require 'user_init.php';

if(isset($_POST['email']) && isset($_POST['password'])){
    $email = mysqli_real_escape_string($connection, sanitizeInput($_POST['email']));
    $password = mysqli_real_escape_string($connection, sanitizeInput($_POST['password']));

    //validation 
    // email validation
    if (empty($email)) {
        echo json_encode([
            'error' => "Email cannot be empty"
            ]);
            return; 
    } 
   
    // password validation
    if (empty($password)) {
        echo json_encode([
            'error' => "Password cannot be empty"
            ]);
            return; 
    } 

     // email/password validation
        if (user_exist($email, $password)) {
            echo json_encode([
            'status' => true, 'email' => $email, 'password'=>  $password
            ]);
            return;
        }else{
            echo json_encode([
            'error' => "Incorrect username or password"
            ]);
            return; 
        }
}