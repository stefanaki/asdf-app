<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>Reserve Room</title>
    <meta charset="utf-8">
  </head>

  <?php
    require_once("./templates/header.php");
    require_once("./db_connect.php");
  ?>

  <div class="container-md">
    <h3 class="mb-3 mt-3" style="text-align: center">Specify customer, room and reservation time period</h3>
    <?php
      $current_date = date("Y-m-d");
      $cust_query = "SELECT CONCAT(first_name, ' ', last_name, ' (', verif_id, ')') FROM customers EXCEPT
                     SELECT CONCAT(c.first_name, ' ', c.last_name, ' (', c.verif_id, ')') FROM customers c, enroll_in e
                     WHERE c.nfc_id = e.customer_id AND e.service_id = 2";
      $cust_result = mysqli_query($db, $cust_query);
      if (empty(mysqli_fetch_row($cust_result))) {
        echo '<div class="mb-3 alert alert-primary d-grid gap-2 col-6 mx-auto" role="alert style="margin: 0 25%">All customers have reserved a room.</div>';
        $disable = true;
      } else {
        $disable = false;
      }
      $cust_result = mysqli_query($db, $cust_query);
      $room_query = "SELECT CONCAT(place_description, ' (', room_capacity, ')') FROM places WHERE offered_service_id = 2";
      $room_result = mysqli_query($db, $room_query);

      if (isset($_POST['submit'])) {
        if (empty($_POST['in_date']) || empty($_POST['in_time']) ||
            empty($_POST['out_date']) || empty($_POST['out_time']))
              echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert style="margin: 0 25%">All fields are required.</div>';
        else {
          $id = trim(explode(' ', $_POST['customer'])[2], '()');
          $id = mysqli_real_escape_string($db, $id);
          $room = mysqli_real_escape_string($db, explode(' ', $_POST['room'])[0]);
          $in = mysqli_real_escape_string($db, $_POST['in_date'] . ' ' . $_POST['in_time'] . ':00');
          $out = mysqli_real_escape_string($db, $_POST['out_date'] . ' ' . $_POST['out_time'] . ':00');

          if ($in === $out) {
            echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert style="margin: 0 25%">Check in and check out timestamps should not be identical.</div>';
            exit;
          }


          $cap_query = "SELECT COUNT(*) FROM have_access h, places p WHERE p.place_description LIKE '$room' AND h.place_id = p.place_id";
          $result = mysqli_query($db, $cap_query);
          $how_many =  (int) mysqli_fetch_row($result)[0];
          $room_capacity = (int) trim(explode(' ', $_POST['room'])[1], '()');

          if ($how_many === $room_capacity) {
            echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert style="margin: 0 25%">The room is full.</div>';
            exit;
          }

          $enroll = "INSERT INTO enroll_in (customer_id, service_id, enroll_date_time)
                       SELECT c.nfc_id, 2, '$in' FROM customers c
                       WHERE c.verif_id = '$id'";
          $reservation = "INSERT INTO have_access (customer_id, place_id, start_date_time, end_date_time)
                            SELECT c.nfc_id, p.place_id, '$in', '$out' FROM customers c, places p
                            WHERE c.verif_id = '$id' AND p.place_description = '$room'";

          if (mysqli_query($db, $enroll) && mysqli_query($db, $reservation))
            echo '<div class="mb-3 alert alert-success" role="alert" style="margin: 0 25%">Room reserved successfully.</div>';
          else
            echo '<div class="mb-3 alert alert-danger d-grid gap-2 col-6 mx-auto" role="alert style="margin: 0 25%">Error while reserving room / enrolling in service ROOM.</div>';
        }
      }
    ?>

    <form class="mb-3" action="reserve_room.php" method="POST" style="margin: 0 25%">
      <div class="mb-3">
        <label for="customer" class="form-label">Customer</label>
        <select name="customer" name="customer" class="form-control">
          <option selected>Select Customer</option>
          <?php while ($row = mysqli_fetch_row($cust_result)): ?>
          <option value="<?php echo $row[0]; ?>"><?php echo $row[0]; ?></option>
          <?php endwhile; ?>
        </select>
      </div>
      <div class="mb-3">
        <label for="room" class="form-label">Room to Reserve (Number of Beds)</label>
        <select name="room" name="room" class="form-control">
          <?php while ($row = mysqli_fetch_row($room_result)): ?>
          <option value="<?php echo $row[0]; ?>"><?php echo $row[0]; ?></option>
          <?php endwhile; ?>
        </select>
      </div>
      <div class="row">
        <div class="mb-3 col">
          <label for="in_date" class="form-label">Check In Date</label>
          <input type="date" class="form-control" name="in_date">
        </div>
        <div class="col mb-3">
          <label for="in_time" class="form-label">Check In Time</label>
          <input type="time" class="form-control" name="in_time">
        </div>
      </div>
      <div class="row mb-3">
        <div class="mb-3 col">
          <label for="out_date" class="form-label">Check Out Date</label>
          <input type="date" class="form-control" name="out_date">
        </div>
        <div class="col mb-3">
          <label for="in_time" class="form-label">Check Out Time</label>
          <input type="time" class="form-control" name="out_time">
        </div>
      </div>
      <div class="d-grid gap-2 col-3 mx-auto pt-2">
        <button type="submit" name="submit" value="submit" class="btn btn-primary" <?php echo $disable ? "disabled" : "" ?>>Submit</button>
      </div>
    </form>
  </div>
</html>
<?php require_once("./templates/footer.php"); ?>
