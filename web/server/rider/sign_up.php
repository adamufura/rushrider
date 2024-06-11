<?php

header('Content-Type: application/json');

require 'user_init.php';

// var_dump($_POST);
if(isset($_POST['fullname']) && isset($_POST['email']) && isset($_POST['phonenumber']) && isset($_POST['password'])){

    $fullname = mysqli_real_escape_string($connection, $_POST['fullname']);
    $email = mysqli_real_escape_string($connection, $_POST['email']);
    $phone = mysqli_real_escape_string($connection, $_POST['phonenumber']);
    $password = mysqli_real_escape_string($connection, $_POST['password']);   

      //validation 
    // email validation
    if (empty($email)) {
        echo json_encode([
            'error' => "Email cannot be empty"
            ]);
            return; 
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode([
            'error' => "Invalid email address"
            ]);
            return; 
    } elseif (email_exists($email)) {
        echo json_encode([
            'error' => "Email address already exist"
            ]);
            return; 
    }

        // fullname validation
    if (empty($fullname)) {
         echo json_encode([
            'error' => "Fullname cannot be empty"
            ]);
            return; 
    } elseif (strlen($fullname) > 100) {
         echo json_encode([
            'error' => "Fullname is too long"
            ]);
            return; 
    }

     // phone validation
    if (empty($phone)) {
            echo json_encode([
            'error' => "Phone number cannot be empty"
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

    $hashed__password = password_hash($password, PASSWORD_DEFAULT, array());

        //insert user to database
        $signUpQuery = "INSERT INTO `rider`(`fullname`, `email`, `phonenumber`, `password`) VALUES (?, ?, ?, ?)";

        $signUp_smtmt = mysqli_prepare($connection, $signUpQuery);

        mysqli_stmt_bind_param($signUp_smtmt, "ssss", $fullname, $email, $phone, $hashed__password);

        $exec_signUpquery = mysqli_stmt_execute($signUp_smtmt);

        if ($exec_signUpquery) {
            // success
            echo json_encode([
            'status' => $exec_signUpquery, 'email' => $email, 'password'=>  $password
            ]);
        }else{
            // error
            echo json_encode([
            'status' => $exec_signUpquery
            ]);
        }

        mysqli_stmt_close($signUp_smtmt);

}else{
    echo "No request, check server file";
}
?>