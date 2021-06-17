<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>Enroll in Services</title>
    <meta charset="utf-8">
  </head>

  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
  ?>

  <div class="container-md">
    <h3 class="mb-3 mt-3" style="text-align: center">Specify customer and services to enroll in</h3>
    <?php
      $current_date = date("Y-m-d");
      $cust_query = "SELECT CONCAT(first_name, ' ', last_name, ' (', verif_id, ')') FROM customers";
      $cust_result = mysqli_query($db, $cust_query);

      if (isset($_POST['submit'])) {
        $id = mysqli_real_escape_string($db, trim(explode(' ', $_POST['customer'])[2], '()'));
        if ((!isset($_POST['conf_check']) && !isset($_POST['gym_check']) && !isset($_POST['sauna_check'])) || empty($_POST['date']) || empty($_POST['time']) || $_POST['customer'] == "-1")
          echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert style="margin: 0 25%">All fields are required.</div>';
        else {
          $datetime = mysqli_real_escape_string($db, $_POST['date'] . ' ' . $_POST['time'] . ':00');
          if (isset($_POST['conf_check']) && $_POST['conf_check'] == "yes") {
            $check_if_enrolled = "SELECT COUNT(*) from enroll_in e, customers c
                                  WHERE c.verif_id = '$id' AND e.customer_id = c.nfc_id
                                  AND e.service_id = 5";
            if (mysqli_fetch_row(mysqli_query($db, $check_if_enrolled))[0] == 1)
              echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert style="margin: 0 25%">Customer has already enrolled in service Conference Room.</div>';
            else {
              $insert_query = "INSERT INTO enroll_in
                               SELECT c.nfc_id, 5, '$datetime'
                               FROM customers c
                               WHERE c.verif_id = '$id'";
              if (mysqli_query($db, $insert_query))
                echo '<div class="mb-3 alert alert-success" role="alert" style="margin: 0 25%">Customer enrolled in service Conference Room successfully.</div>';
            }
          }
          if (isset($_POST['gym_check']) && $_POST['gym_check'] == "yes") {
            $check_if_enrolled = "SELECT COUNT(*) from enroll_in e, customers c
                                  WHERE c.verif_id = '$id' AND e.customer_id = c.nfc_id
                                  AND e.service_id = 6";
            if (mysqli_fetch_row(mysqli_query($db, $check_if_enrolled))[0] == 1)
              echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert style="margin: 0 25%">Customer has already enrolled in service Gym.</div>';
            else {
              $insert_query = "INSERT INTO enroll_in
                               SELECT c.nfc_id, 6, '$datetime'
                               FROM customers c
                               WHERE c.verif_id = '$id'";
              if (mysqli_query($db, $insert_query))
                echo '<div class="mb-3 alert alert-success" role="alert" style="margin: 0 25%">Customer enrolled in service Gym successfully.</div>';
            }
          }

          if (isset($_POST['sauna_check']) && $_POST['sauna_check'] == "yes") {
            $check_if_enrolled = "SELECT COUNT(*) from enroll_in e, customers c
                                  WHERE c.verif_id = '$id' AND e.customer_id = c.nfc_id
                                  AND e.service_id = 7";
            if (mysqli_fetch_row(mysqli_query($db, $check_if_enrolled))[0] == 1)
              echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert style="margin: 0 25%">Customer has already enrolled in service Sauna.</div>';
            else {
              $insert_query = "INSERT INTO enroll_in
                               SELECT c.nfc_id, 7, '$datetime'
                               FROM customers c
                               WHERE c.verif_id = '$id'";
              if (mysqli_query($db, $insert_query))
                echo '<div class="mb-3 alert alert-success" role="alert" style="margin: 0 25%">Customer enrolled in service Sauna successfully.</div>';
            }
          }
        }
      }
    ?>

    <form class="mb-3" action="enroll.php" method="POST" style="margin: 0 25%">
      <div class="mb-3">
        <label for="customer" class="form-label">Customer</label>
        <select name="customer" name="customer" class="form-control">
          <option value="-1" selected>Select Customer</option>
          <?php while ($row = mysqli_fetch_row($cust_result)): ?>
          <option value="<?php echo $row[0]; ?>"><?php echo $row[0]; ?></option>
          <?php endwhile; ?>
        </select>
      </div>
      <label class="form-label">Services</label>
      <div class="form-control mb-3">
        <div class="text-center">
          <div class="p-1">
            <label class="form-check-label" for="conf_check">
            Conference Room &nbsp;
            </label>
            <input class="form-check-input" type="checkbox" value="yes" name="conf_check">
            <label class="form-check-label" for="gym_check">
            &emsp; Gym &nbsp;
            </label>
            <input class="form-check-input" type="checkbox" value="yes" name="gym_check">
            <label class="form-check-label" for="sauna_check">
            &emsp; Sauna &nbsp;
            </label>
            <input class="form-check-input" type="checkbox" value="yes" name="sauna_check">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="mb-3 col">
          <label for="date" class="form-label">Enroll Date</label>
          <input type="date" class="form-control" name="date" min="<?php echo $current_date; ?>">
        </div>
        <div class="col mb-3">
          <label for="time" class="form-label">Enroll Time</label>
          <input type="time" class="form-control" name="time">
        </div>
      </div>
      <div class="d-grid gap-2 col-3 mx-auto pt-2">
        <button type="submit" name="submit" value="submit" class="btn btn-primary ">Submit</button>
      </div>
    </form>
  </div>
</html>
<?php require_once("./templates/footer.php"); ?>
