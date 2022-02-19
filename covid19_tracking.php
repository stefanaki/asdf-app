<?php if(!isset($_SESSION)) session_start(); ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <?php require_once('./templates/includes.php'); ?>

    <title>COVID-19 Tracking</title>
    <meta charset="utf-8">
    <link href="assets/css/flex.css" rel="stylesheet">
  </head>
  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
    ?>

  <?php
    $current_date = date("Y-m-d");
    $cust_query = "SELECT nfc_id, CONCAT(first_name, ' ', last_name, ' (', verif_id, ')') FROM customers";
    $cust_result = mysqli_query($db, $cust_query);
    ?>
  <div class="container-fluid">
    <h3 class="mb-4 mt-3" style="text-align: center">Specify COVID-19 infected customer</h3>
    <?php
      if (isset($_GET['select'])) {
        if ($_GET['date'] == "" || $_GET['customer'] == -1)
          echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert" style="margin: 0 25%">All fields are required.</div>';
        else {
          $customer = $_GET['customer'];
          $_SESSION['customer'] = $customer;
          $date = $_GET['date'];
          $_SESSION['date'] = $date;
          $datetime = $date . " 00:00:00";
          $activity_query = "select concat(timestamp_in, ' / ', timestamp_out), place_description
                             from customer_activity
                             where customer_id = '$customer'
                             and timestamp_in between date_add('$datetime', INTERVAL -5 DAY) and '$date'";
          $infections_query = "select concat(c.first_name, ' ', c.last_name, ' (', c.verif_id, ')'), p.place_description,
                               concat(v.timestamp_in, ' / ', v.timestamp_out)
                               from visit_log v join customers c on v.customer_id = c.nfc_id
                               join places p on p.place_id = v.place_id
                               where v.place_id in
                                 (select v1.place_id from visit_log v1
                                 where v.timestamp_in between v1.timestamp_in and date_add(v1.timestamp_out, INTERVAL 1 HOUR)
                                 and v1.customer_id = '$customer'
                                 and v1.timestamp_in between date_add('$datetime', INTERVAL -5 DAY) AND '$datetime')
                                 and v.customer_id <> '$customer' and v.timestamp_in between date_add('$datetime', INTERVAL -5 DAY) AND '$datetime'";

          $activity = mysqli_query($db, $activity_query);
          $infections = mysqli_query($db, $infections_query);
        }
      }
      ?>
    <form class="mb-3 mx-auto" style="max-width: 600px" action="covid19_tracking.php" method="GET">
      <div class="row">
        <div class="col-md mx-auto mb-3">
          <label for="customer" class="form-label">Select Customer</label>
          <select name="customer" class="form-control">
            <option value="-1" selected>Select Customer</option>
            <?php while ($row = mysqli_fetch_row($cust_result)): ?>
            <option value="<?php echo htmlspecialchars($row[0]); ?>"><?php echo htmlspecialchars($row[1]); ?></option>
            <?php $names[$row[0]] = $row[1]; endwhile; ?>
          </select>
        </div>
        <div class="col-md mx-auto mb-3">
          <label for="date" class="form-label">Date Diagnosed Positive</label>
          <input type="date" class="form-control" name="date" max="<?php echo $current_date; ?>">
        </div>
        <div class="mb-3 pt-2" style="display: flex; align-items: center; justify-content: center;">
          <button type="submit" name="select" value="1" class="btn btn-primary">Select</button>
        </div>
      </div>
    </form>
    <?php if (isset($_GET['select']) && $_GET['date'] != "" && $_GET['customer'] != -1): ?>
    <hr>
    <div class="flexbox row">
      <div class="item col-lg">
        <div class="content">
          <div class="mx-auto mb-3">
            <table id="myTable" class="table table-striped table-hover border border-dark border-2 mx-auto mb-2 text-start">
              <thead>
                <tr>
                  <th scope="col"><?php echo $names[$_SESSION['customer']] . " "; ?> visits for five days before <?php echo $_SESSION['date']; ?></th>
                  <th scope="col" class="text-center">Date-Time In/Out</th>
                </tr>
              </thead>
              <tbody>
                <?php while ($row = mysqli_fetch_row($activity)): ?>
                <tr>
                  <td><?php echo htmlspecialchars($row[1]); ?></td>
                  <td class="text-center"><?php echo htmlspecialchars($row[0]); ?></td>
                </tr>
                <?php endwhile; ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="item col-lg">
        <div class="content">
          <div class="mx-auto mb-3">
            <table id="myTable2" class="table table-striped table-hover border border-dark border-2 mx-auto mb-2 text-start">
              <thead>
                <tr>
                  <th scope="col">Possibly infected customers</th>
                  <th scope="col">Place</th>
                  <th scope="col" class="text-center">Date-Time In/Out</th>
                </tr>
              </thead>
              <tbody>
                <?php while ($row = mysqli_fetch_row($infections)): ?>
                <tr>
                  <td><?php echo htmlspecialchars($row[0]); ?></td>
                  <td><?php echo htmlspecialchars($row[1]); ?></td>
                  <td class="text-center"><?php echo htmlspecialchars($row[2]); ?></td>
                </tr>
                <?php endwhile; ?>
              </tbody>
            </table>
          </div>
          <?php endif; ?>
        </div>
      </div>
    </div>
  </div>

  <script>
    $(document).ready( function () {
      $('#myTable').DataTable( {
         "order": [[ 1, "asc" ]]
       } );
    } );

    $(document).ready( function () {
      $('#myTable2').DataTable( {
         "order": [[ 2, "desc" ]]
       } );
    } );
  </script>
</html>
