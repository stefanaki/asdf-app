<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>Most Used Services</title>
    <meta charset="utf-8">
  </head>

  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
    session_start();
  ?>

  <script>
    $(document).ready( function () {
      $('#myTable').DataTable();
    } );
  </script>

  <?php
    $q1 = "select * from most_used_by_most_customers";

    $q2 = "select * from uses_per_service";


    $r_q1 = mysqli_query($db, $q1);
    $r_q2 = mysqli_query($db, $q2);
  ?>

  <div class="container-fluid">
    <h3 class="mb-4 mt-3" style="text-align: center">Service Statistics</h3>

  <div class="accordion mx-auto" id="ac" style="width: 40%">
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        Most Used Services by Most Customers
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
            <?php while ($row = mysqli_fetch_row($r_q1)): ?>
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
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="true" aria-controls="panelsStayOpen-collapseTwo">
        Most Uses per Service
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
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
</div>
<br>
<br>
</html>
<?php require_once("./templates/footer.php"); ?>
