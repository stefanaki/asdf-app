<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <?php require_once('./templates/includes.php'); ?>

    <title>Add Customer</title>
    <meta charset="utf-8">
  </head>

  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
  ?>

  <div class="container-md" style="max-width: 700px">
    <h3 class="mb-3 mt-3" style="text-align: center">Insert new customer data in the form below</h3>
    <?php
      $current_date = date("Y-m-d");
      if (isset($_POST['submit'])) {
        if (empty($_POST['first_name']) || empty($_POST['last_name']) || empty($_POST['date_of_birth']) || empty($_POST['verif_id'])
         || empty($_POST['verif_date']) || empty($_POST['email']) ||  empty($_POST['phone']))
            echo '<div class="mb-3 alert alert-danger" role="alert">All fields are required.</div>';
        else {
          $first = mysqli_real_escape_string($db, $_POST['first_name']);
          $last = mysqli_real_escape_string($db, $_POST['last_name']);
          $dob = mysqli_real_escape_string($db, $_POST['date_of_birth']);
          $gender = mysqli_real_escape_string($db, $_POST['gender']);
          $verif_id = mysqli_real_escape_string($db, $_POST['verif_id']);
          $verif_type = mysqli_real_escape_string($db, $_POST['verif_type']);
          $verif_date = mysqli_real_escape_string($db, $_POST['verif_date']);
          $email = mysqli_real_escape_string($db, $_POST['email']);
          $phone_num = mysqli_real_escape_string($db, $_POST['phone']);

          $query = "INSERT INTO customers (first_name, last_name, gender, date_of_birth, verif_id, verif_id_type, verif_date) VALUES ('$first', '$last', '$gender', '$dob', '$verif_id', '$verif_type', '$verif_date')";
          if (mysqli_query($db, $query))
            echo '<div class="mb-3 alert alert-success" role="alert">Customer inserted successfully.</div>';
          else
            echo '<div class="mb-3 alert alert-danger" role="alert">Error while inserting customer.</div>';

          $query = "INSERT INTO customer_phones (customer_id, phone_num) SELECT c.nfc_id, '$phone_num' FROM customers c WHERE c.verif_id = '$verif_id'";
          if (!mysqli_query($db, $query))
            echo '<div class="mb-3 alert alert-danger" role="alert">Error while inserting phone number.</div>';

          $query = "INSERT INTO customer_emails (customer_id, email) SELECT c.nfc_id, '$email' FROM customers c WHERE c.verif_id = '$verif_id'";
          if (!mysqli_query($db, $query))
            echo '<div class="mb-3 alert alert-danger" role="alert">Error while inserting e-mail.</div>';
        }
      }
    ?>
    <form class="mb-3 mx-auto" action="add_customer.php" method="POST">
      <div class="mb-3">
        <label for="first_name" class="form-label">First Name</label>
        <input type="text" class="form-control" name="first_name" placeholder="First Name">
      </div>
      <div class="mb-3">
        <label for="last_name" class="form-label">Last Name</label>
        <input type="text" class="form-control" name="last_name" placeholder="Last Name">
      </div>
      <div class="row">
        <div class="mb-3 col">
          <label for="date_of_birth" class="form-label">Date of Birth</label>
          <input type="date" class="form-control" name="date_of_birth" min="1900-01-01" max="<?php echo $current_date ?>">
        </div>
        <div class="mb-3 col">
          <label for="gender" class="form-label">Gender</label>
          <select id="gender" name="gender" class="form-control" value="">
            <option value="M">Male</option>
            <option value="F">Female</option>
            <option value="NON_BINARY">Non-Binary</option>
          </select>
        </div>
      </div>
      <div class="row">
        <div class="mb-3 col">
          <label for="email" class="form-label">e-mail</label>
          <input type="text" class="form-control" name="email" placeholder="e-mail">
        </div>
        <div class="mb-3 col">
          <label for="phone" class="form-label">Phone</label>
          <input type="text" class="form-control" name="phone" placeholder="Phone Number">
        </div>
      </div>
      <div class="row">
        <div class="mb-3 col">
          <label for="verif_type" class="form-label">Verification</label>
          <select name="verif_type" name="verif_type" class="form-control">
            <option value="ID">Identity Card</option>
            <option value="PASSPORT">Passport</option>
          </select>
        </div>
        <div class="mb-3 col">
          <label for="verif_id" class="form-label">Verification ID</label>
          <input type="text" class="form-control" name="verif_id" placeholder="ID">
        </div>
        <div class="mb-3 col">
          <label for="verif_date" class="form-label">Date of Verification</label>
          <input type="date" class="form-control" name="verif_date" max="<?php echo $current_date ?>">
        </div>
      </div>
      <div class="d-grid gap-2 col-3 mx-auto pt-2">
        <button type="submit" name="submit" value="submit" class="btn btn-primary ">Submit</button>
      </div>
    </form>
  </div>
</html>
<?php require_once("./templates/footer.php"); ?>
