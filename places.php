<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>Place Statistics</title>
    <meta charset="utf-8">
    <link href="assets/css/flex.css" rel="stylesheet">
  </head>
  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
    session_start();
    ?>
  <?php
    $q1 = "select p.place_description,p.place_id,count(*) as number_of_visits
           from visit_log v join places p on v.place_id = p.place_id join customers_age c on c.nfc_id = v.customer_id
           where p.offered_service_id <> 2 and c.Age between 20 and 40
           and v.timestamp_in between date_add(curdate(), INTERVAL -1 MONTH) and curdate()
           group by p.place_id
           order by number_of_visits desc
           limit 10";

    $q2 = "select p.place_description,p.place_id,count(*) as number_of_visits
           from visit_log v join places p on v.place_id = p.place_id join customers_age c on c.nfc_id = v.customer_id
           where p.offered_service_id <> 2 and c.Age between 41 and 60
           and v.timestamp_in between date_add(curdate(), INTERVAL -1 MONTH) and curdate()
           group by p.place_id
           order by number_of_visits desc
           limit 10";

    $q3 = "select p.place_description,p.place_id,count(*) as number_of_visits
           from visit_log v join places p on v.place_id = p.place_id join customers_age c on c.nfc_id = v.customer_id
           where p.offered_service_id <> 2 and c.Age >= 61
           and v.timestamp_in between date_add(curdate(), INTERVAL -1 MONTH) and curdate()
           group by p.place_id
           order by number_of_visits desc
           limit 10";

    $q4 = "select p.place_description,p.place_id,count(*) as number_of_visits
           from visit_log v join places p on v.place_id = p.place_id join customers_age c on c.nfc_id = v.customer_id
           where p.offered_service_id <> 2 and c.Age between 20 and 40
           and v.timestamp_in between date_add(curdate(), INTERVAL -1 YEAR) and curdate()
           group by p.place_id
           order by number_of_visits desc
           limit 10";

    $q5 = "select p.place_description,p.place_id,count(*) as number_of_visits
           from visit_log v join places p on v.place_id = p.place_id join customers_age c on c.nfc_id = v.customer_id
           where p.offered_service_id <> 2 and c.Age between 41 and 60
           and v.timestamp_in between date_add(curdate(), INTERVAL -1 YEAR) and curdate()
           group by p.place_id
           order by number_of_visits desc
           limit 10";

    $q6 = "select p.place_description,p.place_id,count(*) as number_of_visits
           from visit_log v join places p on v.place_id = p.place_id join customers_age c on c.nfc_id = v.customer_id
           where p.offered_service_id <> 2 and c.Age >= 61
           and v.timestamp_in between date_add(curdate(), INTERVAL -1 YEAR) and curdate()
           group by p.place_id
           order by number_of_visits desc
           limit 10";

    $r_q1 = mysqli_query($db, $q1);
    $r_q2 = mysqli_query($db, $q2);
    $r_q3 = mysqli_query($db, $q3);
    $r_q4 = mysqli_query($db, $q4);
    $r_q5 = mysqli_query($db, $q5);
    $r_q6 = mysqli_query($db, $q6);
    ?>
  <div class="container-md">
  <h3 class="mb-4 mt-3" style="text-align: center">Places</h3>
  <h4 class="mb-3 mt-3" style="text-align: center">Most visited places per age group</h4>
  <div class="flexbox row">
    <div class="item col-md">
      <div class="content">
        <h5 class="mb-3 mt-3" style="text-align: center">Past Month</h5>
        <div class="accordion mx-auto" id="ac1">
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne1">
              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
              20 - 40 Years Old
              </button>
            </h2>
            <div id="collapseOne1" class="accordion-collapse collapse show" aria-labelledby="headingOne1" data-bs-parent="#ac1">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Places</th>
                      <th scope="col">Total Visits</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q1)): ?>
                    <tr>
                      <th scope="row"><?php echo $row[0]; ?></th>
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
                      <th scope="col">Places</th>
                      <th scope="col">Total Visits</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q2)): ?>
                    <tr>
                      <th scope="row"><?php echo $row[0]; ?></th>
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
                      <th scope="col">Places</th>
                      <th scope="col">Total Visits</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q3)): ?>
                    <tr>
                      <th scope="row"><?php echo $row[0]; ?></th>
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
              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne2">
              20 - 40 Years Old
              </button>
            </h2>
            <div id="collapseOne2" class="accordion-collapse collapse show" aria-labelledby="headingOne2" data-bs-parent="#ac2">
              <div class="accordion-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Places</th>
                      <th scope="col">Total Visits</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q4)): ?>
                    <tr>
                      <th scope="row"><?php echo $row[0]; ?></th>
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
                      <th scope="col">Places</th>
                      <th scope="col">Total Visits</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q5)): ?>
                    <tr>
                      <th scope="row"><?php echo $row[0]; ?></th>
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
                      <th scope="col">Places</th>
                      <th scope="col">Total Visits</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row = mysqli_fetch_row($r_q6)): ?>
                    <tr>
                      <th scope="row"><?php echo $row[0]; ?></th>
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
  <br>
</html>
<?php require_once("./templates/footer.php"); ?>
