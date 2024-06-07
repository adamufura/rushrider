<?php require 'helpers/admin_init.php'; ?>
<?php require 'helpers/_index.php'; ?>
<?php require 'helpers/_settings.php'; ?>

<?php
$pageDetails = [
	'title' => "SSS Admin"
];

Includes::custom_include('includes/header.php', $pageDetails, true);

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
                <h1 class="app-page-title">Settings</h1>
                <hr class="mb-4">
                <div class="row g-4 settings-section">
                    <div class="col-12 col-md-4">
                        <h3 class="section-title">General</h3>
                        <div class="section-intro">
                            <p>Admin Settings.</p>
                            View, Update and manage the general system systems
                        </div>
                    </div>
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
                                    <div class="mb-3">
                                        <label for="setting-input-1" class="form-label">System Name<span class="ms-2"
                                                data-container="body" data-bs-toggle="popover" data-trigger="hover"
                                                data-placement="top"
                                                data-content="This is a Bootstrap popover example. You can use popover to provide extra info."><svg
                                                    width="1em" height="1em" viewBox="0 0 16 16"
                                                    class="bi bi-info-circle" fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                        d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                    <path
                                                        d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z" />
                                                    <circle cx="8" cy="4.5" r="1" />
                                                </svg></span></label>
                                        <input type="text" class="form-control" id="setting-input-1"
                                            value="The Sub Agent System" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="setting-input-2" class="form-label">System Username</label>
                                        <input type="text" name="username" class="form-control" id="setting-input-2"
                                            value="<?php echo $admin_results['username'] ?>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="setting-input-3" class="form-label">System Email Address</label>
                                        <input type="email" name="email" class="form-control" id="setting-input-3"
                                            value="<?php echo $admin_results['email'] ?>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="setting-input-3" class="form-label">Change System Password</label>
                                        <input type="password" name="password" class="form-control" id="setting-input-3"
                                            placeholder="********" maxlength="12">
                                    </div>
                                    <button type="submit" name="edit_admin" class="btn app-btn-primary">Save
                                        Changes</button>
                                </form>
                            </div>
                            <!--//app-card-body-->

                        </div>
                        <!--//app-card-->
                    </div>
                </div>
                <!--//row-->

                <!--//row-->
                <hr class="my-4">
                <div class="row g-4 settings-section">
                    <div class="col-12 col-md-4">
                        <h3 class="section-title">Notifications</h3>
                        <div class="section-intro">Settings section intro goes here. Switch to the notifications you
                            want</div>
                    </div>
                    <div class="col-12 col-md-8">
                        <div class="app-card app-card-settings shadow-sm p-4">
                            <div class="app-card-body">
                                <form class="settings-form">

                                    <div class="form-check form-switch mb-3">
                                        <input class="form-check-input" type="checkbox" id="settings-switch-2">
                                        <label class="form-check-label" for="settings-switch-2">Web browser push
                                            notifications</label>
                                    </div>
                                    <div class="form-check form-switch mb-3">
                                        <input class="form-check-input" type="checkbox" id="settings-switch-3">
                                        <label class="form-check-label" for="settings-switch-3">Mobile push
                                            notifications</label>
                                    </div>
                                    <div class="form-check form-switch mb-3">
                                        <input class="form-check-input" type="checkbox" id="settings-switch-4" checked>
                                        <label class="form-check-label" for="settings-switch-4">Contact us
                                            notifications</label>
                                    </div>
                                    <div class="form-check form-switch mb-3">
                                        <input class="form-check-input" type="checkbox" id="settings-switch-5" checked>
                                        <label class="form-check-label" for="settings-switch-5">New Support
                                            Notifications</label>
                                    </div>
                                    <div class="mt-3">
                                        <button type="submit" class="btn app-btn-primary">Save Changes</button>
                                    </div>
                                </form>
                            </div>
                            <!--//app-card-body-->
                        </div>
                        <!--//app-card-->
                    </div>
                </div>
                <!--//row-->
                <!--//row-->
                <hr class="my-4">
                <div class="row g-4 settings-section">
                    <div class="col-12 col-md-4">
                        <h3 class="section-title">Data &amp; Privacy</h3>
                        <div class="section-intro">Settings section intro goes here. Morbi vehicula, est eget fermentum
                            ornare. </div>
                    </div>
                    <div class="col-12 col-md-8">
                        <div class="app-card app-card-settings shadow-sm p-4">
                            <div class="app-card-body">
                                <form class="settings-form">
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" value=""
                                            id="settings-checkbox-1" checked>
                                        <label class="form-check-label" for="settings-checkbox-1">
                                            Keep user app activity history
                                        </label>
                                    </div>
                                    <!--//form-check-->
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" value=""
                                            id="settings-checkbox-2" checked>
                                        <label class="form-check-label" for="settings-checkbox-2">
                                            Keep user app preferences
                                        </label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" value=""
                                            id="settings-checkbox-3">
                                        <label class="form-check-label" for="settings-checkbox-3">
                                            Keep user app search history
                                        </label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" value=""
                                            id="settings-checkbox-4">
                                        <label class="form-check-label" for="settings-checkbox-4">
                                            Lorem ipsum dolor sit amet
                                        </label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" value=""
                                            id="settings-checkbox-5">
                                        <label class="form-check-label" for="settings-checkbox-5">
                                            Aenean quis pharetra metus
                                        </label>
                                    </div>
                                    <div class="mt-3">
                                        <button type="submit" class="btn app-btn-primary">Save Changes</button>
                                    </div>
                                </form>
                            </div>
                            <!--//app-card-body-->
                        </div>
                        <!--//app-card-->
                    </div>
                </div>
                <hr class="my-4">
            </div>
            <!--//container-fluid-->
        </div>
        <!--//app-content-->
        <!--//app-content-->


        <?php Includes::custom_include('includes/footer.php', [], true);    ?>