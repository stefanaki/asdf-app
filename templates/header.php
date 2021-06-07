<!-- Bootstrap CSS & Javascript -->
<link href="templates/bootstrap.min.css" rel="stylesheet">
<link href="templates/dataTables.bootstrap5.min.css" rel="stylesheet">

<script src="javascript/popper.min.js"></script>
<script src="javascript/bootstrap.min.js"></script>
<script src="javascript/jquery-3.5.1.js"></script>
<script src="javascript/clock.js"></script>
<script src="javascript/jquery.dataTables.min.js"></script>
<script src="javascript/dataTables.bootstrap5.min.js"></script>

<!-- Navbar -->
 <header style="margin: 85px;">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" style="margin-bottom: 200px;">
       <div class="container-md">
          <a href="index.php" class="navbar-brand">
             <h2>
                ASDF Hotel
                <small class="text-muted">Customer Activity Record</small>
             </h2>
          </a>
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
                      <a class="nav-link active" href="add_customer.php">COVID-19</a>
                   </li>
                   <li class="nav-item dropdown">
                      <a class="active nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Hotel Management
                      </a>
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
          <div style="color: white">
             <span id="timestamp"><pre>                                  </pre></span>
          </div>
       </div>
    </nav>
 </header>

 <body style="background-color:#e9ecef">
