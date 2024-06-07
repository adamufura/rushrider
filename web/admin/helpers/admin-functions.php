<?php

include 'setup.php';

function sanitizeInput($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = stripslashes($data);
    $data = filter_var($data, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    return $data;
}

function haveSpecialChar($data)
{
    return preg_match('/[#$%^&*()+=\-\[\]\';,.\/{}|":<>?~\\\\]/', $data);
}

function getAdminByEmail($email)
{
    global $connection;

    $admin_data_q = "SELECT * FROM `businessaccount` WHERE `email` = ?";

    $admin_data_stmt = mysqli_prepare($connection, $admin_data_q);

    mysqli_stmt_bind_param($admin_data_stmt, 's', $email);

    mysqli_stmt_execute($admin_data_stmt);

    $result = mysqli_fetch_assoc(mysqli_stmt_get_result($admin_data_stmt));

    mysqli_stmt_close($admin_data_stmt);

    return $result;
}

function admin_exist($email, $password)
{
    $adminExist = false;

    $result = getAdminByEmail($email);

    $db_username = isset($result['email']) ? $result['email'] : null;
    $is_password = isset($result['password']) ? password_verify($password, $result['password']) : null;

    if ($db_username == $email && $is_password) {
        $adminExist = true;
    } else {
        $adminExist = false;
    }
    return $adminExist;
}

function email_exist($email)
{
    $emailExist = false;

    $result = getAdminByEmail($email);

    $db_email = $result['email'];

    if ($db_email == $email) {
        $emailExist = true;
    } else {
        $emailExist = false;
    }
    return $emailExist;
}


function loginAdmin($email, $password)
{
    if (admin_exist($email, $password)) {
        $result = getAdminByEmail($email);

        session_start();
        $_SESSION['email'] = $result['email'];
        header("Location: index.php");
    }
}

function isUserLoggedIn()
{
    if (!isset($_SESSION)) {
        session_start();
    }

    if (isset($_SESSION['email'])) {
        return true;
    } else {
        return false;
    }
}


function getUserByEmail($email)
{
    global $connection;

    $data_q = "SELECT * FROM `businessaccount` WHERE `email` = ?";

    $data_stmt = mysqli_prepare($connection, $data_q);

    mysqli_stmt_bind_param($data_stmt, 's', $email);

    mysqli_stmt_execute($data_stmt);

    $result = mysqli_fetch_assoc(mysqli_stmt_get_result($data_stmt));

    mysqli_stmt_close($data_stmt);

    return $result;
}


function getRiders()
{

    global $connection;

    $dept_data_q = "SELECT * FROM `rider`";

    $dept_data_stmt = mysqli_prepare($connection, $dept_data_q);

    mysqli_stmt_execute($dept_data_stmt);

    $dept_res = mysqli_stmt_get_result($dept_data_stmt);
    mysqli_stmt_close($dept_data_stmt);
    return $dept_res;
}

function getCustomers()
{

    global $connection;

      if (!isset($_SESSION)) {
        session_start();
    }

$for_email = $_SESSION['email'];

    $dept_data_q = "SELECT * FROM `customer` WHERE `for_email` = '$for_email'";

    $dept_data_stmt = mysqli_prepare($connection, $dept_data_q);

    mysqli_stmt_execute($dept_data_stmt);

    $dept_res = mysqli_stmt_get_result($dept_data_stmt);
    mysqli_stmt_close($dept_data_stmt);
    return $dept_res;
}


function getOrderCount()
{

    global $connection;

      if (!isset($_SESSION)) {
        session_start();
    }

$for_email = $_SESSION['email'];

    $data_q = "SELECT * FROM `order` WHERE `businessEmail` = '$for_email'";

    $data_stmt = mysqli_prepare($connection, $data_q);

    mysqli_stmt_execute($data_stmt);

    $result = mysqli_stmt_get_result($data_stmt);

    return mysqli_num_rows($result);
}
function getCustomerCounter()
{

    global $connection;

      if (!isset($_SESSION)) {
        session_start();
    }

$for_email = $_SESSION['email'];

    $data_q = "SELECT * FROM `customer` WHERE `for_email` = '$for_email'";

    $data_stmt = mysqli_prepare($connection, $data_q);

    mysqli_stmt_execute($data_stmt);

    $result = mysqli_stmt_get_result($data_stmt);

    return mysqli_num_rows($result);
}
