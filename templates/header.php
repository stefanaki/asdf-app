<!-- Bootstrap CSS & Javascript -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<script src="assets/javascript/popper.min.js"></script>
<script src="assets/javascript/bootstrap.min.js"></script>
<script src="assets/javascript/jquery-3.5.1.js"></script>
<script src="assets/javascript/clock.js"></script>
<script src="assets/javascript/jquery.dataTables.min.js"></script>
<script src="assets/javascript/dataTables.bootstrap5.min.js"></script>

<!-- Navbar -->
<header>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid" style="width: 85%">
      <a href="index.php" class="navbar-brand">
        <h2>
          ASDF Hotel
          <small class="text-muted">Customer Activity Record</small>
        </h2>
      </a>
      <div style="color: white">
        <span id="timestamp">

        </span>
      </div>
      <div class="justify-content-right">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index.php">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index.php">COVID-19 Tracking</a>
            </li>
            <li class="nav-item dropdown">
              <a class="active nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Statistics
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="visits_by_criteria.php">Visits by Criteria</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="places.php">Places</a></li>
                <li><a class="dropdown-item" href="services.php">Services</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link active nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Hotel Management</a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="customer_info.php">Customer Info</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="add_customer.php">Insert Customer</a></li>
                <li><a class="dropdown-item" href="reserve_room.php">Reserve Room</a></li>
                <li><a class="dropdown-item" href="enroll.php">Enroll in Services</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="check_out.php">Check Out</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>

    </div>
  </nav>
</header>

<body style="background-color:#e9ecef">
