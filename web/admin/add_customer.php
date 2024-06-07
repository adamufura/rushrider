<?php require 'helpers/admin_init.php'; ?>

<?php
$pageDetails = [
  'title' => "Add Customer"
];

Includes::custom_include('includes/header.php', $pageDetails, true);

if (isset($_POST['addCustomer'])) {
    $email = mysqli_real_escape_string($connection, sanitizeInput($_POST['email']));
    $fullname = mysqli_real_escape_string($connection, sanitizeInput($_POST['fullname']));
    $address = mysqli_real_escape_string($connection, sanitizeInput($_POST['address']));
    $phonenumber = mysqli_real_escape_string($connection, sanitizeInput($_POST['phonenumber']));

    $for_email = $_SESSION['email'];

        $add_org_query = "INSERT INTO `customer`(`email`, `fullname`, `address`, `phonenumber`, `for_email`) VALUES (?, ?, ?, ?, ?)";

        $add_org_stmt = mysqli_prepare($connection, $add_org_query);

        mysqli_stmt_bind_param(
            $add_org_stmt,
            "sssss",
            $email,
            $fullname,
            $address,
            $phonenumber,
            $for_email
        );

        $exec_add_dept = mysqli_stmt_execute($add_org_stmt);

        mysqli_stmt_close($add_org_stmt);

        if ($exec_add_dept) {
            $messages['msgSucc'] = "Customer Added Successfully...";
        } else {
            $messages['msgErr'] = "Error Occured adding customer, try again";
        }
    
}


?>


<body class="app">
  <header class="app-header fixed-top">
    <?php Includes::custom_include('includes/navbar.php', [], true);    ?>
    <!--//app-header-inner-->
    <?php Includes::custom_include('includes/sidebar.php', [], true);    ?>
    <!--//app-sidepanel-->
  </header>
  <!--//app-header-->

  <div class="app-wrapper">

        <div class="app-content pt-3 p-md-3 p-lg-4">
            <div class="container-xl">
                <div class="">
                    <h1 class="app-page-title text-success">Add a New Customer</h1>
                    <a class="btn btn-outline-primary" href="my_customers.php">My Customers</a>
                </div>
                <hr class="mb-4">
                <div class="row g-4 settings-section">

                    <div class="col-12 col-md-8">
                        <div class="app-card app-card-settings shadow-sm p-4">

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
                                                <label for="setting-input-1" class="form-label">CUSTOMER ID</label>
                                                <input name="id" type="text" class="form-control" id="setting-input-1" placeholder="AUTO-GENERATED" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="setting-input-3" class="form-label">Email</label>
                                                <input name="email" type="text" class="form-control" id="setting-input-3" placeholder="Enter Email" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="setting-input-3" class="form-label">Full Name</label>
                                                <input name="fullname" type="text" class="form-control" id="setting-input-3" placeholder="Enter Full name" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="setting-input-3" class="form-label">Address (DESTINATION)</label>
                                                <input name="address" type="text" class="form-control" id="setting-input-3" placeholder="Enter Address" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="setting-input-3" class="form-label">Phone Number</label>
                                                <input name="phonenumber" type="text" class="form-control" id="setting-input-3" placeholder="Enter Phone Number" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <button name="addCustomer" type="submit" class="btn app-btn-primary float-end">Add Customer</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--//app-card-body-->

                        </div>
                        <!--//app-card-->
                    </div>
                </div>
                <!--//row-->
                <hr class="my-4">
            </div>
            <!--//container-fluid-->
        </div>
        <!--//app-content-->

    </div>
  <!--//app-content-->


  <?php Includes::custom_include('includes/footer.php', [], true);    ?>