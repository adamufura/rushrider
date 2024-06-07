<?php require 'helpers/admin_init.php'; ?>

<?php
$pageDetails = [
  'title' => "RUSH RIDER"
];

Includes::custom_include('includes/header.php', $pageDetails, true);



  if (!isset($_SESSION)) {
        session_start();
    }

$for_email = $_SESSION['email'];
$org_data_q = "SELECT * FROM `order` WHERE `businessEmail` = '$for_email'";

$org_data_stmt = mysqli_prepare($connection, $org_data_q);

mysqli_stmt_execute($org_data_stmt);

$org_results = mysqli_stmt_get_result($org_data_stmt);

// ?>

?>

<body class="app">
    <header class="app-header fixed-top">
        <?php Includes::custom_include('includes/navbar.php', [], true);    ?>
    </header>
    <!--//app-header-->

    <div class="app-wrapper">
        <div class="app-content pt-3 p-md-3 p-lg-4">
            <div class="container-xl">
                <h1 class="app-page-title">Overview</h1>

                <!--//app-card-->

                <div class="row g-4 mb-4">
                    <div class="col-6 col-lg-3  bg-primary p-1">
                        <div class="app-card app-card-stat shadow-lg h-100 ">
                            <div class="app-card-body p-3 p-lg-4">
                                <h4 class="stats-type mb-1">Delivery History</h4>
                                <div class="stats-figure">
                                       <h4>History</h4>
                            </div>
                            <a href="create_order.php" class="stats-meta text-success">Order history</a>
                            </div>
                            <!--//app-card-body-->
                            <a class="app-card-link-mask" href="#"></a>
                        </div>
                        <!--//app-card-->
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="app-card app-card-stat shadow-sm h-100">
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

                  <div class="app-card app-card-orders-table shadow-sm mb-5">
                    <div class="app-card-body">
                        <div class="table-responsive">
                            <table class="table app-table-hover mb-0 text-left">
                                <thead>
                                    <tr>
                                        <th class="cell">S/N</th>
                                        <th class="cell">ORDER TITLE</th>
                                        <th class="cell">ORDER DESCRIPTION</th>
                                        <th class="cell">RIDER</th>
                                        <th class="cell">DELIVERY</th>
                                        <th class="cell">TRACKING CODE</th>
                                        <th class="cell">ORDER STATUS</th>
                                    </tr>   
                                </thead>
                                   <?php

                                   $counter = 1;

                                    while ($org_result = mysqli_fetch_array($org_results)) : ?>

                                        <tr>
                                            <td class="cell"><?php echo $counter++; ?></td>
                                            <td class="cell"><?php echo $org_result['title'] ?></td>
                                            <td class="cell"><?php echo $org_result['description'] ?></td>
                                            <td class="cell"><?php echo $org_result['rider_email'] ?></td>
                                            <td class="cell"><?php echo $org_result['customerEmail'] ?></td>
                                            <td class="cell"><?php echo $org_result['tracking_code'] ?></td>
                                            <td class="cell"><?php echo $org_result['status'] ?></td>
                                                                                      
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