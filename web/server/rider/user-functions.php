<?php

include '../connection.php';

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

function getUserByEmail($email)
{
    global $connection;

    $user_data_q = "SELECT * FROM `rider` WHERE `email` = ?";

    $user_data_stmt = mysqli_prepare($connection, $user_data_q);

    mysqli_stmt_bind_param($user_data_stmt, 's', $email);

    mysqli_stmt_execute($user_data_stmt);

    $result = mysqli_fetch_assoc(mysqli_stmt_get_result($user_data_stmt));

    mysqli_stmt_close($user_data_stmt);

    return $result;
}

function email_exists($email)
{
    $result = getUserByEmail($email);
    
    if (isset($result)) {
        return true;
    }
    return false;
}

function user_exist($email, $password)
{
    $userExist = false;

    $result = getUserByEmail($email);

    $db_email = $result['email'];
    $is_password = password_verify($password, $result['password']);

    if ($db_email == $email && $is_password) {
        $userExist = true;
    } else {
        $userExist = false;
    }
    return $userExist;
}

function isUserLoggedIn()
{
    if (!isset($_SESSION)) {
        session_start();
    }

    if (isset($_SESSION['id']) && isset($_SESSION['email'])) {
        return true;
    } else {
        return false;
    }
}


// ORDERRRRRRRRRRRRR
function getAllRiderOrders($email){
    global $connection;

    // $user_data_q = "SELECT * FROM `order` WHERE `rider_email` = ?";

    $user_data_q = "SELECT o.*, c.fullname AS customer_fullname, c.address AS customer_address, c.phonenumber AS customer_phonenumber
              FROM `order` AS o
              INNER JOIN `customer` AS c ON o.customerEmail = c.email
              WHERE o.rider_email = ?";

    $user_data_stmt = mysqli_prepare($connection, $user_data_q);

    mysqli_stmt_bind_param($user_data_stmt, 's', $email);

    mysqli_stmt_execute($user_data_stmt);

    $results = mysqli_stmt_get_result($user_data_stmt);

    $mappedResult = array();

    while ($row = mysqli_fetch_array($results)) {
        $mappedResult[] = $row;
    }

    mysqli_stmt_close($user_data_stmt);

    echo json_encode(['status' => 'success', 'data'=> $mappedResult, 'size' => count($mappedResult) ]);
}

function getAllRiderPENDINGOrders($email){
    global $connection;

        $user_data_q = "SELECT o.*, c.fullname AS customer_fullname, c.address AS customer_address, c.phonenumber AS customer_phonenumber
              FROM `order` AS o
              INNER JOIN `customer` AS c ON o.customerEmail = c.email
              WHERE o.rider_email = ? AND o.status='PENDING'";

    $user_data_stmt = mysqli_prepare($connection, $user_data_q);

    mysqli_stmt_bind_param($user_data_stmt, 's', $email);

    mysqli_stmt_execute($user_data_stmt);

    $results = mysqli_stmt_get_result($user_data_stmt);
    
    $mappedResult = array();

    while ($row = mysqli_fetch_array($results)) {
        $mappedResult[] = $row;
    }

    mysqli_stmt_close($user_data_stmt);

    echo json_encode(['status' => 'success', 'data'=> $mappedResult, 'size' => count($mappedResult) ]);
}

function getRiderOrderInfo($id){
global $connection;

    $query = "SELECT o.*, 
                     c.fullname AS customer_fullname, c.address AS customer_address, c.phonenumber AS customer_phonenumber,
                     b.businessName AS business_name, b.businessAddress AS business_address
              FROM `order` AS o
              INNER JOIN `customer` AS c ON o.customerEmail = c.email
              INNER JOIN `businessaccount` AS b ON o.businessEmail = b.email
              WHERE o.id = ?";

    $stmt = mysqli_prepare($connection, $query);
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);

    $results = mysqli_fetch_array( mysqli_stmt_get_result($stmt));

    mysqli_stmt_close($stmt);

    echo json_encode(['status' => 'success', 'data' => $results]);
}


function setOrderStatus($id, $status){
    global $connection;

     //insert to database
        $InsertQuery = "UPDATE `order` SET  `status`='$status' WHERE `id`= ?";

        $query_smtmt = mysqli_prepare($connection, $InsertQuery);

        mysqli_stmt_bind_param($query_smtmt, "i", $id);

        $exec_query = mysqli_stmt_execute($query_smtmt);


        if ($exec_query) {
            // success
           echo json_encode([
            'status' => 'success'
           ]);
        }else{
            // error
            echo json_encode([
            'status' => $exec_query
            ]);
        }

}
function setOrderLocation($id, $location){
    global $connection;

     //insert to database
        $InsertQuery = "UPDATE `order` SET  `current_location`='$location' WHERE `id`= ?";

        $query_smtmt = mysqli_prepare($connection, $InsertQuery);

        mysqli_stmt_bind_param($query_smtmt, "i", $id);

        $exec_query = mysqli_stmt_execute($query_smtmt);


        if ($exec_query) {
            // success
           echo json_encode([
            'status' => 'success'
           ]);
        }else{
            // error
            echo json_encode([
            'status' => $exec_query
            ]);
        }

}

function orderExists($email, $tracking_code) {
    global $connection;

    $query = "SELECT * FROM `order` WHERE `customerEmail` = ? AND `tracking_code` = ?";

    $stmt = mysqli_prepare($connection, $query);

    mysqli_stmt_bind_param($stmt, 'ss', $email, $tracking_code);

    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    
    // Check if any rows were returned
    if (mysqli_num_rows($result) > 0) {
        // Order with the same email and tracking code exists
        return true;
    }

    mysqli_stmt_close($stmt);

    return false;
}
