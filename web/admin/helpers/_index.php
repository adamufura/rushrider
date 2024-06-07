<?php


function getCount($table)
{

    global $connection;

    $data_q = "SELECT * FROM `$table`";

    $data_stmt = mysqli_prepare($connection, $data_q);

    mysqli_stmt_execute($data_stmt);

    $result = mysqli_stmt_get_result($data_stmt);

    return mysqli_num_rows($result);
}


function getRecentApplicants($table)
{
    global $connection;

    $user_data_q = "SELECT * FROM `$table` ORDER BY id DESC LIMIT 5";

    $user_data_stmt = mysqli_prepare($connection, $user_data_q);

    mysqli_stmt_execute($user_data_stmt);

    $result = mysqli_stmt_get_result($user_data_stmt);

    return $result;
}

function getRecentPayments($table)
{
    global $connection;

    $user_data_q = "SELECT * FROM `$table` ORDER BY id DESC LIMIT 5";

    $user_data_stmt = mysqli_prepare($connection, $user_data_q);

    mysqli_stmt_execute($user_data_stmt);

    $result = mysqli_stmt_get_result($user_data_stmt);

    return $result;
}

function getTotalPayments()
{
    global $connection;

    $data_q = "SELECT SUM(amount)  FROM `payments`";

    $data_stmt = mysqli_prepare($connection, $data_q);

    mysqli_stmt_execute($data_stmt);

    $result = mysqli_fetch_array(mysqli_stmt_get_result($data_stmt))[0];

    return $result;
}

function getTotalTransactions()
{
      global $connection;

    $data_q = "SELECT SUM(amount)  FROM `transactions`";

    $data_stmt = mysqli_prepare($connection, $data_q);

    mysqli_stmt_execute($data_stmt);

    $result = mysqli_fetch_array(mysqli_stmt_get_result($data_stmt))[0];

    return $result;
}