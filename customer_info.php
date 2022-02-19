<?php if(!isset($_SESSION)) session_start(); ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <?php require_once('./templates/includes.php'); ?>

    <title>Customer Info</title>
    <meta charset="utf-8">
  </head>

  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
  ?>

  <div class="container-fluid" style="max-width: 900px">
    <h3 class="mb-3 mt-3" style="text-align: center">Specify a customer to view their information</h3>
    <?php
      if (isset($_POST['delete'])) {
        $customer = mysqli_real_escape_string($db, $_SESSION['customer']);
        $delete_query = "DELETE FROM customers
                         WHERE nfc_id = '$customer'";

        if (mysqli_query($db, $delete_query))
          echo '<div class="mb-3 alert alert-success" role="alert">Customer deleted successfully.</div>';
      }
    ?>
    <?php
      $current_date = date("Y-m-d");
      $cust_query = "SELECT nfc_id, CONCAT(first_name, ' ', last_name, ' (', verif_id, ')')
                     FROM customers";
      $cust_result = mysqli_query($db, $cust_query);
    ?>

    <form class="mb-3 mx-auto" action="customer_info.php" method="GET">
      <div class="row" style="justify-content: center;">
        <div class="mb-3 col-md" style="max-width: 500px">
          <select name="customer" class="form-control">
            <option value="-1" selected>Select Customer</option>
            <?php while ($row = mysqli_fetch_row($cust_result)): ?>
            <option value="<?php echo htmlspecialchars($row[0]); ?>"><?php echo htmlspecialchars($row[1]); ?></option>
            <?php $names[$row[0]] = $row[1]; endwhile; ?>
          </select>
        </div>
        <div class="col-md-1 mb-3" style="display: flex; align-items: center; justify-content: center;">
          <button type="submit" name="select" value="1" class="btn btn-primary">Select</button>
        </div>
      </div>
    </form>
    <?php if (isset($_GET['select'])): ?>
    <?php
      $customer = mysqli_real_escape_string($db, $_GET['customer']);
      $cust_data = "SELECT * FROM customer_data WHERE nfc_id = '$customer'";
      $phone_query = "SELECT * FROM customer_phones WHERE customer_id = '$customer'";
      $email_query = "SELECT * FROM customer_emails WHERE customer_id = '$customer'";
      $phone_nums = mysqli_query($db, $phone_query);
      $emails = mysqli_query($db, $email_query);
    ?>
    <?php $result = mysqli_query($db, $cust_data); $_SESSION['customer'] = $_GET['customer']; $sum = 0.0; ?>
    <hr>
    <h4 class="mb-3" style="text-align: center"><?php echo $names[$_SESSION['customer']]; ?></h4>
    <table class="table table-striped table-hover border border-dark border-2 mx-auto mb-3">
      <thead>
        <tr class="text-center">
          <th scope="col">NFC ID</th>
          <th scope="col">Name</th>
          <th scope="col">Verification ID</th>
          <th scope="col">Date of Birth</th>
          <th scope="col">Age</th>
          <th scope="col">Gender</th>
          <th scope="col">Reserved Room</th>
        </tr>
      </thead>
      <tbody>
        <?php while ($row = $result->fetch_assoc()): ?>
        <tr class="text-center">
          <td><?php echo htmlspecialchars($row['nfc_id']); ?></td>
          <td><?php echo htmlspecialchars($row['first_name']) . " " . htmlspecialchars($row['last_name']); ?></td>
          <td><?php echo htmlspecialchars($row['verif_id']); ?></td>
          <td><?php echo htmlspecialchars($row['birth']); ?></td>
          <td><?php echo htmlspecialchars($row['age']); ?></td>
          <td><?php echo htmlspecialchars($row['gender']); ?></td>
          <td><?php echo htmlspecialchars($row['reserved']); ?></td>
        </tr>
        <?php endwhile; ?>
      </tbody>
    </table>
    <div class="d-flex row text-center justify-content-center gap-5 mx-auto" style="max-width: 900px">
      <table class="table table-striped table-hover border border-dark border-2 mx-auto mb-3 col-md">
        <thead>
          <tr>
            <th>Phone Number(s)</th>
          </tr>
        </thead>
        <tbody>
          <?php while ($row = $phone_nums->fetch_assoc()): ?>
          <tr class="text-center">
            <td><?php echo htmlspecialchars($row['phone_num']); ?></td>
          </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
      <table class="table table-striped table-hover border border-dark border-2 mx-auto mb-3 col-md">
        <thead>
          <tr>
            <th>e-mail(s)</th>
          </tr>
        </thead>
        <tbody>
          <?php while ($row = $emails->fetch_assoc()): ?>
          <tr class="text-center">
            <td><?php echo htmlspecialchars($row['email']); ?></td>
          </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
    </div>
    <form class="mb-3" action="customer_info.php" method="POST">
      <div class="mb-3 gap-2 mx-auto pt-2" style="float: right">
        <button type="submit" name="delete" value="delete" class="btn btn-danger">Delete Customer</button>
      </div>
    </form>
    <?php endif; ?>
  </div>
</html>
<?php require_once("./templates/footer.php"); ?>
