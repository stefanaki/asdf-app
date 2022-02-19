<header>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid mx-4">
      <a href="index.php" class="navbar-brand">
        <h2>
          ASDF Hotel
          <small class="text-muted d-none d-md-inline">Customer Activity Record</small>
        </h2>
      </a>
      <div style="color: white" class="d-none d-xl-block">
        <span id="timestamp"></span>
      </div>

      <div>
        <div class="collapse navbar-collapse" id="navmenu">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" href="index.php">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active d-none d-md-none d-xl-block" href="covid19_tracking.php">COVID-19 Tracking</a>
              <a class="nav-link active d-block d-xl-none" href="covid19_tracking.php">COVID-19</a>
            </li>
            <li class="nav-item dropdown">
              <a class="active nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
              Statistics
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="visits_by_criteria.php">Visits by Criteria</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="places.php">Places</a></li>
                <li><a class="dropdown-item" href="services.php">Services</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link active nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">Hotel Management</a>
              <ul class="dropdown-menu">
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

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </nav>
</header>


