<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
     <title>Customer Info</title>
     <meta charset="utf-8">
   </head>

  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
    session_start();
  ?>

  <div class="container-fluid">
    <h3 class="mb-3 pt-2" style="text-align: center">Specify a customer to view their information.</h3>

  <?php if (isset($_POST['delete'])) {
    $customer = mysqli_real_escape_string($db, $_SESSION['customer']);
    $delete_query = "DELETE FROM customers
                     WHERE nfc_id = '$customer'";

    if (mysqli_query($db, $delete_query))
      echo '<div class="mb-3 alert alert-success" role="alert" style="margin: 0 25%">Customer deleted successfully.</div>';


  } ?>

  <?php
  $current_date = date("Y-m-d");
  $cust_query = "SELECT nfc_id, CONCAT(first_name, ' ', last_name, ' (', verif_id, ')')
                 FROM customers";
  $cust_result = mysqli_query($db, $cust_query);
  $customer = mysqli_real_escape_string($db, $_POST['customer']);
  $cust_data = "SELECT * FROM customer_data WHERE nfc_id = '$customer'";
  ?>

    <form class="mb-3" action="customer_info.php" method="POST" style="margin: 0 25%">
      <div class="row justify-content-end", style="float: center">
        <div class="mb-3 col-5">
          <select name="customer" class="form-control">
            <option value="-1" selected>Select Customer</option>
            <?php while ($row = mysqli_fetch_row($cust_result)): ?>
              <option value="<?php echo htmlspecialchars($row[0]); ?>"><?php echo htmlspecialchars($row[1]); ?></option>
            <?php endwhile; ?>
          </select>
        </div>
        <div class="col-4">
          <button type="submit" name="select" value="select" class="btn btn-primary ">Select</button>
        </div>
        </div>
    </form>

    <?php if (isset($_POST['select'])): ?>
      <?php $result = mysqli_query($db, $cust_data); $_SESSION['customer'] = $_POST['customer']; $sum = 0.0; ?>
      <table class="table table-striped table-hover border border-dark border-2 mx-auto mb-3" style="width: 50%; margin: 0 25%">
        <thead>
        <tr class="text-center">
          <th scope="col">NFC ID</th>
          <th scope="col">Name</th>
          <th scope="col">Verification ID</th>
          <th scope="col">Age</th>
          <th scope="col">Gender</th>
          <th scope="col">Phone Number(s)</th>
          <th scope="col">e-mails(s)</th>
        </tr>
      </thead>
      <tbody>
        <?php while ($row = mysqli_fetch_row($result)): ?>
          <tr class="text-center">
            <td><?php echo htmlspecialchars($row[0]); ?></td>
            <td><?php echo htmlspecialchars($row[1]) . " " . htmlspecialchars($row[2]); ?></td>
            <td><?php echo htmlspecialchars($row[3]); ?></td>
            <td><?php echo htmlspecialchars($row[4]); ?></td>
            <td><?php echo htmlspecialchars($row[5]); ?></td>
            <td><?php echo htmlspecialchars($row[6]); ?></td>
            <td><?php echo htmlspecialchars($row[7]); ?></td>
          </tr>
        <?php endwhile; ?>
        <tr class="text-center">
        </tr>

      </tbody>
      </table>

      <form class="mb-3" action="customer_info.php" method="POST" style="margin: 0 25%">
        <div class="mb-3 gap-2 mx-auto pt-2" style="float: right">
          <button type="submit" name="delete" value="delete" class="btn btn-danger">Delete Customer</button>
        </div>
      </form>
    <?php endif; ?>
  </div>

  <?php require_once("./templates/footer.php"); ?>
</html>
