<?php require 'helpers/admin_init.php'; ?>

<?php 

  if (!isset($_SESSION)) {
        session_start();
    }

$for_email = $_SESSION['email'];
$org_data_q = "SELECT * FROM `customer` WHERE `for_email` = '$for_email'";

$org_data_stmt = mysqli_prepare($connection, $org_data_q);

mysqli_stmt_execute($org_data_stmt);

$org_results = mysqli_stmt_get_result($org_data_stmt);

// ?>

<?php
$pageDetails = [
    'title' => "Manage Customers"
];

Includes::custom_include('includes/header.php', $pageDetails, true);

?>


<body class="app">
    <header class="app-header fixed-top">
        <?php Includes::custom_include('includes/navbar.php', [], true);    ?>
    </header>
    <!--//app-header-->

    <div class="app-wrapper">
        <div class="app-content pt-3 p-md-3 p-lg-4">
            <div class="container-xl">

                     <div class="row g-4 mb-4">
                    <div class="col-6 col-lg-3  ">
                        <div class="app-card app-card-stat shadow-sm h-100 ">
                            <div class="app-card-body p-3 p-lg-4">
                                <h4 class="stats-type mb-1">Delivery History</h4>
                                <div class="stats-figure">
                                       History
                            </div>
                                <a href="index.php" class="stats-meta text-success">Order history</a>
                            </div>
                        </div>
                        <!--//app-card-->
                    </div>
                    <div class="col-6 col-lg-3 bg-primary p-1">
                        <div class="app-card app-card-stat shadow-lg h-100">
                            <div class="app-card-body p-3 p-lg-4">
                                <h4 class="stats-type mb-1">MY CUSTOMERS</h4>
                                 <div class="stats-figure">
                                    <?php echo getCustomerCounter() ?>
                            </div>
                                <a href="my_customers.php" class="stats-meta text-success">Manage Customers</a>
                            </div>
                        </div>
                        <!--//app-card-->
                    </div>
                    <!--//col-->

                    <div class="col-6 col-lg-3">
                        <div class="app-card app-card-stat shadow-sm h-100">
                            <div class="app-card-body p-3 p-lg-4">
                                <h4 class="stats-type mb-1">MY ORDERS</h4>
                                  <div class="stats-figure">
                                    <?php echo getOrderCount() ?>
                            </div>
                                <a href="create_order.php" class="stats-meta text-success">Create Order</a>
                            </div>
                            <!--//app-card-body-->
                        </div>
                        <!--//app-card-->
                    </div>
                      
                    <!--//col-->
                    <div class="col-6 col-lg-3">
                        <a href="request_rider.php" class="btn app-btn-primary">
                            <div class="app-card-body p-3 p-lg-4">
                                <h4 class="stats-type mb-1"></h4>
                                <div class="stats-figure">
                                    <h3>REQUEST A RIDER</h3>
                            </div>
                            </div>
                        </a>
                        <!--//app-card-->
                    </div>
                    <!--//col-->
                  
                    <!--//col-->
                </div>


                <div class="row g-3 mb-4 align-items-center justify-content-between">
                    <div class="col-auto">
                        <div class="">
                    <h1 class="app-page-title text-success">My Customers</h1>
                    <a class="btn btn-outline-primary" href="add_customer.php">Add a New Customer</a>
                </div>
                    </div>
                    <div class="col-auto">
                        <div class="page-utilities">
                            <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
                                <div class="col-auto">
                                 
                                </div>
                                <!--//col-->
                            </div>
                            <!--//row-->
                        </div>
                        <!--//table-utilities-->
                    </div>
                    <!--//col-auto-->
                </div>
                <!--//row-->

                <div class="app-card app-card-orders-table shadow-sm mb-5">
                    <div class="app-card-body">
                        <div class="table-responsive">
                            <table class="table app-table-hover mb-0 text-left">
                                <thead>
                                    <tr>
                                        <th class="cell">S/N</th>
                                        <th class="cell">EMAIL</th>
                                        <th class="cell">FULLNAME</th>
                                        <th class="cell">ADDRESS</th>
                                        <th class="cell">PHONE NUMBER</th>
                                    </tr>   
                                </thead>
                                   <?php

                                   $counter = 1;

                                    while ($org_result = mysqli_fetch_array($org_results)) : ?>

                                        <tr>
                                            <td class="cell"><?php echo $counter++; ?></td>
                                            <td class="cell"><?php echo $org_result['email'] ?></td>
                                            <td class="cell"><?php echo $org_result['fullname'] ?></td>
                                            <td class="cell"><?php echo $org_result['address'] ?></td>
                                            <td class="cell"><?php echo $org_result['phonenumber'] ?></td>
                                                                                      
                                        </tr>
                                    <?php endwhile; ?>
                                    <?php mysqli_stmt_close($org_data_stmt);
                                    ?>
                            </table>
                        </div>
                        <!--//table-responsive-->

                    </div>
                    <!--//app-card-body-->
                </div>

            </div>
            <!--//container-fluid-->
        </div>
    </div>
    <!--//app-content-->


    <?php Includes::custom_include('includes/footer.php', [], true);    ?>