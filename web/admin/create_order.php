<?php require 'helpers/admin_init.php'; ?>

<?php 
function generateRandomCode($length = 6) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $code = '';

    for ($i = 0; $i < $length; $i++) {
        $randomIndex = mt_rand(0, strlen($characters) - 1);
        $code .= $characters[$randomIndex];
    }

    return strtoupper($code);
}

 if (!isset($_SESSION)) {
        session_start();
    }

if (isset($_POST['add_order'])) {
    $title = mysqli_real_escape_string($connection, sanitizeInput($_POST['title']));
    $description = mysqli_real_escape_string($connection, sanitizeInput($_POST['description']));
    $businessEmail = $_SESSION['email'];
    $rider_email = mysqli_real_escape_string($connection, sanitizeInput($_POST['rider_email']));
    $customerEmail = mysqli_real_escape_string($connection, sanitizeInput($_POST['customerEmail']));
    $tracking_code = generateRandomCode();

   

    $add_staff_query = "INSERT INTO `order`(`title`, `description`, `businessEmail`, `rider_email`, `customerEmail`,  `tracking_code`) VALUES (?, ?, ?, ?, ?, ?)";

        $add_staff_stmt = mysqli_prepare($connection, $add_staff_query);

        mysqli_stmt_bind_param(
            $add_staff_stmt,
            "ssssss",
            $title,
            $description,
            $businessEmail,
            $rider_email,
            $customerEmail,
            $tracking_code
        );

        $exec_add_staff = mysqli_stmt_execute($add_staff_stmt);

        mysqli_stmt_close($add_staff_stmt);

        if ($exec_add_staff) {
            $messages['msgSucc'] = "<p class='text-right'>TRACKING CODE: $tracking_code</p>Order created Successfully...GO TO <a href='index.php' class='btn btn-primary'>ORDER HISTORY</a> ";
        } else {
            $messages['msgErr'] = "Error Occured creating order, try again";
        }
}



// ?>

<?php
$pageDetails = [
    'title' => "Create Order"
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
                                    <?php echo getCustomerCounter() ?>
                            </div>
                                <a href="my_customers.php" class="stats-meta text-success">Manage Customers</a>
                            </div>
                        </div>
                        <!--//app-card-->
                    </div>
                    <!--//col-->

                    <div class="col-6 col-lg-3 bg-primary p-1">
                        <div class="app-card app-card-stat shadow-lg h-100">
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
                    <h1 class="app-page-title text-success">CREATE ORDER</h1>
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

                <div class="app-card col-md-8 app-card-orders-table shadow mb-5">
                    <div class="app-card-body p-3">
                        <h3 class="text-center">Create an Order</h3>
                        <p class="lead">Tracking code will be generated automatically</p>
                        <hr>
                       <div class="app-card-body">
                                <form class="settings-form" action="" method="POST">
                                    <span class="text-success text-center">
                                        <?php if (isset($messages['msgSucc'])) {
                                            echo $messages['msgSucc'];
                                        } ?>
                                    </span>
                                    <span class="text-danger text-center">
                                        <?php if (isset($messages['msgErr'])) {
                                            echo $messages['msgErr'];
                                        } ?>
                                    </span>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="setting-input-1" class="form-label">Order Title </label>
                                                <input name="title" type="text" class="form-control" id="setting-input-1" placeholder="Enter Order title" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="setting-input-1" class="form-label">Order Description</label>
                                                <input name="description" type="text" class="form-control" id="setting-input-1" placeholder="Enter Order Description" required>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="setting-input-2" class="form-label">Order Owner</label>
                                                <div class="form-floating">
                                                     <select required class="form-select" name="customerEmail" id="floatingSelect" aria-label="Floating label select example">
                                                        <option selected>Select Customer</option>
                                                        <?php
                                                        $depts = getCustomers();
                                                        while ($res = mysqli_fetch_array($depts)) : ?>
                                                            <option value="<?php echo $res['email'] ?>"><?php echo $res['fullname'] ?></option>
                                                        <?php endwhile; ?>
                                                    </select>
                                                    <label for="floatingSelect">Customer</label>
                                                </div>
                                            </div>
                                        </div>
                                            <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="setting-input-2" class="form-label">Rider</label>
                                                <div class="form-floating">
                                                    <select required class="form-select" name="rider_email" id="floatingSelect" aria-label="Floating label select example">
                                                        <option selected>Select Rider</option>
                                                        <?php
                                                        $depts = getRiders();
                                                        while ($res = mysqli_fetch_array($depts)) : ?>
                                                            <option value="<?php echo $res['email'] ?>"><?php echo $res['fullname'] ?></option>
                                                        <?php endwhile; ?>
                                                    </select>
                                                    <label for=" floatingSelect">Rider</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button name="add_order" type="submit" class="btn app-btn-primary w-100">
                                                CREATE ORDER
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                
                    </div>
                    <!--//app-card-body-->
                </div>

            </div>
            <!--//container-fluid-->
        </div>
    </div>
    <!--//app-content-->


    <?php Includes::custom_include('includes/footer.php', [], true);    ?>