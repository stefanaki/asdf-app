<?php if(!isset($_SESSION)) session_start(); ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <?php require_once('./templates/includes.php'); ?>
  
    <title>Service Statistics</title>
    <meta charset="utf-8">
    <link href="assets/css/flex.css" rel="stylesheet">
  </head>
  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
    ?>
  <?php
    $q1 = "select s.service_type,s.service_id,count(*) as number_of_uses
           from use_charge_log u join services s on u.service_id = s.service_id join customers_age c on c.nfc_id = u.customer_id
           where u.service_id <> 2 and c.Age between 20 and 40
           and u.use_date_time between date_add(curdate(), INTERVAL -1 MONTH) and curdate()
           group by s.service_id
           order by number_of_uses desc";

    $q2 = "select s.service_type,s.service_id,count(*) as number_of_uses
           from use_charge_log u join services s on u.service_id = s.service_id join customers_age c on c.nfc_id = u.customer_id
           where u.service_id <> 2 and c.Age between 41 and 60
           and u.use_date_time between date_add(curdate(), INTERVAL -1 MONTH) and curdate()
           group by s.service_id
           order by number_of_uses desc";

    $q3 = "select s.service_type,s.service_id,count(*) as number_of_uses
           from use_charge_log u join services s on u.service_id = s.service_id join customers_age c on c.nfc_id = u.customer_id
           where u.service_id <> 2 and c.Age >= 61
           and u.use_date_time between date_add(curdate(), INTERVAL -1 MONTH) and curdate()
           group by s.service_id
           order by number_of_uses desc";

    $q4 = "select s.service_type,s.service_id,count(*) as number_of_uses
           from use_charge_log u join services s on u.service_id = s.service_id join customers_age c on c.nfc_id = u.customer_id
           where u.service_id <> 2 and c.Age between 20 and 40
           and u.use_date_time between date_add(curdate(), INTERVAL -1 YEAR) and curdate()
           group by s.service_id
           order by number_of_uses desc";

    $q5 = "select s.service_type,s.service_id,count(*) as number_of_uses
           from use_charge_log u join services s on u.service_id = s.service_id join customers_age c on c.nfc_id = u.customer_id
           where u.service_id <> 2 and c.Age between 41 and 60
           and u.use_date_time between date_add(curdate(), INTERVAL -1 YEAR) and curdate()
           group by s.service_id
           order by number_of_uses desc";

    $q6 = "select s.service_type,s.service_id,count(*) as number_of_uses
           from use_charge_log u join services s on u.service_id = s.service_id join customers_age c on c.nfc_id = u.customer_id
           where u.service_id <> 2 and c.Age >= 61
           and u.use_date_time between date_add(curdate(), INTERVAL -1 YEAR) and curdate()
           group by s.service_id
           order by number_of_uses desc";

    $q7 = "select * from uses_per_service";

    $q8 = "select s.service_type, count(distinct u.customer_id, u.service_id) as most_used
           from use_charge_log u join customers_age c on u.customer_id = c.nfc_id
           join services s on u.service_id = s.service_id
           where u.service_id <> 2 and c.age between 20 and 40
           and u.use_date_time between date_add(curdate(), INTERVAL -1 MONTH) and curdate()
           group by s.service_id
           order by most_used desc";

    $q9 = "select s.service_type, count(distinct u.customer_id, u.service_id) as most_used
           from use_charge_log u join customers_age c on u.customer_id = c.nfc_id
           join services s on u.service_id = s.service_id
           where u.service_id <> 2 and c.age between 41 and 60
           and u.use_date_time between date_add(curdate(), INTERVAL -1 MONTH) and curdate()
           group by s.service_id
           order by most_used desc";

    $q10 = "select s.service_type, count(distinct u.customer_id, u.service_id) as most_used
           from use_charge_log u join customers_age c on u.customer_id = c.nfc_id
           join services s on u.service_id = s.service_id
           where u.service_id <> 2 and c.age >= 61
           and u.use_date_time between date_add(curdate(), INTERVAL -1 MONTH) and curdate()
           group by s.service_id
           order by most_used desc";

    $q11 = "select s.service_type, count(distinct u.customer_id, u.service_id) as most_used
           from use_charge_log u join customers_age c on u.customer_id = c.nfc_id
           join services s on u.service_id = s.service_id
           where u.service_id <> 2 and c.age between 20 and 40
           and u.use_date_time between date_add(curdate(), INTERVAL -1 YEAR) and curdate()
           group by s.service_id
           order by most_used desc";

    $q12 = "select s.service_type, count(distinct u.customer_id, u.service_id) as most_used
           from use_charge_log u join customers_age c on u.customer_id = c.nfc_id
           join services s on u.service_id = s.service_id
           where u.service_id <> 2 and c.age between 41 and 60
           and u.use_date_time between date_add(curdate(), INTERVAL -1 YEAR) and curdate()
           group by s.service_id
           order by most_used desc";

    $q13 = "select s.service_type, count(distinct u.customer_id, u.service_id) as most_used
           from use_charge_log u join customers_age c on u.customer_id = c.nfc_id
           join services s on u.service_id = s.service_id
           where u.service_id <> 2 and c.age >= 61
           and u.use_date_time between date_add(curdate(), INTERVAL -1 YEAR) and curdate()
           group by s.service_id
           order by most_used desc";

    $r_q1 = mysqli_query($db, $q1);
    $r_q2 = mysqli_query($db, $q2);
    $r_q3 = mysqli_query($db, $q3);
    $r_q4 = mysqli_query($db, $q4);
    $r_q5 = mysqli_query($db, $q5);
    $r_q6 = mysqli_query($db, $q6);
    $r_q7 = mysqli_query($db, $q7);
    $r_q8 = mysqli_query($db, $q8);
    $r_q9 = mysqli_query($db, $q9);
    $r_q10 = mysqli_query($db, $q10);
    $r_q11 = mysqli_query($db, $q11);
    $r_q12 = mysqli_query($db, $q12);
    $r_q13 = mysqli_query($db, $q13);
    ?>
  <div class="container-md">
  <h3 class="mb-4 mt-3" style="text-align: center">Services</h3>
  <h4 class="mb-3 mt-3" style="text-align: center">Most used services</h4>
  <div class="accordion mx-auto" id="ac" style="max-width: 600px">
    <div class="accordion-item">
      <h2 class="accordion-header" id="panelsStayOpen-headingOne">
        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        Uses per Service
        </button>
      </h2>
      <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
        <div class="accordion-body">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Service</th>
                <th scope="col">Total Uses</th>
              </tr>
            </thead>
            <tbody>
              <?php while ($row = mysqli_fetch_row($r_q7)): ?>
              <tr>
                <th scope="row"><?php echo str_replace("_", " ", $row[1]); ?></th>
                <td><?php echo $row[2]; ?></td>
              </tr>
              <?php endwhile; ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <br>
  <br>
  <h4 class="mb-3 mt-3" style="text-align: center">Most used services per age group</h4>
  <div class="flexbox row">
    <div class="item col-md">
      <div class="content">
        <h5 class="mb-3 mt-3" style="text-align: center">Past Month</h5>
        <div class="accordion mx-auto" id="ac1">
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne1">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
              20 - 40 Years Old
              </button>
            </h2>
            <div id="collapseOne1" class="accordion-collapse collapse " aria-labelledby="headingOne1" data-bs-parent="#ac1">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q1)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[2]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo1">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo1" aria-expanded="false" aria-controls="collapseTwo1">
              41 - 60 Years Old
              </button>
            </h2>
            <div id="collapseTwo1" class="accordion-collapse collapse" aria-labelledby="headingTwo1" data-bs-parent="#ac1">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q2)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[2]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree1">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree1" aria-expanded="false" aria-controls="collapseThree1">
              61+ Years Old
              </button>
            </h2>
            <div id="collapseThree1" class="accordion-collapse collapse" aria-labelledby="headingThree1" data-bs-parent="#ac1">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q3)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[2]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="item col-md">
      <div class="content">
        <h5 class="mb-3 mt-3" style="text-align: center">Past Year</h5>
        <div class="accordion mx-auto" id="ac2">
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne2">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne2">
              20 - 40 Years Old
              </button>
            </h2>
            <div id="collapseOne2" class="accordion-collapse collapse" aria-labelledby="headingOne2" data-bs-parent="#ac2">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q4)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[2]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo2">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
              41 - 60 Years Old
              </button>
            </h2>
            <div id="collapseTwo2" class="accordion-collapse collapse" aria-labelledby="headingTwo2" data-bs-parent="#ac2">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q5)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[2]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree2">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree2" aria-expanded="false" aria-controls="collapseThree2">
              61+ Years Old
              </button>
            </h2>
            <div id="collapseThree2" class="accordion-collapse collapse" aria-labelledby="headingThree2" data-bs-parent="#ac2">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q6)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[2]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <h4 class="mb-3 mt-3" style="text-align: center">Most used services by most customers per age group</h4>
  <div class="flexbox row">
    <div class="item col-md">
      <div class="content">
        <h5 class="mb-3 mt-3" style="text-align: center">Past Month</h5>
        <div class="accordion mx-auto" id="ac3">
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne3">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne3" aria-expanded="true" aria-controls="collapseOne3">
              20 - 40 Years Old
              </button>
            </h2>
            <div id="collapseOne3" class="accordion-collapse collapse" aria-labelledby="headingOne3" data-bs-parent="#ac3">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q8)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[1]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo3">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo3" aria-expanded="false" aria-controls="collapseTwo3">
              41 - 60 Years Old
              </button>
            </h2>
            <div id="collapseTwo3" class="accordion-collapse collapse" aria-labelledby="headingTwo3" data-bs-parent="#ac3">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q9)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[1]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree3">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3">
              61+ Years Old
              </button>
            </h2>
            <div id="collapseThree3" class="accordion-collapse collapse" aria-labelledby="headingThree3" data-bs-parent="#ac3">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q10)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[1]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="item col-md">
      <div class="content">
        <h5 class="mb-3 mt-3" style="text-align: center">Past Year</h5>
        <div class="accordion mx-auto" id="ac4">
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne4">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne4" aria-expanded="true" aria-controls="collapseOne4">
              20 - 40 Years Old
              </button>
            </h2>
            <div id="collapseOne4" class="accordion-collapse collapse" aria-labelledby="headingOne4" data-bs-parent="#ac4">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q11)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[1]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo4">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo4" aria-expanded="false" aria-controls="collapseTwo4">
              41 - 60 Years Old
              </button>
            </h2>
            <div id="collapseTwo4" class="accordion-collapse collapse" aria-labelledby="headingTwo4" data-bs-parent="#ac4">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q12)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[1]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree4">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree4" aria-expanded="false" aria-controls="collapseThree4">
              61+ Years Old
              </button>
            </h2>
            <div id="collapseThree4" class="accordion-collapse collapse" aria-labelledby="headingThree4" data-bs-parent="#ac4">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Service</th>
                      <th scope="col">Total Uses</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q13)): ?>
                    <tr>
                      <th scope="row"><?php echo str_replace("_", " ", $row[0]); ?></th>
                      <td><?php echo $row[1]; ?></td>
                    </tr>
                    <?php endwhile; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <br>
  <br>
</html>
<?php require_once("./templates/footer.php"); ?>
