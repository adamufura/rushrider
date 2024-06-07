<?php
if (isset($_POST['loginAdmin'])) {
    $username = mysqli_real_escape_string($connection, sanitizeInput($_POST['email']));
    $password = mysqli_real_escape_string($connection, sanitizeInput($_POST['password']));

    $adminErrors = [];
    // validate email
    if (empty($username)) {
        $adminErrors['usernameErr'] = "Email cannot be empty";
    }

    //  validate password
    if (empty($password)) {
        $adminErrors['passErr'] = "Password cannot be empty";
    }

    
    // validate credentials 
    if (!admin_exist($username, $password)) {
        $adminErrors['credentialErr'] = "Incorrect email or password";
    }

    if (count($adminErrors) < 1) {
        // login admin
        loginAdmin($username, $password);
    }
}