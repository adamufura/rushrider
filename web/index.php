<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RUSH RIDER</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="shortcut icon" href="assets/images/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/icons/css/materialdesignicons.css">
    <link rel="stylesheet" href="assets/css/carousel.css">
    <link rel="stylesheet" href="assets/css/reviews.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <style>
#fixedCallButton {
    position: fixed;
    bottom: 50px;
    right: 50px;
}

@-webkit-keyframes rotating

/* Safari and Chrome */
    {
    from {
        -webkit-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
    }

    to {
        -webkit-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}

@keyframes rotating {
    from {
        -ms-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -webkit-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
    }

    to {
        -ms-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -webkit-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}

.rotating {
    -webkit-animation: rotating 2s linear infinite;
    -moz-animation: rotating 2s linear infinite;
    -ms-animation: rotating 2s linear infinite;
    -o-animation: rotating 2s linear infinite;
    animation: rotating 2s linear infinite;
}
 @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg); /* Adjust the degree value for the desired rotation */
            }
        }

        .rotate-image {
            animation: rotate 5s linear infinite; /* Adjust the duration as needed */
        }
</style>
</head>
<body>
    <!-- Header -->
    <header class="sticky-top">
        <!-- nav -->
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-success shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">
                <img src="assets/images/logo.png" alt="Logo" style="width:60px;" class="rounded-pill">
                RUSH RIDER
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.php">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Track Order</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Get App</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin/signup.php">Create Business Account</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <a href="admin/signin.php" class="btn btn-secondary me-2 w-100" type="submit">Sign In</a>
                </div>
            </div>
        </div>
    </nav>
    </header>
    <!-- /Header -->

    <!-- Main -->
    <main >
        <div class="container-fluid">
            <img src="assets/images/bg.png" class="w-100" style="height: 75vh;" alt="">
        </div>

        <!-- Intro -->
        <div class="container">
            <div class="  card shadow-sm my-5">
            <div class="d-flex justify-content-center align-contents-center align-items-center">
                <img class="rotate-image" src="assets/images/logo-two.png" width="200" alt="">
            </div>
            <hr>
            <p class="lead card-body text-success text-bold">Rush Rider is a cutting-edge delivery tracking platform that ensures swift, efficient, and reliable package deliveries. It offers real-time tracking, a team of expert riders, user-friendly technology, customized delivery solutions, and a strong commitment to reliability. Whether you're a business or an individual, Rush Rider accelerates your delivery experience, making waiting for packages a thing of the past.</p>
        </div>
        </div>
        <!-- /Intro -->

        <!-- Our Services -->

        <div class="container marketing">

            <!-- Three columns of text below the carousel -->
            <div class="row">
                <h2 class="text-center text-success">Our Services</h2>
                <hr class="divider">

                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img src="assets/images/rider.png" class="bd-placeholder-img" width="300"  />

                    <h3 class="text-center text-success">Rider Accounts</h3>
                    <p>Rush Rider offers accounts for riders or delivery drivers who are part of their network. Rider accounts may include features such as  order assignment and tracking tools to help riders efficiently carry out deliveries.
                    </p>
                    <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
                                <div class="col-lg-4">
                    <img src="assets/images/business.png" class="bd-placeholder-img" width="300" />

                    <h3 class="text-center text-success">Business Accounts</h3>
                    <p>A Rush Rider provides businesses with the option to create and manage accounts tailored to their delivery needs. These business accounts might include features like bulk order placement, invoice management, and delivery scheduling for their delivery operations.
                    </p>
                    <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <img src="assets/images/customer.png" class="bd-placeholder-img" width="250"  />

                    <h3 class="text-center text-success">Order Tracking</h3>
                    <p>With "Rush Rider Order Tracking," customers can easily use a tracking code to monitor the status and location of their orders in real-time, ensuring they stay informed throughout the delivery process.</p>
                    <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
            </div><!-- /.row -->

        </div><!-- /.container -->
        <!-- / Our Services -->

        <!-- Swiper -->
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">


            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>
        <!-- /Swiper -->

        <!-- fixed call -->

        <a href="tel:+2348166644083" id="fixedCallButton" class="rotating">
            <img src="assets/images/call.png" alt="" width="50">
        </a>

          <footer>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
          <path fill="#198754" fill-opacity="1"
              d="M0,192L30,181.3C60,171,120,149,180,122.7C240,96,300,64,360,48C420,32,480,32,540,58.7C600,85,660,139,720,165.3C780,192,840,192,900,165.3C960,139,1020,85,1080,90.7C1140,96,1200,160,1260,170.7C1320,181,1380,139,1410,117.3L1440,96L1440,320L1410,320C1380,320,1320,320,1260,320C1200,320,1140,320,1080,320C1020,320,960,320,900,320C840,320,780,320,720,320C660,320,600,320,540,320C480,320,420,320,360,320C300,320,240,320,180,320C120,320,60,320,30,320L0,320Z">
          </path>
      </svg>
      
      <div class="container-fluid bg-success text-white">
              <!-- get out mobile app -->
      <div class="container-fluid mb-5" id="ourModileApp" style="margin-top: -60px;">
        <div class="row">
          <div class="col-md-4 offset-md-4">
            <div
              class="card shadow-lg"
              style="background-color: #198754; border: none"
            >
              <div class="card-body">
                <h3 class="text-center">Get Our Mobile App</h3>
              </div>
              <div class="card-body" style="margin-top: -20px">
                <div class="row">
                  <div class="col-6">
                    <a href="#"
                      ><img
                        src="assets/images/google-play-logo.png"
                        alt=""
                        class="img-fluid w-100 h-75"
                    /></a>
                  </div>
                  <div class="col-6">
                    <a href="#"
                      ><img
                        src="assets/images/app-store-logo.png"
                        alt=""
                        class="img-fluid w-100 h-75"
                    /></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end of get our mobile app -->
          <div class="container " >
              <div class="row text-center">
                                  <div class="col-sm  my-3">
                      <h4>Business Account <span class="mdi mdi-account-outline"></span> </h4>
                      <hr>
                      <ul class="list-unstyled footerLinks">
                          <li>
                              <span class="mdi mdi-chevron-double-right"></span> <a href="admin/signin.php"
                                  class="link-light">Sign
                                  In</a>
                          </li>
                          <li>
                              <span class="mdi mdi-chevron-double-right"></span> <a href="admin/signup.php"
                                  class="link-light">Sign
                                  Up</a>
                          </li>
                      </ul>
                  </div>
                  <div class="col-sm my-3  bg-dark">
                      <h4>Stay Connected <span class="mdi mdi-cast-connected"></span> </h4>
                      <hr>
                      <div class="mb-3">
                          <a href="" class="link-success"> <span class="mdi mdi-facebook"></span> Facebook</a>
                          <a href="" class="link-success"> <span class="mdi mdi-twitter"></span> Twitter</a>
                          <a href="" class="link-success"> <span class="mdi mdi-instagram"></span> Instagram</a>
                          <a href="" class="link-success"> <span class="mdi mdi-whatsapp"></span> WhatsApp</a>
                      </div>
                      <h4>Our Office <span class="mdi mdi-office-building-marker-outline"></span></h4>
                      <hr>
                      Office No 12.
                      Adamu Fura House
                      Biu Road.
                      Gombe, Gombe State Nigeria
                      <hr>
                      <p class="text-success">Subscribe to our Newsletter</p>
                      <div class="input-group mb-3">
                          <input type="text" class="form-control" placeholder="Your email" aria-label="your email"
                              aria-describedby="basic-addon2">
                          <button class=" btn-success input-group-text" id="basic-addon2">Subscribe</button>
                      </div>
                  </div>

                  <div class="col-sm my-3">
                      <h4>Quick Links <span class="mdi mdi-link-variant"></span></h4>
                      <hr>
                      <ul class="list-unstyled footerLinks">
                          <li>
                              <span class="mdi mdi-chevron-double-right"></span> <a href="#" class="link-light">About
                                  Us</a>
                          </li>
                          <li>
                              <span class="mdi mdi-chevron-double-right"></span> <a href="#" class="link-light">Contact
                                  Us</a>
                          </li>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
      <!-- <hr class="featurette-divider"> -->
      <div class="container mt-5">
          <p class="float-end"><a href="#" class="link-success">Back to top <span class="mdi mdi-arrow-up-circle-outline"></span> </a></p>
          <p>&copy; 2023 Rush Rider, Inc. &middot; <a href="#" class="link-success">Privacy</a> &middot; <a href="#" class="link-success">Terms</a></p>
      </div>
  </footer>
  </main>
  <!-- /Main -->

  <!-- scripts -->
  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <!-- Swiper JS -->
  <script src="assets/js/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
var swiper = new Swiper(".mySwiper", {
    slidesPerView: 1,
    spaceBetween: 10,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    loop: true,
    loopFillGroupWithBlank: true,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    breakpoints: {
        "@0.00": {
            slidesPerView: 1,
            spaceBetween: 10,
        },
        "@0.75": {
            slidesPerView: 2,
            spaceBetween: 20,
        },
        "@1.00": {
            slidesPerView: 3,
            spaceBetween: 40,
        },
        "@1.50": {
            slidesPerView: 4,
            spaceBetween: 50,
        },
    },
});
  </script>
  </body>

  </html>