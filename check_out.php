<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>Check Out</title>
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
    <h3 class="mb-3 pt-2" style="text-align: center">Check Out</h3>
    <?php
      if (isset($_POST['check_out'])) {
        $customer = mysqli_real_escape_string($db, $_SESSION['customer']);
        $delete_query = "DELETE FROM enroll_in
                         WHERE customer_id = '$customer'";

        if (mysqli_query($db, $delete_query))
          echo '<div class="mb-3 alert alert-success" role="alert" style="margin: 0 25%">Customer checked out successfully.</div>';
        else
          echo '<div class="mb-3 alert alert-danger" role="alert" style="margin: 0 25%">Error while checking out customer.</div>';
      }
    ?>
    <?php
      $current_date = date("Y-m-d");
      $cust_query = "SELECT nfc_id, CONCAT(first_name, ' ', last_name, ' (', verif_id, ')')
                     FROM customers
                     EXCEPT
                     SELECT nfc_id, CONCAT(first_name, ' ', last_name, ' (', verif_id, ')')
                     FROM customers c
                     WHERE nfc_id NOT IN (
                       SELECT customer_id FROM enroll_in
                       WHERE service_id = 2
                     )";
      $cust_result = mysqli_query($db, $cust_query);
      $customer = mysqli_real_escape_string($db, $_GET['customer']);
      $charges = "SELECT * FROM customer_charges WHERE nfc_id = '$customer'";
    ?>
    <form class="mb-3" action="check_out.php" method="GET" style="margin: 0 25%">
      <div class="row justify-content-end", style="float: center">
        <div class="mb-3 col-5">
          <select name="customer" class="form-control">
            <option value="-1" selected>Select Customer</option>
            <?php while ($row = mysqli_fetch_row($cust_result)): ?>
            <option value="<?php echo htmlspecialchars($row[0]); ?>"><?php echo htmlspecialchars($row[1]); ?></option>
            <?php $names[$row[0]] = $row[1]; endwhile; ?>
          </select>
        </div>
        <div class="col-4">
          <button type="submit" name="select" value="1" class="btn btn-primary ">Select</button>
        </div>
      </div>
    </form>
    <?php if (isset($_GET['select'])): ?>
    <?php $result = mysqli_query($db, $charges); $_SESSION['customer'] = $_GET['customer']; $sum = 0.0; ?>
    <hr>
    <h4 style="text-align: center"><?php echo $names[$_SESSION['customer']]; ?></h4>
    <div class="mx-auto mb-3" style="width: 50%">
      <table id="myTable" class="table table-striped  table-hover border border-dark border-2 mx-auto mb-2 text-start" style="width: 100%; margin: 0 25%">
        <thead>
          <tr>
            <th scope="col" class="text-center">Date</th>
            <th scope="col">Type</th>
            <th scope="col">Description</th>
            <th scope="col" class="text-end">Charge Amount</th>
          </tr>
        </thead>
        <tbody>
          <?php while ($row = $result->fetch_assoc()): ?>
          <tr >
            <td class="text-center"><?php echo htmlspecialchars($row['date']); ?></td>
            <td><?php echo htmlspecialchars($row['type']); ?></td>
            <td><?php echo htmlspecialchars($row['description']); ?></td>
            <td class="text-end"><?php echo htmlspecialchars($row['charge']); ?></td>
          </tr>
          <?php $sum += $row['charge'] ?>
          <?php endwhile; ?>
        </tbody>
      </table>
    </div>
    <table class="table table-striped  table-hover border border-dark border-2 mx-auto mb-3 text-start" style="width: 50%; margin: 0 25%">
      <tbody>
        <tr class="text-start table-active table-primary">
          <td><b>Total Charges</b></td>
          <td></td>
          <td></td>
          <td class="text-end"><b><?php echo number_format($sum, 2, '.', ''); ?></b></td>
        </tr>
      </tbody>
    </table>
    <form class="mb-3" action="check_out.php" method="POST" style="margin: 0 25%">
      <div class="mb-3 d-grid gap-2 col-3 mx-auto">
        <button type="submit" name="check_out" value="check_out" class="btn btn-danger">Check Out</button>
      </div>
    </form>
    <?php endif; ?>
  </div>
</html>
<?php require_once("./templates/footer.php"); ?>
