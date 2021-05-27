<?php
    $db = mysqli_connect("localhost", "root", "rootroot123", "asdf_db");
    if (!$db)
        die("Connection error: " . mysqli_connect_error());
    $tmp = mysqli_query($db, "SET NAMES 'utf8'");
?>
