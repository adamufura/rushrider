<?php

if (!isset($_SESSION)) {
    session_start();
}

$admin_id = $_SESSION['s_adminID'];
$admin_data_q = "SELECT * FROM `admin` WHERE id = ?";

$admin_data_stmt = mysqli_prepare($connection, $admin_data_q);

mysqli_stmt_bind_param($admin_data_stmt, "i", $admin_id);

mysqli_stmt_execute($admin_data_stmt);

$admin_results = mysqli_fetch_assoc(mysqli_stmt_get_result($admin_data_stmt));


if (isset($_POST['edit_admin'])) {
    $username = mysqli_real_escape_string($connection, sanitizeInput($_POST['username']));
    $email = mysqli_real_escape_string($connection, sanitizeInput($_POST['email']));
    $password = mysqli_real_escape_string($connection, sanitizeInput($_POST['password']));

    $messages = [];

    $password = password_hash($password,  PASSWORD_DEFAULT, []);

    if (count($messages) < 1) {
        $update_admin_query = "UPDATE `admin` SET `username`= ?, `password`= ? WHERE email = ?";

        $update_admin_stmt = mysqli_prepare($connection, $update_admin_query);

        mysqli_stmt_bind_param(
            $update_admin_stmt,
            "sss",
            $username,
            $password,
            $email
        );

        $exec_update_admin = mysqli_stmt_execute($update_admin_stmt);

        mysqli_stmt_close($update_admin_stmt);

        if ($exec_update_admin) {
            $messages['msgSucc'] = "Admin Updated Successfully...";
        } else {
            $messages['msgErr'] = "Error Occured updating admin, try again";
        }
    }
}
