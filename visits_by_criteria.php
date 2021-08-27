<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>Visits by Criteria</title>
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

  <div class="container-fluid">
    <h3 class="mb-3 mt-3" style="text-align: center">Visits by Criteria</h3>

  <?php
    $failure = 1;
    if (isset($_GET['select'])) {
      $q = "SELECT CONCAT(v.timestamp_in, ' / ', v.timestamp_out),
             CONCAT(c.first_name, ' ', c.last_name, ' (', c.verif_id, ')'),
             p.place_description, u.charge_amount
             FROM customers c JOIN visit_log v ON c.nfc_id = v.customer_id
             JOIN places p ON v.place_id = p.place_id
             JOIN use_charge_log u ON u.use_date_time = v.timestamp_out ";

      if (isset($_GET['service'])) $service = $_GET['service'];
      if (isset($_GET['charge'])) $charge = $_GET['charge'];
      if (isset($_GET['start'])) $start = $_GET['start'];
      if (isset($_GET['end'])) $end = $_GET['end'];

      if (isset($_GET['service_check']) && $service == '-1') {
        echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto mt-3" role="alert style="margin: 0 25%">Please select a service.</div>';
        $failure = 1;
      } else {
        if (isset($_GET['charge_check']) && !is_numeric($charge)) {
          echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto mt-3" role="alert style="margin: 0 25%">Please enter a valid charge value.</div>';
          $failure = 1;
        } else {
          if (isset($_GET['date_check']) && ($_GET['start'] == '' || $_GET['end'] == '')) {
            echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto mt-3" role="alert style="margin: 0 25%">Both date fields are required.</div>';
            $failure = 1;
          } else {
            $start .= " 00:00:00";
            $end .= " 23:59:59";
            if (!isset($_GET['service_check']) && !isset($_GET['date_check']) && !isset($_GET['charge_check'])) {
              echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert" style="margin: 0 25%">Please select at least one condition.</div>';
              $failure = 1;
            } else {
              $failure = 0;
              if (isset($_GET['service_check'])) {
                if (isset($_GET['date_check']) && isset($_GET['charge_check'])) {
                  $q .= "WHERE p.offered_service_id = '$service' AND u.charge_amount <= '$charge' AND v.timestamp_in BETWEEN '$start' AND '$end'";
                } else if (isset($_GET['date_check']) && !isset($_GET['charge_check']))
                  $q .= "WHERE p.offered_service_id = '$service' AND v.timestamp_in BETWEEN '$start' AND '$end'";
                else if (!isset($_GET['date_check']) && isset($_GET['charge_check']))
                  $q .= "WHERE p.offered_service_id = '$service' AND u.charge_amount <= '$charge'";
                else
                  $q .= "WHERE p.offered_service_id = '$service'";
              } else {
                if (isset($_GET['date_check']) && isset($_GET['charge_check']))
                  $q .= "WHERE u.charge_amount <= '$charge' AND v.timestamp_in BETWEEN '$start' AND '$end'";
                else if (isset($_GET['date_check']) && !isset($_GET['charge_check']))
                  $q .= "WHERE v.timestamp_in BETWEEN '$start' AND '$end'";
                else
                  $q .= "WHERE u.charge_amount <= '$charge'";
              }
            }
          }
        }
      }
  }
  ?>

    <form class="mb-3 mx-auto" action="visits_by_criteria.php" method="GET" style="max-width: 700px">
      <div class="row mx-auto" style="justify-content: center; max-width: 500px">
        <div class="mb-3 col">
          <select name="service" class="form-control">
            <option value="-1" selected>Select Service</option>
            <option value="3">Bar</option>
            <option value="4">Restaurant</option>
            <option value="5">Conference Room</option>
            <option value="6">Gym</option>
            <option value="7">Sauna</option>
            <option value="8">Hair Salon</option>
          </select>
        </div>
        <div class="col-2 mb-3" style="display: flex; align-items: center; justify-content: center;">
          <input type="checkbox" value="1" name="service_check" class="btn-check col-4" id="b1" autocomplete="off">
          <label class="btn btn-outline-secondary" for="b1">Select</label>
        </div>
      </div>


    <div class="row mx-auto" style="justify-content: center; max-width: 1000px">
        <div class="mb-3 col">
          <label for="start" class="form-label">Start Date</label>
          <input type="date" class="form-control" name="start">
        </div>
        <div class="mb-3 col">
          <label for="end" class="form-label">End Date</label>
          <input type="date" class="form-control" name="end" min="<?php echo $current_date; ?>">
        </div>
        <div class="mb-3 col-2">
          <input type="checkbox" value="1" name="date_check" class="btn-check col-4" id="b2" autocomplete="off">
          <label class="btn btn-outline-secondary" for="b2">Select</label>
        </div>
      </div>



      <div class="row mx-auto" style="justify-content: center; max-width: 500px">
        <div class="mb-3 col">
          <label for="charge" class="form-label">Maximum Charge Amount</label>
          <input type="text" class="form-control" name="charge" placeholder="0000.00">
        </div>
        <div class="col-2 mb-3" style="display: flex; align-items: center; justify-content: center;">
          <input type="checkbox" value="1" name="charge_check" class="btn-check col-4" id="b3" autocomplete="off">
          <label class="btn btn-outline-secondary" for="b3">Select</label>
        </div>
      </div>


    <div class="d-grid gap-2 col-2 mx-auto mb-3 pt-2">
      <button type="submit" name="select" value="1" class="btn btn-primary">Search</button>
    </div>

    </form>

    <?php if ($failure == 0): $result = mysqli_query($db, $q); ?>
      <hr>
      <div class="mx-auto mb-3" style="max-width: 900px">
        <table id="myTable" class="table table-striped table-hover border border-dark border-2 mx-auto mb-2 text-start">
          <thead>
            <tr>
              <th scope="col" class="text-center">Date-Time In/Out</th>
              <th scope="col">Name (Verification ID)</th>
              <th scope="col">Place</th>
              <th scope="col" class="text-end">Charge Amount</th>
            </tr>
          </thead>
          <tbody>
            <?php while ($row = mysqli_fetch_row($result)): ?>
            <tr>
              <td class="text-center"><?php echo htmlspecialchars($row[0]); ?></td>
              <td><?php echo htmlspecialchars($row[1]); ?></td>
              <td><?php echo htmlspecialchars($row[2]); ?></td>
              <td class="text-end"><?php echo htmlspecialchars($row[3]); ?></td>
            </tr>
            <?php endwhile; ?>
          </tbody>
        </table>
      </div>
    <?php endif; ?>
  </div>

  <br>
  <br>
</html>
<?php require_once("./templates/footer.php"); ?>
