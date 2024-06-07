<?php
if (isset($_POST['signup'])) {
    $name = mysqli_real_escape_string($connection, sanitizeInput($_POST['name']));
    $email = mysqli_real_escape_string($connection, sanitizeInput($_POST['email']));
    $address = mysqli_real_escape_string($connection, sanitizeInput($_POST['address']));
    $password = mysqli_real_escape_string($connection, sanitizeInput($_POST['password']));
    $CPassword = mysqli_real_escape_string($connection, sanitizeInput($_POST['cpassword']));

    $messages = [];
    if (user_email_exist($email)) {
        $messages['msgErr'] = "business exist with same email";
    }
    if ($password != $CPassword) {
        $messages['msgErr'] = "The two password does not match";
    }


    if (count($messages) < 1) {
          $add_user_query = "INSERT INTO `businessaccount`(`email`, `businessName`, `businessAddress`, `password`) VALUES (?, ?, ?, ?)";

        $add_user_stmt = mysqli_prepare($connection, $add_user_query);

        $password = password_hash($CPassword,  PASSWORD_DEFAULT, []);

        mysqli_stmt_bind_param(
            $add_user_stmt,
            "ssss",
            $email,
            $name,
            $address,
            $password
        );

        $exec_add_user = mysqli_stmt_execute($add_user_stmt);

        mysqli_stmt_close($add_user_stmt);

        session_start();
        $_SESSION['email'] = $email;
        header("Location: index.php");
    }
}

function user_email_exist($email)
{
    $userExist = false;

    $result = getUserByEmail($email);

    $db_userEmail = isset($result['email']) ? $result['email'] : false;

    if ($db_userEmail == $email) {
        $userExist = true;
    } else {
        $userExist = false;
    }
    return $userExist;
}
