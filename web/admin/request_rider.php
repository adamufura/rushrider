<?php require 'helpers/admin_init.php'; ?>

<?php 

// $org_data_q = "SELECT * FROM `organization`";

// $org_data_stmt = mysqli_prepare($connection, $org_data_q);

// mysqli_stmt_execute($org_data_stmt);

// $org_results = mysqli_stmt_get_result($org_data_stmt);

// ?>

<?php
$pageDetails = [
    'title' => "Manage Organizations"
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
                    <div class="col-6 col-lg-3 ">
                        <div class="app-card app-card-stat shadow-sm h-100">
                            <div class="app-card-body p-3 p-lg-4">
                                <h4 class="stats-type mb-1">MY CUSTOMERS</h4>
                                <div class="stats-figure">
                                    4
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
                                 <div class="stats-figure">7
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

                <!--//row-->

                <div class="app-card app-card-orders-table shadow-sm mb-5">
                    
                    <!--//app-card-body-->
                </div>

            </div>
            <!--//container-fluid-->
        </div>
    </div>
    <!--//app-content-->


    <?php Includes::custom_include('includes/footer.php', [], true);    ?>